@setlocal enableextensions

@echo off

echo.ant mp9 3.0 ada2fhir-r4 schemavalidate...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp9-30.xml schemavalidate_fhir_30

echo.Done
pause
