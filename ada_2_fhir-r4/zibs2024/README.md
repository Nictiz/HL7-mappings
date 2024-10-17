# Folder structure

The folder structure uses the following conventions:

- `payload` contains the actual XSLT mappings from ADA to FHIR. Each ADA to FHIR mapping lives in a separate file.
  - `nl-core-x.x.xsl` can be used to import all stylesheets relevant to the nl-core package with that version number.
  - `nl-core-latest.xsl` can be used to import all stylesheets relevant to the latest nl-core package.
  - `x.x/` folders containing all the stylesheets that have been added or changed in the nl-core package with that version number.
  - `x.x/*.xsl` individual nl-core XSLTs.
- `util` containts utility files.
- `ada_instance` contains instances of the zib scenarios in ADA format.
- `ada_project_drivers` contains the XSLT 'drivers' that can be called to start the transformation from ADA to FHIR for the zib scenarios. See the README in this folder for more information.
- `fhir_instance` contains FHIR instances generated from ADA instances.