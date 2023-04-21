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
    
    <xsl:import href="../../../../zibs2020/payload/0.8.0-beta.1/all_zibs.xsl"/>
    
    <xd:doc>
        <xd:desc>If true, write all generated resources to disk in the fhir_instance directory. Otherwise, return all the output in a FHIR Bundle.</xd:desc>
    </xd:doc>
    <xsl:param name="writeOutputToDisk" select="true()" as="xs:boolean"/>
    
    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/R4/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>
    
    <!-- Generate metadata for all ADA instances -->
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <!-- ADA instances for this project start with $zib2020Oid and end in .1, or in 9.*.* in the case of the medication related zibs -->
            <xsl:with-param name="in" select="//(
                beschikbaarstellen_contraindicatie/patient | 
                beschikbaarstellen_contraindicatie/medicatie_contra_indicatie | 
                beschikbaarstellen_contraindicatie/bouwstenen/zorgverlener |
                beschikbaarstellen_contraindicatie/bouwstenen/zorgaanbieder
                )"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="beschikbaarstellen_contraindicatie">
        <!--<xsl:message>Parameter writeOutputToDisk has value = <xsl:value-of select="$writeOutputToDisk"/></xsl:message>
        <xsl:message>Parameter dateT has value = <xsl:value-of select="$dateT"/></xsl:message>-->
        
        <xsl:variable name="resources" as="element(f:entry)*">
            <xsl:variable name="medicatiecontraindicaties" as="element()*">
                <xsl:for-each select="medicatie_contra_indicatie">
                    <xsl:call-template name="cio-MedicationContraIndication"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="patient" as="element()?">
                <xsl:for-each select="patient">
                    <xsl:call-template name="nl-core-Patient"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="zorgverleners" as="element()*">
                <xsl:for-each-group select="bouwstenen/zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:variable>
            
            <xsl:variable name="zorgaanbieders" as="element()*">
                <xsl:for-each-group select="bouwstenen/zorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthcareProvider-Organization">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:variable>
            
            <xsl:for-each select="$medicatiecontraindicaties | $patient | $zorgverleners | $zorgaanbieders">
                <entry xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="_insertFullUrlById"/>
                    <resource>
                        <xsl:copy-of select="."/>
                    </resource>
                </entry>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$writeOutputToDisk">
                <xsl:for-each select="$resources/f:resource/*">
                    <xsl:choose>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="../fhir_instance/{f:id/@value}.xml">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- This happens when transforming a non-saved document in Oxygen -->
                            <xsl:message>Could not output to result-document without Resource.id. Outputting to console instead.</xsl:message>
                            <xsl:copy-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <Bundle xmlns="http://hl7.org/fhir">
                    <id value="{nf:assure-logicalid-length(nf:removeSpecialCharacters(@id))}"/>
                    <type value="searchset"/>
                    <!-- What should we count? -->
                    <total value="TODO"/>
                    <!--<total value="{count($resources/f:resource/*)}"/>-->
                    <xsl:choose>
                        <xsl:when test="$bundleSelfLink[not(. = '')]">
                            <link>
                                <relation value="self"/>
                                <url value="{$bundleSelfLink}"/>
                            </link>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Parameter bundleSelfLink is empty, but server SHALL return the parameters that were actually used to process the search.</xsl:with-param>
                                <xsl:with-param name="terminate" select="false()"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:copy-of select="$resources"/>
                </Bundle>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="cio-MedicationContraIndication" as="element(f:Flag)?">
        <xsl:param name="subject" select="../patient" as="element()?"/>
        <xsl:param name="author" select="auteur/*" as="element()?"/>
        
            <Flag>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'cio-MedicationContraIndication'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/cio-MedicationContraIndication"/>
                </meta>
                
                <xsl:for-each select="toelichting[@value]">
                    <xsl:call-template name="ext-Comment"/>
                </xsl:for-each>
                
                <xsl:for-each select="reden_van_afsluiten[@value]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationContraIndication.ReasonClosure">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="registratie_datum_tijd[@value]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationContraIndication.RegistrationDateTime">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="relatie_medicatie_contra_indicatie/identificatie[@value]">
                    <xsl:variable name="relatieIdentificatie">
                        <xsl:value-of select="@value"/>
                    </xsl:variable>
                    
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationContraIndication.RelationContraIndication">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="../../../medicatie_contra_indicatie[identificatie/@value = $relatieIdentificatie]"/>
                                <xsl:with-param name="profile" select="'cio-MedicationContraIndication'"/>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="identificatie[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                
                <xsl:for-each select="medicatie_contra_indicatie_status[@code]">
                    <status>
                        <xsl:attribute name="value">
                            <xsl:call-template name="code-to-code">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="codeMap" as="element()*">
                                    <map inCode="15240007" inCodeSystem="2.16.840.1.113883.6.96" code="active"/>
                                    <map inCode="410513005" inCodeSystem="2.16.840.1.113883.6.96" code="inactive"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:attribute>
                    </status>
                </xsl:for-each>
                
                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="140401000146105"/>
                        <display value="contra-indicatie met betrekking op medicatiebewaking"/>
                    </coding>
                </category>
                
                <xsl:for-each select="medicatie_contra_indicatie_naam[@code]">
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
                
                <xsl:if test="start_bewaking_datum_tijd[@value] or datum_tijd_afsluiten[@value]">
                    <period>
                        <xsl:if test="start_bewaking_datum_tijd[@value]">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(start_bewaking_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:if>
                        <xsl:if test="datum_tijd_afsluiten[@value]">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(datum_tijd_afsluiten/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:if>
                    </period>
                </xsl:if>
                
                <xsl:for-each select="$author">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'author'"/>
                        <xsl:with-param name="profile">
                            <xsl:choose>
                                <xsl:when test="self::zorgverlener">nl-core-HealthProfessional-PractitionerRole</xsl:when>
                                <xsl:when test="self::zorgaanbieder">nl-core-HealthcareProvider-Organization</xsl:when>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </Flag>
    </xsl:template>
    
    <!--<xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="*" mode="_generateId" priority="2">
        <xsl:param name="profile" as="xs:string" required="yes"/>
        <xsl:variable name="id" select="replace(tokenize(base-uri(), '/')[last()], '.xml', '')"/>
        <xsl:variable name="baseId" select="replace($id, '-[0-9]{2}$', '')"/>
        <xsl:variable name="localName" select="local-name()"/>
        <xsl:variable name="logicalId">
            <xsl:choose>
                <xsl:when test="$localName = 'medicatie_contra_indicatie'">
                    <xsl:value-of select="'mci-' || identificatie/@value"/>
                </xsl:when>
                <xsl:when test="$localName = 'patient'">
                    <xsl:value-of select="'patient-' || string-join((naamgegevens[1]/geslachtsnaam/(voorvoegsels, achternaam)/@value, naamgegevens[1]/geslachtsnaam_partner/(voorvoegsels_partner, achternaam_partner)/@value), '-')"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgverlener'">
                    <xsl:value-of select="'prac-' || (zorgverlener_identificatienummer/@value, specialisme/(@displayName, @code))[1]"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgaanbieder'">
                    <xsl:value-of select="'org-' || ((zorgaanbieder_identificatienummer, organisatie_naam)/@value, organisatie_type/(@displayName, @code))[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$localName"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-\- Failsafe, ids can get quite long -\->
        <xsl:value-of select="nf:assure-logicalid-length(nf:removeSpecialCharacters($logicalId))"/>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
        <xd:param name="fhirId"/>
    </xd:doc>
    <xsl:template name="_insertFullUrlById">
        <xsl:param name="in" select="."/>   
        <xsl:param name="fhirId" select="$in/f:id/@value"/>
        
        <xsl:variable name="theMetaData" select="$fhirMetadata[nm:logical-id = $fhirId]" as="element()*"/>
        <xsl:choose>
            <xsl:when test="count($theMetaData) = 0">
                <xsl:message terminate="yes">_insertFullUrlById: Nothing found. (<xsl:value-of select="count($fhirId)"/>)</xsl:message>
            </xsl:when>
            <xsl:when test="count($theMetaData) gt 1">
                <xsl:message terminate="no">_insertFullUrlById: Multiple found (<xsl:value-of select="count($theMetaData)"/>): <xsl:value-of select="$fhirId"/> - <xsl:value-of select="$theMetaData/nm:full-url"/></xsl:message>
            </xsl:when>
        </xsl:choose>
        
        <xsl:variable name="fullUrl" select="$theMetaData/nm:full-url"/>
        
        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>