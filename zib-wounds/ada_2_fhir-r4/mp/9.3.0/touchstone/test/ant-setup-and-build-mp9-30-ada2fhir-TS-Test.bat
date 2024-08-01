@setlocal enableextensions

@echo off

echo.ant mp9 30 ada2fhir-r4 Touchstone Test setup ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp9-30-TS-Test.xml setup_30 >ant-setup.log
echo.Done
echo.ant mp9 30 ada2fhir-r4 Touchstone Test build ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp9-30-TS-Test.xml convert_ada_2_fhir_30 >ant-build.log
echo.Done
pause
