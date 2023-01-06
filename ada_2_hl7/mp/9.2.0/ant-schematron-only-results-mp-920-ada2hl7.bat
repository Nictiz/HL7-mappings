@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP 9 2.0 schematron do only results ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-920.xml schematronresults_hl7_920>ant-schematronresults.log

echo.Done
pause
