@setlocal enableextensions

@echo off

echo.ant mp 920 ada2fhir-r4 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-920.xml >ant-build.log

echo.Done
pause
