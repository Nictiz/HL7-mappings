@setlocal enableextensions
@echo off

echo.ant MP9 3.0 fhir2ada-r4 build...
call ant -f _ant-buildfiles/ant-publish/build-fhir2ada-mp9-30.xml >ant-build.log 


echo.Done
pause
