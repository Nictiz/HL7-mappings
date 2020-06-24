@setlocal enableextensions

@echo off

echo.ant mp 907 hl72ada setup and build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-907.xml setup >ant-setup.log

echo.Done
pause
