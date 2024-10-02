@setlocal enableextensions

@echo off

echo.ant mp9 3.0 hl72ada setup ...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-930.xml setup_930 >ant-setup.log

echo.Done
pause
