@setlocal enableextensions

@echo off

echo.ant mp 920 ada2fhir-r4 schematronvalidate...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-920.xml schematronvalidate_fhir_920>ant-schematronvalidate.log

echo.Done
pause
