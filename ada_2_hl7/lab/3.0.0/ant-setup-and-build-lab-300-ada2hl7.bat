@setlocal enableextensions

@echo off

echo.ant lab 300 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-lab-300.xml setup_lab300 >ant-setup.log

echo.Done
pause
