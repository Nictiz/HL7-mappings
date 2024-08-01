@setlocal enableextensions

@echo off

echo.ant cio 200 ada2fhir setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-cio-200.xml setup >ant-setup.log

echo.Done
pause
