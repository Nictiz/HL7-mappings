==Ketenzorg 3.0.2 ADA to HL7 FHIR STU3==

This contains resources for converting ADA instance with various Ketenzorg/Community Based Care 'building blocks' from a relatively simple dataset xml format in response type transactions to HL7 FHIR. 

It is based on publication 3.0.2 for the HL7v3 Ketenzorg project and on version 3.0.2 for the ADA data format that follows the dataset based on what was relevant from the Beschikbaarstellen transactions.

    https://decor.nictiz.nl/pub/ketenzorg/kz-html-20190110T164948/index.html

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:

    https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The XML Schemas of the ADA format is included in the folder "ada_schemas". Complete empty XML instances in the ADA format are included in the folder "ada_new".

The folder "payload" contains the stylesheets (XSLT 2.0) that do the conversion for the payload: "beschikbaarstellen_*_2_fhir.xsl"
The XSLTs use the "../../../hl7_2_ada_ketenzorg_include.xsl" which in turn uses ../../../../hl7/hl7_2_ada_hl7_include.xsl which is meant to be reused by other/different transactions.

The folder 'ada_instance' contains sample ADA instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder fhir_instance contains the result of the conversion.

The ADA user front-end for Ketenzorg 3.0.2 can be found here: 

    https://decor.nictiz.nl/art-decor/ada-data/projects/ketenzorg3.0/views/ketenzorg_30_index.xhtml

===Release Notes===
2021-12-01
* MM-2651 Fix for XPath 2 compatibility. Replaced || syntax with concat()
* MM-2606 Improved references by making them relative instead of absolute
* MM-2693 AVG: Filter address/contactinformation marked private from Practitioner(Role) and Organization. Contact information marked "Emergency Number" is also filtered (V3: EC)
2021-11-30
* MM-2606 Enhance mapping Huisartsgegevens <> Ketenzorg with resource.id. Keeps fullURL, Resource.id and references to them in sync
  * NOTE: GP Data/Ketenzorg **now requires new parameter baseId** that allows creation of fullURL [baseId]/[type]/[id] where [id] matches Resource.id. Its value SHALL be the generic fhir endpoint and SHALL NOT end with a forward slash. Example: https://example.org/fhir 
  * Fixed nf:removeSpecialCharacters() function. Now keeps the dot instead replacing it because it is perfectly valid. Smarter handling of diacriticals
