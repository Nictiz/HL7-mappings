# Project drivers

Whereas the `payload` folder contains pure zib/nl-core mappings to be re-used across ADA projects, this folder contains drivers to handle the output specifically from the [zib2024 project on ART-DECOR](https://decor.nictiz.nl/ada/modules/index-admin.xquery?app=zib2024-prerelease&language=nl-NL&validate=false) which can be found in the `ada_instance` folder and feed it to these zib/nl-core mappings.

This driver is responsible for preprocessing the ADA input to, for example, pass the referenced patient via the `subject` parameter to all nl-core stylesheets, or to pass zibs like Nationality etc. as input to the nl-core-Patient template.

When adding a template for a specific zib, it MUST be added to `_applyNlCoreTemplate` in `zib2024bbr_driver/zib2024bbr_driver.xsl`.