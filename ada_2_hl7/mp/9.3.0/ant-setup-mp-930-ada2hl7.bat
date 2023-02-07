@setlocal enableextensions

@echo off

echo.ant MP9 3.0 ada2hl7 setup ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-930.xml setup_mp930 >ant-setup.log

echo.Done
pause
