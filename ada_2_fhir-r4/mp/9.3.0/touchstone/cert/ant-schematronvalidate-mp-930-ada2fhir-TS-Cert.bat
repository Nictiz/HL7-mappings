@setlocal enableextensions

@echo off

echo.ant mp9 30 ada2fhir-r4 Touchstone Test schematronvalidate...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp9-30-TS-Cert.xml schematronvalidate_fhir_30 > ant-schematronvalidate.log

echo.Done
pause
