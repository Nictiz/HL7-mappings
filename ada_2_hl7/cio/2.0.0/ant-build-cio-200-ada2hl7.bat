@setlocal enableextensions

@echo off

echo.ant build cio 200 ada2hl7...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-200.xml >ant-build.log

echo.Done
pause
