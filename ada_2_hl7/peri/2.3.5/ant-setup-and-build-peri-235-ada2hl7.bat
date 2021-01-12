@setlocal enableextensions

@echo off

echo.ant peri 2.3.5 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-235.xml setup_peri235 >ant-setup.log

echo.Done
pause
