# BGZ-MSZ

To run all xslt transformations please run `ada_project_drivers\buildResources.bat`. The batch file assumes [Saxon](http://saxon.sourceforge.net) is installed in the folder `C:\SaxonHE9-9-1-7J\saxon9he.jar`. Another Saxon location can be specified using the %SaxonPath% EnvironmentVariable.

## Manual steps to make FHIR resources suitable for qualification

* If the ada instances (in the `ada_instance` folder) have been changed, run `/payload/ada_processing/bgz_msz-adarefs2ada.xsl` to correctly generate all ada bundles in the `ada_processed` folder.
    * Changes in the ada instance of the zib Patient (`bgz-patA.xml` and `bgz-patB.xml`) need to be done manually in `bgz-msz-patA-patient.xml` and `bgz-msz-patB-patient.xml` (in the `ada_processed` folder) as well.
* If the ada bundles have changed, run `buildResources.bat` in the `ada_project_drivers` folder in order to correctly generate all FHIR resources (which are present in the `fhir_instance_resources` folder).
* The complete set of FHIR fixtures necessary for qualification consists of all resources in the `fhir_instance_resources` folder (with the exception of three RelatedPerson resources; of these only `nl-core-relatedperson-bgz-msz-DIRKD-DIRKJANSE.xml` needs to be included).