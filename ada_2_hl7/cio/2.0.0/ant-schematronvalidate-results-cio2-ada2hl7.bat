@setlocal enableextensions

@echo off

echo.ant ada2hl7 CiO 2.0 schematronvalidate results...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-20.xml schematronresults_hl7 > ant-schematronvalidate.log

echo.Done
pause
