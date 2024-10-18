@setlocal enableextensions

@echo off

echo.ant lab 300 ada2fhir setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-lab-300.xml setup_lab300 setup convert_ada_2_fhir_300 2>&1 ant-setup.log

echo.Done
pause
