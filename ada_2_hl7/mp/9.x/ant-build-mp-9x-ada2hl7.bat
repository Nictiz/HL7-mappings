@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP 9x build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-9x.xml >ant-build.log

echo.Done
pause
