# Project zib2017

This project defines general mappings from ZIB/HCIM definitions in ADA to FHIR for the project [zib2017](https://decor.nictiz.nl/art-decor/decor-project--zib2017bbr-).

## Folder structure

The folder structure uses the following conventions:

- `payload` contains the actual XSLT mappings from ADA to FHIR. Each ADA to FHIR mapping lives in a separate file.
  - `payload/all-zibs.xsl` imports all XSLT files in the folder. It can be used to import all mappings using a single file.
- `ada_new` contains an empty instance of the zib scenarios in ADA format.
- `ada_instance` is used to save instances of zib scenarios in ADA format, once they are created using the frontend (see below).
- `fhir_instance` contains FHIR instances generated from the ADA instances.
- `ada_schemas` contains the (generated) XSD's of the ADA descriptions. These can be used to validate the ADA instances.

## Creating instances

The ADA front-end for this project is available at https://decor.nictiz.nl/art-decor/ada-data/projects/zib2017/views/health_and_care_information_models_hcim_2017_index.xhtml. Using the front-end, ADA instances can be created. 

These instances can be further accessed at https://decor.nictiz.nl/ada/modules/index-admin.xquery?app=langdurigezorg. This is also the place to download the instances in XML format.