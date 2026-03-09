@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP9 3.0 schematronvalidate nictiz_test only ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-930.xml schematronvalidate_hl7_930_nictiztest>ant-schematronvalidate-nictiztest.log

echo.Done
pause
