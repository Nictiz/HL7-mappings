@setlocal enableextensions

@echo off

echo.ant ada2hl7 JGZ 7.0.0 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-jgz-700.xml >ant-build.log

echo.Done
pause
