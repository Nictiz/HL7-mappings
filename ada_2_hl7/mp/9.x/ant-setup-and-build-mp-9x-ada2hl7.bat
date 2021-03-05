@setlocal enableextensions

@echo off

echo.ant mp 9x ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-9x.xml setup_mp9x >ant-setup.log

echo.Done
pause
