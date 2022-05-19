@setlocal enableextensions

@echo off

echo.ant ada2hl7 Geboortezorg 3.0 schematronvalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-30.xml schematronvalidate_peri_30>ant-schematronvalidate.log

echo.Done
pause
