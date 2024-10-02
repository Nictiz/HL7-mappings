@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP9 3.0 schemavalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-930.xml schemavalidate_hl7_930>ant-schemavalidate.log

rem call ant -verbose, -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-930.xml schemavalidate_hl7_930>ant-schemavalidate.log

echo.Done
pause
