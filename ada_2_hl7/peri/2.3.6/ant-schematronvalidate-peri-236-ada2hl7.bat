@setlocal enableextensions

@echo off

echo.ant ada2hl7 Geboortezorg 2.3.6 schematronvalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-236.xml schematronvalidate_peri_236>ant-schematronvalidate.log

echo.Done
pause
