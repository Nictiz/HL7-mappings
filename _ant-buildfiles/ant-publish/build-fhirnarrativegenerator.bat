@setlocal enableextensions

@echo off

echo.ant build fhirnarrativegenerator hl7 mappings build...
call ant -f build-fhirnarrativegenerator.xml >ant-build-fhirnarrativegenerator.log

echo.Done
pause