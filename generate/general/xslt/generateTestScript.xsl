<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://hl7.org/fhir"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nts="http://nictiz.nl/xsl/testscript"
    exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
        
    <!-- The base of the folder where fixtures can be found, relative to the TestScript. -->
    <xsl:param name="fixtureBase" select="'../_reference/'"/>
    
    <!-- The folder where components for this project can be found, relative to the TestScript. -->
    <xsl:param name="projectComponentFolder" select="'components/'"/>
    
    <!-- The folder where the general components for TestScript generation can be found, relative to the TestScript. -->
    <xsl:param name="generalComponentFolder" select="'../../general/common-tests/'"/>
    
    <!-- The main template, which will call the remaining templates.
         param testscriptBase is an optional base (as unerstood by xsl:document()) where the TestScript input resides.
                              Inclusions will start relative to this base. -->
    <xsl:template name="generate" match="f:TestScript">
        <xsl:param name="testscriptBase" select="current()"/>
                
        <!-- Expand all the Nictiz inclusion elements to their FHIR representation --> 
        <xsl:variable name="expanded">
            <xsl:apply-templates mode="expand" select=".">
                <xsl:with-param name="inclusionBase" select="$testscriptBase"/>
                <xsl:with-param name="testscriptBase" select="$testscriptBase" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:variable>
       
        <xsl:copy>
            <xsl:apply-templates select="$expanded/f:TestScript/f:id"/>
            <url value="{concat('http://nictiz.nl/fhir/fhir3-0-1/TestScript/', $expanded/f:TestScript/f:id/@value)}"/>
            <xsl:apply-templates select="$expanded/f:TestScript/f:name"/>
            <xsl:choose>
                <xsl:when test="$expanded/f:TestScript/f:status">
                    <xsl:apply-templates select="$expanded/f:TestScript/f:status"/>
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
            <xsl:apply-templates select="$expanded/f:TestScript/f:description"/>
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
            <xsl:for-each-group select="$expanded/f:TestScript/f:fixture" group-by="@id">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different fixture inclusions using the same id ''', @id, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:copy-of select="current-group()[1]"/>
            </xsl:for-each-group>
            <xsl:for-each-group select="$expanded/f:TestScript/f:profile" group-by="@id">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different profile declarations using the id ''', @id, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:copy-of select="current-group()[1]"/>
            </xsl:for-each-group>
            <xsl:for-each-group select="$expanded/f:TestScript/f:variable" group-by="f:name/@value">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different variables using the name ''', f:name/@value, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:copy-of select="current-group()[1]"/>
            </xsl:for-each-group>
            <xsl:for-each-group select="$expanded/f:TestScript/f:rule[@id]" group-by="@id">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different rules using the id ''', @id, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:copy-of select="current-group()[1]"/>
            </xsl:for-each-group>
            <xsl:apply-templates select="$expanded/f:TestScript/*[preceding-sibling::f:description]"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="#default">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="processing-instruction()" priority="1"/>
    
    <!-- Silence fixture, profile, variable and rule elements, because they are already handled elsewhere -->
    <xsl:template match="f:TestScript/f:fixture"/>
    <xsl:template match="f:TestScript/f:profile"/>
    <xsl:template match="f:TestScript/f:variable"/>
    <xsl:template match="f:TestScript/f:rule[@id]"/>

    <!-- Silence all remaining nts: elements (that have been read but are not transformed) -->
    <xsl:template match="nts:*">
        <xsl:message>Unhandled element in the nts namespace: <xsl:value-of select="local-name()"/></xsl:message>
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
                <reference value="{concat($fixtureBase, @href)}"/>
            </resource>
        </fixture>
    </xsl:template>
    
    <xsl:template match="nts:patientTokenFixture[@type = 'phr']" mode="expand">
        <fixture id="patient-token-fixture">
            <resource>
                <reference value="{concat($fixtureBase, @href)}"/>
            </resource>
        </fixture>
        <variable>
            <name value="patient-token-id"/>
            <expression value="Patient.id"/>
            <sourceId value="patient-token-fixture"/>
        </variable>
    </xsl:template>
    
    <xsl:template match="nts:patientTokenFixture[@type = 'xis']" mode="expand">
        <xsl:param name="testscriptBase" tunnel="yes"/>
        <xsl:variable name="patientTokenFixture">
            <xsl:choose>
                <xsl:when test="$testscriptBase">
                    <xsl:copy-of select="document(concat($fixtureBase, @href), $testscriptBase)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="document(concat($fixtureBase, @href))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <variable>
            <name value="patient-token-id"/>
            <defaultValue value="{$patientTokenFixture/f:Patient/f:id/@value}"/>
            <xsl:if test="not($patientTokenFixture/f:Patient/f:id/@value)">
                <xsl:comment>patientTokenFixture <xsl:value-of select="nts:patientTokenFixture/@href"/> not available</xsl:comment>
            </xsl:if>
            <description value="OAuth Token for current patient"/>
        </variable>
    </xsl:template>
    
    <xsl:template match="nts:includeDateT[@value='yes']" mode="expand">
        <variable>
            <name value="T"/>
            <defaultValue value="${{CURRENTDATE}}"/>
            <description value="Date that data and queries are expected to be relative to."/>
        </variable>
    </xsl:template>

    <!-- Expand a nts:include element that uses absolute references with href.
         It will read all f:parts elements in the referenced file and process them further.
         param inclusionBase is the base (as understood by document()) to include files relative to. It is not passed
                             on in subsequent calls to this template, as nested nts:include's are always relative to
                             the including file. --> 
    <xsl:template match="nts:include[@href]" mode="expand">
        <xsl:param name="inclusionBase"/>
        <xsl:variable name="document" as="node()*">
            <xsl:choose>
                <xsl:when test="$inclusionBase">
                    <xsl:copy-of select="document(@href, $inclusionBase)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="document(@href)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:apply-templates select="$document/nts:parts/(element()|comment())" mode="expand"/>
    </xsl:template>

    <!-- Expand a nts:include element that uses relative references with value and scope.
         It will convert value to a full file path, read all f:parts elements in the referenced file and process them
         further.
         param testscriptBase is the base (as understood by document()) to include files relative to. --> 
    <xsl:template match="nts:include[@value]" mode="expand">
        <xsl:param name="testscriptBase" tunnel="yes"/>
        
        <xsl:variable name="filePath">
            <xsl:choose>
                <xsl:when test="@scope = 'common'">
                    <xsl:value-of select="nts:constructXMLFilePath($generalComponentFolder, @value)"/>
                </xsl:when>
                <xsl:when test="@scope = 'project' or not(@scope)">
                    <xsl:value-of select="nts:constructXMLFilePath($projectComponentFolder, @value)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes" select="concat('Unknown inclusion scope ''', @scope, '''')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:apply-templates select="document($filePath, $testscriptBase)/nts:parts/(element()|comment())" mode="expand"/>
    </xsl:template>
    
    <!-- Expand a nts:rule element -->
    <xsl:template match="nts:rule[@id and @href]" mode="expand">
        <rule id="{@id}">
            <resource>
                <reference value="{concat($fixtureBase, @href)}"/>
            </resource>
            <xsl:copy-of select="./*"/>
        </rule>
    </xsl:template>
        
    <!-- Default template in the expand mode -->
    <xsl:template match="@*|node()" mode="expand">
        <xsl:param name="inclusionBase"/>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="expand">
                <xsl:with-param name="inclusionBase" select="$inclusionBase"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <!-- Default template in the filter mode -->
    <xsl:template match="@*|node()" mode="filter">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="filter"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- === Here be functions ==================================================================================== -->
    
    <!-- Construct a file path from the elements.
         param base is the folder where the file resides
         param filename is the name of the file in the folder
         return the full path to the file, optionally appending the .xml extension to the filename if it doesn't
                already have it. -->
    <xsl:function name="nts:constructXMLFilePath" as="xs:string">
        <xsl:param name="base" as="xs:string" />
        <xsl:param name="filename" as="xs:string" />
        
        <xsl:variable name="fullFilename" select="nts:addXMLExtension($filename)"/>
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
        <xsl:value-of select="string-join(($base, $fullFilename), $separator)"/>
    </xsl:function>

    <!-- Add .xml to the filename if it doesn't have it already.
         param filename is the filename, which may or may not include the extension in upper- or lowercase
         return a filename that will have an xml extension -->
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

</xsl:stylesheet>
