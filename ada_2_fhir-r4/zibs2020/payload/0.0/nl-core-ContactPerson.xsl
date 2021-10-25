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
        <xd:desc>Converts ada patient to FHIR resource conforming to profile nl-core-Patient</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create a nl-core-Contactperson as a RelatedPerson FHIR instance from ada Contactpersoon.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="contactpersoon" name="nl-core-ContactPerson" mode="nl-core-ContactPerson" as="element(f:RelatedPerson)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="patient" select="patient" as="element()?"/>
        
        <xsl:for-each select="$in">
            <RelatedPerson>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson"/>
                </meta>

                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$patient"/>
                    <xsl:with-param name="wrapIn" select="'patient'"/>
                </xsl:call-template>

                <xsl:for-each select="rol">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>

                <xsl:for-each select="relatie">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>

                <xsl:for-each select="naamgegevens">
                    <xsl:call-template name="nl-core-NameInformation"/>
                </xsl:for-each>

                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation"/>
                </xsl:for-each>

                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation"/>
                </xsl:for-each>
            </RelatedPerson>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create a nl-core-Contactperson FHIR instance emmbedded in the Patient instance from ada Contactpersoon. Since it is embedded in the Patient no Resource.id is needed.</xd:desc>
        <xd:param name="in">Node to consider in the creation of a Patient.contact element.</xd:param>
    </xd:doc>
    <xsl:template match="contactpersoon" name="nl-core-ContactPerson-embedded" mode="nl-core-ContactPerson-embedded" as="element(f:contact)?">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">
            <contact>
                <xsl:for-each select="rol">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>
                
                <xsl:for-each select="relatie">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>
                
                <xsl:for-each select="naamgegevens">
                    <xsl:call-template name="nl-core-NameInformation"/>
                </xsl:for-each>
                
                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation"/>
                </xsl:for-each>
                
                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation"/>
                </xsl:for-each>
            </contact>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify a patient present in a (set of) ada-instance(s)</xd:desc>
    </xd:doc>
    <xsl:template match="contactpersoon" mode="_generateId">
        <xsl:choose>
            <xsl:when test="naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value">
                <xsl:value-of select="upper-case(nf:removeSpecialCharacters(normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value, ' '))))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="contactpersoon" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Contact person</xsl:text>
            <xsl:value-of select="nf:renderName(naamgegevens)"/>

        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
        
</xsl:stylesheet>
