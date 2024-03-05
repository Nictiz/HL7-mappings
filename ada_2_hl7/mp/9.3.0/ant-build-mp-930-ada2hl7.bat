@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP9 3.0 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-930.xml >ant-build.log

echo.Done
pause
