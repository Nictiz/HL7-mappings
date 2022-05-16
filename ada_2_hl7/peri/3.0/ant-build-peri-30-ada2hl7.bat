@setlocal enableextensions

@echo off

echo.ant peri 3.0 ada2hl7 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-30.xml  >ant-build.log

echo.Done
pause
