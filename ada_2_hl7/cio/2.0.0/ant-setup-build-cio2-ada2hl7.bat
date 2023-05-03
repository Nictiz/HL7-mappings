@setlocal enableextensions

@echo off

echo.ant CIO 2.0.0-beta1 ada2hl7 setup and build ...
echo.setup first
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-20.xml setup_cio2 >ant-setup.log
echo.setup done, now the build ...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-20.xml convert_ada_2_hl7_cio2 >ant-build.log


echo.Done
pause
