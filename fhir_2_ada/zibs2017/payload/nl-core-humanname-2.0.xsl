<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:variable name="humanname-assembly-order" select="'http://hl7.org/fhir/StructureDefinition/humanname-assembly-order'"/>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:name" mode="nl-core-humanname-2.0">
        <xsl:variable name="nameUsage" select="f:extension[@url=$humanname-assembly-order]/f:valueCode/@value"/>
        <naamgegevens>
            <xsl:if test="f:extension/@url=$humanname-assembly-order">
                <xsl:attribute name="code"><xsl:value-of select="f:extension[@url=$humanname-assembly-order]/f:valueCode/@value"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="f:text" mode="#current"/>
            <xsl:apply-templates select="f:given" mode="#current"/>
            <xsl:apply-templates select="f:extension[@url=$humanname-assembly-order]" mode="#current">
                <xsl:with-param name="nameUsage" select="$nameUsage"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="f:family" mode="#current">
                <xsl:with-param name="nameUsage" select="$nameUsage"/>
            </xsl:apply-templates>
            <!-- to do: geslachtsnaam_partner -->
            
            <!-- for debugging: -->
            <xsl:apply-templates select="node() except (f:extension[@url=$humanname-assembly-order]|f:text|f:given|f:family)" mode="#current"/>
        </naamgegevens>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:name/f:text" mode="nl-core-humanname-2.0">
        <ongestructureerde_naam>
            <xsl:attribute name="value" select="f:text//text()"/>
        </ongestructureerde_naam>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:name/f:given" mode="nl-core-humanname-2.0">
        <xsl:variable name="iso21090-EN-qualifier" select="f:extension[@url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier']/f:valueCode/@value"/>
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="$iso21090-EN-qualifier='BR'">voornamen</xsl:when>
                <xsl:when test="$iso21090-EN-qualifier='IN'">initialen</xsl:when>
                <xsl:when test="$iso21090-EN-qualifier='CL'">roepnaam</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$elementName}">
            <xsl:attribute name="value" select="@value"/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:name/f:extension[@url=$humanname-assembly-order]" mode="nl-core-humanname-2.0">
        <xsl:param name="nameUsage" required="yes"/>
        <naamgebruik>
            <xsl:choose>
                <xsl:when test="$nameUsage='NL1'">
                    <xsl:attribute name="value">1</xsl:attribute>
                    <xsl:attribute name="code">NL1</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Eigen geslachtsnaam</xsl:attribute>
                </xsl:when>
                <xsl:when test="$nameUsage='NL2'">
                    <xsl:attribute name="value">2</xsl:attribute>
                    <xsl:attribute name="code">NL2</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Geslachtsnaam partner</xsl:attribute>
                </xsl:when>
                <xsl:when test="$nameUsage='NL3'">
                    <xsl:attribute name="value">3</xsl:attribute>
                    <xsl:attribute name="code">NL3</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Geslachtsnaam partner gevolgd door eigen geslachtsnaam</xsl:attribute>
                </xsl:when>
                <xsl:when test="$nameUsage='NL4'">
                    <xsl:attribute name="value">4</xsl:attribute>
                    <xsl:attribute name="code">NL4</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Eigen geslachtsnaam gevolgd door geslachtsnaam partner</xsl:attribute>
                </xsl:when>
                
                <!--<xsl:element name="{$elemNameUsage}">
                        <xsl:attribute name="code">UNK</xsl:attribute>
                        <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                        <xsl:attribute name="displayName">Unknown</xsl:attribute>
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemNameUsage)))"/>
                    </xsl:element>-->
                
            </xsl:choose>
        </naamgebruik>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:name/f:family" mode="nl-core-humanname-2.0">
        <geslachtsnaam>
            <xsl:choose>
                <xsl:when test="f:extension">
                    <xsl:apply-templates select="node()" mode="#current"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">No Patient family name extensions found.</xsl:message><!--To do: @value verwerken.-->
                </xsl:otherwise>
            </xsl:choose>            
        </geslachtsnaam>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:name/f:family/f:extension" mode="nl-core-humanname-2.0">
        <xsl:variable name="extensionUrl" select="@url"/>
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-own-prefix'">voorvoegsels</xsl:when>
                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-own-name'">achternaam</xsl:when>
                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix'">voorvoegsels_partner</xsl:when>
                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-partner-name'">achternaam_partner</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$elementName}">
            <xsl:attribute name="value" select="f:valueString/@value"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>