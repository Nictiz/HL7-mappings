@setlocal enableextensions

@echo off

echo.ant mp 9 2.0 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-920.xml setup_mp920 >ant-setup.log

echo.Done
pause
