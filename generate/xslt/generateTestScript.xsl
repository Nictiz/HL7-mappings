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
    
    <!-- The format for responses (either 'xml' (default) or 'json') that this TestScript expects when it tests a 
         server (i.e. it has no meaning when nts:scenario is set to 'client'). This value is added as 'Accept' header
         on all requests and to the name and id of the TestScript. -->
    <xsl:param name="expectedResponseFormat"/>
    
    <!-- An NTS input file can nominate elements to only be included in specific named targets using the nts:only-in
         attribute. The "target" parameter determines which target to build. '#default' is considered to be the default
         target that always applies if nothing else is specified. -->
    <xsl:param name="target" select="'#default'"/>

    <!-- Optional string that will be appended verbatim to the verson string. If there is no version element in the
         input, it will be set to this parameter. -->
    <xsl:param name="versionAddition" select="''"/>
    
    <!-- The main template, which will call the remaining templates. -->
    <xsl:template name="generate" match="f:TestScript">
        <xsl:variable name="scenario" select="@nts:scenario"/>
        
        <!-- Capture the base path in a variable, because the relative path changes with nested includes, leading to Patient token errors -->
        <xsl:variable name="basePath">
            <xsl:variable name="tokenize" select="tokenize(base-uri(), '/')"/>
            <xsl:value-of select="string-join($tokenize[position() lt last()], '/')"/>
        </xsl:variable>
        
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
                <xsl:with-param name="basePath" select="$basePath" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:variable>
    
        <!-- Filter the expanded TestScript. This will add the required elements and put everything in the right
             position --> 
        <xsl:apply-templates mode="filter" select="$expanded">
            <xsl:with-param name="fixtures" select="$expanded//f:fixture" tunnel="yes"/>
            <xsl:with-param name="profiles" select="$expanded//f:profile[not(ancestor::f:origin | ancestor::f:destination)]" tunnel="yes"/>
            <xsl:with-param name="variables" select="$expanded//f:variable" tunnel="yes"/>
            <xsl:with-param name="rules" select="$expanded//f:extension[@url = 'http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-rule']" tunnel="yes"/>
            <xsl:with-param name="scenario" select="$scenario" tunnel="yes"/>
            <xsl:with-param name="expectedResponseFormat" select="$expectedResponseFormat" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <!-- Match the root to organize and/or edit all children -->
    <xsl:template match="f:TestScript" mode="filter">
        <xsl:param name="scenario" tunnel="yes"/>
        <xsl:param name="expectedResponseFormat" tunnel="yes"/>
        <xsl:param name="fixtures" tunnel="yes"/>
        <xsl:param name="profiles" tunnel="yes"/>
        <xsl:param name="variables" tunnel="yes"/>
        <xsl:param name="rules" tunnel="yes"/>
        
        <xsl:variable name="url">
            <xsl:text>http://nictiz.nl/fhir/TestScript/</xsl:text>
            <xsl:value-of select="f:id/@value"/>
            <xsl:if test="$scenario='server'">
                <xsl:text>-</xsl:text>
                <xsl:value-of select="$expectedResponseFormat"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="f:id" mode="#current"/>
            <xsl:if test="f:meta/f:profile/@value">
                <xsl:message>Overriding meta.profile to Aegis TestScript profile</xsl:message>
            </xsl:if>
            <meta>
                <xsl:apply-templates select="f:meta/f:versionId | f:meta/f:lastUpdated" mode="#current"/>
                <profile value="http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"/>
                <xsl:apply-templates select="f:meta/f:security | f:meta/f:tag" mode="#current"/>
            </meta>
            <!-- Apply all templates that can exist between f:meta and f:url -->
            <xsl:apply-templates select="f:implicitRules | f:language | f:text | f:contained" mode="#current"/>
            
            <xsl:for-each-group select="$rules" group-by="f:extension[@url = 'ruleId']/f:valueId/@value">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different rules using the id ''', f:extension[@url = 'ruleId']/f:valueId/@value, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:apply-templates select="current-group()[1]" mode="filter">
                    <xsl:with-param name="doCopy" select="true()"/>
                </xsl:apply-templates>
            </xsl:for-each-group>
            
            <xsl:apply-templates select="f:extension[not(@url = 'http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-rule')] | f:modifierExtension" mode="#current"/>
            <xsl:if test="f:url/@value">
                <xsl:message>Overriding url to conform to convention</xsl:message>
            </xsl:if>
            <url value="{$url}"/>
            <!-- Always add version -->
            <xsl:choose>
                <xsl:when test="normalize-space($versionAddition)">
                    <version value="{concat(f:version/@value, $versionAddition)}"/>
                </xsl:when>
                <xsl:when test="f:version[@value]">
                    <xsl:copy-of select="f:version"/>                    
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:name | f:title" mode="#current"/>
            <xsl:choose>
                <xsl:when test="f:status">
                    <xsl:apply-templates select="f:status"/>
                </xsl:when>
                <xsl:otherwise>
                    <status value="active"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="f:publisher/@value">
                <xsl:message>Overriding publisher to 'Nictiz'</xsl:message>
            </xsl:if>
            <publisher value="Nictiz"/>
            <xsl:if test="f:contact/@value">
                <xsl:message>Overriding contact to 'Nictiz'</xsl:message>
            </xsl:if>
            <contact>
                <name value="Nictiz"/>
                <telecom>
                    <system value="email"/>
                    <value value="kwalificatie@nictiz.nl"/>
                    <use value="work"/>
                </telecom>
            </contact>
            <xsl:apply-templates select="f:description | f:useContext | f:jurisdiction | f:purpose | f:copyright" mode="#current"/>
            <!-- Include origin and destination elements -->
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
            <xsl:apply-templates select="f:metadata" mode="#current"/>
            <xsl:for-each-group select="$fixtures" group-by="@id">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different fixture inclusions using the same id ''', @id, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:apply-templates select="current-group()[1]" mode="filter">
                    <xsl:with-param name="doCopy" select="true()"/>
                </xsl:apply-templates>
            </xsl:for-each-group>
            <xsl:for-each-group select="$profiles" group-by="@id">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different profile declarations using the id ''', @id, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:apply-templates select="current-group()[1]" mode="filter">
                    <xsl:with-param name="doCopy" select="true()"/>
                </xsl:apply-templates>
            </xsl:for-each-group>
            <xsl:for-each-group select="$variables" group-by="f:name/@value">
                <xsl:for-each select="subsequence(current-group(), 2)">
                    <xsl:if test="not(deep-equal(current-group()[1], .))">
                        <xsl:message terminate="yes" select="concat('Encountered different variables using the name ''', f:name/@value, '''')"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:apply-templates select="current-group()[1]" mode="filter">
                    <xsl:with-param name="doCopy" select="true()"/>
                </xsl:apply-templates>
            </xsl:for-each-group>
            <xsl:apply-templates select="f:setup | f:test | f:teardown" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Fixture, profile, variable and rule elements:
        Silence by default, because they are already handled elsewhere, but copied if explicitly intended with param doCopy -->
    <xsl:template match="f:TestScript//f:fixture" mode="filter">
        <xsl:param name="doCopy" select="false()"/>
        <xsl:if test="$doCopy">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="f:TestScript//f:profile" mode="filter">
        <xsl:param name="doCopy" select="false()"/>
        <xsl:if test="$doCopy">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="f:TestScript//f:variable" mode="filter">
        <xsl:param name="doCopy" select="false()"/>
        <xsl:if test="$doCopy">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="f:TestScript//f:extension[@url = 'http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-rule']" mode="filter">
        <xsl:param name="doCopy" select="false()"/>
        <xsl:if test="$doCopy">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <!-- Silence rule use elements that have been produced in the wrong place as a side effect of the declaration element --> 
    <xsl:template match="f:TestScript//f:extension[@url = 'http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-rule'][not(parent::f:assert)]" mode="filter" />
    
    <!-- Silence all remaining nts: elements and attributes (that have been read but are not transformed) -->
    <xsl:template match="nts:*" mode="filter"/>
    <xsl:template match="@nts:*" mode="filter"/>
    
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
    
    <!--Add the Accept header and encodeRequestUrl, if necessary-->
    <xsl:template match="f:TestScript/f:test/f:action/f:operation" mode="filter">
        <xsl:param name="scenario" tunnel="yes"/>
        <xsl:param name="expectedResponseFormat" tunnel="yes"/>
        
        <!--All elements that can exist before the accept element following the FHIR spec.-->
        <xsl:variable name="pre-accept" select="('type','resource','label','description')"/>
        <xsl:variable name="pre-encodeRequestUrl" select="('contentType','destination','accept')"/>
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:apply-templates select="f:*[local-name()=$pre-accept]" mode="#current"/>
            <xsl:if test="$scenario='server' and not(f:accept) and $expectedResponseFormat != ''">
                <accept value="{lower-case($expectedResponseFormat)}"/>
            </xsl:if>
            <xsl:apply-templates select="f:*[local-name()=$pre-encodeRequestUrl]" mode="#current"/>
            <xsl:if test="not(f:encodeRequestUrl)">
                <encodeRequestUrl value="true"/>
            </xsl:if>
            <xsl:apply-templates select="f:*[not(local-name()=$pre-accept or local-name()=$pre-encodeRequestUrl)]" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <!--Add TouchStone assert-stopTestOnFail extension by default.-->
    <xsl:template match="f:TestScript/f:test/f:action/f:assert" mode="filter">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:choose>
                <xsl:when test="f:extension/@url = 'http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail'"/>
                <xsl:when test="@nts:stopTestOnFail='true'">
                    <extension url="http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail">
                        <valueBoolean value="true"/>
                    </extension>
                </xsl:when>
                <xsl:otherwise>
                    <extension url="http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail">
                        <valueBoolean value="false"/>
                    </extension>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="node()" mode="#current"/>
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
        <xsl:param name="basePath" tunnel="yes"/>
        <xsl:variable name="href" as="xs:string">
            <xsl:apply-templates select="@href" mode="expand"/>
        </xsl:variable>
                    
        <xsl:choose>
            <!-- Expand the nts:patientTokenFixture element for 'phr' type scripts -->
            <xsl:when test="$scenario='client'">
                <fixture id="patient-token-fixture">
                    <autocreate value="false"/>
                    <autodelete value="false"/>
                    <resource>
                        <reference value="{nts:constructFilePath($referenceBase, $href)}"/>
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
                    <xsl:copy-of select="document(string-join(($basePath,$referenceBase, $href), '/'),.)"/>
                </xsl:variable>
                <variable>
                    <name value="patient-token-id"/>
                    <defaultValue value="{$patientTokenFixture/f:Patient/f:id/@value}"/>
                    <xsl:if test="not($patientTokenFixture/f:Patient/f:id/@value)">
                        <xsl:comment>patientTokenFixture <xsl:value-of select="string-join(($referenceBase, $href), '/')"/> not available</xsl:comment>
                    </xsl:if>
                    <description value="OAuth Token for current patient"/>
                </variable>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- Expand the nts:includeDateT element -->
    <xsl:template match="nts:includeDateT" mode="expand">
        <xsl:variable name="value" as="xs:string">
            <xsl:apply-templates select="@value" mode="expand"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$value = 'yes'">
                <variable>
                    <name value="T"/>
                    <defaultValue value="${{CURRENTDATE}}"/>
                    <description value="Date that data and queries are expected to be relative to."/>
                </variable>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <!-- Expand a nts:include element that uses absolute references with href.
         It will read all f:parts elements in the referenced file and process them further.
         param inputDir is the base to include files relative to. --> 
    <xsl:template match="nts:include[@href]" mode="expand">
        <xsl:param name="inclusionParameters" tunnel="yes" as="element(nts:with-parameter)*"/>
        
        <xsl:variable name="newInclusionParameters" as="element(nts:with-parameter)*">
            <xsl:copy-of select="$inclusionParameters"/>
            <xsl:variable name="attributesAsParameters">
                <xsl:for-each select="./@*[not(local-name() = ('value', 'scope'))]">
                    <nts:with-parameter name="${local-name(.)}" value="."/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="nts:with-parameter | $attributesAsParameters/nts:with-parameter">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="expand"/>
                </xsl:copy>
            </xsl:for-each>
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
            <xsl:variable name="attributesAsParameters">
                <xsl:for-each select="./@*[not(local-name() = 'href')]">
                    <nts:with-parameter name="{local-name(.)}" value="{.}"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="nts:with-parameter | $attributesAsParameters/nts:with-parameter">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="expand"/>
                </xsl:copy>
            </xsl:for-each>
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
    
    <!--
        Expand a nts:rule element that declares a rule (which should go to the header section of the TestScript).
        Note: it is possible to use a single nts:rule element both for declaring and using a rule, hence this template
        matches first by setting a high priority and subsequently calls the 'use' template. A side effect that a 'use'
        output will be produced in the place where only a declaration is required, but this will be filtered out in the
        filter step.
    -->
    <xsl:template match="nts:rule[@id and @href]" mode="expand" priority="2">
        <!-- https://touchstone.aegis.net/touchstone/userguide/html/testscript-authoring/rule-authoring/basics.html -->
        <extension url="http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-rule">
            <extension url="ruleId">
                <valueId value="{@id}"/>
            </extension>
            <extension url="path">
                <valueString value="{nts:constructFilePath($referenceBase, @href)}"/>
            </extension>
        </extension>
        <xsl:next-match/>
    </xsl:template>

    <!--
        Expand a nts:rule element that uses a rule (in an assert).
        Note: it is possible to use a single nts:rule element both for declaring and using a rule, hence this template
        matches first by setting a high priority and subsequently calls the 'use' template,
    -->
    <xsl:template match="nts:rule[@id]" mode="expand">
        <extension url="http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-rule">
            <extension url="ruleId">
                <valueId value="{@id}"/>
            </extension>
            <xsl:for-each select="./@*[not(local-name() = ('id', 'href'))]">
                <extension url="param">
                    <extension url="name">
                        <valueString value="{local-name()}"/>
                    </extension>
                    <extension url="value">
                        <valueString value="{.}"/>
                    </extension>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="./nts:with-param">
                <extension url="param">
                    <extension url="name">
                        <valueString value="{@name}"/>
                    </extension>
                    <extension url="value">
                        <valueString value="{@value}"/>
                    </extension>
                </extension>
            </xsl:for-each>
        </extension>
    </xsl:template>
    
    <!-- Include or exclude elements with the nts:ifset and nts:ifnotset attributes, based on whether the specified 
        parameter is passed in an nts:include. -->
    <xsl:template match="*[@nts:ifset]" mode="expand" priority="2">
        <xsl:param name="inclusionParameters" tunnel="yes" as="element(nts:with-parameter)*"/>
        <xsl:if test="./@nts:ifset = $inclusionParameters/@name/string()">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*[@nts:ifnotset]" mode="expand" priority="2">
        <xsl:param name="inclusionParameters" tunnel="yes" as="element(nts:with-parameter)*"/>
        <xsl:if test="not(./@nts:ifnotset = $inclusionParameters/@name/string())">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <xsl:variable name="parameterChars" select="'[a-zA-Z_0-9-]'"/>
    
    <xsl:template match="@*" mode="expand">
        <xsl:param name="inclusionParameters" as="element(nts:with-parameter)*" tunnel="yes"/>
        <xsl:param name="defaultParameters" as="element(nts:parameter)*" select="ancestor::nts:component[1]/nts:parameter"/>
        <xsl:variable name="componentName" select="tokenize(base-uri(), '/')[last()]"/>
        
        <xsl:variable name="value">
            <xsl:variable name="regexString" select="concat('\{\$(',$parameterChars,'*)\}')"/>
            <xsl:choose>
                <xsl:when test="matches(., $regexString)">
                    <xsl:analyze-string select="." regex="{$regexString}">
                        <xsl:matching-substring>
                            <xsl:variable name="paramName" select="regex-group(1)"/>
                            <xsl:variable name="replacement" select="$inclusionParameters[@name = $paramName]"/>
                            <xsl:variable name="default" select="$defaultParameters[@name=$paramName and @value]"/>
                            <xsl:choose>
                                <xsl:when test="$paramName != '' and count($replacement) gt 1">
                                    <xsl:message terminate="yes">Parameter '<xsl:value-of select="$paramName"/>' is available twice in nts:component '<xsl:value-of select="$componentName"/>'. Cool, but not supported at the moment. Please use globally unique variable names.</xsl:message>
                                </xsl:when>
                                <xsl:when test="$paramName != '' and count($replacement) = 1">
                                    <xsl:value-of select="$replacement/@value"/>
                                </xsl:when>
                                <xsl:when test="$paramName != '' and count($default) ne 0">
                                    <xsl:value-of select="$default[last()]/@value"/>
                                </xsl:when>
                                <xsl:when test="$paramName = ''">
                                    <xsl:message terminate="yes">An empty parameter name is found in nts:component '<xsl:value-of select="$componentName"/>'. Not cool.</xsl:message>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:message terminate="yes">You used parameter '<xsl:value-of select="$paramName"/>' in nts:component '<xsl:value-of select="$componentName"/>', but no value is available. Not cool.</xsl:message> 
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
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="$value"/>
        </xsl:attribute>
    </xsl:template>

    <!-- Pre-filter in the expand mode to only include elements that are in the target designated using the 'target'
         stylesheet parameter -->
    <xsl:template match="(f:*|nts:*)" mode="expand" priority="3">
        <xsl:if test=".[$target = tokenize(@nts:in-targets, ' ') or not(@nts:in-targets)]">
            <xsl:next-match/>
        </xsl:if>
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
    
    <!-- Fix to pretty print output - strip-space does not seem to function when being called from ANT -->
    <xsl:template match="text()[not(normalize-space(.))]" mode="#all"/>
    
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
            <!-- If path is absolute - Unix/MacOS and Windows -->
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
