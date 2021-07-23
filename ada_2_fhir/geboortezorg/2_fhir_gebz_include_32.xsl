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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="../zibs2017/payload/zib-LaboratoryTestResult-Observation-2.1.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_nl-core-patient.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_nl-core-relatedperson.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_nl-core-organization.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_nl-core-practitioner.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_bc-referralrequest.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_zib-pregnancy.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_bc-maternalrecord.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_bc-observation.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_zib-laboratory-testresult-observation.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_bc-condition.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_bc-procedure.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_bc-encounter.xsl"/>
    <xsl:import href="bouwstenen/gebz_2_fhir_bc-composition.xsl"/>
    <xsl:import href="bouwstenen/gebz_mappings.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- dateT may be given for relative dates, only applicable for test instances -->
    <xsl:param name="dateT" as="xs:date?"/>
    
    <xsl:param name="vrouwId" select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/vrouw/demografische_gegevens/patient/@value"/><!-- alleen voor 3.2 -->

    <!-- ada instances -->
    <xsl:param name="patient-ada" as="element()*">
        <xsl:choose>
            <!-- voor 2.3 moet ada eerst nog omgezet worden naar ada formaat conform zibs -->
            <xsl:when test="$adaversion='2.3'">
                <xsl:apply-templates select="//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23)/vrouw" mode="vrouw-ada"/>
            </xsl:when>
            <!-- 3.2 volgt al zib structuur en kan rechtstreeks gebruikt worden -->
            <xsl:otherwise>
                <xsl:copy-of select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/administratief/patient[@id=$vrouwId]"></xsl:copy-of>
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:param>

    <xsl:param name="partner-ada" as="element()*">
        <xsl:choose>
            <!-- voor 2.3 moet ada eerst nog omgezet worden naar ada formaat conform zibs -->
            <xsl:when test="$adaversion='2.3'">
                <xsl:apply-templates select="//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23)/vrouw/partner" mode="partner-ada"/>
            </xsl:when>
            <!-- 3.2 volgt al zib structuur en kan rechtstreeks gebruikt worden -->
            <xsl:otherwise>
                <xsl:copy-of select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/administratief/patient[@id='partner']"></xsl:copy-of><!-- todo: filter op partner -->
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:param>

    <xsl:variable name="kind-ada" as="element()*">
        <xsl:choose>
            <!-- voor 2.3 moet ada eerst nog omgezet worden naar ada formaat conform zibs -->
            <xsl:when test="$adaversion='2.3'">
                <xsl:apply-templates select="//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23)/uitkomst_per_kind" mode="kind-ada"/>
            </xsl:when>
            <!-- 3.2 volgt al zib structuur en kan rechtstreeks gebruikt worden -->
            <xsl:otherwise>
                <xsl:copy-of select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/administratief/patient[@id='Kind2']"></xsl:copy-of><!-- todo: filter op kind -->
                <xsl:copy-of select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/administratief/patient[@id='Kind3']"></xsl:copy-of><!-- todo: filter op kind -->
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:variable>

    <xsl:param name="zorginstelling-ada" as="element()*">
        <xsl:choose>
            <!-- voor 2.3 moet ada eerst nog omgezet worden naar ada formaat conform zibs -->
            <xsl:when test="$adaversion='2.3'">
                <xsl:apply-templates select="//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23)/zorgverlenerzorginstelling/zorginstelling" mode="zorginstelling-ada"/>
            </xsl:when>
            <!-- 3.2 volgt al zib structuur en kan rechtstreeks gebruikt worden -->
            <xsl:otherwise>
                <xsl:copy-of select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/administratief/zorgaanbieder"></xsl:copy-of>
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:param>
    
    <xsl:param name="verwijzing-zorginstelling-ada" as="element()*">
        <xsl:choose>
            <!-- voor 2.3 moet ada eerst nog omgezet worden naar ada formaat conform zibs -->
            <xsl:when test="$adaversion='2.3'">
                <xsl:apply-templates select="(prio1_huidige_zwangerschap | bevallingsgegevens_23)/zorgverlening/verwijsdetails/verwijzing_naar/zorginstelling" mode="zorginstelling-ada"/>
            </xsl:when>
            <!-- 3.2 volgt al zib structuur en kan rechtstreeks gebruikt worden --> <!-- todo: verwijzer zit er nu nog niet in in 3.2 -->
