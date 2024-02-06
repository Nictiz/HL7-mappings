@setlocal enableextensions

@echo off

echo.ant ada2hl7 CiO 2.0 schema validate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-20.xml schemavalidate_cio2 > ant-schemavalidate.log
echo.Done
pause
