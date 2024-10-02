@setlocal enableextensions
@echo off

echo.ant MP9 2.0.0 fhir2ada2fhir-r4 roundtrip...
call ant -f _ant-buildfiles/ant-publish/build-fhir2ada-mp-920.xml roundtrip_fhir_2_ada_2_fhir>ant-roundtrip.log 


echo.Done
pause
