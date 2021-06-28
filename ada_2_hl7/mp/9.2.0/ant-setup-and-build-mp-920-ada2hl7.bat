@setlocal enableextensions

@echo off

echo.ant mp 9 2.0 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-920.xml setup_mp9x >ant-setup.log

echo.Done
pause
