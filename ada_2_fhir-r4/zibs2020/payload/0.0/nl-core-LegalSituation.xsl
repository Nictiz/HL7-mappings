<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada juridische_situatie to FHIR Condition conforming to either profile nl-core-LegalSituation-LegalStatus or nl-core-LegalSituation-Representation</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-LegalSituation-LegalStatus FHIR instance from an ada juridische_situatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="juridische_situatie" name="nl-core-LegalSituation-LegalStatus" mode="nl-core-LegalSituation-LegalStatus" as="element(f:Condition)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient" as="element()?"/>
        
        <xsl:for-each select="$in[juridische_status]">
            <Condition>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-LegalSituation-LegalStatus'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LegalSituation-LegalStatus"/>
                </meta>
                <xsl:if test="datum_einde">
                    <!-- Needed to satisfy constraint con-3 -->
                    <clinicalStatus>
                        <coding>
                            <system value="http://terminology.hl7.org/CodeSystem/condition-clinical"/>
                            <code value="inactive"/>
                            <display value="Inactive"/>
                        </coding>
                    </clinicalStatus>
                </xsl:if>
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="303186005"/>
                        <display value="juridische status van patiënt"/>
                    </coding>
                </category>
                <xsl:for-each select="juridische_status">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="datum_aanvang">
                    <onsetDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </onsetDateTime>
                </xsl:for-each>
                <xsl:for-each select="datum_einde">
                    <abatementDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </abatementDateTime>
                </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create an nl-core-LegalSituation-Representation FHIR instance from an ada juridische_situatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="juridische_situatie" name="nl-core-LegalSituation-Representation" mode="nl-core-LegalSituation-Representation" as="element(f:Condition)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient" as="element()?"/>
        
        <xsl:for-each select="$in[vertegenwoordiging]">
            <Condition>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-LegalSituation-Representation'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LegalSituation-Representation"/>
                </meta>
                <xsl:if test="datum_einde">
                    <!-- Needed to satisfy constraint con-3 -->
                    <clinicalStatus>
                        <coding>
                            <system value="http://terminology.hl7.org/CodeSystem/condition-clinical"/>
                            <code value="inactive"/>
                            <display value="Inactive"/>
                        </coding>
                    </clinicalStatus>
                </xsl:if>
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="151701000146105"/>
                        <display value="Type of guardian"/>
                    </coding>
                </category>
                <xsl:for-each select="vertegenwoordiging">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="datum_aanvang">
                    <onsetDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </onsetDateTime>
                </xsl:for-each>
                <xsl:for-each select="datum_einde">
                    <abatementDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </abatementDateTime>
                </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="juridische_situatie" mode="_generateDisplay">
        <xsl:param name="profile" required="yes" as="xs:string"/>
        
        <xsl:choose>
            <xsl:when test="$profile = 'nl-core-LegalSituation-LegalStatus'">
                <xsl:variable name="parts" as="item()*">
                    <xsl:text>Legal situation</xsl:text>
                    <xsl:if test="juridische_status/@displayName">
                        <xsl:value-of select="concat('legal status: ',juridische_status/@displayName)"/>
                    </xsl:if>
                    <xsl:if test="datum_aanvang[@value]">
                        <xsl:value-of select="concat('from ', datum_aanvang/@value)"/>
                    </xsl:if>
                    <xsl:if test="datum_einde[@value]">
                        <xsl:value-of select="concat('until ', datum_einde/@value)"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
            </xsl:when>
            <xsl:when test="$profile = 'nl-core-LegalSituation-Representation'">
                <xsl:variable name="parts" as="item()*">
                    <xsl:text>Legal situation</xsl:text>
                    <xsl:if test="vertegenwoordiging/@displayName">
                        <xsl:value-of select="concat('representation: ',vertegenwoordiging/@displayName)"/>
                    </xsl:if>
                    <xsl:if test="datum_aanvang[@value]">
                        <xsl:value-of select="concat('from ', datum_aanvang/@value)"/>
                    </xsl:if>
                    <xsl:if test="datum_einde[@value]">
                        <xsl:value-of select="concat('until ', datum_einde/@value)"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>
