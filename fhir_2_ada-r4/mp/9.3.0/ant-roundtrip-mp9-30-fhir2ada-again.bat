@setlocal enableextensions

@echo off

echo.ant mp9 3.0 fhir2ada again roundtrip for nictiz_test ...
call ant -f _ant-buildfiles\ant-publish\build-fhir2ada-mp9-30.xml roundtrip_fhir_2_ada_again >ant-roundtrip-fhir2ada-again.log

echo.Done
pause
