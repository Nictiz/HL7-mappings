# Manual steps to 'finish' FHIR resources

* If the ada instances (in the ada_instance folder) have been changed, run /payload/ada_processing/bgz_msz-adarefs2ada.xsl to correctly generate all ada bundles in the ada_processed folder.
    * Changes in the ada instance of the zib Patient (bgz-patA.xml and bgz-patB.xml) need to be done manually in bgz-msz-patA-patient.xml and bgz-msz-patB-patient.xml (in the ada_processed folder) as well.
* If the ada bundles have changed, run buildResources.bat in the ada_project_drivers folder in order to correctly generate all FHIR resources (which are present in the fhir_instance_resources folder).
* The complete set of FHIR fixtures necessary for qualification consists of:
    * all resources in the fhir_instance_resources folder (with the exception of .xml), where
        * the Patient fixtures have been enriched by adding the contact and general-practitioner-reference snippets (which can be found in the fhir_instance_resources_manually folder);
        * the Payer fixtures have been enriched by replacing the payor element by the payor-reference snippet (which can be found in the fhir_instance_resources_manually folder);
        * the references in the LaboratoryTestResult-Observation fixtures to underlying Observations (in the case of a panel) and the Specimen have been changed.
    * the insurance-company fixtures (which can be found in the fhir_instance_resources_manually folder).
* Replace dots (.) in file names and ids by dashes (-) for the Patient, Organization, Practitioner, PractitionerRole and RelatedPerson fixtures. Also replace these in all files where these resources are referenced.