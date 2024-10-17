# Project drivers

Whereas the `payload` folder contains pure zib/nl-core mappings to be re-used across ADA projects, this folder contains drivers to handle the output specifically from the [zib2024 project on ART-DECOR](https://decor.nictiz.nl/ada/modules/index-admin.xquery?app=zib2024-prerelease&language=nl-NL&validate=false) which can be found in the `ada_instance` folder and feed it to these zib/nl-core mappings.

## Patient references
Specifically for the patient reference, a field for the patient identifier is added to ADA in this project. Drivers can use the template `_resolveAdaPatient` to find the patient instance from the files in the ADA instance folder.