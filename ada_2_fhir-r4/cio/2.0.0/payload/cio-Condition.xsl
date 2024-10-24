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
    
    <xsl:variable name="profileNameCioCondition">cio-Condition</xsl:variable>
    
    <xd:doc>
        <xd:desc>Create a cio-Condition instance as a Condition FHIR instance from the ada element geneesmiddelovergevoeligheid/aandoening_of_gesteldheid.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template name="cio-Condition" as="element(f:Condition)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="../../patient" as="element()?"/>
        
        <xsl:for-each select="$in">    
            <Condition>
                <xsl:variable name="registrationInformation" select="../../bouwstenen/registratie_informatie[@id = current()/registratie_informatie/@value]"/>
                <xsl:variable name="identificationNumber" select="$registrationInformation/identificatienummer"/>
                <xsl:variable name="author" select="$registrationInformation/auteur/*"/>
                <xsl:variable name="creationDateTime" select="$registrationInformation/ontstaans_datum_tijd"/>
                
                <xsl:variable name="hypersensitivityIntolerance" select="../overgevoeligheid_intolerantie[relatie_aandoening_of_gesteldheid/identificatie/@value = $identificationNumber/@value]"/>
                <xsl:variable name="reaction" select="../reactie[relatie_aandoening_of_gesteldheid/identificatie/@value = $identificationNumber/@value]"/>
                <xsl:variable name="symptom" select="../symptoom[relatie_aandoening_of_gesteldheid/identificatie/@value = $identificationNumber/@value]"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameCioCondition"/>
                </xsl:call-template>
                <meta>
                    <profile value="{concat($urlBaseNictizProfile, $profileNameCioCondition)}"/>
                </meta>
                
                <xsl:for-each select="($hypersensitivityIntolerance | $reaction)/diagnostisch_inzicht_datum[@value]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/condition-assertedDate">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="../identificatie_gmo">
                    <xsl:call-template name="ext-MedicationHypersensitivityIdentifier">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="$identificationNumber[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                
                <xsl:for-each select="ernst[@code]">
                    <severity>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </severity>
                </xsl:for-each>
                
                <xsl:for-each select="($hypersensitivityIntolerance | $reaction)/diagnose">
                    <code>
                        <xsl:for-each select="diagnose_naam[@code]">
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <xsl:for-each select="nadere_specificatie_diagnose_naam[@value]">
                            <text>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </text>
                        </xsl:for-each>
                    </code>
                </xsl:for-each>
            
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <xsl:for-each select="periode_aanwezig/tijds_interval/start_datum_tijd[@value]">
                    <onsetDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </onsetDateTime>
                </xsl:for-each>
                
                <xsl:for-each select="periode_aanwezig/tijds_interval/eind_datum_tijd[@value]">
                    <abatementDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </abatementDateTime>
                </xsl:for-each>
                
                <xsl:for-each select="$creationDateTime[@value]">
                    <recordedDate>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </recordedDate>
                </xsl:for-each>
                
                <xsl:for-each select="$author">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'recorder'"/>
                        <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="($hypersensitivityIntolerance | $reaction)/diagnose_steller/*">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'asserter'"/>
                        <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="$symptom">
                    <evidence>
                        <detail>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="$profileNameCioSymptom"/>
                            </xsl:call-template> 
                        </detail>
                    </evidence>
                </xsl:for-each>
    
                <xsl:for-each select="toelichting[@value]">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="aandoening_of_gesteldheid[parent::geneesmiddelovergevoeligheid]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Aandoening</xsl:text>
            <xsl:value-of select="concat('startdatum: ', periode_aanwezig/tijds_interval/start_datum_tijd/@value)"/>
            <xsl:if test="periode_aanwezig/tijds_interval/eind_datum_tijd/@value">
                <xsl:value-of select="concat('einddatum: ', periode_aanwezig/tijds_interval/eind_datum_tijd/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>