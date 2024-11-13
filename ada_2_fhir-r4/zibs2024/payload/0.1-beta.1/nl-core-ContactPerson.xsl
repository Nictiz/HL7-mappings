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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="profileNameContactPerson">nl-core-ContactPerson</xsl:variable>

    <xsl:template match="contactpersoon" name="nl-core-ContactPerson" mode="nl-core-ContactPerson" as="element(f:RelatedPerson)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" as="element()?"/>

        <xsl:for-each select="$in">
            <RelatedPerson>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameContactPerson"/>
                </xsl:call-template>
                
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>

                <xsl:for-each select="toelichting[@value]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/note">
                        <valueAnnotation>
                            <text>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </text>
                        </valueAnnotation>
                    </extension>
                </xsl:for-each>

                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'patient'"/>
                </xsl:call-template>

                <xsl:for-each select="rol[@code]">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>

                <xsl:for-each select="relatie[@code]">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>

                <xsl:for-each select="naamgegevens">
                    <xsl:call-template name="nl-core-NameInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </RelatedPerson>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a Patient.contact element in line with nl-core-Contactperson from ADA contactpersoon element.</xd:desc>
    </xd:doc>
    <xsl:template match="contactpersoon" name="nl-core-ContactPerson-embedded" mode="nl-core-ContactPerson-embedded" as="element(f:contact)?">
        <xsl:param name="in" select="." as="element()?"/>

        <xsl:for-each select="$in">
            <contact>
                <xsl:for-each select="rol[@code]">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>

                <xsl:for-each select="relatie[@code]">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>

                <!-- We can't add the full name information here, just the name information needed to address the contact person -->
                <xsl:variable name="nameInformation" as="element(f:name)*">
                    <xsl:for-each select="naamgegevens">
                        <xsl:call-template name="nl-core-NameInformation">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:if test="count($nameInformation) &gt; 0">
                    <xsl:copy-of select="$nameInformation[1]"/>
                </xsl:if>

                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </contact>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="contactpersoon" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Contact person</xsl:text>
            <xsl:value-of select="nf:renderName(naamgegevens)"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>