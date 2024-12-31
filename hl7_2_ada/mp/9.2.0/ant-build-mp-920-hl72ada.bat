@setlocal enableextensions

@echo off

echo.ant mp 920 hl72ada build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-920.xml convert_hl7_2_ada_920 >ant-build.log

echo.Done
pause
