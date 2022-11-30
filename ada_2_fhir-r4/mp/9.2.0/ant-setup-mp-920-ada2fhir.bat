@setlocal enableextensions

@echo off

echo.ant mp 920 ada2fhir-r4 setup ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-920.xml setup_920 >ant-setup.log
echo.Done
pause
