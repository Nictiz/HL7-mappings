@setlocal enableextensions
@echo off

echo.ant mp 930 fhir2ada-r4 setup...
call ant -f _ant-buildfiles/ant-publish/build-fhir2ada-mp9-30.xml setup > ant-setup.log 


echo.Done
pause
