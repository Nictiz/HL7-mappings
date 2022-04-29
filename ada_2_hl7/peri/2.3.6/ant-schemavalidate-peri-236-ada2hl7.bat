@setlocal enableextensions

@echo off

echo.ant ada2hl7 peri 2.3.6 schemavalidate ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-236.xml schemavalidate_hl7_236>ant-schemavalidate.log

rem call ant -verbose, -f _ant-buildfiles\ant-publish\build-ada2hl7-peri-30.xml schemavalidate_hl7_30>ant-schemavalidate.log

echo.Done
pause
