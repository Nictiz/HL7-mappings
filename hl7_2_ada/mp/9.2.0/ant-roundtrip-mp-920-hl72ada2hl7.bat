@setlocal enableextensions

@echo off

echo.ant mp 920 hl72ada2hl7 roundtrip...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-920.xml roundtrip_hl7_2_ada_920 >ant-roundtrip.log

echo.Done
pause
