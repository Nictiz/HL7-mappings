<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://hl7.org/fhir"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nts="http://nictiz.nl/xsl/testscript"
    exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
        
    <!-- The path to the base folder of fixtures, relative to the output. Defaults to '../_reference'. -->
    <xsl:param name="referenceBase" select="'../_reference/'"/>
    
    <!-- The folder where components for this project can be found, relative to this file. -->
    <xsl:param name="projectComponentFolder" select="'../_componenents/'"/>
    
    <!-- The folder where the common components for TestScript generation can be found. -->
    <xsl:param name="commonComponentFolder" select="'../../common-asserts/'"/>
    
    <xsl:param name="expectedResponseFormat"/>
    
    <!-- The main template, which will call the remaining templates.
         param expectedResponseFormat is the format for responses (either 'xml' (default) or 'json') that this 
                                      TestScript expects when it tests a server (i.e. it has no meaning when 
                                      nts:scenario is set to 'client'). This value is added as 'Accept' header on all
                                      requests and to the name and id of the TestScript.
    -->
    <xsl:template name="generate" match="f:TestScript">
        <xsl:variable name="scenario" select="@nts:scenario"/>
        
        <!-- Sanity check the expectedResponseFormat parameter -->
        <xsl:if test="$expectedResponseFormat != '' and $scenario != 'server'">
            <xsl:message select="'Parameter ''expectedResponseFormat'' only has a meaning when nts:scenario is ''server'''"></xsl:message>
        </xsl:if>
        <xsl:if test="$scenario = 'server' and not($expectedResponseFormat = ('xml', 'json'))">
            <xsl:message terminate="yes" select="concat('Invalid value ''', $expectedResponseFormat, ''' for parameter ''expectedResponseFormat''; should be either ''xml'' or ''json''')"></xsl:message>
        </xsl:if>
        
        <!-- Expand all the Nictiz inclusion elements to their FHIR representation --> 
        <xsl:variable name="expanded">
            <xsl:apply-templates mode="expand" select=".">
                <xsl:with-param name="scenario" select="$scenario" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:variable>
        
        <!-- Filter the expanded TestScript. This will add the required elements and put everything in the right
             position --> 
        <xsl:apply-templates mode="filter" select="$expanded">
            <xsl:with-param name="fixtures" select="$expanded//f:fixture" tunnel="yes"/>
            <xsl:with-param name="profiles" select="$expanded//f:profile[not(ancestor::f:origin | ancestor::f:destination)]" tunnel="yes"/>
            <xsl:with-param name="variables" select="$expanded//f:variable" tunnel="yes"/>
            <xsl:with-param name="rules" select="$expanded//f:rule[@id]" tunnel="yes"/>
            <xsl:with-param name="scenario" select="$scenario" tunnel="yes"/>
            <xsl:with-param name="expectedResponseFormat" select="$expectedResponseFormat" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- Use the id element as hook to include a matching url -->
    <xsl:template match="f:TestScript/f:id" mode="filter">
        <xsl:param name="scenario" tunnel="yes"/>
        <xsl:param name="expectedResponseFormat" tunnel="yes"/>
        <xsl:variable name="url">
            <xsl:text>http://nictiz.nl/fhir/fhir3-0-1/TestScript/</xsl:text>
            <xsl:value-of select="@value"/>
            <xsl:if test="$scenario='server'">
                <xsl:text>-</xsl:text>
                <xsl:value-of select="$expectedResponseFormat"/>
            </xsl:if>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="#current"/>
        </xsl:copy>
        <url value="{$url}"/>
    </xsl:template>

    <!-- Use the name element as hook to include status. date, publisher and contact information --> 
    <xsl:template match="f:TestScript/f:name" mode="filter">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="#current"/>
        </xsl:copy>
        
        <xsl:choose>
            <xsl:when test="../f:status">
                <xsl:copy-of select="../f:status"/>
            </xsl:when>
            <xsl:otherwise>
                <status value="active"/>
            </xsl:otherwise>
        </xsl:choose>
        <date value="{format-date(current-date(), '[Y0001]-[M01]-[D01]')}"/>
        <publisher value="Nictiz"/>
        <contact>
            <name value="Nictiz"/>
            <telecom>
                <system value="email"/>
                <value value="kwalificatie@nictiz.nl"/>
                <use value="work"/>
            </telecom>
        </contact>
    </xsl:template>
    
    <!-- Use description element as hook to include the origin and destination elements -->
    <xsl:template match="f:TestScript/f:description" mode="filter">
        <xsl:copy-of select="."/>
        <origin>
            <index value="1"/>
            <profile>
                <system value="http://hl7.org/fhir/testscript-profile-origin-types"/>
                <code value="FHIR-Client"/>
            </profile>
        </origin>
        <destination>
            <index value="1"/>
            <profile>
                <system value="http://hl7.org/fhir/testscript-profile-destination-types"/>
                <code value="FHIR-Server"/>
            </profile>
        </destination>
    </xsl:template>
    
    <!-- Silence status, fixture, profile, variable and rule elements, because they are already handled elsewhere -->
    <xsl:template match="f:TestScript/f:status" mode="filter" />
    <xsl:template match="f:TestScript//f:fixture" mode="filter" />
    <xsl:template match="f:TestScript//f:profile" mode="filter" />
    <xsl:template match="f:TestScript//f:variable" mode="filter" />
    <xsl:template match="f:TestScript//f:rule[@id]" mode="filter" />

    <!-- Silence all remaining nts: elements and attributes (that have been read but are not transformed) -->
    <xsl:template match="nts:*" mode="filter"/>
    <xsl:template match="@nts:*" mode="filter"/>
    
    <!-- Use the setup or (if absent) first test as a hook to inject the fixture, profile, variable and rule elements -->  
    <xsl:template match="f:TestScript/f:setup | f:TestScript/f:test[not(preceding-sibling::f:setup) and not(preceding-sibling::f:test)]" mode="filter">
        <xsl:param name="fixtures" tunnel="yes"/>
        <xsl:param name="profiles" tunnel="yes"/>
        <xsl:param name="variables" tunnel="yes"/>
        <xsl:param name="rules" tunnel="yes"/>

        <xsl:for-each-group select="$fixtures" group-by="@id">
            <xsl:for-each select="subsequence(current-group(), 2)">
                <xsl:if test="not(deep-equal(current-group()[1], .))">
                    <xsl:message terminate="yes" select="concat('Encountered different fixture inclusions using the same id ''', @id, '''')"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:copy-of select="current-group()[1]"/>
        </xsl:for-each-group>
        <xsl:for-each-group select="$profiles" group-by="@id">
            <xsl:for-each select="subsequence(current-group(), 2)">
                <xsl:if test="not(deep-equal(current-group()[1], .))">
                    <xsl:message terminate="yes" select="concat('Encountered different profile declarations using the id ''', @id, '''')"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:copy-of select="current-group()[1]"/>
        </xsl:for-each-group>
        <xsl:for-each-group select="$variables" group-by="f:name/@value">
            <xsl:for-each select="subsequence(current-group(), 2)">
                <xsl:if test="not(deep-equal(current-group()[1], .))">
                    <xsl:message terminate="yes" select="concat('Encountered different variables using the name ''', f:name/@value, '''')"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:copy-of select="current-group()[1]"/>
        </xsl:for-each-group>
        <xsl:for-each-group select="$rules" group-by="@id">
            <xsl:for-each select="subsequence(current-group(), 2)">
                <xsl:if test="not(deep-equal(current-group()[1], .))">
                    <xsl:message terminate="yes" select="concat('Encountered different rules using the id ''', @id, '''')"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:copy-of select="current-group()[1]"/>
        </xsl:for-each-group>
        
        <!-- Write back the element we matched on -->
        <xsl:element name="{local-name()}">
            <xsl:for-each select="@*">
                <xsl:attribute name="{local-name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates select="./(*|comment())" mode="filter"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Add the format for requests to the TestScript id, if specified -->
    <xsl:template match="f:TestScript/f:id/@value" mode="filter">
        <xsl:param name="scenario" tunnel="yes"/>
        <xsl:param name="expectedResponseFormat" tunnel="yes"/>
        <xsl:attribute name="value">
            <xsl:value-of select="."/>
            <xsl:if test="$scenario='server' and not(ancestor::f:TestScript/f:test/f:action/f:operation/f:accept) and not(contains(lower-case(.),$expectedResponseFormat))">
                <xsl:text>-</xsl:text>
                <xsl:value-of select="lower-case($expectedResponseFormat)"/>
            </xsl:if>
        </xsl:attribute>
    </xsl:template>
    
    <!--Add the format for requests to the TestScript name, if specified -->
    <xsl:template match="f:TestScript/f:name/@value" mode="filter">
        <xsl:param name="scenario" tunnel="yes"/>
        <xsl:param name="expectedResponseFormat" tunnel="yes"/>
        <xsl:attribute name="value">
            <xsl:value-of select="."/>
            <xsl:if test="$scenario='server' and not(ancestor::f:TestScript/f:test/f:action/f:operation/f:accept) and not(contains(lower-case(.),$expectedResponseFormat))">
                <xsl:text> - </xsl:text>
                <xsl:value-of select="upper-case($expectedResponseFormat)"/>
                <xsl:text> Format</xsl:text>
            </xsl:if>
        </xsl:attribute>
    </xsl:template>
    
    <!--Add the Accept header, if necessary-->
    <xsl:template match="f:TestScript/f:test/f:action/f:operation" mode="filter">
        <xsl:param name="scenario" tunnel="yes"/>
        <xsl:param name="expectedResponseFormat" tunnel="yes"/>
        
        <!--All elements that can exist before the accept element following the FHIR spec.-->
        <xsl:variable name="pre-accept" select="('type','resource','label','description')"/>
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:apply-templates select="f:*[local-name()=$pre-accept]" mode="#current"/>
            <xsl:if test="$scenario='server' and not(f:accept) and $expectedResponseFormat != ''">
                <accept value="{lower-case($expectedResponseFormat)}"/>
            </xsl:if>
            <xsl:apply-templates select="f:*[not(local-name()=$pre-accept)]" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <!--Remove unwanted space from FHIRPath expressions-->
    <xsl:template match="f:TestScript/f:test/f:action/f:assert/f:expression/@value" mode="filter">
        <xsl:attribute name="value">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:attribute>
    </xsl:template>
    
    <!-- Expand a nts:profile element to a FHIR profile element -->
    <xsl:template match="nts:profile" mode="expand">
        <profile id="{@id}">
            <reference value="{@value}"/>
        </profile>
    </xsl:template>
    
    <!-- Expand a nts:fixture element to a FHIR fixture element -->
    <xsl:template match="nts:fixture[@id and @href]" mode="expand">
        <fixture id="{@id}">
            <resource>
                <reference value="{nts:constructFilePath($referenceBase, @href)}"/>
            </resource>
        </fixture>
    </xsl:template>
    
    <!-- Expand an nts:patientTokenFixture element to create a variable called 'patient-token-id'. How this is handled
         is different for server and client scripts:
         - for a server script, it will be provided with a default value read from the fixture, which can be overridden
           by the TestScript executor.
         - for a client script, the fixture will be included as TestScript fixture and the variable will be read from
           it using a FHIRPath experssion. --> 
    <xsl:template match="nts:patientTokenFixture" mode="expand">
        <xsl:param name="scenario" tunnel="yes"/>
        
        <xsl:choose>
            <!-- Expand the nts:patientTokenFixture element for 'phr' type scripts -->
            <xsl:when test="$scenario='client'">
                <fixture id="patient-token-fixture">
                    <resource>
                        <reference value="{nts:constructFilePath($referenceBase, @href)}"/>
                    </resource>
                </fixture>
                <variable>
                    <name value="patient-token-id"/>
                    <expression value="Patient.id"/>
                    <sourceId value="patient-token-fixture"/>
                </variable>
            </xsl:when>
            <!-- Expand the nts:patientTokenFixture element for 'xis' type scripts -->
            <xsl:when test="$scenario='server'">
                <xsl:variable name="patientTokenFixture">
                    <xsl:copy-of select="document(string-join(($referenceBase, @href), '/'),.)"/>
                </xsl:variable>
                <variable>
                    <name value="patient-token-id"/>
                    <defaultValue value="{$patientTokenFixture/f:Patient/f:id/@value}"/>
                    <xsl:if test="not($patientTokenFixture/f:Patient/f:id/@value)">
                        <xsl:comment>patientTokenFixture <xsl:value-of select="string-join(($referenceBase, @href), '/')"/> not available</xsl:comment>
                    </xsl:if>
                    <description value="OAuth Token for current patient"/>
                </variable>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- Expand the nts:includeDateT element -->
    <xsl:template match="nts:includeDateT[@value='yes']" mode="expand">
        <variable>
            <name value="T"/>
            <defaultValue value="${{CURRENTDATE}}"/>
            <description value="Date that data and queries are expected to be relative to."/>
        </variable>
    </xsl:template>

    <!-- Expand a nts:include element that uses absolute references with href.
         It will read all f:parts elements in the referenced file and process them further.
         param inputDir is the base to include files relative to. --> 
    <xsl:template match="nts:include[@href]" mode="expand">
        <xsl:param name="inclusionParameters" tunnel="yes" as="element(nts:with-parameter)*"/>
        
        <xsl:variable name="newInclusionParameters" as="element(nts:with-parameter)*">
            <xsl:copy-of select="$inclusionParameters"/>
            <xsl:copy-of select="nts:with-parameter"/>
        </xsl:variable>
        
        <xsl:variable name="document" as="node()*">
            <xsl:copy-of select="document(@href, .)"/>
        </xsl:variable>
        <xsl:apply-templates select="$document/nts:component/(element()|comment())" mode="expand">
            <xsl:with-param name="inclusionParameters" select="$newInclusionParameters" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- Expand a nts:include element that uses relative references with value and scope.
         It will convert value to a full file path, read all f:parts elements in the referenced file and process them
         further. --> 
    <xsl:template match="nts:include[@value]" mode="expand">
        <xsl:param name="inclusionParameters" tunnel="yes" as="element(nts:with-parameter)*"/>
        
        <xsl:variable name="newInclusionParameters" as="element(nts:with-parameter)*">
            <xsl:copy-of select="$inclusionParameters"/>
            <xsl:copy-of select="nts:with-parameter"/>
        </xsl:variable>
        
        <xsl:variable name="filePath">
            <xsl:choose>
                <xsl:when test="@scope = 'common'">
                    <xsl:value-of select="nts:constructXMLFilePath($commonComponentFolder, @value)"/>
                </xsl:when>
                <xsl:when test="@scope = 'project' or not(@scope)">
                    <xsl:value-of select="nts:constructXMLFilePath($projectComponentFolder, @value)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes" select="concat('Unknown inclusion scope ''', @scope, '''')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:apply-templates select="document(string-join(($filePath), '/'), .)/nts:component/(element()|comment(),.)" mode="expand">
            <xsl:with-param name="inclusionParameters" select="$newInclusionParameters" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <!-- Expand a nts:rule element -->
    <xsl:template match="nts:rule[@id and @href]" mode="expand">
        <rule id="{@id}">
            <resource>
                <reference value="{nts:constructFilePath($referenceBase, @href)}"/>
            </resource>
            <xsl:copy-of select="./*"/>
        </rule>
    </xsl:template>
    
    <xsl:variable name="parameterChars" select="'[a-zA-Z_0-9-]'"/>
    
    <xsl:template match="@*" mode="expand">
        <xsl:param name="inclusionParameters" as="element(nts:with-parameter)*" tunnel="yes"/>
        <xsl:param name="defaultParameters" as="element(nts:parameter)*" select="ancestor::nts:component[1]/nts:parameter"/>
        
        <xsl:variable name="value">
            <xsl:variable name="regexString" select="concat('\{\$(',$parameterChars,'*)\}')"/>
            <xsl:choose>
                <xsl:when test="matches(., $regexString)">
                    <xsl:analyze-string select="." regex="{$regexString}">
                        <xsl:matching-substring>
                            <xsl:variable name="paramName" select="regex-group(1)"/>
                            <xsl:variable name="replacement" select="$inclusionParameters[@name = $paramName]"/>
                            <xsl:variable name="default" select="$defaultParameters[@name=$paramName and not(@value='')]"/>
                            <xsl:choose>
                                <xsl:when test="$paramName != '' and count($replacement) = 1">
                                    <xsl:value-of select="$replacement/@value"/>
                                </xsl:when>
                                <xsl:when test="$paramName != '' and count($default) ne 0">
                                    <xsl:value-of select="$default[last()]/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:message terminate="yes">You used parameter '<xsl:value-of select="$paramName"/>' but didn't define it. Not cool.</xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:value-of select="."/>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="{name()}">
            <xsl:value-of select="$value"/>
        </xsl:attribute>
    </xsl:template>
    
    <!-- Default template in the expand mode -->
    <xsl:template match="node()" mode="expand">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="expand"/>
        </xsl:copy>
    </xsl:template>

    <!-- Default template in the filter mode -->
    <xsl:template match="@*|node()" mode="filter">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="filter"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- === Here be functions ==================================================================================== -->
    
    <!-- Construct an XML file path from the elements.
         param base is the folder where the XML file resides
         param filename is the name of the XML file in the folder
         return the full path to the file, optionally appending the .xml extension to the filename if it doesn't
                already have it. -->
    <xsl:function name="nts:constructXMLFilePath" as="xs:string">
        <xsl:param name="base" as="xs:string" />
        <xsl:param name="filename" as="xs:string" />
        
        <xsl:variable name="fullFilename" select="nts:addXMLExtension($filename)"/>
        <xsl:choose>
            <!-- If path is absolute - Linux and Windows -->
            <xsl:when test="not(starts-with($base, 'file:')) and (starts-with($base,'/') or matches($base,'^[A-Za-z]:[/\\]'))">
                <xsl:value-of select="concat('file:///',nts:constructFilePath($base,$fullFilename))"/>
            </xsl:when>
            <!-- Else relative -->
            <xsl:otherwise>
                <xsl:value-of select="nts:constructFilePath($base,$fullFilename)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Add .xml to the filename if it doesn't have it already.
         param filename is the filename, which may or may not include the extension in upper- or lowercase
         return a filename that will have an xml extension if the filename does not have one of the supported extensions -->
    <xsl:function name="nts:addXMLExtension" as="xs:string">
        <xsl:param name="filename" as="xs:string"/>
        <xsl:variable name="fullFilename" as="xs:string">
            <xsl:choose>
                <xsl:when test="ends-with(lower-case($filename), '.xml')">
                    <xsl:value-of select="$filename"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($filename, '.xml')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$fullFilename"/>
    </xsl:function>
    
    
    <!-- Construct a file path from the elements.
         param base is the folder where the file resides
         param filename is the name of the file in the folder including the extension
         return the full path to the file -->
    <xsl:function name="nts:constructFilePath" as="xs:string">
        <xsl:param name="base" as="xs:string" />
        <xsl:param name="filename" as="xs:string" />
        
        <xsl:variable name="separator">
            <xsl:choose>
                <xsl:when test="ends-with($base, '/')">
                    <xsl:value-of select="''"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'/'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="string-join(($base, $filename), $separator)"/>
    </xsl:function>

</xsl:stylesheet>
