@setlocal enableextensions

@echo off

echo.ant ketenzorg 3.0.2 hl7 mappings build...
call ant -f build-ketenzorg-3.0.2.xml >ant-build-kz.log

echo.Done
pause