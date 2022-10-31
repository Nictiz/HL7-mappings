@setlocal enableextensions
@echo off

echo.ant mp 920 fhir2ada-r4 setup and roundtrip ...
echo.setup first ...
call ant -f _ant-buildfiles/ant-publish/build-fhir2ada-mp-920.xml setup>ant-build.log 
echo.setup done
echo.now the roundtrip ...
call ant -f _ant-buildfiles/ant-publish/build-fhir2ada-mp-920.xml roundtrip_fhir_2_ada_2_fhir>ant-roundtrip.log 

echo.Done
pause
