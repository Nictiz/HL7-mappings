@echo off
setlocal enabledelayedexpansion

:: CHECK BEFORE RUNNING ####
if "%saxonPath%"=="" (
  SET saxonPath=C:\SaxonHE9-9-1-7J\saxon9he.jar
)
SET inputDir=ada_processed
SET xsltDir=payload
SET outputDir=fhir_instance_resources


if not exist "%saxonPath%" (
    echo.
    echo.Did not find Saxon JAR here '%saxonPath%'. Either add it here or set the 'saxonPath' environment variable to supply a different path...
    echo.http://saxon.sourceforge.net
    pause
)

echo Removing previous output
if exist "%outputDir%" (
	del "%outputDir%" /Q
)


for /f %%f in ('dir /b "%inputDir%"') do (
	set id=%%~nf
	call :doTransformation !id!
)

pause
exit /b


:doTransformation
set input=%1

echo Converting !input!
set baseId=!noDriverId:~0, -3!

java -jar "%saxonPath%" -s:"%inputDir%/!input!.xml" -xsl:"%xsltDir%/beschikbaarstellen_2_fhir.xsl" -o:"%outputDir%/dummy.xml