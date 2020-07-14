@setlocal enableextensions

@echo off

echo.ant mp 910 hl72ada2hl7 roundtrip...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-910.xml roundtrip_hl7_2_ada_2_hl7_910 >ant-roundtrip.log

echo.Done
pause
