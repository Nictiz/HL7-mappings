@setlocal enableextensions

@echo off

echo.ant peri 2.3.6 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-236.xml setup_peri236 >ant-setup.log

echo.Done
pause
