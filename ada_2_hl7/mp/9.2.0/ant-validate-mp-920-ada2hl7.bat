@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP 9 2.0 validate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-920.xml validate_hl7_920>ant-validate.log

echo.Done
pause
