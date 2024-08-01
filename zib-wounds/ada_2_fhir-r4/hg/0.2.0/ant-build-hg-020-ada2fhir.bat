@setlocal enableextensions

@echo off

echo.ant hg 020 ada2fhir build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-hg-020.xml >ant-build.log

echo.Done
pause
