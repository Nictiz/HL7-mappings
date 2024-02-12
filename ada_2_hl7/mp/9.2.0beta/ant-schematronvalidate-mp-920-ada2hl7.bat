@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP 9 2.0beta schematronvalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-920.xml schematronvalidate_hl7_920>ant-schematronvalidate.log

echo.Done
pause
