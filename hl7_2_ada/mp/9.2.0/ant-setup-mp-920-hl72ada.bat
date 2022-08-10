@setlocal enableextensions

@echo off

echo.ant mp 920 hl72ada setup ...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-920.xml setup_920 >ant-setup.log

echo.Done
pause
