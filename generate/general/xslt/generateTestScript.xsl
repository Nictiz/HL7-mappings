<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nictiz="http://nictiz.nl/xsl/testscript"
    exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="fixtureBase" select="'../_reference/'"/>
    
    <xsl:template name="generate" match="f:TestScript" xmlns="http://hl7.org/fhir">
        <xsl:param name="fixtureBase" as="xs:string" select="'../_reference/'"/>
               
        <!-- Expand all the Nictiz inclusion elements to their FHIR representation --> 
        <xsl:variable name="expanded">
            <xsl:apply-templates mode="expand" select="."/>
        </xsl:variable>
        
        <!-- Gather all fixture elements that now might be scattered throughout the document -->
        <xsl:variable name="fixtures" as="element(f:fixture)*">
            <xsl:copy-of select="$expanded//f:fixture"/>
            <xsl:if test="nictiz:patientTokenFixture">
                <fixture id="patient-token-fixture">
                    <resource>
                        <reference value="{concat($fixtureBase, nictiz:patientTokenFixture/@href)}"/>
                    </resource>
                </fixture>
            </xsl:if>
        </xsl:variable>

        <!-- Gather all variable elements that now might be scattered throughout the document -->
        <xsl:variable name="variables" as="element(f:variable)*">
            <xsl:copy-of select="$expanded//f:variable"/>
            <xsl:if test="nictiz:patientTokenFixture">
                <variable>
                    <name value="patient-token-id"/>
                    <expression value="Patient.id"/>
                    <sourceId value="patient-token-fixture"/>
                </variable>
            </xsl:if>
            <xsl:if test="nictiz:includeDateT[@value='yes']">
                <variable>
                    <name value="T"/>
                    <defaultValue value="${{CURRENTDATE}}"/>
                    <description value="Date that data and queries are expected to be relative to."/>
                </variable>
            </xsl:if>
        </xsl:variable>
        
        <!-- Filter the expanded TestScript. This will add the required elements and put everything in the right
             position --> 
        <xsl:apply-templates mode="filter" select="$expanded">
            <xsl:with-param name="fixtures" select="$fixtures" tunnel="yes"/>
            <xsl:with-param name="profiles" select="$expanded//f:profile[not(ancestor::origin | ancestor::destination)]" tunnel="yes"/>
            <xsl:with-param name="variables" select="$variables" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- Use the id element as hook to include a matching url -->
    <xsl:template match="f:TestScript/f:id" xmlns="http://hl7.org/fhir" mode="filter">
        <xsl:copy-of select="."/>
        <url value="{concat('http://nictiz.nl/fhir/fhir3-0-1/TestScript/', @value)}"/>
    </xsl:template>

    <!-- Use the name element as hook to include status. date, publisher and contact information --> 
    <xsl:template match="f:TestScript/f:name" xmlns="http://hl7.org/fhir" mode="filter">
        <xsl:copy-of select="."/>
        
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
    <xsl:template match="f:TestScript/f:description" mode="filter" xmlns="http://hl7.org/fhir">
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
    
    <!-- Silence status, fixture, profile and variable elements, because they are already handled elsewhere -->
    <xsl:template match="f:TestScript/f:status" mode="filter" />
    <xsl:template match="f:TestScript//f:fixture" mode="filter" />
    <xsl:template match="f:TestScript//f:profile" mode="filter" />
    <xsl:template match="f:TestScript//f:variable" mode="filter" />

    <!-- Silence all remaining nictiz: elements (that have been read but are not transformed) -->
    <xsl:template match="nictiz:*" mode="filter"/>
    
    <!-- Use the setup or (if absent) first test as a hook to inject the fixture, profile and variable elements -->  
    <xsl:template match="(f:TestScript/f:setup | f:TestScript/f:test)[1]" mode="filter" xmlns="http://hl7.org/fhir">
        <xsl:param name="fixtures" tunnel="yes"/>
        <xsl:param name="profiles" tunnel="yes"/>
        <xsl:param name="variables" tunnel="yes"/>

        <xsl:for-each-group select="$fixtures" group-by="@id">
            <xsl:copy-of select="."/>
        </xsl:for-each-group>
        <xsl:for-each-group select="$profiles" group-by="@id">
            <xsl:copy-of select="."/>
        </xsl:for-each-group>
        <xsl:for-each-group select="$variables" group-by="f:name/@value">
            <xsl:copy-of select="."/>
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
    
    <!-- Expand a nictiz:profile element to a FHIR profile element -->
    <xsl:template match="nictiz:profile" mode="expand" xmlns="http://hl7.org/fhir">
        <profile id="{@id}">
            <reference value="{@value}"/>
        </profile>
    </xsl:template>
    
    <!-- Expand a nictiz:fixture element to a FHIR fixture element -->
    <xsl:template match="nictiz:fixture[@id and @href]" mode="expand" xmlns="http://hl7.org/fhir">
        <fixture id="{@id}">
            <resource>
                <reference value="{concat($fixtureBase, @href)}"/>
            </resource>
        </fixture>
    </xsl:template>
    
    <!-- Epand a nictiz:variables element; read all f:variable elements in the referenced file and further process them --> 
    <xsl:template match="nictiz:variables[@href]" mode="expand" xmlns="http://hl7.org/fhir">
        <xsl:variable name="loadedVariables" as="node()*">
            <xsl:copy-of select="document(@href)/f:variables/(element()|comment())"/>
        </xsl:variable>
        <xsl:apply-templates select="$loadedVariables" mode="expand"/>
    </xsl:template>
    
    <!-- Epand a nictiz:variables element; read all f:actopms elements in the referenced file and further process them -->
    <xsl:template match="nictiz:actions[@href]" mode="expand" xmlns="http://hl7.org/fhir">
        <xsl:variable name="loadedActions" as="node()*">
            <xsl:copy-of select="document(@href)/f:actions/(element()|comment())"/>
        </xsl:variable>
        <xsl:apply-templates select="$loadedActions" mode="expand"/>
    </xsl:template>
    
    <!-- Default template in the expand mode -->
    <xsl:template match="@*|node()" mode="expand">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="expand"/>
        </xsl:copy>
    </xsl:template>

    <!-- Default template in the filter mode -->
    <xsl:template match="@*|node()" mode="filter">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="filter"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>