@setlocal enableextensions

@echo off

echo.ant cio100 hl72ada setup and build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-cio-100.xml setup_100 >ant-setup.log

echo.Done
pause
