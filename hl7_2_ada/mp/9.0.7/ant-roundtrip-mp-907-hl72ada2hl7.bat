@setlocal enableextensions

@echo off

echo.ant mp 907 hl72ada2hl7 roundtrip...
echo.ant mp 907 hl72ada build ...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-907.xml convert_hl7_2_ada_907 >ant-build.log
echo.ant mp 907 hl72ada roundtrip ...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-907.xml roundtrip_ada_2_hl7_907 >ant-roundtrip.log

echo.Done
pause
