@setlocal enableextensions

@echo off

echo.ant vragenlijsten 1.0.0 ada2fhir setup...
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-vl-100.xml setup >ant-setup.log

echo.Done
pause