<!--            <xsl:otherwise>
                <xsl:copy-of select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/administratief/...."></xsl:copy-of>
            </xsl:otherwise>-->
        </xsl:choose>
    </xsl:param>

    <xsl:param name="zorgverlener-ada" as="element()*">
        <xsl:choose>
            <!-- voor 2.3 moet ada eerst nog omgezet worden naar ada formaat conform zibs -->
            <xsl:when test="$adaversion='2.3'">
                <xsl:apply-templates select="//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23)/zorgverlenerzorginstelling" mode="zorgverlener-ada"/>
            </xsl:when>
            <!-- 3.2 volgt al zib structuur en kan rechtstreeks gebruikt worden -->
            <xsl:otherwise>
                <xsl:copy-of select="med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart/administratief/zorgverlener"></xsl:copy-of>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    
    <!-- unieke related persons -->
    <xsl:variable name="relatedPersons" as="element()*">
        <!-- related-persons -->
        <xsl:for-each-group select="$partner-ada" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-persoon xmlns="">
                <group-key>
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="current-group()[1]/normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doRelatedPersonEntry-2.0">
                    <xsl:with-param name="uuid" select="$uuid"/>
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                </xsl:apply-templates>
            </unieke-persoon>
        </xsl:for-each-group>
    </xsl:variable>

    <!-- pregnancyId -->
    <!-- TODO: ophalen uit ada transactie (nu nog niet beschikbaar) -->
    <xsl:variable name="pregnancyId">
        <xsl:for-each select="//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23 | med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart)/zwangerschap">
            <xsl:value-of select="graviditeit/@value | a_terme_datum/@value | definitieve_a_terme_datum/@value"/>
        </xsl:for-each>
    </xsl:variable>
      
    <!-- verwijzingen -->
    <xsl:variable name="referralRequests" as="element()*">
        <xsl:for-each-group select="//verwijsdetails" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-verwijzing xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="concat('Verwijzing naar ',verwijzing_naar/zorginstelling/zorgaanbieder_identificatie_nummer,' ',datum_verwijzing,' ',$vrouwId)"/>
                </reference-display>
                <xsl:call-template name="referralRequestEntry">
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    <xsl:with-param name="adaZorginstelling" select="$zorginstelling-ada"/>
                    <xsl:with-param name="adaVerwijzingZorginstelling" select="$verwijzing-zorginstelling-ada"/>
                </xsl:call-template>
            </unieke-verwijzing>
        </xsl:for-each-group>
    </xsl:variable>    

    <!-- unieke zwangerschappen -->
    <!-- moet in 2 stappen ivm circular dependencies met zwangerschapsdossier -->
    <xsl:variable name="zwangerschappen" as="element()*">
        <xsl:for-each-group select="//zwangerschap" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-zwangerschap>
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="concat('Zwangerschap ',$pregnancyId,' ',$vrouwId)"/>
                </reference-display>      
                <!--<full-url xmlns="" value="{nf:get-fhir-uuid(.)}"/>-->
                <xsl:call-template name="dummyEntry">
                    <xsl:with-param name="resourceType" select="'Condition'"/>
                </xsl:call-template>
                <ada-copy xmlns="">
                    <xsl:copy-of select="."/>
                </ada-copy>
            </unieke-zwangerschap>
        </xsl:for-each-group>
    </xsl:variable>    
    
    <xd:doc>
        <xd:desc>Adds a (temporary) dummy entry to support circular references in resources</xd:desc>
        <xd:param name="resourceType">Required. Type of resource to create dummy entry for.</xd:param>
    </xd:doc>
    <xsl:template name="dummyEntry" match="/*" mode="doDummyEntry" as="element(f:entry)">
        <xsl:param name="resourceType"/>
        <entry xmlns="http://hl7.org/fhir">
            <resource>
                <xsl:element name="{$resourceType}">
                    <id value="{nf:removeSpecialCharacters(replace(nf:get-fhir-uuid(.), 'urn:[^i]*id:', ''))}"/>
                </xsl:element>>
            </resource>
        </entry>     
    </xsl:template>

    <!-- zwangerschapsdossier -->
    <xsl:variable name="episodesofcare" as="element()*">
        <xsl:for-each-group select="//zorgverlening/zorg_episode" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-episode xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="concat('Zwangerschap ',$pregnancyId,' ',$vrouwId)"/>
                </reference-display>
                <xsl:call-template name="maternalRecordEntry">
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    <xsl:with-param name="adaZorginstelling" select="$zorginstelling-ada"/>
                    <xsl:with-param name="adaZorgverlener" select="$zorgverlener-ada"/>
                </xsl:call-template>
            </unieke-episode>
        </xsl:for-each-group>
    </xsl:variable>
    
    <!-- pregnancies/conditions -->
    <xsl:variable name="conditions" as="element()*">
        <xsl:for-each select="//zwangerschap">
            <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
            <xsl:variable name="theGroupElement" select="$zwangerschappen[group-key = $theGroupKey]" as="element()?"/>
            <xsl:variable name="resourceId" select="$theGroupElement/f:entry/f:resource/f:Condition/f:id/@value"/>
            <unieke-problem xmlns="">
                <xsl:copy-of select="$theGroupElement/group-key"/>
                <xsl:copy-of select="$theGroupElement/reference-display"/>
                <xsl:call-template name="pregnancyEntry">
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    <xsl:with-param name="fhirResourceId" select="$resourceId"/>
                </xsl:call-template>       
            </unieke-problem>
        </xsl:for-each>
        <!-- problems -->
        <xsl:for-each-group select="//probleem_zwangerschap" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <xsl:variable name="elementName" select="name(.)"/>
            <unieke-bccondition xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="concat(replace($elementName, '_', ' '),$vrouwId)"/>
                </reference-display>
                <xsl:call-template name="bcConditionEntry">
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    <xsl:with-param name="adaChild" select="$kind-ada"/>
                </xsl:call-template>
            </unieke-bccondition>
        </xsl:for-each-group>
    </xsl:variable>    

    <!-- encounters -->
    <xsl:variable name="encounters" as="element()*">       
        <!-- maternale labonderzoekgegevens -->
        <xsl:for-each-group select="//prenatale_controle[not(@datatype='reference')]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <xsl:variable name="elementName" select="name(.)"/>
            <unieke-encounter xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="concat(replace($elementName, '_', ' '),$vrouwId)"/>
                </reference-display>
                <xsl:for-each select=".">
                    <xsl:call-template name="bcEncounterEntry">
                        <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    </xsl:call-template>
                </xsl:for-each>
            </unieke-encounter>
        </xsl:for-each-group>
    </xsl:variable>

    <!-- observations -->
    <xsl:variable name="observations" as="element()*">       
        <!-- maternale labonderzoekgegevens -->
        <xsl:for-each-group select="//(laboratorium_test_bloedgroep | laboratorium_test_rhesus_d | laboratorium_test_rhesus_c)[not(@datatype='reference')]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <xsl:variable name="labtest-ada" as="element()*">
                <xsl:call-template name="convertToADAlabtest"/><!-- todo conversie 3.2 naar zib2017 is anders dan die van 2.3 en het komt ook niet 1 op 1 overeen met zib 2017 -->
            </xsl:variable>
            <xsl:variable name="elementName" select="name(.)"/>
            <!-- need this later to create context element (ada context will be lost at that time) -->
            <xsl:variable name="context">
                <xsl:for-each select="(ancestor::med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart)/zwangerschapsgegevens/zwangerschap">
                    <context xmlns="http://hl7.org/fhir">
                        <xsl:apply-templates select="." mode="doMaternalRecordReference"/>  
                    </context>
                </xsl:for-each>                
            </xsl:variable>
            <unieke-labobservation xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="concat(replace($elementName, '_', ' '),$vrouwId)"/>
                </reference-display>
                <xsl:for-each select="$labtest-ada">
                    <xsl:variable name="labObservation">
                        <xsl:call-template name="laboratoryResultObservationEntry">
                            <xsl:with-param name="adaPatient" select="$patient-ada"/>
                        </xsl:call-template>            
                    </xsl:variable>
                    <xsl:for-each select="$labObservation">
                        <xsl:call-template name="transformLabObservation">
                            <xsl:with-param name="context" select="$context"></xsl:with-param>
                        </xsl:call-template>    
                    </xsl:for-each>
                </xsl:for-each>
            </unieke-labobservation>
        </xsl:for-each-group>
        <!-- zwangerschaps- en bevallingsgegevens en kindspecifieke uitkomstgegevens -->
        <xsl:for-each-group select="//(graviditeit | pariteit | pariteit_voor_deze_zwangerschap | aterme_datum | a_terme_datum | definitieve_a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | tijdstip_begin_actieve_ontsluiting | hoeveelheid_bloedverlies | conditie_perineum_postpartum | voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie | voorgenomen_voeding) | //(baring/(kindspecifieke_maternale_gegevens | kindspecifieke_uitkomstgegevens)/(tijdstip_actief_meepersen | type_partus | lichamelijk_onderzoek_kind/(apgarscore_na_5_min | geboortegewicht)) | node()[substring(name(.),string-length(name(.)) + 1 - string-length('waarde'), string-length(name(.)))='waarde'])" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <xsl:variable name="elementName" select="name(.)"/>
            <unieke-bcobservation xmlns="">
              <group-key xmlns="">
                  <xsl:value-of select="current-grouping-key()"/>
              </group-key>
              <reference-display xmlns="">
                  <xsl:value-of select="concat(replace($elementName, '_', ' '),$vrouwId)"/>
              </reference-display>
              <xsl:call-template name="bcObservationEntry">
                  <xsl:with-param name="adaPatient" select="$patient-ada"/>
                  <xsl:with-param name="adaChild" select="$kind-ada"/>
              </xsl:call-template>
            </unieke-bcobservation>
        </xsl:for-each-group>
    </xsl:variable>

    <!-- bevalling, geboorte en obstetrische verrichtingen -->
    <!-- moet in 2 stappen ivm circular dependencies met zichzelf -->
    <xsl:variable name="verrichtingen" as="element()*">
        <xsl:for-each-group select="//bevalling | //baring | //verrichting_zwangerschap" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-procedure xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="concat(replace(name(.), '_', ' '),' zwangerschap ',$pregnancyId,' ',$vrouwId)"/>
                </reference-display>
                <xsl:call-template name="dummyEntry">
                    <xsl:with-param name="resourceType" select="'Procedure'"/>
                </xsl:call-template>
            </unieke-procedure>
        </xsl:for-each-group>
    </xsl:variable>

    <!-- bevalling, geboorte en obstetrische verrichtingen -->
    <xsl:variable name="procedures" as="element()*">
        <xsl:for-each select="//bevalling | //baring | //verrichting_zwangerschap">
            <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
            <xsl:variable name="theGroupElement" select="$verrichtingen[group-key = $theGroupKey]" as="element()?"/>
            <xsl:variable name="resourceId" select="$theGroupElement/f:entry/f:resource/f:Procedure/f:id/@value"/>
            <unieke-procedure xmlns="">
                <xsl:copy-of select="$theGroupElement/group-key"/>
                <xsl:copy-of select="$theGroupElement/reference-display"/>
                <xsl:call-template name="bcProcedureEntry">
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    <xsl:with-param name="adaChild" select="$kind-ada"/>
                    <xsl:with-param name="fhirResourceId" select="$resourceId"/>
                </xsl:call-template>                    
            </unieke-procedure>
        </xsl:for-each>
    </xsl:variable> 
   
    <!-- Composition (nu alleen nog prio1) -->
    <xsl:variable name="composition" as="element(f:Composition)*">
        <xsl:for-each select="//prio1_huidige_zwangerschap | //prio1_vorige_zwangerschap | //bevallingsgegevens_23 | //med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart">
            <xsl:call-template name="bc-composition">
                <xsl:with-param name="logicalId">
                    <xsl:value-of select="concat('samenvatting-zwangerschap', $pregnancyId, '-', $vrouwId)"/>
                </xsl:with-param>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="adaZorgverlener" select="$zorgverlener-ada"/>
                <xsl:with-param name="entries">
                    <xsl:copy-of select="$patients | $organizations| $practitioners | $practitionerRoles | $referralRequests | $episodesofcare | $conditions | $procedures | $observations"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- alle bouwstenen -->
    <xsl:variable name="bouwstenen" as="element()*">
        <xsl:for-each select="$composition">
            <xsl:apply-templates select="." mode="doCreateTransactionBundleEntry"/>
        </xsl:for-each>
        <xsl:for-each select="$patients | $relatedPersons | $organizations | $referralRequests | $practitioners | $practitionerRoles | $conditions | $episodesofcare | $observations | $procedures | $encounters">
            <entry xmlns="http://hl7.org/fhir">
                <xsl:copy-of select="f:entry/f:fullUrl"/>
                <xsl:copy-of select="f:entry/f:resource"/>
                <request>
                    <method value="PUT"/>
                    <url value="{concat(name(f:entry/f:resource/*),'/', f:entry/f:resource/*/f:id/@value)}"/>
                </request>
            </entry>
        </xsl:for-each>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Creates transaction bundle entry for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template name="createTransactionBundleEntry" match="f:resource/* | f:Patient | f:RelatedPerson | f:Organization | f:Practitioner | f:PractitionerRole | f:ReferralRequest | f:Condition | f:EpisodeOfCare | f:Observation | f:Procedure | f:Encounter | f:List | f:Composition" mode="doCreateTransactionBundleEntry">
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{nf:get-fhir-uuid(.)}"/>
            <resource>
                <xsl:copy-of select="."/>
            </resource>
            <request>
                <method value="PUT"/>
                <url value="{concat(name(.),'/',f:id/@value)}"/>
            </request>
        </entry>
    </xsl:template>

    <xsl:variable name="conditionalIDs">
        <xsl:copy-of select="($patients/f:entry/f:resource/f:Patient | $organizations | $practitioners)/f:id"/>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Transforms Bundle entries to support conditional updates for the resources with given IDs</xd:desc>
    </xd:doc>
    <xsl:template name="conditionalTransform" match="node() | @*" mode="doConditionalTransform doConditionalTransformElements">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="doConditionalTransformElements">
                <xsl:with-param name="resourceID">
                    <xsl:copy-of select="$conditionalIDs"/>
                </xsl:with-param>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Transforms the request.url of resources that are conditionally updated to conditional ones</xd:desc>
        <xd:param name="resourceID">ID of resource to update entry for.</xd:param>
    </xd:doc>
    <xsl:template name="setConditionalURL" match="f:Bundle/f:entry/f:request/f:url" mode="doConditionalTransformElements">
        <xsl:param name="resourceID"/>
        <xsl:variable name="resource" select="ancestor::f:entry/f:resource/*"/>
        <xsl:variable name="node" select="."/>
        <xsl:for-each select="$resourceID">
            <xsl:choose>
                <xsl:when test="$resource/f:id/@value = $resourceID/f:id/@value">
                    <url xmlns="http://hl7.org/fhir" value="{concat(substring-before($node/@value,'/'),'?identifier=',$resource/f:identifier/f:value/@value)}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$node"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Transforms all references to resources that are conditionally updated to fullUrls</xd:desc>
        <xd:param name="resourceID">ID of resource to update references for</xd:param>
    </xd:doc>
    <xsl:template name="removeConditionalID" match="f:reference" mode="doConditionalTransformElements">
        <xsl:param name="resourceID"/>
        <xsl:variable name="bundle" select="ancestor::f:Bundle"/>
        <xsl:variable name="node" select="."/>
        <xsl:variable name="referenceID" select="substring-after($node/@value, '/')"/>
        <xsl:for-each select="$resourceID">
            <xsl:choose>
                <xsl:when test="$referenceID = $resourceID/f:id/@value">
                    <reference xmlns="http://hl7.org/fhir" value="{$bundle/f:entry[f:resource/*/f:id/@value=$referenceID]/f:fullUrl/@value}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$node"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Removes the id from the body for resources that are conditionally updated</xd:desc>
        <xd:param name="resourceID">ID of resource to remove id for</xd:param>
    </xd:doc>
    <xsl:template name="setConditionalReference" match="f:id" mode="doConditionalTransformElements">
        <xsl:param name="resourceID"/>
        <xsl:variable name="node" select="."/>
        <xsl:for-each select="$resourceID">
            <xsl:choose>
                <xsl:when test="$node/@value = $resourceID/f:id/@value"> </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$node"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template to add missing elements from core lab observation</xd:desc>/>
    </xd:doc>
    <xsl:template name="transformLabObservation" match="node() | @*" mode="doTransformLabObservation doTransformLabObservationElements">
        <xsl:param name="context"/>
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="doTransformLabObservationElements">
                <xsl:with-param name="context" select="$context"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template to add missing category display in lab observation</xd:desc>
    </xd:doc>
    <xsl:template name="addCategoryDisplayLabObservation" match="f:category/f:coding/f:code" mode="doTransformLabObservationElements">
        <xsl:choose>
            <xsl:when test="@value=49581000146104 and not(following-sibling::display)">
                <xsl:copy-of select="."></xsl:copy-of>
                <display xmlns="http://hl7.org/fhir" value="Laboratory test finding (finding)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."></xsl:copy-of>
            </xsl:otherwise>
        </xsl:choose>   
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template to add birthcare specific context to lab observation</xd:desc>
    </xd:doc>
    <xsl:template name="addContextObservation" match="f:subject" mode="doTransformLabObservationElements">
        <xsl:param name="context"/>
        <xsl:choose>
            <xsl:when test="name(.)='subject' and not(following-sibling::context)">
                <xsl:copy-of select="."/>
                <xsl:copy-of select="$context"/>
            </xsl:when>    
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>   
    </xsl:template>

</xsl:stylesheet>
