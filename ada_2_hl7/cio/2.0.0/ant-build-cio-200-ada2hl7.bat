@setlocal enableextensions

@echo off

echo.ant build mp 907 ada2hl7...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-907.xml >ant-build.log

echo.Done
pause
