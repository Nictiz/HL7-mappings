@setlocal enableextensions

@echo off

echo.ant cio 100 hl72ada build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-cio-100.xml convert_hl7_2_ada >ant-build.log

echo.Done
pause
