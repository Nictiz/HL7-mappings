@setlocal enableextensions

@echo off

echo.ant peri 3.0 ada2hl7 setup ...

call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-30.xml setup_peri30 >ant-setup.log

echo.Done
pause
