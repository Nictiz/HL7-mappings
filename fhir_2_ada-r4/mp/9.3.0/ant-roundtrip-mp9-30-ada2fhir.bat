@setlocal enableextensions

@echo off

echo.ant mp9 3.0 ada2fhir roundtrip...
call ant -f _ant-buildfiles\ant-publish\build-fhir2ada-mp9-30.xml roundtrip_ada_2_fhir >ant-roundtrip-ada2fhir.log

echo.Done
pause
