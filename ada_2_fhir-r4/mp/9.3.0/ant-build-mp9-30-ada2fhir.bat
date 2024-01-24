@setlocal enableextensions

@echo off

echo.ant mp9 30 ada2fhir-r4 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp9-30.xml >ant-build.log

echo.Done
pause
