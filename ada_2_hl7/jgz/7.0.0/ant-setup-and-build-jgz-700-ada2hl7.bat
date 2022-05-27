@setlocal enableextensions

@echo off

echo.ant ada2hl7 jgz 7.0.0 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-jgz-700.xml setup_jgz700 >ant-setup.log

echo.Done
pause
