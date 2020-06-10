<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:template match="f:address" mode="nl-core-address-2.0">
        <adresgegevens>
            <xsl:apply-templates select="f:line" mode="#current"/>
            <xsl:apply-templates select="f:postalCode" mode="#current"/>
            <xsl:apply-templates select="f:city" mode="#current"/>
            <xsl:apply-templates select="f:district" mode="#current"/>
            <xsl:apply-templates select="f:country" mode="#current"/>
            <xsl:apply-templates select="f:line/f:extension[@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID']" mode="#current"/>
            <xsl:call-template name="address-use-type"/>
        </adresgegevens>
    </xsl:template>
    
    <xsl:template match="f:line" mode="nl-core-address-2.0">
        <xsl:apply-templates select="f:extension[@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName']" mode="#current"/>
        <xsl:apply-templates select="f:extension[@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber']" mode="#current"/>
        <xsl:apply-templates select="f:extension[@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix']" mode="#current"/>
        <xsl:apply-templates select="f:extension[@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator']" mode="#current"/>
    </xsl:template>
    
    <xsl:template match="f:extension" mode="nl-core-address-2.0">
        <xsl:choose>
            <xsl:when test="@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName'">
                <straat value="{f:valueString/@value}"/>
            </xsl:when>
            <xsl:when test="@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber'">
                <huisnummer value="{f:valueString/@value}"/>
            </xsl:when>
            <xsl:when test="@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix'">
                <huisnummertoevoeging value="{f:valueString/@value}"/>
                <!-- could also be 'huisnummerletter' but we cannot really tell -->
            </xsl:when>
            <xsl:when test="@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID'">
                <additionele_informatie value="{f:valueString/@value}"/>
            </xsl:when>
            <xsl:when test="@url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator'">
                <aanduiding_bij_nummer value="{f:valueString/@value}"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="f:postalCode" mode="nl-core-address-2.0">
        <postcode value="{@value}"/>
    </xsl:template>
    
    <xsl:template match="f:city" mode="nl-core-address-2.0">
        <woonplaats value="{@value}"/>
    </xsl:template>
    
    <xsl:template match="f:district" mode="nl-core-address-2.0">
        <gemeente value="{@value}"/>
    </xsl:template>
    
    <xsl:template match="f:country" mode="nl-core-address-2.0">
        <xsl:choose>
            <xsl:when test="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/code-specification']">
                <xsl:call-template name="CodeableConcept-to-code">
                    <xsl:with-param name="in" select="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/code-specification']/f:valueCodeableConcept"/>
                    <xsl:with-param name="adaElementName" select="'land'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <land displayName="{@value}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="address-use-type">
        <xsl:variable name="ad-use" select="'http://hl7.org/fhir/StructureDefinition/iso21090-AD-use'"/>
        <!-- Accounts for both possible cases of AD_use extension -->
        <xsl:variable name="ad-use-valueCode" select="(f:extension[@url=$ad-use]/f:valueCode/@value,f:use/f:extension[@url=$ad-use]/f:valueCode/@value)[1]"/>
        <xsl:variable name="codeMapInput">
            <xsl:choose>
                <!-- Postadres -->
                <xsl:when test="$ad-use-valueCode='PST' or f:type/@value='postal'">PST</xsl:when>
                <!-- Officieel adres -->
                <xsl:when test="$ad-use-valueCode='HP'">HP</xsl:when>
                <!-- Woon-/verblijfadres -->
                <xsl:when test="$ad-use-valueCode='PHYS'">PHYS</xsl:when>
                <!-- Vakantie-adres -->
                <xsl:when test="$ad-use-valueCode='HV'">HV</xsl:when>
                <!-- Tijdelijk adres -->
                <xsl:when test="f:use/@value='temp'">TMP</xsl:when>
                <!-- Werkadres -->
                <xsl:when test="f:use/@value='work'">WP</xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <adres_soort>
            <xsl:call-template name="code-to-code">
                <xsl:with-param name="value" select="$codeMapInput"/>
                <xsl:with-param name="codeMap" as="element()*">
                    <map inValue="PST" code="PST" codeSystem="2.16.840.1.113883.5.1119" displayName="Postadres"/>
                    <map inValue="HP" code="HP" codeSystem="2.16.840.1.113883.5.1119" displayName="Officieel adres"/>
                    <map inValue="PHYS" code="PHYS" codeSystem="2.16.840.1.113883.5.1119" displayName="Woon-/verblijfadres"/>
                    <map inValue="TMP" code="TMP" codeSystem="2.16.840.1.113883.5.1119" displayName="Tijdelijk adres"/>
                    <map inValue="WP" code="WP" codeSystem="2.16.840.1.113883.5.1119" displayName="Werkadres"/>
                    <map inValue="HV" code="HV" codeSystem="2.16.840.1.113883.5.1119" displayName="Vakantie adres"/>
                </xsl:with-param>
            </xsl:call-template>
        </adres_soort>
    </xsl:template>
    
</xsl:stylesheet>