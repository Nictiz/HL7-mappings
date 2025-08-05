#!/bin/bash
publisher_jar=validator_cli.jar
input_cache_path=./input-cache/
echo Checking internet connection...
curl -sSf tx.fhir.org > /dev/null

if [ $? -eq 0 ]; then
	echo "Online"
	txoption=""
else
	echo "Offline"
	txoption="-tx n/a"
fi

echo "$txoption"

export JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -Dfile.encoding=UTF-8"

publisher=$input_cache_path/$publisher_jar
if test -f "$publisher"; then
	#java -jar $publisher -ig . $txoption $*
	java -jar $publisher -ig nictiz.fhir.nl.stu3.geboortezorg#1.3.3 -ig nictiz.fhir.nl.stu3.zib2017#2.2.10 -version 3.0 -recurse -debug -html-output validation.html -txLog txlog.txt -locale nl -language nl -sct 11000146104 -display-issues-are-warnings -level error `dirname $0`/../med_mij_uitbreiding_verloskunde_beschikbaarstellen/fhir_instance

else
	publisher=../$publisher_jar
	if test -f "$publisher"; then
		#java -jar $publisher -ig . $txoption $*
  	java -jar $publisher -ig nictiz.fhir.nl.stu3.geboortezorg#1.3.3 -ig nictiz.fhir.nl.stu3.zib2017#2.2.10 -version 3.0 -recurse -debug -html-output validation.html -txLog txlog.txt -locale nl -language nl -sct 11000146104  -display-issues-are-warnings -level error `dirname $0`/../med_mij_uitbreiding_verloskunde_beschikbaarstellen/fhir_instance
	else
		echo IG Validator NOT FOUND in input-cache or parent folder.  Please run _updateValidator.  Aborting...
	fi
fi
