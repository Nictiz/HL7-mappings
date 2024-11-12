@setlocal enableextensions

@echo off

echo.ant lab 3.0.0 ada2fhir mapping...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-lab-300.xml 2>&1 ant-build.log

echo.Done
pause
