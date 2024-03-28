<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nm="http://www.nictiz.nl/mappings" 
    exclude-result-prefixes="xs"
    version="2.0">

    <!--
        The ada2resourceType variable defined in 2_fhir_fhir_include.xsl maps ADA elements to profile canonicals.
        This file is used across all versions of the package, but mp9 2.0.0-beta.1 introduces a breaking change in the way ada 'farmaceutisch_product' is handled (from nl-core-PharmaceuticalProduct to mp-PharmaceuticalProduct) To override the default behaviour, the static ada2resourceType defined
        here is used. -->
    <xsl:variable name="ada2resourceType">
        <nm:map ada="afleverlocatie" resource="Location" profile="nl-core-Dummy"/>
        <!-- MTD zorgaanbieder is performer -->
        <nm:map ada="zorgaanbieder" resource="PractitionerRole" profile="nl-core-HealthProfessional-PractitionerRole"/>
        
        <nm:map ada="alcohol_gebruik" resource="Observation" profile="nl-core-AlcoholUse"/>
        <nm:map ada="alert" resource="Flag" profile="nl-core-alert"/>
        <nm:map ada="allergie_intolerantie" resource="AllergyIntolerance" profile="nl-core-AllergyIntolerance"/>
        <nm:map ada="behandel_aanwijzing" resource="Consent" profile="nl-core-TreatmentDirective2"/>
        <nm:map ada="bloeddruk" resource="Observation" profile="nl-core-BloodPressure"/>
        <nm:map ada="betaler" resource="Coverage" profile="nl-core-Payer.InsuranceCompany"/>
        <nm:map ada="betaler" resource="Coverage" profile="nl-core-Payer.PayerPerson"/>
        <nm:map ada="betaler" resource="Organization" profile="nl-core-Payer-Organization"/>
        <nm:map ada="contact" resource="Encounter" profile="nl-core-Encounter"/>
        <nm:map ada="contactpersoon" resource="RelatedPerson" profile="nl-core-ContactPerson"/>
        <nm:map ada="drugs_gebruik" resource="Observation" profile="nl-core-DrugUse"/>
        <nm:map ada="farmaceutisch_product" resource="Medication" profile="mp-PharmaceuticalProduct"/>
        <nm:map ada="functie_horen" resource="Observation" profile="nl-core-HearingFunction"/>
        <nm:map ada="functie_zien" resource="Observation" profile="nl-core-VisualFunction"/>
        <nm:map ada="functionele_of_mentale_status" resource="Observation" profile="nl-core-FunctionalOrMentalStatus"/>
        <nm:map ada="hartfrequentie" resource="Observation" profile="nl-core-HeartRate"/>
        <nm:map ada="laboratorium_uitslag" resource="Observation" profile="nl-core-LaboratoryTestResult"/>
        <nm:map ada="laboratorium_test" resource="Observation" profile="nl-core-LaboratoryTestResult"/>
        <nm:map ada="lichaamslengte" resource="Observation" profile="nl-core-BodyHeight"/>
        <nm:map ada="lichaamstemperatuur" resource="Observation" profile="nl-core-BodyTemperature"/>
        <nm:map ada="lichaamsgewicht" resource="Observation" profile="nl-core-BodyWeight"/>
        <nm:map ada="medicatiegebruik" resource="MedicationStatement" profile="mp-MedicationUse2"/>
        <nm:map ada="medicatie_gebruik" resource="MedicationStatement" profile="mp-MedicationUse2"/>
        <nm:map ada="medicatie_toediening" resource="MedicationAdministration" profile="mp-MedicationAdministration2"/>
        <nm:map ada="medicatietoediening" resource="MedicationAdministration" profile="mp-MedicationAdministration2"/>
        <nm:map ada="medicatieafspraak" resource="MedicationRequest" profile="mp-MedicationAgreement"/>
        <nm:map ada="medicatieverstrekking" resource="MedicationDispense" profile="mp-MedicationDispense"/>
        <nm:map ada="medisch_hulpmiddel" resource="DeviceUseStatement" profile="nl-core-MedicalDevice"/>
        <nm:map ada="medisch_hulpmiddel" resource="DeviceUseStatement" profile="nl-core-HearingFunction.HearingAid"/>
        <nm:map ada="medisch_hulpmiddel" resource="DeviceUseStatement" profile="nl-core-VisualFunction.VisualAid"/>
        <nm:map ada="mobiliteit" resource="Observation" profile="nl-core-Mobility"/>
        <nm:map ada="monster" resource="Specimen" profile="nl-core-LaboratoryTestResult.Specimen"/>
        <nm:map ada="bron_monster" resource="Device" profile="nl-core-LaboratoryTestResult.Specimen.Source"/>
        <nm:map ada="mustscore" resource="Observation" profile="nl-core-MUSTScore"/>
        <nm:map ada="o2saturatie" resource="Observation" profile="nl-core-O2Saturation"/>
        <nm:map ada="opleiding" resource="Observation" profile="nl-core-Education"/>
        <nm:map ada="patient" resource="Patient" profile="nl-core-Patient"/>
        <nm:map ada="probleem" resource="Condition" profile="nl-core-Problem"/>
        <nm:map ada="product" resource="Device" profile="nl-core-MedicalDevice.Product"/>
        <nm:map ada="product" resource="Device" profile="nl-core-HearingFunction.HearingAid.Product"/>
        <nm:map ada="product" resource="Device" profile="nl-core-VisualFunction.VisualAid.Product"/>
        <nm:map ada="schedelomvang" resource="Observation" profile="nl-core-HeadCircumference"/>
        <nm:map ada="sturen_medicatievoorschrift" resource="Bundle" profile="mp-MedicationPrescription-Bundle"/>
        <nm:map ada="sturen_afhandeling_medicatievoorschrift" resource="Bundle" profile="mp-MedicationPrescriptionProcessing-Bundle"/>
        <nm:map ada="sturen_antwoord_voorstel_medicatieafspraak" resource="Bundle" profile="mp-ReplyProposalMedicationAgreement-Bundle"/>
        <nm:map ada="sturen_antwoord_voorstel_medicatieafspraak" resource="Communication" profile="mp-ReplyProposalMedicationAgreement"/>
        <nm:map ada="sturen_antwoord_voorstel_verstrekkingsverzoek" resource="Bundle" profile="mp-ReplyProposalDispenseRequest-Bundle"/>
        <nm:map ada="sturen_antwoord_voorstel_verstrekkingsverzoek" resource="Communication" profile="mp-ReplyProposalDispenseRequest"/>
        <nm:map ada="sturen_voorstel_medicatieafspraak" resource="Bundle" profile="mp-ProposalMedicationAgreement-Bundle"/>
        <nm:map ada="sturen_voorstel_verstrekkingsverzoek" resource="Bundle" profile="mp-ProposalDispenseRequest-Bundle"/>
        <nm:map ada="sturen_afhandeling_medicatievoorschrift" resource="Bundle" profile="mp-MedicationPrescriptionProcessing-Bundle"/>
        <nm:map ada="sturen_afhandeling_medicatievoorschrift" resource="Bundle" profile="mp-MedicationPrescriptionProcessing-Bundle"/>
        <nm:map ada="sturen_afhandeling_medicatievoorschrift" resource="Bundle" profile="mp-MedicationPrescriptionProcessing-Bundle"/>
        <nm:map ada="tabak_gebruik" resource="Observation" profile="nl-core-TobaccoUse"/>
        <nm:map ada="tekst_uitslag" resource="DiagnosticReport" profile="nl-core-TextResult"/>
        <nm:map ada="visueel_resultaat" resource="Media" profile="nl-core-TextResult.VisualResult"/>
        <nm:map ada="toedieningsafspraak" resource="MedicationDispense" profile="mp-AdministrationAgreement"/>
        <nm:map ada="vaccinatie" resource="Immunization" profile="nl-core-Vaccination-event"/>
        <nm:map ada="vaccinatie" resource="ImmunizationRecommendation" profile="nl-core-Vaccination-request"/>
        <nm:map ada="vermogen_tot_zich_kleden" resource="Observation" profile="nl-core-AbilityToDressOneself"/>
        <nm:map ada="vermogen_tot_zich_wassen" resource="Observation" profile="nl-core-AbilityToWashOneself"/>
        <nm:map ada="verrichting" resource="Procedure" profile="nl-core-Procedure"/>
        <nm:map ada="verstrekkingsverzoek" resource="MedicationRequest" profile="mp-DispenseRequest"/>
        <nm:map ada="visueel_resultaat" resource="Media" profile="nl-core-TextResult-Media"/>
        <nm:map ada="voedingsadvies" resource="NutritionOrder" profile="nl-core-NutritionAdvice"/>
        <nm:map ada="wilsverklaring" resource="Consent" profile="nl-core-AdvanceDirective"/>
        <nm:map ada="wisselend_doseerschema" resource="MedicationRequest" profile="mp-VariableDosingRegimen"/>
        <nm:map ada="woonsituatie" resource="Observation" profile="nl-core-LivingSituation"/>
        <nm:map ada="zorgaanbieder" resource="Organization" profile="nl-core-HealthcareProvider-Organization"/>
        <nm:map ada="zorgaanbieder" resource="Location" profile="nl-core-HealthcareProvider"/>
        <nm:map ada="zorg_episode" resource="EpisodeOfCare" profile="nl-core-EpisodeOfCare"/>
        <nm:map ada="zorg_team" resource="CareTeam" profile="nl-core-CareTeam"/>
        <nm:map ada="zorgverlener" resource="PractitionerRole" profile="nl-core-HealthProfessional-PractitionerRole"/>
        <nm:map ada="zorgverlener" resource="Practitioner" profile="nl-core-HealthProfessional-Practitioner"/>
    </xsl:variable>
</xsl:stylesheet>