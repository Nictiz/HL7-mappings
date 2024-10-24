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
    
    <xsl:variable name="profileNameCioHypersensitivityIntolerance">cio-HypersensitivityIntolerance</xsl:variable>
    
    <xd:doc>
        <xd:desc>Create a cio-HypersensitivityIntolerance instance as an AllergyIntolerance FHIR instance from the ada element geneesmiddelovergevoeligheid/overgevoeligheid_intolerantie.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template name="cio-HypersensitivityIntolerance" as="element(f:AllergyIntolerance)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="../../patient" as="element()?"/>
        
        <xsl:for-each select="$in">    
            <AllergyIntolerance>
                <xsl:variable name="registrationInformation" select="../../bouwstenen/registratie_informatie[@id = current()/registratie_informatie/@value]"/>
                <xsl:variable name="identificationNumber" select="$registrationInformation/identificatienummer"/>
                <xsl:variable name="author" select="$registrationInformation/auteur/*"/>
                <xsl:variable name="creationDateTime" select="$registrationInformation/ontstaans_datum_tijd"/>
                
                <xsl:variable name="relationConditionRegistrationInformation" select="../../bouwstenen/registratie_informatie[identificatienummer/@value = current()/relatie_aandoening_of_gesteldheid/identificatie/@value]"/>
                <xsl:variable name="relationCondition" select="../../geneesmiddelovergevoeligheid/aandoening_of_gesteldheid[registratie_informatie/@value = $relationConditionRegistrationInformation/@id]"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameCioHypersensitivityIntolerance"/>
                </xsl:call-template>
                <meta>
                    <profile value="{concat($urlBaseNictizProfile, $profileNameCioHypersensitivityIntolerance)}"/>
                </meta>
                
                <extension url="http://nictiz.nl/fhir/5.0/StructureDefinition/extension-AllergyIntolerance.type">
                    <valueCodeableConcept>
                        <coding>
                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                            <code value="420134006"/>
                            <display value="neiging tot ongewenste reactie"/>
                        </coding>
                    </valueCodeableConcept>
                </extension>
                
                <xsl:for-each select="diagnostisch_inzicht_datum[@value]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/allergyintolerance-assertedDate">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="wijze_van_vaststellen[@code]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-WayOfDetermination">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                
                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-RelationCondition">
                    <valueReference>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$relationCondition"/>
                            <xsl:with-param name="profile" select="$profileNameCioCondition"/>
                        </xsl:call-template>
                    </valueReference>
                </extension>
                
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
                
                <xsl:for-each select="categorie[@code]">
                    <category>
                        <xsl:attribute name="value">
                            <xsl:call-template name="code-to-code">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="codeMap" as="element()*">
                                    <map inCode="418471000" inCodeSystem="{$oidSNOMEDCT}" code="food"/>
                                    <map inCode="157531000146101" inCodeSystem="{$oidSNOMEDCT}" code="environment"/>
                                    <map inCode="419511003" inCodeSystem="{$oidSNOMEDCT}" code="medication"/>
                                    <map inCode="157521000146103" inCodeSystem="{$oidSNOMEDCT}" code="environment"/>
                                    <map inCode="157511000146108" inCodeSystem="{$oidSNOMEDCT}" code="environment"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:attribute>
                        
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </category>
                </xsl:for-each>
                
                <xsl:for-each select="verwacht_risico_bij_blootstelling[@code]">
                    <criticality>
                        <xsl:attribute name="value">
                            <xsl:call-template name="code-to-code">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="codeMap" as="element()*">
                                    <map inCode="255604002" inCodeSystem="{$oidSNOMEDCT}" code="low"/>
                                    <map inCode="24484000" inCodeSystem="{$oidSNOMEDCT}" code="high"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:attribute>
                        
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </criticality>
                </xsl:for-each>
                
                <xsl:for-each select="agens/stof[@code]">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'patient'"/>
                </xsl:call-template>
                
                <xsl:for-each select="$relationCondition/periode_aanwezig/tijds_interval/start_datum_tijd[@value]">
                    <onsetDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </onsetDateTime>
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
                
                <xsl:for-each select="diagnose_steller/*">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'asserter'"/>
                        <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                    </xsl:call-template>
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
            </AllergyIntolerance>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="overgevoeligheid_intolerantie[parent::geneesmiddelovergevoeligheid]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Overgevoeligheid/intolerantie</xsl:text>
            <xsl:value-of select="agens/stof/@displayName"/>
            <xsl:value-of select="concat('diagnosedatum: ', diagnostisch_inzicht_datum/@value)"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>