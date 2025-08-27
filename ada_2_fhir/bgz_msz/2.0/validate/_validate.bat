@ECHO OFF
SET publisher_jar=validator_cli.jar
SET input_cache_path=%CD%\input-cache

ECHO Checking internet connection...
PING tx.fhir.org -4 -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET txoption=-tx n/a
GOTO igpublish

:isonline
ECHO We're online
SET txoption=

:igpublish

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%publisher_jar%" (
	REM JAVA -jar "%input_cache_path%\%publisher_jar%" -ig . %txoption% %*
  java -jar "%input_cache_path%\%publisher_jar%" -ig %~dp0..\..\..\..\..\Nictiz-STU3-BgZ\Profiles -ig "%~dp0..\..\..\..\..\Nictiz-STU3-Zib2017\Profiles - ZIB 2017" -version 3.0 -recurse -debug -html-output validation.html -txLog txlog.txt -locale nl -language nl -sct 11000146104 -display-issues-are-warnings %~dp0/../sturen/fhir_instance
) ELSE If exist "..\%publisher_jar%" (
	REM JAVA -jar "..\%publisher_jar%" -ig . %txoption% %*
  java -jar "..\%publisher_jar%"  -ig %~dp0..\..\..\..\..\Nictiz-STU3-BgZ\Profiles -ig "%~dp0..\..\..\..\..\Nictiz-STU3-Zib2017\Profiles - ZIB 2017" -version 3.0 -recurse -debug -html-output validation.html -txLog txlog.txt -locale nl -language nl -sct 11000146104 -display-issues-are-warnings %~dp0/../sturen/fhir_instance
) ELSE (
	ECHO IG Validator NOT FOUND in input-cache or parent folder.  Please run _updateValidator.  Aborting...
)

PAUSE
