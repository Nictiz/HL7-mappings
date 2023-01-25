@setlocal enableextensions

@echo off

echo.ant zibs2020 ada2fhir build...
call ant -f _ant-buildfiles/ant-publish/build-ada2fhir-zibs2020.xml >ant-build.log

echo.Done
pause
