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

igAZ=`dirname $0`/../../../../../AZ-IG/output/package.tgz

inputFiles=`dirname $0`/../verwijzing_ambulance_naar_huisartsenpost/fhir_instance/*

export JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -Dfile.encoding=UTF-8"

publisher=$input_cache_path/$publisher_jar
if test -f "$publisher"; then
	  validator=`java -jar $publisher | head -n 1`
    # Validate instances AZ
    java -jar $publisher  -ig "$igAZ" -version 4.0.1 -recurse -output validation.xml  -txLog txlog.txt -locale nl -language nl -sct 11000146104 -display-issues-are-warnings -level error $inputFiles
	  java -jar `dirname $0`/../../../../../YATC-tools/saxon/saxon.jar -o:`dirname $0`/validation.html -xsl:`dirname $0`/validation.xsl `dirname $0`/validation.xml validator="$validator"
else
	echo "else.."
	  publisher=../$publisher_jar
	  if test -f "$publisher"; then
		    #java -jar $publisher -ig . $txoption $*
  	    java -jar $publisher -version 4.0.1 -recurse -html-output validation.html -tx n/a -txLog txlog.txt -locale nl -language nl -sct 11000146104  -display-issues-are-warnings -level error $inputFiles
	  else
		    echo IG Validator NOT FOUND in input-cache or parent folder.  Please run _updateValidator.  Aborting...
	  fi
fi
