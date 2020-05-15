@setlocal enableextensions

@echo off

echo.ant mp 907 ada2fhir setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-907.xml setup >ant-setup.log

echo.Done
pause
