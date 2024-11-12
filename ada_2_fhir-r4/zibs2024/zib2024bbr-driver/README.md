# Project drivers

Whereas the `payload` folder contains pure zib/nl-core mappings to be re-used across ADA projects, this folder contains drivers to handle the output specifically from the [zib2024 project on ART-DECOR](https://decor.nictiz.nl/ada/modules/index-admin.xquery?app=zib2024-prerelease&language=nl-NL&validate=false) which can be found in the `ada_instance` folder and feed it to these zib/nl-core mappings.

This driver is responsible for preprocessing the ADA input to, for example, make the references patient the `subject` parameter of all nl-core stylesheets, or to make zibs like Nationality etc. to become input for the nl-core-Patient template.

When adding a template for a specific zib, it MUST be added to `_applyNlCoreTemplate` in `ada_project_drivers/nl-core-driver.xsl`.