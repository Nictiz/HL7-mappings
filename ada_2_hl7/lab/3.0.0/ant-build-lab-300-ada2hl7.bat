@setlocal enableextensions

@echo off

echo.ant ada2hl7 lab 3.0.0 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-lab-300.xml >ant-build.log

echo.Done
pause