@setlocal enableextensions

@echo off

echo.ant mp 910 ada2fhir build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-910.xml >ant-build.log

echo.Done
pause
