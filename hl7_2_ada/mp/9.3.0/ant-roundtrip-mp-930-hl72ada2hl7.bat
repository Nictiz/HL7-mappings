@setlocal enableextensions

@echo off

echo.ant MP9 3.0 hl72ada2hl7 roundtrip...
echo.ant MP9 3.0 hl72ada build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-930.xml convert_hl7_2_ada_930 >ant-build.log
echo.ant MP9 3.0 ada2hl7 roundtrip...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-930.xml roundtrip_hl7_2_ada_930 >ant-roundtrip.log

echo.Done
pause
