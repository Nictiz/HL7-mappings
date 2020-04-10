<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nictiz="http://nictiz.nl/xsl/testscript"
    exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="fixtureBase" select="'../_reference/'"/>
    
    <xsl:template name="generate" match="TestScript">
        <xsl:param name="fixtureBase" as="xs:string" select="'../_reference/'"/>
               
        <TestScript>
            <xsl:apply-templates select="."/>
        </TestScript>
    </xsl:template>

    <xsl:template match="f:TestScript/f:id" xmlns="http://hl7.org/fhir">
        <xsl:copy-of select="."/>
        <url value="{concat('http://nictiz.nl/fhir/fhir3-0-1/TestScript/', @value)}"/>
    </xsl:template>

    <xsl:template match="f:TestScript/f:name" xmlns="http://hl7.org/fhir">
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
    
    <xsl:template match="f:TestScript/f:status"/>
    
    <xsl:template match="(f:TestScript/f:setup | f:TestScript/f:test)[1]" xmlns="http://hl7.org/fhir">
        <xsl:if test="../nictiz:patientTokenFixture">
            <variable>
                <name value="patient-token-id"/>
                <expression value="Patient.id"/>
                <sourceId value="patient-token-fixture"/>
            </variable>
        </xsl:if>
        <xsl:if test="../nictiz:includeDateT[@value='yes']">
            <variable>
                <name value="T"/>
                <defaultValue value="${{CURRENTDATE}}"/>
                <description value="Date that data and queries are expected to be relative to."/>
            </variable>
        </xsl:if>
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="./*"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="f:TestScript/f:description" xmlns="http://hl7.org/fhir">
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
    
    <xsl:template match="nictiz:patientTokenFixture" xmlns="http://hl7.org/fhir">
        <fixture id="patient-token-fixture">
            <resource>
                <reference value="{concat($fixtureBase, @href)}"/>
            </resource>
        </fixture>
    </xsl:template>
    
    <xsl:template match="nictiz:profile" xmlns="http://hl7.org/fhir">
        <profile id="{@id}">
            <reference value="{@value}"/>
        </profile>
    </xsl:template>
    
    <xsl:template match="nictiz:fixture[@id and @href]" xmlns="http://hl7.org/fhir">
        <fixture id="{@id}">
            <resource>
                <reference value="{concat($fixtureBase, @href)}"/>
            </resource>
        </fixture>
    </xsl:template>
    
    <xsl:template match="nictiz:variables[@href]" xmlns="http://hl7.org/fhir">
        <xsl:variable name="loadedVariables" as="node()*">
            <xsl:copy-of select="document(@href)/f:variables/(element()|comment())"/>
        </xsl:variable>
        <xsl:apply-templates select="$loadedVariables"/>
    </xsl:template>
    
    <xsl:template match="nictiz:actions[@href]" xmlns="http://hl7.org/fhir">
        <xsl:variable name="loadedActions" as="node()*">
            <xsl:copy-of select="document(@href)/f:actions/(element()|comment())"/>
        </xsl:variable>
        <xsl:apply-templates select="$loadedActions"/>
    </xsl:template>
    
    <xsl:template match="nictiz:*"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
   
</xsl:stylesheet>