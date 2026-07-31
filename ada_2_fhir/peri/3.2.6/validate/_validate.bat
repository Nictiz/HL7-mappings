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

SET "instance_root=%~dp0..\med_mij_uitbreiding_verloskunde_beschikbaarstellen\fhir_instance"
SET "echo_root=%~dp0..\med_mij_echo_beschikbaarstellen\fhir_instance"
SET "kraam_root=%~dp0..\med_mij_kraam_beschikbaarstellen\fhir_instance"

IF EXIST "%input_cache_path%\%publisher_jar%" (
	REM JAVA -jar "%input_cache_path%\%publisher_jar%" -ig . %txoption% %*
  	java -jar "%input_cache_path%\%publisher_jar%" ^
   		-ig nictiz.fhir.nl.stu3.geboortezorg#3.0.0-beta1-rc.2 ^
   		-ig nictiz.fhir.nl.stu3.zib2017#2.2.10 ^
   		-version 3.0 ^
   		-recurse -html-output validation.html ^
   		-txLog txlog.txt ^
   		-locale nl -language nl ^
   		-sct 11000146104 ^
  		%txoption% ^
   		-display-issues-are-warnings ^
    	"%instance_root%\gz-izv-kwa-casus1" ^
   		"%instance_root%\gz-izv-kwa-casus2" ^
		"%instance_root%\gz-izv-kwa-casus4" ^
		"%echo_root%\gz-ize-kwa-casus1" ^
		"%kraam_root%\gz-izk-kwa-casus1" ^
		 > validator-console.log 2>&1
) ELSE If exist "..\%publisher_jar%" (
	REM JAVA -jar "..\%publisher_jar%" -ig . %txoption% %*
	java -jar "..\%publisher_jar%" ^
        -ig nictiz.fhir.nl.stu3.geboortezorg#3.0.0-beta1-rc.2 ^
        -ig nictiz.fhir.nl.stu3.zib2017#2.2.10 ^
        -version 3.0 ^
        -recurse ^
        -html-output validation.html ^
        -txLog txlog.txt ^
        -locale nl ^
        -language nl ^
        -sct 11000146104 ^
        -display-issues-are-warnings ^
        %txoption% ^
    	"%instance_root%\gz-izv-kwa-casus1" ^
   		"%instance_root%\gz-izv-kwa-casus2" ^
		"%instance_root%\gz-izv-kwa-casus4" ^
		"%echo_root%\gz-ize-kwa-casus1" ^
		"%kraam_root%\gz-izk-kwa-casus1" ^
		 > validator-console.log 2>&1
) ELSE (
	ECHO IG Validator NOT FOUND in input-cache or parent folder.  Please run _updateValidator.  Aborting...
)

PAUSE
