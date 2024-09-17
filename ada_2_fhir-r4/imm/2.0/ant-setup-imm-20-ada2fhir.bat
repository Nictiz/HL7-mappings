@setlocal enableextensions

@echo off

echo.ant imm 2.0 ada2fhir-r4 setup ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-imm-20.xml setup >ant-setup.log
echo.Done
pause
