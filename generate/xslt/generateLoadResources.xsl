<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:f="http://hl7.org/fhir" exclude-result-prefixes="#all" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Updated on:</xd:b> Oct 21, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> Nictiz (AHE, AWE, JDU)</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:output indent="yes" omit-xml-declaration="yes"/>

    <!-- The path to the base folder of fixtures, relative to the output. Defaults to '../_reference'. -->
    <xsl:param name="referenceBase" select="'../_reference/'"/>
    <!-- The absolute path to the folder of fixtures -->
    <xsl:param name="referenceDir"/>
    
    <xsl:param name="referenceDirNormalized">
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
    </xsl:param>
    
    <xsl:param name="project"/>
    <xsl:param name="loadResourcesExclude"/>
    <!-- Assumes loadResourcesExclude can be comma-separated -->
    <xsl:param name="loadResourcesExcludeParsed" select="tokenize(translate($loadResourcesExclude,'\','/'),',')"/>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="xml1" as="item()*">
            <xsl:variable name="collection" select="collection(iri-to-uri(concat(resolve-uri($referenceDirNormalized), '?select=', '*.xml;recurse=yes')))/f:*"/>
            <xsl:choose>
                <xsl:when test="normalize-space($loadResourcesExclude)">
                    <xsl:sequence select="$collection[for $i in $loadResourcesExcludeParsed return (if (not(contains(document-uri(ancestor::node()),normalize-space($i)))) then true() else false())]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$collection"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/testscript.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <TestScript xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://hl7.org/fhir" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/testscript.xsd">
            <id value="{$project}-resources-purgecreateupdate-xml"/>
            <url value="http://nictiz.nl/fhir/TestScript/{$project}-load-resources-purgecreateupdate-xml"/>
            <name value="Nictiz {$project} Load Test Resources - Purge Create Update - XML"/>
            <status value="active"/>
            <date value="{format-date(current-date(), '[Y0001]-[M01]-[D01]')}"/>
            <publisher value="Nictiz"/>
            <contact>
                <name value="MedMij"/>
                <telecom>
                    <system value="email"/>
                    <value value="kwalificatie@nictiz.nl"/>
                    <use value="work"/>
                </telecom>
            </contact>
            <description value="Load Nictiz {$project} test resources using the update (PUT) operation of the target FHIR server for use in {$project} qualification testing. All resource ids are pre-defined. The target XIS FHIR server is expected to support resource create via the update (PUT) operation for client assigned ids. "/>
            <copyright value="© Nictiz 2020"/>
            <xsl:for-each select="$xml1">
                <xsl:sort select="lower-case(concat(local-name(), '-', f:id/@value))"/>
                <xsl:variable name="resId" select="concat(local-name(), '-', replace(replace(f:id/@value, 'Bearer ', ''), '\s', ''))"/>
                <xsl:variable name="dn" select="document-uri(ancestor::node())"/>
                <fixture id="{$resId}-fx">
                    <resource>
                        <reference value="{$referenceBase}/{replace($dn, $referenceDirNormalized, '')}"/>
                    </resource>
                </fixture>
            </xsl:for-each>
            <xsl:for-each select="$xml1">
                <xsl:sort select="lower-case(concat(local-name(), '-', f:id/@value))"/>
                <xsl:variable name="resId" select="concat(local-name(), '-', replace(replace(f:id/@value, 'Bearer ', ''), '\s', ''))"/>
                <variable>
                    <name value="{$resId}-id"/>
                    <expression value="{local-name(.)}.id"/>
                    <sourceId value="{$resId}-fx"/>
                </variable>
            </xsl:for-each>
            <!-- variable T -->
            <variable>
                <name value="T"/>
                <defaultValue value="${{CURRENTDATE}}"/>
                <description value="Date that data and queries are expected to be relative to."/>
            </variable>
            <!--  Setup -->
            <xsl:variable name="xml-token" select="collection(iri-to-uri(concat(resolve-uri($referenceDirNormalized), '?select=', '*token.xml;recurse=yes')))/f:*"/>
            <setup>
                <xsl:for-each select="$xml-token">
                    <action>
                        <operation>
                            <type>
                                <system value="http://touchstone.com/fhir/extended-operation-codes"/>
                                <code value="purge"/>
                            </type>
                            <resource value="Patient"/>
                            <accept value="xml"/>
                            <contentType value="xml"/>
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
                        </assert>
                    </action>
                </xsl:for-each>
            </setup>
            <!-- Test -->
            <test id="Step1-LoadTestResourceCreate">
                <name value="Step1-LoadTestResourceCreate"/>
                <description value="Load {$project} test resources using the update (PUT) operation of the target FHIR server for use in {$project} qualification testing. All resource ids are pre-defined. The target XIS FHIR server is expected to support resource create via the update (PUT) operation for client assigned ids. "/>
                <xsl:for-each select="$xml1[not(contains(f:id/@value, 'Bearer'))]">
                    <xsl:sort select="lower-case(concat(local-name(), '-', f:id/@value))"/>
                    <xsl:variable name="resId" select="concat(local-name(), '-', replace(replace(f:id/@value, 'Bearer ', ''), '\s', ''))"/>
                    <xsl:variable name="dn" select="document-uri(ancestor::node())"/>
                    <action>
                        <operation>
                            <type>
                                <system value="http://hl7.org/fhir/testscript-operation-codes"/>
                                <code value="updateCreate"/>
                            </type>
                            <resource value="{local-name(.)}"/>
                            <accept value="xml"/>
                            <contentType value="xml"/>
                            <params value="/${{{$resId}-id}}"/>
                            <requestHeader>
                                <field value="Authorization"/>
                                <!-- This Bearer token is a dedicated token for LoadResources purposes -->
                                <!--<value value="Bearer e317fc02-e8ff-40fe-9b22-f3c43fbf5613"/>-->
                                <!-- Use patient token until dedicated Bearer token is active -->
                                <value value="{f:id/@value}"/>
                            </requestHeader>
                            <sourceId value="{$resId}-fx"/>
                        </operation>
                    </action>
                    <action>
                        <assert>
                            <description value="Confirm that the returned HTTP status is 200(OK) or 201(Created)."/>
                            <operator value="in"/>
                            <responseCode value="200,201"/>
                        </assert>
                    </action>
                </xsl:for-each>
            </test>
        </TestScript>
    </xsl:template>
</xsl:stylesheet>
