@setlocal enableextensions

@echo off

echo.ant CIO 2.0.0-beta1 ada2hl7 build ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-20.xml convert_ada_2_hl7_cio2 >ant-build.log

echo.Done
pause
