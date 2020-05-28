@setlocal enableextensions
@echo off

echo.ant mp 907 fhir2ada build...
call ant -f _ant-buildfiles\ant-publish\build-fhir2ada-mp-907.xml 
rem >ant-build.log

echo.Done
pause
