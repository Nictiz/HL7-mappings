@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP9 3.0 schematronvalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-930.xml schematronresults_hl7_930>ant-schematronresultsvalidate.log

echo.Done
pause
