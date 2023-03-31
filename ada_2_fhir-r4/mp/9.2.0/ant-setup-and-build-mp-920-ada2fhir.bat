@setlocal enableextensions

@echo off

echo.ant mp 920 ada2fhir-r4 setup and build...
echo.ant setup first
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-920.xml setup_920 >ant-setup.log
echo.ant setup done

echo.ant build
call ant -f _ant-buildfiles\ant-publish\build-ada2fhir-mp-920.xml >ant-build.log
echo.ant build done

echo.Done
pause
