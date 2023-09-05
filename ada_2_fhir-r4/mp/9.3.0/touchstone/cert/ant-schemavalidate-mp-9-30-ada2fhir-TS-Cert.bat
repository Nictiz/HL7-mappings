@setlocal enableextensions

@echo off

echo.ant mp9 3.0 ada2fhir-r4 Touchstone Test schemavalidate...
echo.beware: will have errors for configurable T-dates, need to generate with fixed T-date to avoid that
echo.now validating ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp9-30-TS-Cert.xml schemavalidate_fhir_30 >ant-schemavalidate.log

echo.Done
pause
