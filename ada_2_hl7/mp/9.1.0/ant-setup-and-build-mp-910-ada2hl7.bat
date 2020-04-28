@setlocal enableextensions

@echo off

echo.ant setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-910.xml setup >ant-setup.log

echo.Done
pause
