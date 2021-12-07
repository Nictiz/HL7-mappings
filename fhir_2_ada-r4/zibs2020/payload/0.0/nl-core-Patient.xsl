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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    xmlns:nf="http://www.nictiz.nl/functions" 
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:variable name="nl-core-patient">http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient</xsl:variable>
    
    <xd:doc>
        <xd:desc>Template to convert f:Patient to ADA patient</xd:desc>
    </xd:doc>
    <xsl:template match="f:Patient" mode="nl-core-Patient">
        <patient>
            <!-- naamgegevens -->
            <!-- TODO naam even uitstellen vanwege zib issue -->
<!--            <xsl:apply-templates select="f:name" mode="nl-core-humanname-2.0"/>-->
            <naamgegevens/>
            <!-- TODO adresgegevens, contactgegevens -->
            <!-- identificatienummer -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- geboortedatum -->
            <xsl:apply-templates select="f:birthDate" mode="#current"/>
            <!-- geslacht -->
            <xsl:apply-templates select="f:gender" mode="#current"/>
            <!-- meerling_indicator -->
            <xsl:apply-templates select="f:multipleBirthBoolean" mode="#current"/>
            <!-- TODO overlijdensindicator datum_overlijden -->
        </patient>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:identifier to identificatienummer</xd:desc>
    </xd:doc>
    <xsl:template match="f:identifier" mode="nl-core-Patient">
        <xsl:call-template name="Identifier-to-identificatie">
            <xsl:with-param name="adaElementName">identificatienummer</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:birthDate to geboortedatum</xd:desc>
    </xd:doc>
    <xsl:template match="f:birthDate" mode="nl-core-Patient">
        <geboortedatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                    <xsl:with-param name="precision" select="'DAY'"/>
                </xsl:call-template>
            </xsl:attribute>
            <!--<xsl:attribute name="datatype">datetime</xsl:attribute>-->
        </geboortedatum>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:gender to geslacht</xd:desc>
    </xd:doc>
    <xsl:template match="f:gender" mode="nl-core-Patient">
        <geslacht>
            <xsl:call-template name="code-to-code">
                <xsl:with-param name="value" select="@value"/>
                <xsl:with-param name="codeMap" as="element()*">
                    <map code="M" codeSystem="2.16.840.1.113883.5.1" inValue="male" displayName="Man"/>
                    <map code="F" codeSystem="2.16.840.1.113883.5.1" inValue="female" displayName="Vrouw"/>
                    <map code="UN" codeSystem="2.16.840.1.113883.5.1" inValue="other" displayName="Ongedifferentieerd"/>
                    <map code="UNK" codeSystem="2.16.840.1.113883.5.1008" inValue="unknown" displayName="Onbekend"/>
                </xsl:with-param>
            </xsl:call-template>
            <!-- displayName attribute? -->
        </geslacht>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:multipleBirthBoolean to meerling_indicator</xd:desc>
    </xd:doc>
    <xsl:template match="f:multipleBirthBoolean" mode="nl-core-Patient">
        <meerling_indicator>
            <xsl:call-template name="boolean-to-boolean"/>
        </meerling_indicator>
    </xsl:template>
    
</xsl:stylesheet>