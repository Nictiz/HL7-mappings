@setlocal enableextensions

@echo off

echo.ant setup ada2hl7 mp 907...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-907.xml setup >ant-setup.log

echo.Done
pause
