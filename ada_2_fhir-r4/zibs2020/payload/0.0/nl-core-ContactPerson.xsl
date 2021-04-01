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
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
       
    <xd:doc>
        <xd:desc>Unwrap contactpersoon_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="contactpersoon_registratie">
        <xsl:apply-templates select="contactpersoon" mode="nl-core-ContactPerson"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create a nl-core-Contactperson as a RelatedPerson FHIR instance from ada Contactpersoon.</xd:desc>
        <xd:param name="logicalId">RelatedPerson.id value</xd:param>
    </xd:doc>
        <xsl:template match="contactpersoon" name="nl-core-ContactPerson" mode="nl-core-ContactPerson">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
          
        <xsl:for-each select="$in">
                <RelatedPerson>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{$logicalId}"/>
                    </xsl:if>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson"/>
                    </meta>
                    
                   <!--                    
                   TODO: Patient reference
                        <patient>
                            <xsl:call-template name="nl-core-Patient-reference">
                                <xsl:with-param name="in" select="XXXXXX"/>
                                <xsl:with-param name="logicalId" select="XXXXXX"/>
                            </xsl:call-template>
                        </patient>
                    </xsl:if>
                    -->
                    
                    <!-- role -->
                    <xsl:for-each select="rol[@code]">
                        <relationship>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </relationship>
                    </xsl:for-each>
                    
                    <!-- relatie -->
                    <xsl:for-each select="relatie[@code]">
                        <relationship>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </relationship>
                    </xsl:for-each>
                    
                    <!-- sub-zibs -->
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
    <xsl:template match="contactpersoon" name="nl-core-ContactPerson-embedded" mode="nl-core-ContactPerson-embedded">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">
            <contact>
                <!-- role -->
                <xsl:for-each select="rol[@code]">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>
                
                <!-- relatie -->
                <xsl:for-each select="relatie[@code]">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>
                
                <!-- sub-zibs -->
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
        
</xsl:stylesheet>
