@setlocal enableextensions

@echo off

echo.ant ada2hl7 Geboortezorg 3.0 schematronvalidate results...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-30.xml schematronvalidateresults_peri_30 >ant-schematronvalidateresults.log

echo.Done
pause
