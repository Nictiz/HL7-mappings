@setlocal enableextensions

@echo off

echo.ant mp 907 hl72ada roundtrip ...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-907.xml roundtrip_ada_2_hl7_907 >ant-roundtrip.log

echo.Done
pause
