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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> ahenket</xd:p>
            <xd:p>Contains any constants we might need. Anticipated are OIDs/URIs, ConceptMaps, ...</xd:p>
        </xd:desc>
        <xd:param name="fhirVersion">Some constants depend on the FHIR version used, so this parameter can be used to select either 'STU3' (default) or 'R4'.</xd:param>
    </xd:doc>
    
    <xsl:param name="fhirVersion" select="'STU3'"/>
    
    <xsl:variable name="ada-unit-second" select="('seconde', 's', 'sec', 'second')"/>
    <xsl:variable name="ada-unit-minute" select="('minuut', 'min', 'minute')"/>
    <xsl:variable name="ada-unit-hour" select="('uur', 'h', 'hour')"/>
    <xsl:variable name="ada-unit-day" select="('dag', 'd', 'day')"/>
    <xsl:variable name="ada-unit-week" select="('week', 'wk')"/>
    <xsl:variable name="ada-unit-month" select="('maand', 'mo', 'month')"/>
    <xsl:variable name="ada-unit-year" select="('jaar', 'a', 'year')"/>

    <xsl:variable name="ada-unit-kilo" select="('kilo', 'kg', 'kilogram')"/>
    <xsl:variable name="ada-unit-gram" select="('gram', 'g', 'gr')"/>
    <xsl:variable name="ada-unit-cm" select="('centimeter', 'cm')"/>
    <xsl:variable name="ada-unit-m" select="('meter', 'm')"/>

    <xsl:variable name="ada-unit-liter" select="('liter', 'l')"/>
    <xsl:variable name="ada-unit-dl" select="('deciliter', 'dl')"/>
    <xsl:variable name="ada-unit-cl" select="('centiliter', 'cl')"/>
    <xsl:variable name="ada-unit-ml" select="('milliliter', 'ml')"/>
    <xsl:variable name="ada-unit-ul" select="('microliter', 'ul')"/>
    
    <xsl:variable name="ada-unit-druppel" select="('druppel', 'drp','[drp]')"/>
    
    <xsl:variable name="ada-unit-degrees-celsius" select="('Cel', 'graden Celsius', 'graden celsius', 'degrees Celsius', 'degrees celsius', 'Celsius', 'celsius')"/>
    <xsl:variable name="ada-unit-pH" select="('pH', '[pH]')"/>
    <xsl:variable name="ada-unit-mmol-l" select="('mmol/L', 'mmol/l', 'mmol per liter')"/>

    <xsl:variable name="oidAGB">2.16.840.1.113883.2.4.6.1</xsl:variable>
    <xsl:variable name="oidAGBSpecialismen">2.16.840.1.113883.2.4.6.7</xsl:variable>
    <xsl:variable name="oidAORTAApplicatieID">2.16.840.1.113883.2.4.6.6</xsl:variable>
    <xsl:variable name="oidAORTAProfileID">2.16.840.1.113883.2.4.3.11.1</xsl:variable>
    <xsl:variable name="oidBIGregister">2.16.528.1.1007.5.1</xsl:variable>
    <xsl:variable name="oidBurgerservicenummer">2.16.840.1.113883.2.4.6.3</xsl:variable>
    <xsl:variable name="oidChoiceListOrientation">2.16.840.1.113883.4.642.1.851</xsl:variable>
    <xsl:variable name="oidFHIRObservationCategory">2.16.840.1.113883.4.642.1.393</xsl:variable>
    <xsl:variable name="oidGStandaardGPK">2.16.840.1.113883.2.4.4.1</xsl:variable>
    <xsl:variable name="oidGStandaardPRK">2.16.840.1.113883.2.4.4.10</xsl:variable>
    <xsl:variable name="oidGStandaardHPK">2.16.840.1.113883.2.4.4.7</xsl:variable>
    <xsl:variable name="oidGStandaardSSK">2.16.840.1.113883.2.4.4.1.725</xsl:variable>
    <xsl:variable name="oidGStandaardSNK">2.16.840.1.113883.2.4.4.1.750</xsl:variable>
    <xsl:variable name="oidGStandaardTH122OngewensteGroepen">2.16.840.1.113883.2.4.4.1.902.122</xsl:variable>
    <xsl:variable name="oidGStandaardZInummer">2.16.840.1.113883.2.4.4.8</xsl:variable>
    <xsl:variable name="oidGStandaardTH007Toedieningswegen">2.16.840.1.113883.2.4.4.9</xsl:variable>
    <xsl:variable name="oidGStandaardBST361">2.16.840.1.113883.2.4.4.1.361</xsl:variable>
    <xsl:variable name="oidGStandaardBST902THES2">2.16.840.1.113883.2.4.4.1.900.2</xsl:variable>
    <xsl:variable name="oidGStandaardTH040ContraIndicaties">2.16.840.1.113883.2.4.4.1.902.40</xsl:variable>
    <xsl:variable name="oidGStandaardFarmaceutischeVormen">2.16.840.1.113883.2.4.4.11</xsl:variable>
    <xsl:variable name="oidHL7AcknowledgementDetailCode">2.16.840.1.113883.5.1100</xsl:variable>
    <xsl:variable name="oidHL7ActCode">2.16.840.1.113883.5.4</xsl:variable>
    <xsl:variable name="oidHL7ActClass">2.16.840.1.113883.5.6</xsl:variable>
    <xsl:variable name="oidHL7ActStatus">2.16.840.1.113883.5.14</xsl:variable>
    <xsl:variable name="oidHL7AddressUse">2.16.840.1.113883.5.1119</xsl:variable>
    <xsl:variable name="oidHL7AdministrativeGender">2.16.840.1.113883.5.1</xsl:variable>
    <xsl:variable name="oidHL7InteractionID">2.16.840.1.113883.1.6</xsl:variable>
    <xsl:variable name="oidHL7LanguageAbilityProficiency">2.16.840.1.113883.5.61</xsl:variable>
    <xsl:variable name="oidHL7NullFlavor">2.16.840.1.113883.5.1008</xsl:variable>
    <xsl:variable name="oidHL7ObservationInterpretation">2.16.840.1.113883.5.83</xsl:variable>
    <xsl:variable name="oidHL7ParticipationType">2.16.840.1.113883.5.90</xsl:variable>
    <xsl:variable name="oidHL7RoleCode">2.16.840.1.113883.5.111</xsl:variable>
    <xsl:variable name="oidHL7V3MaritalStatus">2.16.840.1.113883.5.2</xsl:variable>
    <xsl:variable name="oidICPC1NL">2.16.840.1.113883.2.4.4.31.1</xsl:variable>
    <xsl:variable name="oidJournaalregeltypen">2.16.840.1.113883.2.4.4.32.2</xsl:variable>
    <xsl:variable name="oidLOINC">2.16.840.1.113883.6.1</xsl:variable>
    <xsl:variable name="oidNHGTabel14Contactwijze">2.16.840.1.113883.2.4.4.30.14</xsl:variable>
    <xsl:variable name="oidNHGTabel15Verrichtingen">2.16.840.1.113883.2.4.4.30.15</xsl:variable>
    <xsl:variable name="oidNHGTabel25BCodesNumeriek">2.16.840.1.113883.2.4.4.5</xsl:variable>
    <xsl:variable name="oidNHGTabel45DiagnBepal">2.16.840.1.113883.2.4.4.30.45</xsl:variable>
    <xsl:variable name="oidNHGTabel45DiagnBepalResultaat">2.16.840.1.113883.2.4.4.30.1045</xsl:variable>
    <xsl:variable name="oidNHGTabel56Profylaxe">2.16.840.1.113883.2.4.4.30.56</xsl:variable>
    <xsl:variable name="oidQuestionnaireItemUIControlCodes">2.16.840.1.113883.4.642.1.849</xsl:variable>
    <xsl:variable name="oidQuestionnaireItemType">2.16.840.1.113883.4.642.1.438</xsl:variable>
    <xsl:variable name="oidQuestionnaireItemUsageMode">2.16.840.1.113883.4.642.1.855</xsl:variable>
    <xsl:variable name="oidQuestionnaireResponseStatus">2.16.840.1.113883.4.642.1.441</xsl:variable>    
    <xsl:variable name="oidQuestionnaireTextCategories">2.16.840.1.113883.4.642.1.853</xsl:variable>
    <xsl:variable name="oidRoleCodeNLOrganizations">2.16.840.1.113883.2.4.15.1060</xsl:variable>
    <xsl:variable name="oidSNOMEDCT">2.16.840.1.113883.6.96</xsl:variable>
    <xsl:variable name="oidSBVZOrganization">2.16.528.1.1007</xsl:variable>
    <xsl:variable name="oidSBVZSystems">2.16.528.1.1007.4</xsl:variable>
    <xsl:variable name="oidUCUM">2.16.840.1.113883.6.8</xsl:variable>
    <xsl:variable name="oidURAOrganizations">2.16.528.1.1007.3.3</xsl:variable>
    <xsl:variable name="oidUZIPersons">2.16.528.1.1007.3.1</xsl:variable>
    <xsl:variable name="oidUZISystems">2.16.528.1.1007.3.2</xsl:variable>
    <xsl:variable name="oidUZIRoleCode">2.16.840.1.113883.2.4.15.111</xsl:variable>
    <xsl:variable name="oidZIBLaboratoriumUitslagTestUitslagStatus">2.16.840.1.113883.2.4.3.11.60.40.4.16.1</xsl:variable>
 
    <xsl:variable name="urlExtNLCodeSpecification">http://nictiz.nl/fhir/StructureDefinition/code-specification</xsl:variable>
    <xsl:variable name="urlExtNLMissingTypeReference">http://nictiz.nl/fhir/StructureDefinition/missing-type-reference</xsl:variable>
    <xsl:variable name="urlExtNLPractitionerRoleReference">http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference</xsl:variable>
    <xsl:variable name="urlExtHL7DataAbsentReason">http://hl7.org/fhir/StructureDefinition/data-absent-reason</xsl:variable>
    <xsl:variable name="urlExtHL7NullFlavor">http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor</xsl:variable>
    
    <xsl:variable name="NHGZoNodigNumeriek">1137</xsl:variable>

    <xsl:variable name="hl7NullFlavorMap" as="element()+">
        <!-- bron: https://www.hl7.nl/wiki/index.php/Vocabulaire.NullFlavor -->
        <map hl7NullFlavor="NI" displayName="geen informatie" displayNameEN="no information"/>
        <map hl7NullFlavor="INV" displayName="ongeldig" displayNameEN="invalid"/>
        <map hl7NullFlavor="DER" displayName="afgeleid" displayNameEN="derived"/>
        <!-- er staat 'anders' in de bron, maar 'overig' is een logischere vertaling van other bij valuesets... -->
        <map hl7NullFlavor="OTH" displayName="overig" displayNameEN="other"/>
        <map hl7NullFlavor="NINF" displayName="negatief oneindig" displayNameEN="negative infinity"/>
        <map hl7NullFlavor="PINF" displayName="positief oneindig" displayNameEN="positive infinity"/>
        <map hl7NullFlavor="UNC" displayName="niet-gecodeerd" displayNameEN="unencoded"/>
        <map hl7NullFlavor="MSK" displayName="gemaskeerd" displayNameEN="masked"/>
        <map hl7NullFlavor="NA" displayName="niet van toepassing" displayNameEN="not applicable"/>
        <map hl7NullFlavor="UNK" displayName="onbekend" displayNameEN="unknown"/>
        <map hl7NullFlavor="ASKU" displayName="gevraagd maar onbekend" displayNameEN="asked but unknown"/>
        <map hl7NullFlavor="NAV" displayName="tijdelijk niet beschikbaar" displayNameEN="temporarily unavailable"/>
        <map hl7NullFlavor="NASK" displayName="niet gevraagd" displayNameEN="not asked"/>
        <!-- QS wordt gebruikt bij magistrale bereidingen: ingrediënten voor geneesmiddelen, betekent dan eigenlijk 'aanvullen tot' -->
        <map hl7NullFlavor="QS" displayName="voldoende hoeveelheid" displayNameEN="quantity sufficient"/>
        <map hl7NullFlavor="TRC" displayName="spoor" displayNameEN="trace"/>
    </xsl:variable>

    <xsl:variable name="oidMap" as="element()+">
        <map oid="{$oidAGB}" uri="http://fhir.nl/fhir/NamingSystem/agb-z" displayName="AGB-Z"/>
        <map oid="{$oidAGBSpecialismen}" displayName="COD016-VEKT Zorgverlenersspecificatie (subberoepsgroep)"/>
        <map oid="{$oidBurgerservicenummer}" uri="http://fhir.nl/fhir/NamingSystem/bsn" displayName="BSN"/>
        <map oid="{$oidGStandaardHPK}" displayName="G-Standaard HPK"/>
        <map oid="{$oidGStandaardPRK}" displayName="G-Standaard PRK"/>
        <map oid="{$oidGStandaardGPK}" displayName="G-Standaard GPK"/>
        <map oid="{$oidGStandaardSNK}" displayName="G-Standaard SNK"/>
        <map oid="{$oidGStandaardSSK}" displayName="G-Standaard SSK"/>
        <map oid="{$oidGStandaardTH007Toedieningswegen}" displayName="G-Standaard TH007 Toedieningswegen"/>
        <map oid="{$oidGStandaardTH040ContraIndicaties}" displayName="G-Standaard TH040 Contraindicaties"/>
        <map oid="{$oidGStandaardTH122OngewensteGroepen}" displayName="G-Standaard TH122 Ongewenste groepen"/>
        <map oid="{$oidGStandaardBST361}" displayName="G-Standaard Bestand 361 a-tabel (eenheid gebruiksadvies)"/>
        <map oid="{$oidGStandaardBST902THES2}" displayName="G-Standaard Bestand 902 Thesaurus 2"/>
        <map oid="{$oidGStandaardFarmaceutischeVormen}" displayName="G-Standaard Farmaceutische vormen (tabel 6)"/>
        <map oid="{$oidJournaalregeltypen}" uri="http://fhir.nl/fhir/NamingSystem/journaalregeltypen" displayName="Journaalregeltypen"/>
        <map oid="{$oidLOINC}" uri="http://loinc.org" displayName="LOINC"/>
        <map oid="{$oidNHGTabel14Contactwijze}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-14-contactwijze" displayName="NHG Tabel 14 Contactwijze"/>
        <map oid="{$oidNHGTabel15Verrichtingen}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-15-verrichtingen" displayName="NHG Tabel 15 Verrichtingen"/>
        <map oid="{$oidNHGTabel25BCodesNumeriek}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-25-gebruiksvoorschrift#aanvullend-numeriek" displayName="NHG Tabel 25 B Codes (numeriek)"/>
        <map oid="{$oidNHGTabel45DiagnBepal}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-45-diagnostische-bepalingen" displayName="NHG Tabel 45 Diagnostische bepalingen"/>
        <map oid="{$oidNHGTabel45DiagnBepalResultaat}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-45-diagnostische-bepalingen#resultaten" displayName="NHG Labcodetabel 45 resultaten"/>
        <map oid="{$oidNHGTabel56Profylaxe}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-56-profylaxe-en-voorzorg" displayName="NHG Tabel 56 Profylaxe en voorzorg"/>
        <map oid="{$oidRoleCodeNLOrganizations}" uri="http://nictiz.nl/fhir/NamingSystem/organization-type" displayName="HL7 RoleCodeNL Care provider type (organizations)"/>
        <map oid="{$oidSNOMEDCT}" uri="http://snomed.info/sct" displayName="SNOMED CT"/>
        <map oid="{$oidUCUM}" uri="http://unitsofmeasure.org" displayName="UCUM"/>
        <map oid="{$oidURAOrganizations}" uri="http://fhir.nl/fhir/NamingSystem/ura" displayName="URA"/>
        <map oid="{$oidUZIPersons}" uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-pers" displayName="UZI Personen"/>
        <map oid="{$oidUZIRoleCode}" uri="http://fhir.nl/fhir/NamingSystem/uzi-rolcode" displayName="UZI Rolcodes"/>
        <map oid="{$oidUZISystems}" uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-sys" displayName="UZI Systemen"/>
        <map oid="{$oidICPC1NL}" uri="http://hl7.org/fhir/sid/icpc-1-nl" displayName="ICPC-1NL"/>
        <map oid="{$oidQuestionnaireItemUIControlCodes}" uri="http://hl7.org/fhir/questionnaire-item-control" displayName="Questionnaire Item UI Control Codes"/>            <map oid="{$oidQuestionnaireItemType}" uri="http://hl7.org/fhir/item-type" displayName="QuestionnaireItemType"/>
        <map oid="{$oidQuestionnaireResponseStatus}" uri="http://hl7.org/fhir/questionnaire-answers-status" displayName="QuestionnaireResponseStatus"/>
        <map oid="{$oidQuestionnaireTextCategories}" uri="http://hl7.org/fhir/questionnaire-display-category" displayName="Questionnaire Text Categories"/>
        <xsl:choose>
            <xsl:when test="$fhirVersion='STU3'">
                <map oid="{$oidChoiceListOrientation}" uri="http://hl7.org/fhir/choice-list-orientation" displayName="ChoiceListOrientation"/>
                <map oid="{$oidFHIRObservationCategory}" uri="http://hl7.org/fhir/observation-category" displayName="ObservationCategory"/>
                <map oid="{$oidHL7ActCode}" uri="http://hl7.org/fhir/v3/ActCode" displayName="HL7 ActCode"/>
                <map oid="{$oidHL7ActStatus}" uri="http://hl7.org/fhir/v3/ActStatus" displayName="HL7 ActStatus"/>
                <map oid="{$oidHL7AcknowledgementDetailCode}" uri="http://hl7.org/fhir/v3/AcknowledgementDetailCode" displayName="HL7 AcknowledgementDetailCode"/>
                <map oid="{$oidHL7AdministrativeGender}" uri="http://hl7.org/fhir/v3/AdministrativeGender" displayName="HL7 AdministrativeGender"/>
                <map oid="{$oidHL7ObservationInterpretation}" uri="http://hl7.org/fhir/v3/ObservationInterpretation" displayName="HL7 ObservationInterpretation"/>
                <map oid="{$oidHL7ParticipationType}" uri="http://hl7.org/fhir/v3/ParticipationType" displayName="HL7 ParticipationType"/>
                <map oid="{$oidHL7NullFlavor}" uri="http://hl7.org/fhir/v3/NullFlavor" displayName="HL7 NullFlavor"/>
                <map oid="{$oidHL7AddressUse}" uri="http://hl7.org/fhir/v3/AddressUse" displayName="HL7 AddressUse"/>
                <map oid="{$oidHL7RoleCode}" uri="http://hl7.org/fhir/v3/RoleCode" displayName="HL7 RoleCode"/>
                <map oid="{$oidQuestionnaireItemUsageMode}" uri="http://hl7.org/fhir/questionnaire-usage-mode" displayName="QuestionnaireItemUsageMode Item UI Control Codes"/>
                <map uri="http://hl7.org/fhir/v2/0078" displayName="HL7 Version 2 Table 0078 v2 Interpretation Codes"/>
            </xsl:when>
            <xsl:when test="$fhirVersion='R4'">
                <map oid="{$oidChoiceListOrientation}" uri="http://terminology.hl7.org/CodeSystem/choice-list-orientation" displayName="ChoiceListOrientation"/>
                <map oid="{$oidFHIRObservationCategory}" uri="http://terminology.hl7.org/CodeSystem/observation-category" displayName="ObservationCategory"/>
                <map oid="{$oidHL7ActCode}" uri="http://terminology.hl7.org/CodeSystem/v3-ActCode" displayName="HL7 ActCode"/>
                <map oid="{$oidHL7ActStatus}" uri="http://terminology.hl7.org/CodeSystem/v3-ActStatus" displayName="HL7 ActStatus"/>
                <map oid="{$oidHL7AcknowledgementDetailCode}" uri="http://terminology.hl7.org/CodeSystem/v3-AcknowledgementDetailCode" displayName="HL7 AcknowledgementDetailCode"/>
                <map oid="{$oidHL7AdministrativeGender}" uri="http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender" displayName="HL7 AdministrativeGender"/>
                <map oid="{$oidHL7LanguageAbilityProficiency}" uri="http://terminology.hl7.org/CodeSystem/v3-LanguageAbilityProficiency" displayName="HL7 LanguageAbilityProficiency"/>
                <map oid="{$oidHL7ObservationInterpretation}" uri="http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation" displayName="HL7 ObservationInterpretation"/>
                <map oid="{$oidHL7ParticipationType}" uri="http://terminology.hl7.org/CodeSystem/v3-ParticipationType" displayName="HL7 ParticipationType"/>
                <map oid="{$oidHL7NullFlavor}" uri="http://terminology.hl7.org/CodeSystem/v3-NullFlavor" displayName="HL7 NullFlavor"/>
                <map oid="{$oidHL7AddressUse}" uri="http://terminology.hl7.org/CodeSystem/v3-AddressUse" displayName="HL7 AddressUse"/>
                <map oid="{$oidHL7RoleCode}" uri="http://terminology.hl7.org/CodeSystem/v3-RoleCode" displayName="HL7 RoleCode"/>
                <map oid="{$oidHL7V3MaritalStatus}" uri="http://terminology.hl7.org/CodeSystem/v3-MaritalStatus" displayName="HL7 MaritalStatus"/>

                <map oid="{$oidQuestionnaireItemUsageMode}" uri="http://terminology.hl7.org/CodeSystem/questionnaire-usage-mode" displayName="QuestionnaireItemUsageMode Item UI Control Codes"/>
                <map uri="http://terminology.hl7.org/CodeSystem/v2-0078" displayName="HL7 Version 2 Table 0078 v2 Interpretation Codes"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>

    <!-- leniently recognize OID as OID even when nodes contain illegal leading zeroes -->
    <xsl:variable name="OIDpatternlenient" select="'^[0-2](\.\d+)*$'"/>
    <!-- official OID pattern -->
    <xsl:variable name="OIDpattern" select="'^[0-2](\.(0|[1-9]\d*))*$'"/>
    <!-- official UUID pattern -->
    <xsl:variable name="UUIDpattern" select="'^[A-Fa-f\d]{8}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{12}$'"/>
    
    <!-- http://hl7.org/fhir/v3/ObservationInterpretation/cs.html -->
    <!-- https://zibs.nl/wiki/LaboratoryTestResult-v4.1(2017EN)#ResultFlagsCodelist -->
    <xsl:variable name="hl7v3ObservationInterpretation_to_zibInterpretatieVlaggen" as="element(map)">
        <map>
            <!--<map inCode="(_GeneticObservationInterpretation)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="CAR" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="Carrier" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="(_ObservationInterpretationChange)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="B" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="D" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="U" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="W" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="(_ObservationInterpretationExceptions)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>-->
            <map inCode="&lt;" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
            <map inCode="&gt;" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
            <!--<map inCode="AC" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="IE" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="QCF" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="TOX" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="(_ObservationInterpretationNormality)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="A" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="AA" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>-->
            <map inCode="HH" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
            <map inCode="LL" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
            <map inCode="H" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
            <map inCode="H&gt;" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
            <map inCode="HH" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
            <map inCode="HU" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
            <map inCode="HH" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
            <map inCode="L" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
            <map inCode="L&lt;" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
            <map inCode="LL" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
            <map inCode="LU" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
            <map inCode="LL" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
            <!--<map inCode="N" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="(_ObservationInterpretationSusceptibility)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="IE" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>-->
            <map inCode="I" inCodeSystem="{$oidHL7ObservationInterpretation}" code="11896004" codeSystem="{$oidSNOMEDCT}" displayName="Intermediate"/>
            <!--<map inCode="MS" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="NCL" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="NS" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>-->
            <map inCode="R" inCodeSystem="{$oidHL7ObservationInterpretation}" code="30714006" codeSystem="{$oidSNOMEDCT}" displayName="Resistant"/>
            <map inCode="SYN-R" inCodeSystem="{$oidHL7ObservationInterpretation}" code="30714006" codeSystem="{$oidSNOMEDCT}" displayName="Resistant"/>
            <map inCode="S" inCodeSystem="{$oidHL7ObservationInterpretation}" code="131196009" codeSystem="{$oidSNOMEDCT}" displayName="Susceptible"/>
            <map inCode="SDD" inCodeSystem="{$oidHL7ObservationInterpretation}" code="131196009" codeSystem="{$oidSNOMEDCT}" displayName="Susceptible"/>
            <map inCode="SYN-S" inCodeSystem="{$oidHL7ObservationInterpretation}" code="131196009" codeSystem="{$oidSNOMEDCT}" displayName="Susceptible"/>
            <map inCode="VS" inCodeSystem="{$oidHL7ObservationInterpretation}" code="131196009" codeSystem="{$oidSNOMEDCT}" displayName="Susceptible"/>
            <!--<map inCode="EX" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="HX" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="LX" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="HM" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="(ObservationInterpretationDetection)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="IND" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="E" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="NEG" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="ND" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="POS" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="DET" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="(ObservationInterpretationExpectation)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="EXP" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="UNE" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="OBX" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="(ReactivityObservationInterpretation)" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="NR" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="RR" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>
            <map inCode="WR" inCodeSystem="{$oidHL7ObservationInterpretation}" code="" codeSystem="{$oidSNOMEDCT}" displayName=""/>-->
        </map>
    </xsl:variable>
    
    <!-- https://zibs.nl/wiki/LaboratoryTestResult-v4.1(2017EN)#ResultFlagsCodelist -->
    <!-- http://hl7.org/fhir/v2/0078/index.html -->
    <xsl:variable name="zibInterpretatieVlaggen_to_hl7v2Table0078AbnormalFlags" as="element(map)">
        <map>
            <!-- Above reference range || Boven referentiewaarde -->
            <map inCode="281302008" inCodeSystem="{$oidSNOMEDCT}" code="H" codeSystem="http://hl7.org/fhir/v2/0078" displayName="High"/>
            <!--Below reference range || Onder referentiewaarde-->
            <map inCode="281300000" inCodeSystem="{$oidSNOMEDCT}" code="L" codeSystem="http://hl7.org/fhir/v2/0078" displayName="Low"/>
            <!--Intermediate || Intermediair-->
            <map inCode="11896004" inCodeSystem="{$oidSNOMEDCT}" code="I" codeSystem="http://hl7.org/fhir/v2/0078" displayName="Intermediate"/>
            <!--Resistant || Resistent-->
            <map inCode="30714006" inCodeSystem="{$oidSNOMEDCT}" code="R" codeSystem="http://hl7.org/fhir/v2/0078" displayName="Resistant"/>
            <!--Susceptible || Sensitief-->
            <map inCode="131196009" inCodeSystem="{$oidSNOMEDCT}" code="S" codeSystem="http://hl7.org/fhir/v2/0078" displayName="Susceptible"/>
        </map>
    </xsl:variable>
</xsl:stylesheet>
