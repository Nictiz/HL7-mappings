@setlocal enableextensions

@echo off

echo.ant mp 910 hl72ada build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-910.xml convert_hl7_2_ada >ant-build.log

echo.Done
pause
