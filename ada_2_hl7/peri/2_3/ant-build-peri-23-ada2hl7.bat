@setlocal enableextensions

@echo off

echo.ant peri 2.3 ada2hl7 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-23.xml  >ant-build.log

echo.Done
pause
