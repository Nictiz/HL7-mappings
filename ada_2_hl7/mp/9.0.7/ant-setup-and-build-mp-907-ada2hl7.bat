@setlocal enableextensions

@echo off

echo.ant mp 907 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-907.xml setup >ant-setup.log

echo.Done
pause
