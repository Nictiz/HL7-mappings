# Mapping guidelines

The Schematron file found in this `util` folder can be used to validate XSLT files to see if they meet the expected structure and contain the necessary templates and other elements to function in the zib2020 structure.

Mainly works on the XSLT files in the `payload` folder, but can be extended to work on "drivers" in the `ada_project_driver` folder.

Configure an XSLT Validation Scenario in Oxygen to apply the `.sch`-file to an XSLT.