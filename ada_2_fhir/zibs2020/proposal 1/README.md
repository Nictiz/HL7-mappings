# Proposal 1

If profile versioning happens when the profile is changed, eg. as it is in zib2017

## Folder structure

The folder structure uses the following conventions:

- `payload` contains the actual XSLT mappings from ADA to FHIR. Each ADA to FHIR mapping lives in a separate file.
  - `payload/latest-package.xsl` imports the latest version of 'all-zibs.xsl', updated after each KCR.
  - `all-zibs-x.x.xsl` imports all XSLT files in the folder that belong to the semantic version of the package it is named after. It can be used to import all mappings using a single file. A new file is created for every minor release.
  - `*-x-x.xsl` individual zib XSLTs, including the minor profile version in the file name. Compared to zib2017, all templates and modes named and called do not contain the profile version
- `ada_new` contains an empty instance of the zib scenarios in ADA format.
- `ada_schemas` contains the (generated) XSD's of the ADA descriptions. These can be used to validate the ADA instances.