* MM-2559 Fixed Condition.clinicalStatus so it defaults to 'active' instead an illegal extension dataAbsentReason
* Fixed Laboratory results where the second and latter groups of results would always get uuid. This should have been second or latter instance within a group
* Fixed narrative block when separator is br. This should have lead to but came out textual 'br'
2021-08-16
* MM-2235 Revised mapping for AllergyIntolerance.verificationStatus to always produce a valid @value
2021-08-04
* Add a check for valid booleans based on input where value=0 was sent. Will terminate processing if invalid boolean is found
2021-08-03
* MM-2323 Touchstone : Assert CodeableConcept HA 2020.1. Add display on PractitionerRole.speciality, Observation.category, Observation.referenceRange.type
2021-05-25
* MM-1453 Updated population of Encounter.period. In absence of an Encounter.period.end, substitute Encounter.period.start
* MM-1521 Support EpisodeOfCare in dedicated Resource.extension
2021-01-19
* MM-1698 Corrected display for SNOMED CT 64572001 from Condition to aandoening
* MM-1751 Add Bundle.id
* MM-1682 Add parameter for Bundle.link (bundleSelfLink)
2020-12-09
* MM-1558 Fixed address extensions. Implemented newer extension http://nictiz.nl/fhir/StructureDefinition/zib-AddressInformation-AddressType and changed http://fhir.nl/fhir/StructureDefinition/nl-core-address-official from valueCode to valueBoolean
2020-11-06
* MM-1559 Fixed empty Encounter.class and added implementation of code-specification to preserve the original NHG Table 14 code as specified in the profile
2020-09-22
* MM-1437 Fixed an issue for input where multiple ids are present on a healthcare professional
2020-09-21
* MM-1451 Make Condition search mode include in the EpisodeOfcare bundle
2020-09-02
* Add support for Composition.event.detail containing the episode reference
* Improved Composition.section.text generation for empty journal entries with ICPC code. Now uses ICPC as fallback text.
2020-08-15
* Identifiers. Terminates upon detection of an OID with leading zeroes in a node
* Diagnostic Results and Lab Results, now properly converts HCIM codes (SNOMED CT) to the required HL7v2 Table 0078 codes. 
* Fixed issues with div tags in table/caption that FHIR has declared illegal
2020-07-16 -
* Fixed an issue where duplicates Encounter were not de-duplicated 
2020-07-14 - 
* Add support for Composition.section.entry episodeofcare link as suggested by the profile and as present in the input
* Change Composition.section.text.status from additional to generated. Additional suggests it contains unqiue data compared to the entries and has separate value
2020-06-30 - 
* Add support for Encounter.episodeOfCare 
2020-06-28 - 
* Fixed support for combined bundle containing both encounter reports and encounters when encounter ids are not numeric
2020-06-26 -
* Add support for combined bundle containing both encounter reports and encounters
2020-06-24 - 
* Add support for combined bundle containing both lab results and/or general results
* MM-1018 Improved trimming leading/trailing white spaces which FHIR does not appreciate
* MM-1090 Fixed location of AD_use extension: now goes under Address directly instead of Address.use
* Add support for Coding.version if available
2020-04-28 -
* Wrapped all xsl:message calls into util:logMessage that accepts a log level. If the requested logLevel for the message to emit is smaller than/equal the parameter logLevel, the message is emitted, otherwise it is not. Options:
  * ALL, DEBUG, INFO, WARN, ERROR. FATAL, OFF where ALL shows all messages, DEBUG shows everything but ALL, INFO everything but ALL/DEBUG etc.
  * default is INFO
2020-04-20 -
* HL7-123 Normalize-space() on Address, Name and Contact parts. FHIR does not allow leading or trailing spaces
* HL7-123 NarrativeGenerator will use div instead of br tags to avoid conversion to JSON issues in some reference frameworks
* NarrativeGenerator
  * Replaced table.caption.div with equivalent span style="display: block;"
  * Fixed separator usage when calling DoDT
  * Fixed Observation.comment - used wrong datatype and would thus not be rendered
  * Add support for Observation.specimen and Observation.issued
  * Add support for Observation extension http://hl7.org/fhir/StructureDefinition/observation-eventTiming
  * Add support for zib-NursingIntervention Procedure.usedReference extension http://nictiz.nl/fhir/StructureDefinition/extension-medicaldevice
  * Add support for zib-NursingIntervention Procedure.extension http://hl7.org/fhir/StructureDefinition/goal-pertainsToGoal
  * Add support for zib-NursingIntervention Procedure.extension http://nictiz.nl/fhir/StructureDefinition/zib-NursingIntervention-Requester
  * Add support for zib-NursingIntervention Procedure.extension http://hl7.org/fhir/StructureDefinition/procedure-schedule
  * Add support for zib-FamilySituationChild extension http://nictiz.nl/fhir/StructureDefinition/zib-FamilySituationChild-RelatedPerson
  * Add support for zib-FamilySituation extension http://nictiz.nl/fhir/StructureDefinition/zib-FamilySituation-LivingAtHomeIndicator
  * Add support for Encounter.class and Encounter.serviceProvider
  * Add support for Consent.consentingParty and .organization
  * Add support for Consent.extension http://nictiz.nl/fhir/StructureDefinition/Comment
  * Add support for Consent.extension http://nictiz.nl/fhir/StructureDefinition/zib-AdvanceDirective-Disorder
  * Add support for RelatedPerson http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role
  * Add support for Patient.active (only if false)
  * Harmonized date handling. Now always emits dd mmm yyyy
