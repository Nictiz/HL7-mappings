@echo off
setlocal enabledelayedexpansion

:: CHECK BEFORE RUNNING ####
if "%saxonPath%"=="" (
  SET saxonPath=C:\SaxonHE9-9-1-7J\saxon9he.jar
)
SET inputDir=..\ada_instance
SET outputDir=..\fhir_instance

if not exist "%saxonPath%" (
    echo.
    echo.Did not find Saxon JAR here '%saxonPath%'. Either add it here or set the 'saxonPath' environment variable to supply a different path...
    echo.http://saxon.sourceforge.net
    pause
)

if "%1"=="" (
	for /f %%f in ('dir /b "%inputDir%"') do (
		set id=%%~nf
		if "!id:~0,8!" == "nl-core-" (
			if not exist "%inputDir%\!id!-bundled.xml" (			
				call :doTransformation !id!
			)
		)
	)
) else (
		set input=%1
		call :doTransformation !input!
)

exit /b

:doTransformation
set input=%1

echo Converting !input!
set noDriverId=!input:-bundled=!
set baseId=!noDriverId:~0, -3!

echo Removing previous output
if exist "%outputDir%\!noDriverId!*.xml" (
	del "%outputDir%\!noDriverId!*.xml" /Q
)

if exist "!baseId!-driver.xsl" (
	set xslPath=!baseId!-driver.xsl
) else (
	set xslPath=nl-core-driver.xsl
)

java -jar "%saxonPath%" -s:"%inputDir%/!input!.xml" -xsl:!xslPath! -o:"%outputDir%/!noDriverId!.xml