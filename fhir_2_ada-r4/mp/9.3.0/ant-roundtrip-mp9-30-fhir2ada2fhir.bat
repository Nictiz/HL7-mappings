@setlocal enableextensions

@echo off

echo.ant mp9 3.0 fhir2ada2fhir roundtrip...
call ant -f _ant-buildfiles\ant-publish\build-fhir2ada-mp9-30.xml roundtrip_fhir_2_ada_2_fhir >ant-roundtrip.log

echo.Done
pause