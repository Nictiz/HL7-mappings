@setlocal enableextensions

@echo off

echo.ant mp9 30 ada2fhir-r4 convert examples ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp9-30.xml convert_ada_2_fhir_examples -Ddate.T=2022-12-01 >ant-examples.log
echo.Done
pause
