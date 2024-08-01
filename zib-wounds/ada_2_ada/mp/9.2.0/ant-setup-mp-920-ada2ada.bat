@setlocal enableextensions

@echo off

echo.ant ada2ada MP9 2.0 setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2ada-mp-920.xml setup >ant-setup.log

echo.Done
pause
