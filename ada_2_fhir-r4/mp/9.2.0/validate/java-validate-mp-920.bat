REM Validate all in folder 4TouchstoneMPServe

@setlocal enabledelayedexpansion
@echo off

java -jar C:\util\validator_cli.jar -version 4.0.1 -ig nictiz.fhir.nl.r4.medicationprocess9 C:\Users\144189-ADM\Documents\Git\HL7-mappings\ada_2_fhir-r4\mp\9.2.0\4TouchstoneMPServe -output validationReport.xml

pause