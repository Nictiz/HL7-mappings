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
            <xsl:with-param name="in" select="//(
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/patient | 
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/contactpersoon |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/zorgverlener |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/verzender/zorgverlener |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/ontvanger/zorgverlener |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/verzender/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/ontvanger/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/zorgverlener/zorgaanbieder/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/verzender/zorgverlener/zorgaanbieder/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/ontvanger/zorgverlener/zorgaanbieder/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/kern |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/kern/reden_bericht/probleem
                )"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="sturen_verwijzing_of_update_huisarts_naar_paramedicus">
        <!--<xsl:message>Parameter writeOutputToDisk has value = <xsl:value-of select="$writeOutputToDisk"/></xsl:message>
        <xsl:message>Parameter dateT has value = <xsl:value-of select="$dateT"/></xsl:message>-->
        
        <xsl:variable name="resources" as="element(f:entry)*">
            <xsl:variable name="patient" as="element()?">
                <xsl:for-each select="bundel_generieke_huisartsoverdrachten/patient">
                    <xsl:call-template name="nl-core-Patient"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="contactpersonen" as="element()*">
                <xsl:for-each select="bundel_generieke_huisartsoverdrachten/contactpersoon">
                    <xsl:call-template name="nl-core-ContactPerson">
                        <xsl:with-param name="patient" select="../patient"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="zorgverleners" as="element()*">
                <xsl:for-each-group select="bundel_generieke_huisartsoverdrachten/zorgverlener | envelop/verzender/zorgverlener | envelop/ontvanger/zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                    
                    <xsl:call-template name="nl-core-HealthProfessional-Practitioner">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:variable>
            
            <xsl:variable name="zorgaanbieders" as="element()*">
                <xsl:for-each-group select="bundel_generieke_huisartsoverdrachten/zorgaanbieder | envelop/verzender/zorgaanbieder | envelop/ontvanger/zorgaanbieder | bundel_generieke_huisartsoverdrachten/zorgverlener/zorgaanbieder/zorgaanbieder | envelop/verzender/zorgverlener/zorgaanbieder/zorgaanbieder | envelop/ontvanger/zorgverlener/zorgaanbieder/zorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthcareProvider-Organization">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:variable>
            
            <xsl:variable name="envelop" as="element()*">
                <xsl:for-each select="envelop">
                    <xsl:call-template name="hg-ReferralTask"/>
                    <xsl:call-template name="hg-ReferralServiceRequest"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="kern" as="element()?">
                <xsl:for-each select="kern">
                    <xsl:call-template name="hg-ReferralComposition"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="probleem" as="element()?">
                <xsl:for-each select="kern/reden_bericht/probleem">
                    <xsl:call-template name="nl-core-Problem"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:for-each select="$patient | $contactpersonen | $zorgverleners | $zorgaanbieders | $envelop | $kern | $probleem">
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
    <xsl:template name="hg-ReferralTask" as="element(f:Task)?">
        <xsl:param name="subject" select="patientgegevens/patient" as="element()?"/>
        <xsl:param name="requester" select="verzender/*" as="element()?"/>
        <xsl:param name="owner" select="ontvanger/*" as="element()?"/>
        
        <Task>
            <xsl:call-template name="insertLogicalId">
                <xsl:with-param name="profile" select="'hg-ReferralTask'"/>
            </xsl:call-template>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/hg-ReferralTask"/>
            </meta>
            
            <xsl:for-each select="..[@id]">
                <identifier>
                    <value>
                        <xsl:attribute name="value">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </value>
                </identifier>
            </xsl:for-each>
            
            <status value="requested"/>
            <intent value="order"/>
            
            <code>
                <coding>
                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                    <code value="3457005"/>
                    <display value="verwijzen van patiënt"/>
                </coding>
            </code>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="."/>
                <xsl:with-param name="wrapIn" select="'focus'"/>
                <xsl:with-param name="profile" select="'hg-ReferralServiceRequest'"/>
            </xsl:call-template>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="$subject"/>
                <xsl:with-param name="wrapIn" select="'for'"/>
            </xsl:call-template>
            
            <xsl:for-each select="datum_tijd_verzenden[@value]">
                <authoredOn>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </authoredOn>
            </xsl:for-each>
            
            <xsl:for-each select="$requester">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="wrapIn" select="'requester'"/>
                    <xsl:with-param name="profile">
                        <xsl:choose>
                            <xsl:when test="self::zorgverlener">nl-core-HealthProfessional-PractitionerRole</xsl:when>
                            <xsl:when test="self::zorgaanbieder">nl-core-HealthcareProvider-Organization</xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="$owner">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="wrapIn" select="'owner'"/>
                    <xsl:with-param name="profile">
                        <xsl:choose>
                            <xsl:when test="self::zorgverlener">nl-core-HealthProfessional-PractitionerRole</xsl:when>
                            <xsl:when test="self::zorgaanbieder">nl-core-HealthcareProvider-Organization</xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </Task>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="hg-ReferralServiceRequest" as="element(f:ServiceRequest)?">
        <xsl:param name="subject" select="patientgegevens/patient" as="element()?"/>
        <xsl:param name="requester" select="verzender/*" as="element()?"/>
        <xsl:param name="performer" select="ontvanger/*" as="element()?"/>
        
            <ServiceRequest>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'hg-ReferralServiceRequest'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/hg-ReferralServiceRequest"/>
                </meta>
                
                <xsl:for-each select="..[@id]">
                    <identifier>
                        <value>
                            <xsl:attribute name="value">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </value>
                    </identifier>
                </xsl:for-each>
                
                <status value="completed"/>
                <intent value="order"/>
                
                <xsl:for-each select="type_bericht[@code]">
                    <category>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </category>
                </xsl:for-each>
                
                <xsl:for-each select="urgentie[@code]">
                    <priority>
                        <xsl:call-template name="code-to-code">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </priority>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <xsl:for-each select="datum_tijd_verzenden[@value]">
                    <authoredOn>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </authoredOn>
                </xsl:for-each>
                
                <xsl:for-each select="$requester">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'requester'"/>
                        <xsl:with-param name="profile">
                            <xsl:choose>
                                <xsl:when test="self::zorgverlener">nl-core-HealthProfessional-PractitionerRole</xsl:when>
                                <xsl:when test="self::zorgaanbieder">nl-core-HealthcareProvider-Organization</xsl:when>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="$performer">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'performer'"/>
                        <xsl:with-param name="profile">
                            <xsl:choose>
                                <xsl:when test="self::zorgverlener">nl-core-HealthProfessional-PractitionerRole</xsl:when>
                                <xsl:when test="self::zorgaanbieder">nl-core-HealthcareProvider-Organization</xsl:when>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="../kern"/>
                    <xsl:with-param name="wrapIn" select="'supportingInfo'"/>
                    <xsl:with-param name="profile" select="'hg-ReferralComposition'"/>
                </xsl:call-template>
            </ServiceRequest>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="hg-ReferralComposition" as="element(f:Composition)?">
        <xsl:param name="subject" select="../envelop/patientgegevens/patient" as="element()?"/>
        <xsl:param name="author" select="../envelop/verzender/*" as="element()?"/>
        
        <Composition>
            <xsl:call-template name="insertLogicalId">
                <xsl:with-param name="profile" select="'hg-ReferralComposition'"/>
            </xsl:call-template>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/hg-ReferralComposition"/>
            </meta>
            
            <xsl:for-each select="..[@id]">
                <identifier>
                    <value>
                        <xsl:attribute name="value">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </value>
                </identifier>
            </xsl:for-each>
            
            <status value="final"/>
            
            <type>
                <coding>
                    <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                    <code value="57133-1"/>
                    <display value="Referral note"/>
                </coding>
            </type>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="$subject"/>
                <xsl:with-param name="wrapIn" select="'subject'"/>
            </xsl:call-template>
            
            <xsl:for-each select="../envelop/datum_tijd_verzenden[@value]">
                <date>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </date>
            </xsl:for-each>
            
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
            
            <title value="Referral note"/>
            
            <xsl:for-each select="../envelop">
                <section>
                    <title value="Envelop"/>
                    <code>
                        <coding>
                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                            <code value="405624007"/>
                            <display value="administratieve documentatie"/>
                        </coding>
                    </code>
                    
                    <xsl:for-each select="zorgpad[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Zorgpad"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="370858005"/>
                                    <display value="volgen van klinisch zorgpad"/>
                                </coding>
                            </code>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="voorzieningen_nodig_bij_consult[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Voorzieningen nodig bij consult"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="230211000146109"/>
                                    <display value="faciliteiten benodigd bij consult"/>
                                </coding>
                            </code>
                        </section>
                    </xsl:for-each>
                </section>
            </xsl:for-each>
            
            <xsl:if test="reden_bericht/context[@value] | reden_bericht/probleem | ingestelde_behandeling[@value] | procedure_voorstel[@value] | verder_van_belang[@value]">
                <section>
                    <title value="Kern"/>
                    <code>
                        <coding>
                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                            <code value="406550009"/>
                            <display value="samenvatting van zorgvraag"/>
                        </coding>
                    </code>
                    
                    <xsl:for-each select="reden_bericht">
                        <section>
                            <xsl:for-each select="context[@value]">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                    <valueString>
                                        <xsl:call-template name="string-to-string">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueString>
                                </extension>
                            </xsl:for-each>
                            
                            <title value="Reden bericht"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="440378000"/>
                                    <display value="verwijzing voor"/>
                                </coding>
                            </code>
                            
                            <xsl:for-each select="probleem">
                                <entry>
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                                    </xsl:call-template>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ingestelde_behandeling[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Ingestelde behandeling"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="108631000146107"/>
                                    <display value="behandeling lopende"/>
                                </coding>
                            </code>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="procedure_voorstel[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Procedurevoorstel"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="240471000146100"/>
                                    <display value="toelichting op aard van verwijzing"/>
                                </coding>
                            </code>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="verder_van_belang[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Verder van belang"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="159121000146100"/>
                                    <display value="toelichting op voorgesteld beleid"/>
                                </coding>
                            </code>
                        </section>
                    </xsl:for-each>
                </section>
            </xsl:if>
        </Composition>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="*" mode="_generateId" priority="2">
        <xsl:param name="profile" as="xs:string" required="yes"/>
        <xsl:variable name="id" select="replace(tokenize(base-uri(), '/')[last()], '.xml', '')"/>
        <xsl:variable name="baseId" select="replace($id, '-[0-9]{2}$', '')"/>
        <xsl:variable name="localName" select="local-name()"/>
        <xsl:variable name="logicalId">
            <xsl:choose>
                <xsl:when test="$localName = 'envelop' and $profile = 'hg-ReferralTask'">
                    <xsl:value-of select="'task-' || (../@id)[1]"/>
                </xsl:when>
                <xsl:when test="$localName = 'envelop' and $profile = 'hg-ReferralServiceRequest'">
                    <xsl:value-of select="'servicerequest-' || (../@id)[1]"/>
                </xsl:when>
                <xsl:when test="$localName = 'kern'">
                    <xsl:value-of select="'composition-' || (../@id)[1]"/>
                </xsl:when>
                <xsl:when test="$localName = 'patient'">
                    <xsl:value-of select="'patient-' || string-join((naamgegevens[1]/geslachtsnaam/(voorvoegsels, achternaam)/@value, naamgegevens[1]/geslachtsnaam_partner/(voorvoegsels_partner, achternaam_partner)/@value), '-')"/>
                </xsl:when>
                <xsl:when test="$localName = 'contactpersoon'">
                    <xsl:value-of select="'contactperson-' || string-join((naamgegevens[1]/geslachtsnaam/(voorvoegsels, achternaam)/@value, naamgegevens[1]/geslachtsnaam_partner/(voorvoegsels_partner, achternaam_partner)/@value), '-')"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgverlener' and $profile = 'nl-core-HealthProfessional-PractitionerRole'">
                    <xsl:value-of select="'practitionerrole-' || (zorgverlener_identificatienummer/@value, specialisme/(@displayName, @code))[1]"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgverlener' and $profile = 'nl-core-HealthProfessional-Practitioner'">
                    <xsl:value-of select="'practitioner-' || (zorgverlener_identificatienummer/@value, specialisme/(@displayName, @code))[1]"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgaanbieder' and $profile = 'nl-core-HealthcareProvider-Organization'">
                    <xsl:value-of select="'organization-' || string-join((zorgaanbieder_identificatienummer/@value, afdeling_specialisme/@code)[. != ''], '-')"/>
                </xsl:when>
                <xsl:when test="$localName = 'probleem'">
                    <xsl:value-of select="'problem-' || probleem_naam/@code[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$localName"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- Failsafe, ids can get quite long -->
        <xsl:value-of select="nf:assure-logicalid-length(nf:removeSpecialCharacters($logicalId))"/>
    </xsl:template>
    
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