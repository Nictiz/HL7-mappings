@setlocal enableextensions

@echo off

echo.ant cio 2.0.0 ada2hl7 setup and build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-cio-200.xml setup_cio200 >ant-setup.log

echo.Done
pause
