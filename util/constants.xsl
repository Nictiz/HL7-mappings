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
    
    <xsl:variable name="maxLengthFHIRLogicalId" as="xs:integer">64</xsl:variable>
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
    
    <xsl:variable name="ada-unit-druppel" select="('druppel', 'drp', '[drp]', 'druppels', 'drops')"/>
    
    <xsl:variable name="ada-unit-degrees-celsius" select="('Cel', 'graden Celsius', 'graden celsius', 'degrees Celsius', 'degrees celsius', 'Celsius', 'celsius')"/>
    <xsl:variable name="ada-unit-pH" select="('pH', '[pH]')"/>
    <xsl:variable name="ada-unit-mmol-l" select="('mmol/L', 'mmol/l', 'mmol per liter')"/>
    <xsl:variable name="ada-unit-mmHg" select="('mmHg', 'mm[Hg]')"/>

    <xsl:variable name="oidAGB">2.16.840.1.113883.2.4.6.1</xsl:variable>
    <xsl:variable name="oidAGBSpecialismen">2.16.840.1.113883.2.4.6.7</xsl:variable>
    <xsl:variable name="oidAORTAApplicatieID">2.16.840.1.113883.2.4.6.6</xsl:variable>
    <xsl:variable name="oidAORTAProfileID">2.16.840.1.113883.2.4.3.11.1</xsl:variable>
    <xsl:variable name="oidATC">2.16.840.1.113883.6.73</xsl:variable>
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
    <xsl:variable name="oidGTIN">1.3.160</xsl:variable>
    <xsl:variable name="oidHIBC">2.16.840.1.113883.6.40</xsl:variable>
    <xsl:variable name="oidHL7AcknowledgementDetailCode">2.16.840.1.113883.5.1100</xsl:variable>
    <xsl:variable name="oidHL7ActCode">2.16.840.1.113883.5.4</xsl:variable>
    <xsl:variable name="oidHL7ActClass">2.16.840.1.113883.5.6</xsl:variable>
    <xsl:variable name="oidHL7ActStatus">2.16.840.1.113883.5.14</xsl:variable>
    <xsl:variable name="oidHL7ActReason">2.16.840.1.113883.5.8</xsl:variable>
    <xsl:variable name="oidHL7AddressUse">2.16.840.1.113883.5.1119</xsl:variable>
    <xsl:variable name="oidHL7AdministrativeGender">2.16.840.1.113883.5.1</xsl:variable>
    <xsl:variable name="oidHL7InteractionID">2.16.840.1.113883.1.6</xsl:variable>
    <xsl:variable name="oidHL7LanguageAbilityProficiency">2.16.840.1.113883.5.61</xsl:variable>
    <xsl:variable name="oidHL7NullFlavor">2.16.840.1.113883.5.1008</xsl:variable>
    <xsl:variable name="oidHL7ObservationInterpretation">2.16.840.1.113883.5.83</xsl:variable>
    <xsl:variable name="oidHL7ParticipationType">2.16.840.1.113883.5.90</xsl:variable>
    <xsl:variable name="oidHL7RoleCode">2.16.840.1.113883.5.111</xsl:variable>
    <xsl:variable name="oidISO3166">1.0.3166.1.2.2</xsl:variable>
    <xsl:variable name="oidHL7V3MaritalStatus">2.16.840.1.113883.5.2</xsl:variable>
    <xsl:variable name="oidICD10NL-STU3">1.2.276.0.76.5.409</xsl:variable>
    <xsl:variable name="oidICD10NL-R4">2.16.840.1.113883.6.3.2</xsl:variable>
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
    <xsl:variable name="oidUZOVI">2.16.840.1.113883.2.4.6.4</xsl:variable>
    <xsl:variable name="oidZIBLaboratoriumUitslagTestUitslagStatus">2.16.840.1.113883.2.4.3.11.60.40.4.16.1</xsl:variable>

    <xsl:variable name="oidsGstandaardMedication" as="xs:string*" select="($oidGStandaardSSK, $oidGStandaardSNK, $oidGStandaardGPK, $oidGStandaardPRK, $oidGStandaardHPK, $oidGStandaardZInummer)"/>

    <!-- FHIR profile / extension naming -->
    <xsl:variable name="urlBaseNictizProfile">http://nictiz.nl/fhir/StructureDefinition/</xsl:variable>
    <xsl:variable name="urlExtAdministrationAgreementAdditionalInformation"><xsl:value-of select="$urlBaseNictizProfile"/>ext-AdministrationAgreement.AdditionalInformation</xsl:variable>
    <xsl:variable name="urlExtAsAgreedIndicator"><xsl:value-of select="$urlBaseNictizProfile"/>ext-AsAgreedIndicator</xsl:variable>
    <xsl:variable name="urlExtComment"><xsl:value-of select="$urlBaseNictizProfile"/>ext-Comment</xsl:variable>
    <xsl:variable name="urlExtCommunicationPayloadContentCodeableConcept"><xsl:value-of select="$urlBaseNictizProfile"/>ext-Communication.Payload.ContentCodeableConcept</xsl:variable>
    <xsl:variable name="urlExtContextEpisodeOfCare"><xsl:value-of select="$urlBaseNictizProfile"/>ext-Context-EpisodeOfCare</xsl:variable>
    <xsl:variable name="urlExtCopyIndicator"><xsl:value-of select="$urlBaseNictizProfile"/>ext-CopyIndicator</xsl:variable>
    <xsl:variable name="urlExtNLCodeSpecification"><xsl:value-of select="$urlBaseNictizProfile"/>code-specification</xsl:variable>
    <xsl:variable name="urlExtNLMissingTypeReference"><xsl:value-of select="$urlBaseNictizProfile"/>missing-type-reference</xsl:variable>
    <xsl:variable name="urlExtNLPractitionerRoleReference"><xsl:value-of select="$urlBaseNictizProfile"/>practitionerrole-reference</xsl:variable>
    <xsl:variable name="urlExtHL7DataAbsentReason">http://hl7.org/fhir/StructureDefinition/data-absent-reason</xsl:variable>
    <xsl:variable name="urlExtHL7NullFlavor">http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor</xsl:variable>
    <xsl:variable name="urlExtMedicationAgreementPeriodOfUseCondition"><xsl:value-of select="$urlBaseNictizProfile"/>ext-MedicationAgreement.PeriodOfUse.Condition</xsl:variable>
    <xsl:variable name="urlExtMedicationAgreementRelationMedicationUse"><xsl:value-of select="$urlBaseNictizProfile"/>ext-MedicationAgreement.RelationMedicationUse</xsl:variable>
    <xsl:variable name="urlExtMedicationMedicationDispenseDistributionForm"><xsl:value-of select="$urlBaseNictizProfile"/>ext-MedicationDispense.DistributionForm</xsl:variable>
    <xsl:variable name="urlExtPharmaceuticalTreatmentIdentifier"><xsl:value-of select="$urlBaseNictizProfile"/>ext-PharmaceuticalTreatment.Identifier</xsl:variable>
    <xsl:variable name="urlExtRepeatPeriodCyclical"><xsl:value-of select="$urlBaseNictizProfile"/>zib-Medication-RepeatPeriodCyclicalSchedule</xsl:variable>
    <xsl:variable name="urlExtResourceCategory"><xsl:value-of select="$urlBaseNictizProfile"/>ext-ResourceCategory</xsl:variable>
    <!-- MP9 2.0.0-bèta version -->
    <xsl:variable name="urlExtTimeInterval-Period"><xsl:value-of select="$urlBaseNictizProfile"/>ext-TimeInterval-Period</xsl:variable>
    <xsl:variable name="urlExtTimeInterval-Duration"><xsl:value-of select="$urlBaseNictizProfile"/>ext-TimeInterval-Duration</xsl:variable>
    <!-- proper version -->
    <xsl:variable name="urlExtTimeIntervalPeriod"><xsl:value-of select="$urlBaseNictizProfile"/>ext-TimeInterval.Period</xsl:variable>
    <xsl:variable name="urlExtTimeIntervalDuration"><xsl:value-of select="$urlBaseNictizProfile"/>ext-TimeInterval.Duration</xsl:variable>
    <xsl:variable name="urlTimingExact">http://hl7.org/fhir/StructureDefinition/timing-exact</xsl:variable>

    <xsl:variable name="NHGZoNodigNumeriek">1137</xsl:variable>

    <xsl:variable name="genderMap" as="element()+">
        <map hl7Code="M" hl7CodeSystem="2.16.840.1.113883.5.1" fhirCode="male" displayName="man" displayNameEN="male"/>
        <map hl7Code="F" hl7CodeSystem="2.16.840.1.113883.5.1" fhirCode="female" displayName="vrouw" displayNameEN="female"/>
        <map hl7Code="UN" hl7CodeSystem="2.16.840.1.113883.5.1" fhirCode="other" displayName="ongedifferentieerd" displayNameEN="undifferentatiated"/>
        <map hl7Code="UNK" hl7CodeSystem="{$oidHL7NullFlavor}" fhirCode="unknown" displayName="onbekend" displayNameEN="unknown"/>
    </xsl:variable>

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

    <xsl:variable name="hl7ActStatusMap" as="element()+">
        <map hl7Code="active" hl7CodeSystem="{$oidHL7ActStatus}" displayName="actief" displayNameEN="active"/>
        <map hl7Code="suspended" hl7CodeSystem="{$oidHL7ActStatus}" displayName="onderbroken" displayNameEN="suspended"/>
        <map hl7Code="aborted" hl7CodeSystem="{$oidHL7ActStatus}" displayName="afgebroken" displayNameEN="aborted"/>
        <map hl7Code="completed" hl7CodeSystem="{$oidHL7ActStatus}" displayName="voltooid" displayNameEN="completed"/>
        <map hl7Code="cancelled" hl7CodeSystem="{$oidHL7ActStatus}" displayName="niet gestart" displayNameEN="cancelled"/>
    </xsl:variable>

    <xsl:variable name="uziRoleCodeMap" as="element()+">
        <map hl7Code="01.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Arts"/>
        <map hl7Code="01.002" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Allergoloog (gesloten register)"/>
        <map hl7Code="01.003" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Anesthesioloog"/>
        <map hl7Code="01.004" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Apotheekhoudende huisarts"/>
        <map hl7Code="01.008" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Bedrijfsarts"/>
        <map hl7Code="01.010" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Cardioloog"/>
        <map hl7Code="01.011" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Cardiothoracaal chirurg"/>
        <map hl7Code="01.012" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Dermatoloog"/>
        <map hl7Code="01.013" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Arts v. maag-darm-leverziekten"/>
        <map hl7Code="01.014" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Chirurg"/>
        <map hl7Code="01.015" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Huisarts"/>
        <map hl7Code="01.016" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Internist"/>
        <map hl7Code="01.018" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Keel- neus- en oorarts"/>
        <map hl7Code="01.019" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Kinderarts"/>
        <map hl7Code="01.020" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Arts klinische chemie (gesloten register)"/>
        <map hl7Code="01.021" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Klinisch geneticus"/>
        <map hl7Code="01.022" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Klinisch geriater"/>
        <map hl7Code="01.023" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Longarts"/>
        <map hl7Code="01.024" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Arts-microbioloog"/>
        <map hl7Code="01.025" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Neurochirurg"/>
        <map hl7Code="01.026" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Neuroloog"/>
        <map hl7Code="01.030" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Nucleair geneeskundige"/>
        <map hl7Code="01.031" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Oogarts"/>
        <map hl7Code="01.032" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Orthopedisch chirurg"/>
        <map hl7Code="01.033" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Patholoog"/>
        <map hl7Code="01.034" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Plastisch chirurg"/>
        <map hl7Code="01.035" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Psychiater"/>
        <map hl7Code="01.039" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Radioloog"/>
        <map hl7Code="01.040" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Radiotherapeut"/>
        <map hl7Code="01.041" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Reumatoloog"/>
        <map hl7Code="01.042" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Revalidatiearts"/>
        <map hl7Code="01.045" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Uroloog"/>
        <map hl7Code="01.046" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Gynaecoloog"/>
        <map hl7Code="01.047" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Specialist ouderengeneeskunde"/>
        <map hl7Code="01.048" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verzekeringsarts"/>
        <map hl7Code="01.050" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Zenuwarts (gesloten register)"/>
        <map hl7Code="01.062" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Internist-Allergoloog (gesloten register)"/>
        <map hl7Code="01.055" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Arts maatschappij en gezondheid"/>
        <map hl7Code="01.056" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Arts voor verstandelijk gehandicapten"/>
        <map hl7Code="01.070" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Jeugdarts"/>
        <map hl7Code="01.071" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Spoedeisende hulp arts"/>
        <map hl7Code="01.074" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Sportarts"/>
        <map hl7Code="02.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Tandarts"/>
        <map hl7Code="02.053" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Orthodontist"/>
        <map hl7Code="02.054" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Kaakchirurg"/>
        <map hl7Code="03.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verloskundige"/>
        <map hl7Code="04.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Fysiotherapeut"/>
        <map hl7Code="16.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Psychotherapeut"/>
        <map hl7Code="17.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Apotheker"/>
        <map hl7Code="17.060" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Ziekenhuisapotheker"/>
        <map hl7Code="17.075" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Openbaar apotheker"/>
        <map hl7Code="25.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Gezondheidszorgpsycholoog"/>
        <map hl7Code="25.061" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Klinisch psycholoog"/>
        <map hl7Code="25.063" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Klinisch neuropsycholoog"/>
        <map hl7Code="30.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verpleegkundige"/>
        <map hl7Code="30.065" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verpl. spec. prev. zorg bij som. aandoeningen"/>
        <map hl7Code="30.066" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verpl. spec. acute zorg bij som. aandoeningen"/>
        <map hl7Code="30.067" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verpl. spec. intensieve zorg bij som. aandoeningen"/>
        <map hl7Code="30.068" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verpl. spec. chronische zorg bij som. aandoeningen"/>
        <map hl7Code="30.069" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Verpl. spec. geestelijke gezondheidszorg"/>
        <map hl7Code="31.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Orthopedagoog-generalist"/>
        <map hl7Code="79.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Geregistreerd-mondhygiënist"/>
        <map hl7Code="80.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Bachelor medisch hulpverlener"/>
        <map hl7Code="81.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Physician assistant"/>
        <map hl7Code="82.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Klinisch technoloog"/>
        <map hl7Code="83.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Apothekersassistent"/>
        <map hl7Code="84.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Klinisch fysicus"/>
        <map hl7Code="85.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Tandprotheticus"/>
        <map hl7Code="86.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="VIG-er"/>
        <map hl7Code="87.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Optometrist"/>
        <map hl7Code="88.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Huidtherapeut"/>
        <map hl7Code="89.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Diëtist"/>
        <map hl7Code="90.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Ergotherapeut"/>
        <map hl7Code="91.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Logopedist"/>
        <map hl7Code="92.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Mondhygiënist"/>
        <map hl7Code="93.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Oefentherapeut Mensendieck"/>
        <map hl7Code="94.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Oefentherapeut Cesar"/>
        <map hl7Code="95.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Orthoptist"/>
        <map hl7Code="96.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Podotherapeut"/>
        <map hl7Code="97.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Radiodiagnistisch laborant"/>
        <map hl7Code="98.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Radiotherapeutisch laborant"/>
        <map hl7Code="99.000" hl7CodeSystem="2.16.840.1.113883.2.4.15.111" displayName="Zorgverlener andere zorg"/>
    </xsl:variable>

    <xsl:variable name="orgRoleCodeMap" as="element()+">
        <map hl7Code="V4" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Ziekenhuis"/>
        <map hl7Code="V5" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Universitair Medisch Centrum"/>
        <map hl7Code="V6" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Algemeen ziekenhuis"/>
        <map hl7Code="BRA" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Brandwondencentrum"/>
        <map hl7Code="Z4" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Zelfstandig behandelcentrum"/>
        <map hl7Code="Z5" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Diagnostisch centrum"/>
        <map hl7Code="B1" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Beeldvormende diagnostiek"/>
        <map hl7Code="B2" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Echocentrum"/>
        <map hl7Code="X3" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Verplegings- of verzorgingsinstelling"/>
        <map hl7Code="R5" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Verpleeghuis"/>
        <map hl7Code="M1" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Verzorgingstehuis"/>
        <map hl7Code="A1" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Apotheekinstelling"/>
        <map hl7Code="J8" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Openbare apotheek"/>
        <map hl7Code="K9" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Zelfstandig opererende ziekenhuisapotheek"/>
        <map hl7Code="H1" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Huisartsinstelling"/>
        <map hl7Code="Z3" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Huisartspraktijk (zelfstandig of groepspraktijk)"/>
        <map hl7Code="K3" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Apotheekhoudende huisartspraktijk"/>
        <map hl7Code="N6" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Huisartsenpost (t.b.v. dienstwaarneming)"/>
        <map hl7Code="L1" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Laboratorium"/>
        <map hl7Code="P4" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Polikliniek (als onderdeel van een ziekenhuis)"/>
        <map hl7Code="R8" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Revalidatiecentrum"/>
        <map hl7Code="P6" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Preventieve gezondheidszorg (waaronder Bevolkingsonderzoek)"/>
        <map hl7Code="G5" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Geestelijke Gezondheidszorg"/>
        <map hl7Code="G6" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Verstandelijk gehandicaptenzorg"/>
        <map hl7Code="T2" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Thuiszorg"/>
        <map hl7Code="K4" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Kraamzorg"/>
        <map hl7Code="H2" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Hospice"/>
        <map hl7Code="JGZ" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Jeugdgezondheidszorg"/>
        <map hl7Code="G3" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Verloskundigenpraktijk"/>
        <map hl7Code="GC" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Geboortecentrum"/>
        <map hl7Code="DIA" hl7CodeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Dialysecentrum"/>
    </xsl:variable>

    <xsl:variable name="oidMap" as="element()+">
        <map oid="{$oidAGB}" uri="http://fhir.nl/fhir/NamingSystem/agb-z" displayName="AGB-Z"/>
        <map oid="{$oidAGBSpecialismen}" displayName="Vektis AGB-medische specialismen"/>
        <map oid="{$oidATC}" uri="http://www.whocc.no/atc" displayName="Anatomic Therapeutic Classification (ATC)"/>
        <map oid="{$oidBIGregister}" uri="http://fhir.nl/fhir/NamingSystem/big" displayName="BIG"/>
        <map oid="{$oidBurgerservicenummer}" uri="http://fhir.nl/fhir/NamingSystem/bsn" displayName="BSN"/>
        <map oid="{$oidGStandaardHPK}" displayName="G-Standaard HPK"/>
        <map oid="{$oidGStandaardPRK}" displayName="G-Standaard PRK"/>
        <map oid="{$oidGStandaardGPK}" displayName="G-Standaard GPK"/>
        <map oid="{$oidGStandaardSNK}" displayName="G-Standaard SNK"/>
        <map oid="{$oidGStandaardSSK}" displayName="G-Standaard SSK"/>
        <map oid="{$oidGStandaardZInummer}" displayName="G-Standaard ZI-nummer"/>
        <map oid="{$oidGStandaardTH007Toedieningswegen}" displayName="G-Standaard Toedieningswegen (tabel 7)"/>
        <map oid="{$oidGStandaardTH040ContraIndicaties}" displayName="G-Standaard TH040 Contraindicaties"/>
        <map oid="{$oidGStandaardTH122OngewensteGroepen}" displayName="G-Standaard TH122 Ongewenste groepen"/>
        <map oid="{$oidGStandaardBST361}" displayName="G-Standaard Bestand 361 a-tabel (eenheid gebruiksadvies)"/>
        <map oid="{$oidGStandaardBST902THES2}" displayName="G-Standaard thesaurus basiseenheden"/>
        <map oid="{$oidGStandaardFarmaceutischeVormen}" displayName="G-Standaard Farmaceutische vormen (tabel 6)"/>
        <map oid="{$oidICD10NL-STU3}" uri="http://hl7.org/fhir/sid/icd-10-nl" displayName="ICD-10 NL"/>
        <map oid="{$oidICD10NL-R4}" uri="http://hl7.org/fhir/sid/icd-10-nl" displayName="ICD-10 NL"/>
        <map oid="{$oidICPC1NL}" uri="http://hl7.org/fhir/sid/icpc-1-nl" displayName="ICPC-1NL"/>
        <map oid="{$oidISO3166}" uri="urn:iso:std:iso:3166" displayName="ISO 3166-1 (alpha-2)"/>
        <map oid="{$oidJournaalregeltypen}" uri="http://fhir.nl/fhir/NamingSystem/journaalregeltypen" displayName="Journaalregeltypen"/>
        <map oid="{$oidLOINC}" uri="http://loinc.org" displayName="LOINC"/>
        <map oid="{$oidNHGTabel14Contactwijze}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-14-contactwijze" displayName="NHG Tabel 14 Contactwijze"/>
        <map oid="{$oidNHGTabel15Verrichtingen}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-15-verrichtingen" displayName="NHG Tabel 15 Verrichtingen"/>
        <map oid="{$oidNHGTabel25BCodesNumeriek}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-25-gebruiksvoorschrift#aanvullend-numeriek" displayName="NHG Tabel 25 B Codes (numeriek)"/>
        <map oid="{$oidNHGTabel45DiagnBepal}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-45-diagnostische-bepalingen" displayName="NHG Tabel 45 Diagnostische bepalingen"/>
        <map oid="{$oidNHGTabel45DiagnBepalResultaat}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-45-diagnostische-bepalingen#resultaten" displayName="NHG Labcodetabel 45 resultaten"/>
        <map oid="{$oidNHGTabel56Profylaxe}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-56-profylaxe-en-voorzorg" displayName="NHG Tabel 56 Profylaxe en voorzorg"/>
        <map oid="{$oidQuestionnaireItemUIControlCodes}" uri="http://hl7.org/fhir/questionnaire-item-control" displayName="Questionnaire Item UI Control Codes"/>
        <map oid="{$oidQuestionnaireItemType}" uri="http://hl7.org/fhir/item-type" displayName="QuestionnaireItemType"/>
        <map oid="{$oidQuestionnaireResponseStatus}" uri="http://hl7.org/fhir/questionnaire-answers-status" displayName="QuestionnaireResponseStatus"/>
        <map oid="{$oidQuestionnaireTextCategories}" uri="http://hl7.org/fhir/questionnaire-display-category" displayName="Questionnaire Text Categories"/>
        <map oid="{$oidRoleCodeNLOrganizations}" uri="http://nictiz.nl/fhir/NamingSystem/organization-type" displayName="HL7 RoleCodeNL Care provider type (organizations)"/>
        <map oid="{$oidSNOMEDCT}" uri="http://snomed.info/sct" displayName="SNOMED CT"/>
        <map oid="{$oidUCUM}" uri="http://unitsofmeasure.org" displayName="UCUM"/>
        <map oid="{$oidURAOrganizations}" uri="http://fhir.nl/fhir/NamingSystem/ura" displayName="URA"/>
        <map oid="{$oidUZIPersons}" uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-pers" displayName="UZI Personen"/>
        <map oid="{$oidUZIRoleCode}" uri="http://fhir.nl/fhir/NamingSystem/uzi-rolcode" displayName="UZI Rolcodes"/>
        <map oid="{$oidUZISystems}" uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-sys" displayName="UZI Systemen"/>
        <map oid="{$oidUZOVI}" uri="http://fhir.nl/fhir/NamingSystem/uzovi" displayName="UZOVI"/>
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
            <xsl:when test="$fhirVersion = 'R4'">
                <map oid="{$oidChoiceListOrientation}" uri="http://terminology.hl7.org/CodeSystem/choice-list-orientation" displayName="ChoiceListOrientation"/>
                <map oid="{$oidFHIRObservationCategory}" uri="http://terminology.hl7.org/CodeSystem/observation-category" displayName="ObservationCategory"/>
                <map oid="{$oidGTIN}" uri="https://www.gs1.org/gtin" displayName="GTIN (GS1)"/>
                <map oid="{$oidHL7ActCode}" uri="http://terminology.hl7.org/CodeSystem/v3-ActCode" displayName="HL7 ActCode"/>
                <map oid="{$oidHL7ActStatus}" uri="http://terminology.hl7.org/CodeSystem/v3-ActStatus" displayName="HL7 ActReason"/>
                <map oid="{$oidHL7ActReason}" uri="http://terminology.hl7.org/CodeSystem/v3-ActReason" displayName="HL7 ActStatus"/>
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

    <!-- mp constants -->
    <xsl:variable name="daypartMap" as="element()+">
        <map xmlns="" dayPart="night" fhirWhen="NIGHT" hl7PIVLPhaseLow="1970010100" hl7PIVLPhaseHigh="1970010106" code="2546009" codeSystem="{$oidSNOMEDCT}" displayName="'s nachts" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayPart="morning" fhirWhen="MORN" hl7PIVLPhaseLow="1970010106" hl7PIVLPhaseHigh="1970010112" code="73775008" codeSystem="{$oidSNOMEDCT}" displayName="'s ochtends" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayPart="afternoon" fhirWhen="AFT" hl7PIVLPhaseLow="1970010112" hl7PIVLPhaseHigh="1970010118" code="255213009" codeSystem="{$oidSNOMEDCT}" displayName="'s middags" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayPart="evening" fhirWhen="EVE" hl7PIVLPhaseLow="1970010118" hl7PIVLPhaseHigh="1970010200" code="3157002" codeSystem="{$oidSNOMEDCT}" displayName="'s avonds" codeSystemName="SNOMED CT"/>
    </xsl:variable>

    <xsl:variable name="stoptypeMap" as="element()+">
        <map code="113381000146106" codeSystem="2.16.840.1.113883.6.96" displayName="tijdelijk gestopt"/>
        <map code="113371000146109" codeSystem="2.16.840.1.113883.6.96" displayName="definitief gestopt"/>
        <!-- deprecated codes from pre MP 9.2 -->
        <map hl7Code="1" hl7CodeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="tijdelijk gestopt"/>
        <map hl7Code="2" hl7CodeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="definitief gestopt"/>
    </xsl:variable>

    <xsl:variable name="weekdayMap" as="element()+">
        <map xmlns="" dayOfWeek="1" weekday="monday" fhirDayOfWeek="mon" hl7PIVLPhaseLow="19700601" code="307145004" codeSystem="{$oidSNOMEDCT}" displayName="maandag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="2" weekday="tuesday" fhirDayOfWeek="tue" hl7PIVLPhaseLow="19700602" code="307147007" codeSystem="{$oidSNOMEDCT}" displayName="dinsdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="3" weekday="wednesday" fhirDayOfWeek="wed" hl7PIVLPhaseLow="19700603" code="307148002" codeSystem="{$oidSNOMEDCT}" displayName="woensdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="4" weekday="thursday" fhirDayOfWeek="thu" hl7PIVLPhaseLow="19700604" code="307149005" codeSystem="{$oidSNOMEDCT}" displayName="donderdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="5" weekday="friday" fhirDayOfWeek="fri" hl7PIVLPhaseLow="19700605" code="307150005" codeSystem="{$oidSNOMEDCT}" displayName="vrijdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="6" weekday="saturday" fhirDayOfWeek="sat" hl7PIVLPhaseLow="19700606" code="307151009" codeSystem="{$oidSNOMEDCT}" displayName="zaterdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="0" weekday="sunday" fhirDayOfWeek="sun" hl7PIVLPhaseLow="19700607" code="307146003" codeSystem="{$oidSNOMEDCT}" displayName="zondag" codeSystemName="SNOMED CT"/>
    </xsl:variable> 
</xsl:stylesheet>
