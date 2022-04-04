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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="gebz_mappings.xsl"/>
    <xsl:import href="gebz_2_fhir_zib-pregnancy.xsl"/>
<!--    <xsl:import href="../../../zibs2017/payload/nl-core-patient-2.1.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>  
   
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
 
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="bcObservationReference" match="graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | definitieve_a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | tijdstip_begin_actieve_ontsluiting | hoeveelheid_bloedverlies | conditie_perineum_postpartum | voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie | voorgenomen_voeding | tijdstip_actief_meepersen | type_partus | apgarscore_na_5_min | apgar_score_totaal | geboortegewicht | alcohol_gebruik_status | drugs_gebruik_status | tabak_gebruik_status" mode="doBcObservationReference" as="element()*">
        <xsl:variable name="theIdentifier" select="."/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$observations[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference value="{nf:getFullUrlOrId($theGroupElement/f:entry)}"/>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces a FHIR entry element with an Observation resource</xd:desc>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="adaChild">Optional. ADA child patient concept to build a reference to from this resource</xd:param>
        <xd:param name="uuid">If true generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Observation.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="bcObservationEntry" match="graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | definitieve_a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | tijdstip_begin_actieve_ontsluiting | hoeveelheid_bloedverlies | conditie_perineum_postpartum | voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie | voorgenomen_voeding | tijdstip_actief_meepersen | type_partus | apgarscore_na_5_min | apgar_score_totaal | geboortegewicht | bloeddruk |  alcohol_gebruik_status | drugs_gebruik_status | tabak_gebruik_status | node()[substring(name(.),string-length(name(.)) + 1 - string-length('waarde'), string-length(name(.)))='waarde']" mode="doBcObservationEntry" as="element(f:entry)">
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaChild"/>
        <xsl:param name="uuid" select="true()" as="xs:boolean"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and false()">
                        <!-- TODO: vullen met zinnige checks/data -->
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="bc-observation">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient"/>
                    <xsl:with-param name="adaChild" select="$adaChild"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>
 
    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg concept to FHIR Observation <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of an Observation resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="adaChild">Optional. ADA child patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-observation" mode="doObservationResource" match="graviditeit | pariteit | pariteit_voor_deze_zwangerschap | aterme_datum | a_terme_datum | definitieve_a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | tijdstip_begin_actieve_ontsluiting | hoeveelheid_bloedverlies | conditie_perineum_postpartum | voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie | voorgenomen_voeding | tijdstip_actief_meepersen | type_partus | apgarscore_na_5_min | apgar_score_totaal | geboortegewicht | bloeddruk | alcohol_gebruik_status | drugs_gebruik_status | tabak_gebruik_status | node()[substring(name(.),string-length(name(.)) + 1 - string-length('waarde'), string-length(name(.)))='waarde']" as="element()">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaChild"/>     
        <xsl:variable name="elementId" select="./@id"/>
        <xsl:variable name="elementName" select="name(.)"/>
        <xsl:variable name="parentElemId" select="parent::node()/@id"/>
        <xsl:variable name="parentElemName" select="parent::node()/name(.)"/>
        <xsl:variable name="dateElement" select="(node()|../node())[name(.)='datum_bepaling' or substring(name(.),string-length(name(.)) + 1 - string-length('datum_tijd'), string-length(name(.)))='datum_tijd']"/>
  
        <xsl:for-each select="$in">            
            <Observation>
                <xsl:if test="$referById">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <xsl:variable name="profiles" as="element()*">
                        <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-observation"/>
                        <xsl:call-template name="bc-profile"/>    
                    </xsl:variable>
                    <xsl:for-each-group select="$profiles" group-by="@value">
                        <xsl:copy-of select="."/>
                    </xsl:for-each-group>
                </meta>
                <xsl:if test="ancestor::zwangerschap or ancestor::zwangerschapsgegevens/zwangerschap or ancestor::bevalling or ancestor::baring or ancestor::foetusspecifieke_onderzoeksgegevens"><!-- was: not(ancestor::lichamelijk_onderzoek_kind) -->
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/Observation-focusSTU3">
                        <valueReference>
                            <xsl:for-each select="ancestor::zwangerschap | ancestor::zwangerschapsgegevens/zwangerschap">
                                <xsl:call-template name="pregnancyReference"/>
                            </xsl:for-each>
                            <xsl:for-each select="ancestor::bevalling | ancestor::baring">
                                <xsl:call-template name="bcProcedureReference"/>
                            </xsl:for-each>
                            <xsl:for-each select="ancestor::foetusspecifieke_onderzoeksgegevens">
                                <!--<xsl:call-template name="bcFetusReference"/>-->
                            </xsl:for-each>
                        </valueReference>
                    </extension>
                </xsl:if>
                <status value="final"/>
                <xsl:if test="name(.)=('bloeddruk','gewicht_waarde','lengte_waarde','schedelomvang_waarde')">
                    <category>
                        <coding>
                            <system value="http://hl7.org/fhir/observation-category" />
                            <code value="vital-signs" />
                            <display value="Vital Signs" />
                        </coding>
                    </category>
                </xsl:if>
                <code>
                    <xsl:call-template name="bc-coding"/>
                </code>
                <xsl:choose>
                    <xsl:when test="$adaChild and ancestor::lichamelijk_onderzoek_kind"><!-- was: $parentElemName='lichamelijk_onderzoek_kind -->
                        <xsl:for-each select="$adaChild">
                            <subject>
                                <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                            </subject>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="$adaPatient">
                            <subject>
                                <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                            </subject>
                        </xsl:for-each>                 
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <!-- als de node rechtstreeks onder een contact hangt dan kan de parent opgehaald worden -->
                    <xsl:when test="ancestor::node()/name(.)='prenatale_controle' and not(@datatype='reference')">
                        <xsl:for-each select="ancestor::prenatale_controle">
                            <context>
                                <xsl:apply-templates select="." mode="doBcEncounterReference"/>
                            </context>
                        </xsl:for-each>                    
                    </xsl:when>
                    <!-- voor generieke bouwstenen kan niet naar de parent node gekeken worden, maar moet het pad van bovenaf
                    doorlopen worden om de referentie naar de bouwsteen in het juiste contact op te zoeken obv het id-->
                    <xsl:when test="ancestor::*/zwangerschapsgegevens/prenatale_controle[node()/@value=($elementId,$parentElemId)]">
                        <xsl:for-each select="ancestor::*/zwangerschapsgegevens/prenatale_controle[node()/@value=($elementId,$parentElemId)]">
                            <context>
                                <xsl:apply-templates select="." mode="doBcEncounterReference"/>
                            </context>
                        </xsl:for-each>                    
                    </xsl:when>
                    <!-- indien de observatie niet aan een contact hangt dan zwangerschapsdossier (episode of care) als context nemen -->
                    <xsl:otherwise>
                        <!-- voor 2.3 wordt dossier vanuit zwangerschap gevuld, voor 3.2 vanuit zorg_episode -->
                        <xsl:for-each select="(/*/zorgverlening/zorg_episode | ancestor::*/zwangerschap)[1]">
                            <context>
                                <xsl:apply-templates select="." mode="doMaternalRecordReference"/>
                            </context>
                        </xsl:for-each>                         
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <!-- indien een datum element is opgenomen in de observatie, deze overnemen -->
                    <xsl:when test="$dateElement">
                        <xsl:for-each select="$dateElement">
                            <effectiveDateTime value="{@value}">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        <xsl:with-param name="precision" select="'DAY'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </effectiveDateTime>
                        </xsl:for-each>
                    </xsl:when>
                    <!-- indien geen datum ingevuld dit afleiden uit contact waarbinnen observatie heeft plaatsgevonden -->
                    <xsl:when test="ancestor::prenatale_controle/datum_prenatale_controle/begin_datum_tijd">
                        <xsl:for-each select="ancestor::prenatale_controle/datum_prenatale_controle/begin_datum_tijd">
                            <effectiveDateTime value="{@value}">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        <xsl:with-param name="precision" select="'DAY'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </effectiveDateTime>                   
                        </xsl:for-each>
                    </xsl:when>
                    <!-- indien niet gekoppeld aan contact voor lichamelijk onderzoek kind bij geboorte de geboortedatum overnemen -->
                    <xsl:when test="ancestor::lichamelijk_onderzoek_kind">
                        <xsl:variable name="kindId" select="ancestor::kind/demografische_gegevens/patient/@value"/>
                        <xsl:for-each select="ancestor::*/administratief/patient[@id=$kindId]/geboortedatum">
                            <effectiveDateTime value="{@value}">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        <xsl:with-param name="precision" select="'DAY'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </effectiveDateTime>                   
                        </xsl:for-each>                       
                    </xsl:when>
                    <!-- voor overige observaties waarbij datum verplicht is de periode van de episode invullen -->
                    <xsl:otherwise>
                        <xsl:for-each select="ancestor::*/zorgverlening/zorg_episode">
                            <effectivePeriod>
                                <start value="{begin_datum/@value}">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(begin_datum/@value)"/>
                                            <xsl:with-param name="precision" select="'DAY'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                                <end value="{eind_datum/@value}">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(eind_datum/@value)"/>
                                            <xsl:with-param name="precision" select="'DAY'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>                       
                            </effectivePeriod>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- voor observaties met componenten value[x] leeglaten -->
                <xsl:if test="not(name(.)='bloeddruk')">
                    <xsl:for-each select=".">
                        <xsl:variable name="test" select="@nullFlavor"/>
                        <xsl:choose>
                            <xsl:when test="@datatype='datetime'">
                                <valueDateTime value="{@value}">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="precision" select="'DAY'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </valueDateTime>
                            </xsl:when>
                            <xsl:when test="not(@code) and (@value castable as xs:integer or @value castable as xs:decimal)">
                                <xsl:element name="valueQuantity" namespace="http://hl7.org/fhir">
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="any-to-value"> 
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elemName">value</xsl:with-param>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each> 
                </xsl:if>
                <xsl:for-each select="../interpretatie_frequentie">
                    <interpretation>
                        <coding>
                            <system value="{@codeSystem}"/>
                            <code value="{@code}"/>
                            <display value="{@displayName}"/>
                        </coding>
                    </interpretation>
                </xsl:for-each>
                <xsl:for-each select="../toelichting">
                    <comment value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="../(bepalings_methode | definitieve_a_terme_methode | observatie_methode)">
                    <method>
                        <coding>
                            <system value="{@codeSystem}"/>
                            <code value="{@code}"/>
                            <display value="{@displayName}"/>
                        </coding>
                        <xsl:if test="./@originalText">
                            <text value="{./@originalText}"/>    
                        </xsl:if>
                    </method>
                </xsl:for-each>
                <xsl:for-each select="systolische_bloeddruk | diastolische_bloeddruk | ../hartslag_regelmatigheid | ../kleding">
                    <component>
                        <code>
                            <xsl:call-template name="bc-coding"/>
                        </code>
                        <xsl:choose>
                            <xsl:when test="@datatype='datetime'">
                                <valueDateTime value="{@value}">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="precision" select="'DAY'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </valueDateTime>
                            </xsl:when>
                            <xsl:when test="not(@code) and (@value castable as xs:integer or @value castable as xs:decimal)">
                                <xsl:element name="valueQuantity" namespace="http://hl7.org/fhir">
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="any-to-value"> 
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elemName">value</xsl:with-param>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </component>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
      
</xsl:stylesheet>
