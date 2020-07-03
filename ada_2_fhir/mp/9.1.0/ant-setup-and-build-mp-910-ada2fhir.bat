@setlocal enableextensions

@echo off

echo.ant mp 910 ada2fhir setup and build (convert ada 2 fhir) ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-910.xml setup_910 >ant-setup.log

echo.Done
pause
