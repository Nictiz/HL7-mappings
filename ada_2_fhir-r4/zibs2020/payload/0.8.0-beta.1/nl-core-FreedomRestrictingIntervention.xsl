<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz
This program is free software; you can redistribuste it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.
The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA vrijheidsbeperkende_interventie to FHIR Procedure conforming to profile nl-core-FreedomRestrictingIntervention</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-FreedomRestrictingIntervention instance as a Procedure FHIR instance from ADA vrijheidsbeperkende_interventie.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The subject as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template match="vrijheidsbeperkende_interventie" name="nl-core-FreedomRestrictingIntervention" mode="nl-core-FreedomRestrictingIntervention" as="element(f:Procedure)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Procedure>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-FreedomRestrictingIntervention"/>
                </meta>               
                <xsl:if test="wilsbekwaam | wilsbekwaam_toelichting">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.LegallyCapable">
                        <xsl:for-each select="wilsbekwaam">
                            <extension url="legallyCapable">
                                <valueBoolean>                                    
                                    <xsl:call-template name="boolean-to-boolean">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueBoolean>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="wilsbekwaam_toelichting">
                            <extension url="legallyCapableComment">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                        </xsl:for-each>
                    </extension>
                </xsl:if>
                <xsl:for-each select="instemming">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.Assent">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>                    
                    </extension>                  
                </xsl:for-each>   
                <status>
                    <xsl:choose>
                        <xsl:when test="xs:date(einde/@value) lt current-date()">
                            <xsl:attribute name="value" select="'completed'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- In any other situation, we cannot know if the status is 'preparation' or 'in-progress' because there is no concept of the time difference between transformation and sending the FHIR resource -->
                            <xsl:attribute name="value" select="'unknown'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="225317005"/>
                        <display value="beperking van bewegingsvrijheid"/>
                    </coding>
                </category>                   
                <xsl:for-each select="soort_interventie">
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
                <xsl:choose>
                    <xsl:when test="begin and einde">
                        <performedPeriod>
                            <xsl:call-template name="startend-to-Period">
                                <xsl:with-param name="start" select="begin"/>
                                <xsl:with-param name="end" select="einde"/>
                            </xsl:call-template>
                        </performedPeriod>
                    </xsl:when>
                    <xsl:when test="begin">
                        <performedDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </performedDateTime>
                    </xsl:when>
                </xsl:choose>                
                <xsl:for-each select="reden_van_toepassen">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </reasonCode>
                </xsl:for-each>                
                <xsl:for-each select="juridische_situatie">
                    <reasonReference>
                        <xsl:choose>
                            <xsl:when test="nf:resolveAdaInstance(juridische_situatie, $in)[vertegenwoordiging]">
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="juridische_situatie"/>
                                    <xsl:with-param name="profile" select="'nl-core-LegalSituation-Representation'"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="nf:resolveAdaInstance(juridische_situatie, $in)[juridische_status]">
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="juridische_situatie"/>
                                    <xsl:with-param name="profile" select="'nl-core-LegalSituation-LegalStatus'"/>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </reasonReference>
                </xsl:for-each>                
            </Procedure>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="vrijheidsbeperkende_interventie" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Freedom restricting intervention</xsl:text>
            <xsl:if test="soort_interventie[@displayName]">
                <xsl:value-of select="concat('type ', soort_interventie/@displayName)"/>
            </xsl:if>
            <xsl:if test="begin[@value]">
                <xsl:value-of select="concat('from ', begin/@value)"/>
            </xsl:if>
            <xsl:if test="einde[@value]">
                <xsl:value-of select="concat('until ', einde/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>