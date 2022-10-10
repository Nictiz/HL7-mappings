@setlocal enableextensions

@echo off

echo.ant mp 920 ada2fhir schemavalidate...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-920.xml schemavalidate_fhir_920>ant-schemavalidate.log

echo.Done
pause
