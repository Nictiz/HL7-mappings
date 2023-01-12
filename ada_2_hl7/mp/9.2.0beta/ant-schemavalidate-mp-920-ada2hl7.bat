@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP 9 2.0 schemavalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-920.xml schemavalidate_hl7_920>ant-schemavalidate.log

rem call ant -verbose, -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-920.xml schemavalidate_hl7_920>ant-schemavalidate.log

echo.Done
pause
