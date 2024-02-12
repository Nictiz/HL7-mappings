@setlocal enableextensions

@echo off

echo.ant hg 020 ada2fhir setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-hg-020.xml setup >ant-setup.log

echo.Done
pause
