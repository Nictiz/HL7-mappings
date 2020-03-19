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