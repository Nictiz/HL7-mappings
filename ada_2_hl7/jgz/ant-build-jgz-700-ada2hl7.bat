@setlocal enableextensions

@echo off

echo.ant ada2hl7 JGZ 7.0.0 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-jgz-700.xml convert_ada_2_hl7_700 >ant-build.log

echo.Done
pause
