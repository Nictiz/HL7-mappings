@setlocal enableextensions

@echo off

echo.ant imm 2.0 ada2fhir-r4 build ...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-imm-20.xml >ant-build.log
#echo ant imm 2.0 ada2fhir-r4 copy results ...
#call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-imm-20.xml copy_result_to_testscripts  >>ant-build.log
echo.Done
pause
