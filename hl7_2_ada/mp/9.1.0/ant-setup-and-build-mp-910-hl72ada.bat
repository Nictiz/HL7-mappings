@setlocal enableextensions

@echo off

echo.ant mp 910 hl72ada setup and build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-910.xml setup_910 >ant-setup.log

echo.Done
pause
