@setlocal enableextensions

@echo off

echo.ant mp 907 hl72ada setup and build ...
echo.ant first mp 907 hl72ada setup ...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-907.xml setup_907 >ant-setup.log
echo.ant and now also the mp 907 hl72ada build...
call ant -f _ant-buildfiles\ant-publish\build-hl72ada-mp-907.xml convert_hl7_2_ada_907 >ant-build.log

echo.Done
pause