2020-04-09 -
* MM-1056 Improved display on codes in AllergyIntolerance.category and .criticality. The previous fix introduced an error which is now fixed
2020-04-07 -
* MM-1056 Improved display on codes in AllergyIntolerance.category and .criticality
* MM-1057 Add Composition.type.display
2020-03-30 - 
* Add support for identifier on EpisodeOfCare, remove identifier from Flag. Path would not have data and if it did it would have been incorrect
2020-03-18 - 1.3.3
* MM-1018 Fixed trailing/leading spaces by adjusting the central datatype functions. This affects any mapping part that calls them
* MM-1009 Fixed missing timezone on Bundle.entry.resource.period.start
2020-03-17 - 1.3.2
* MM-1009 Fixed missing Observation.subject on gp-JournalEntry
* MM-1009 Fixed missing timezone when date stamp includes time
2020-03-16 - 1.3.1
* MM-992 Fixed missing Resource.meta.profile indicators on EncounterReport inclusions (gp-JournalEntry), Encounters (gp-Encounter) and Episodes (zib-Alert) - https://bits.nictiz.nl/browse/MM-992
2020-03-13 - 1.3.0
* All resources now contain narrative Resource.text. This is a FHIR SHOULD
* Improved handling of CodeableConcept.display. Now normalizes space to avoid leading/trailing spaces.
* Improved accuracy of display value on Practitioner reference
2019-10-30 - 1.2.0
* Large refactoring efforts have led to a more centralized approach for HCIM conversion to FHIR. Name, Address, ContactData, Patient and more now have a central place in the folder zib2017
* (!!) There is a new XSL level parameter for masking of Burgerservicenummers (BSNs), as not all use cases require this. If you want to mask, please use paramater mask-ids with value 2.16.840.1.113883.2.4.6.3 rather than relyiing on the defaults
* Datatypes: where ValueSets for a given context specify NullFlavor, this will be transformed to a regular Coding, instead of the NullFlavor extension. Example: MedicationRequest.reasonCode
* Datatypes: when an Identifer is masked, the dataAbsentReason is written into the .value, instead of the top level
* Datatypes: quantity units that are supposed to be UCUM but aren't, are now returned in {}, which is a valid UCUM escape
* Datatypes: quantity value commas are converted into dots
* Datatypes: support for parametrized date/time. Relevant for Touchstone instances
* General: Bundle.entry now supports search.mode everywhere
* Patient: add support for Patient.address, Patient.telecom
* AllergyIntolerance: add support for .identifier
* AllergyIntolerance: https://bits.nictiz.nl/browse/MM-492 leads to improved verificationStatus handling
* AllergyIntolerance: .assertedDate is now mapped onto .onsetDateTime. This is a semantically better fit
* Composition: (EncounterReport) is now built differently. It used to list the main complaint. Now simply says "Contactverslag [patient name]"
* Episodes: fixed broken link to the Condition by adding the appropriate entry to the Bundle
* Condition: improved .clicnicalStatus handling. No longer assumes active unless input is specific
* zib-BodyWeight: fixed missing .performer element
2019-08-28 - 1.1.0
* Added default dataAbsentReason 'unknown' for AllergyIntolerance/verificationStatus, since this is a required element in FHIR and we can't always properly map it from the zib/ada.
2019-07-25
* Fixed empty fullUrl for Encounter (Contactmomenten).
2019-07-30
* Consolidated logic for dynamically datatyped elements, e.g. Observation//value for better reuse
* Added missing search type = match for alerts on Bundle entries
* Fixed Encounter.participant. Now properly picks the contact_with
* Fixed Encounter.serviceProvider. Now properly picks the contact_with organization
* Fixed PractitionerRole.code (no longer generated)
* Fixed PractitionerRole.specialty (was reading the wrong path)
* Fixed quantity unit logic by adding UCUM logic based on UCUM essence
* Fixed Observation.valueQuantity for BodyWeight to include system too