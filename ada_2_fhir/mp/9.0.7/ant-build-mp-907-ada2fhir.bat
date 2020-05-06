@setlocal enableextensions

@echo off

echo.ant build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-907.xml >ant-build.log

echo.Done
pause
