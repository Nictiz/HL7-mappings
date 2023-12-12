@setlocal enableextensions

@echo off

echo.ant MP9 3.0 hl72ada build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-930.xml convert_hl7_2_ada_930 >ant-build.log

echo.Done
pause
