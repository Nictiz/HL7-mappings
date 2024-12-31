@setlocal enableextensions

@echo off

echo.ant build huisartswaarneemgegeven 6.10.1.3 hl7 mappings build...
call ant -f build-huisartswaarneemgegevens-6.10.1.3.xml >ant-build-hwg.log

echo.Done
pause