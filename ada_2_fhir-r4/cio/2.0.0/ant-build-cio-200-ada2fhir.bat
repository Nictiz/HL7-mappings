@setlocal enableextensions

@echo off

echo.ant cio 200 ada2fhir build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-cio-200.xml >ant-build.log

echo.Done
pause
