@setlocal enableextensions

@echo off

echo.ant mp 910 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-910.xml setup-910 >ant-setup.log

echo.Done
pause
