@setlocal enableextensions

@echo off

set wd=%~dp0

echo.ant lab 300 ada2fhir setup and build...
call ant -f "%WD%_ant-buildfiles\ant-publish\build-ada2fhir-lab-300.xml" setup_lab300 >"%WD%ant-setup.log"

echo.Done
pause
