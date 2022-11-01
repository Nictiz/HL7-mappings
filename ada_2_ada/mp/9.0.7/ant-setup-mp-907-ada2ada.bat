@setlocal enableextensions

@echo off

echo.ant ada2ada MP 9.0.7 setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2ada-mp-907.xml setup >ant-setup.log

echo.Done
pause
