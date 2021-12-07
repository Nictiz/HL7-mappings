@setlocal enableextensions

@echo off

echo.ant cio 100 2020.01 ada2fhir build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-cio-100.xml >ant-build.log

echo.Done
pause
