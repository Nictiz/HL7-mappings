@setlocal enableextensions

@echo off

echo.ant ada2hl7 CiO 2.0 schematronvalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-20.xml schematronvalidate_cio2 > ant-schematronvalidate.log

echo.Done
pause
