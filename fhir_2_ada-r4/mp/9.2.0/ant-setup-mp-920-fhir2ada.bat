@setlocal enableextensions
@echo off

echo.ant mp 920 fhir2ada-r4 setup...
call ant -f _ant-buildfiles/ant-publish/build-fhir2ada-mp-920.xml setup>ant-build.log 


echo.Done
pause
