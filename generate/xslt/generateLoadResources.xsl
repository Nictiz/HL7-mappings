<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:f="http://hl7.org/fhir" exclude-result-prefixes="#all" version="2.0">
    <!-- Stylesheet to write out the special TestScript resource that is used to load all fixtures to the test 
         server (the load script) -->

    <xsl:output indent="yes" omit-xml-declaration="yes"/>

    <!-- The path to the base folder of fixtures, relative to the output. Defaults to '../_reference'. -->
    <xsl:param name="referenceBase" select="'../_reference/'"/>
    
    <!-- The absolute path to the folder of fixtures -->
    <xsl:param name="referenceDir"/>
        
    <!-- Comma-separated list of paths to exclude -->
    <xsl:param name="loadResourcesExclude"/>

    <xsl:template match="/">
        
        <!-- Convert the reference to a file:// URL and make sure it ends with a slash. -->
        <xsl:variable name="referenceDirAsUrl">
            <xsl:variable name="fileUrl">
                <xsl:choose>
                    <xsl:when test="starts-with($referenceDir, 'file:')">
                        <xsl:value-of select="$referenceDir"/>
                    </xsl:when>
                    <xsl:when test="starts-with($referenceDir,'/')">
                        <!-- Unix style -->
                        <xsl:value-of select="concat('file:', translate($referenceDir,'\','/'))"/>
                    </xsl:when>
                    <xsl:when test="matches($referenceDir,'^[A-Za-z]:[/\\]')">
                        <!-- Windows style -->
                        <xsl:value-of select="concat('file:/',translate($referenceDir,'\','/'))"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:value-of select="if (ends-with($fileUrl, '/')) then $fileUrl else concat($fileUrl, '/')"/>
        </xsl:variable>
        
        <!-- Make sure the referenceBase ends with a slash. -->
        <xsl:variable name="referenceBaseSanitized" select="if (ends-with($referenceBase, '/')) then $referenceBase else concat($referenceBase, '/')"/>
        
        <!-- Collect all non-bearer fixtures as file URLs -->
        <xsl:variable name="fixtures" as="item()*">
            <xsl:variable name="exclusionPatterns" select="
                let $pathNormalized  := translate($loadResourcesExclude,'\','/'),
                    $regexEscaped    := replace($pathNormalized, '(\.|\[|\]|\\|\||\-|\^|\$|\?|\+|\{|\}|\(|\))','\\$1'), (: all regex characters except * :)
                    $wildCardAsRegex := replace($regexEscaped,'\*','.*?')
                return for $pattern in tokenize($wildCardAsRegex,',') 
                return normalize-space($pattern)"/>
            <xsl:variable name="fixturesUnfiltered" select="collection(iri-to-uri(concat(resolve-uri($referenceDirAsUrl), '?select=', '*.xml;recurse=yes')))/f:*[not(contains(f:id/@value, 'Bearer'))]"/>
            <xsl:choose>
                <xsl:when test="normalize-space($loadResourcesExclude)">
                    <xsl:sequence select="$fixturesUnfiltered[not(some $exclusionPattern in $exclusionPatterns satisfies (matches(document-uri(ancestor::node()),$exclusionPattern)))]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$fixturesUnfiltered"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- And collect all bearer fixtures as file URLs -->
        <xsl:variable name="tokens" select="collection(iri-to-uri(concat(resolve-uri($referenceDirAsUrl), '?select=', '*token.xml;recurse=yes')))/f:*"/>
        
        <xsl:choose>
            <xsl:when test="$fixtures">
        <!-- Write out the TestScript resource -->
        <TestScript xmlns="http://hl7.org/fhir">
            <id value="resources-purgecreateupdate-xml"/>
            <url value="http://nictiz.nl/fhir/TestScript/load-resources-purgecreateupdate-xml"/>
            <name value="Load Test Resources - Purge Create Update - XML"/>
            <status value="active"/>
            <publisher value="Nictiz"/>
            <contact>
                <name value="MedMij"/>
                <telecom>
                    <system value="email"/>
                    <value value="kwalificatie@nictiz.nl"/>
                    <use value="work"/>
                </telecom>
            </contact>
            <description value="Load test resources using the update (PUT) operation of the target FHIR server for use in testing. All resource ids are pre-defined. The target XIS FHIR server is expected to support resource create via the update (PUT) operation for client assigned ids. "/>
            <copyright value="© Nictiz 2020"/>
            
            <!-- Write out all fixture references -->
            <xsl:for-each select="$fixtures">
                <xsl:sort select="lower-case(concat(local-name(), '-', f:id/@value))"/>
                <xsl:variable name="fixtureId">
                    <xsl:call-template name="generateFixtureId"/>
                </xsl:variable>
                <fixture id="{$fixtureId}">
                    <autocreate value="false"/>
                    <autodelete value="false"/>
                    <resource>
                        <reference value="{replace(document-uri(ancestor::node()), $referenceDirAsUrl, $referenceBaseSanitized)}"/>
                    </resource>
                </fixture>
            </xsl:for-each>
            
            <!-- Write out variables that read the id's from all fixtures -->
            <xsl:for-each select="$fixtures">
                <xsl:sort select="lower-case(concat(local-name(), '-', f:id/@value))"/>
                <xsl:variable name="fixtureId">
                    <xsl:call-template name="generateFixtureId"/>
                </xsl:variable>
                <variable>
                    <name value="{$fixtureId}-id"/>
                    <expression value="{local-name(.)}.id"/>
                    <sourceId value="{$fixtureId}"/>
                </variable>
            </xsl:for-each>
            
            <!-- variable T -->
            <variable>
                <name value="T"/>
                <defaultValue value="${{CURRENTDATE}}"/>
                <description value="Date that data and queries are expected to be relative to."/>
            </variable>
            
            <!-- Purge Patients in setup -->
            <setup>
                <xsl:for-each select="$tokens">
                    <action>
                        <operation>
                            <type>
                                <system value="http://touchstone.com/fhir/extended-operation-codes"/>
                                <code value="purge"/>
                            </type>
                            <resource value="Patient"/>
                            <accept value="xml"/>
                            <contentType value="xml"/>
                            <encodeRequestUrl value="true"/>
                            <params value="/$purge"/>
                            <requestHeader>
                                <field value="Authorization"/>
                                <value value="{f:id/@value}"/>
                            </requestHeader>
                        </operation>
                    </action>
                    <action>
                        <assert>
                            <description
                                value="Confirm that the returned HTTP status is 200(OK) or 204(No Content)"/>
                            <operator value="in"/>
                            <responseCode value="200,204"/>
                            <warningOnly value="false"/>
                        </assert>
                    </action>
                </xsl:for-each>
            </setup>
            
            <!-- PUT all fixtures in test -->
            <test id="Step1-LoadTestResourceCreate">
                <name value="Step1-LoadTestResourceCreate"/>
                <description value="Load test resources using the update (PUT) operation of the target FHIR server for use in testing. All resource ids are pre-defined. The target XIS FHIR server is expected to support resource create via the update (PUT) operation for client assigned ids. "/>
                <xsl:for-each select="$fixtures">
                    <!-- Load Patient resources first to make sure WildFHIR indexes data in the right order to use patient.identifier searches. -->
                    <xsl:sort data-type="number" order="ascending" select="(number(local-name() = 'Patient') * 1) + (number(not(local-name() = 'Patient')) * 2)"/>
                    <xsl:sort select="lower-case(concat(local-name(), '-', f:id/@value))"/>
                    <xsl:variable name="fixtureId">
                        <xsl:call-template name="generateFixtureId"/>
                    </xsl:variable>
                    <action>
                        <operation>
                            <type>
                                <system value="http://hl7.org/fhir/testscript-operation-codes"/>
                                <code value="updateCreate"/>
                            </type>
                            <resource value="{local-name(.)}"/>
                            <accept value="xml"/>
                            <contentType value="xml"/>
                            <encodeRequestUrl value="true"/>
                            <params value="/${{{$fixtureId}-id}}"/>
                            <requestHeader>
                                <field value="Authorization"/>
                                <!-- This Bearer token is a dedicated token for LoadResources purposes -->
                                <!--<value value="Bearer e317fc02-e8ff-40fe-9b22-f3c43fbf5613"/>-->
                                <!-- Use first patient token until dedicated Bearer token is active -->
                                <value value="{$tokens[1]/f:id/@value}"/>
                            </requestHeader>
                            <sourceId value="{$fixtureId}"/>
                        </operation>
                    </action>
                    <action>
                        <assert>
                            <description value="Confirm that the returned HTTP status is 200(OK) or 201(Created)."/>
                            <operator value="in"/>
                            <responseCode value="200,201"/>
                            <warningOnly value="false"/>
                        </assert>
                    </action>
                </xsl:for-each>
            </test>
        </TestScript>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>No LoadResources to generate</xsl:message>
                <!-- Output empty file, which is deleted by ANT -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Construct a fixture id for the provided resource, based on the type and the resource.id.
         If this constructed id is too long, a generated one that's harder to recognize will be used. -->
    <xsl:template name="generateFixtureId" as="xs:string">
        
        <!-- Check if the resource id is a valid FHIR id -->
        <xsl:if test="not(matches(f:id/@value, '^[A-Za-z0-9\-\.]{1,64}$'))">
            <xsl:message terminate="yes" select="concat('Invalid FHIR id: ', f:id/@value)"/>
        </xsl:if>

        <xsl:variable name="fixtureId" select="concat(local-name(), '-', f:id/@value)"/>
        <xsl:choose>
            <xsl:when test="matches($fixtureId, '^[A-Za-z0-9\-\.]{1,64}$')">
                <xsl:value-of select="$fixtureId"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="substring(concat(local-name(), '-', generate-id(.), '-', f:id/@value),1,64)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
