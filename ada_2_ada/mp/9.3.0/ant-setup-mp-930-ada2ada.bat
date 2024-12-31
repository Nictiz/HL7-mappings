@setlocal enableextensions

@echo off

echo.ant ada2ada MP9 3.0 setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2ada-mp-930.xml setup >ant-setup.log

echo.Done
pause
