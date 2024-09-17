#!/bin/bash

### CHECK BEFORE RUNNING ####
inputDir=../ada_instance
outputDir=../fhir_instance

function doTransformation {
    input=$1
    
    echo Converting $input
    
    echo Removing previous output
    rm -f "$outputDir"/"$input"*.xml
       
    java -jar "$saxonPath" -s:"$inputDir/$input.xml" -xsl:nl-core-driver.xsl -o:"$outputDir/$input.xml"
}

if [[ ! -f "$saxonPath" ]]; then
    echo
    echo Did not find Saxon JAR here "$saxonPath". Set the 'saxonPath' environment variable to supply a different path...
    echo http://saxon.sourceforge.net
    exit
fi

if [[ "$1" == "" ]]; then
	for inFile in $inputDir/nl-core*.xml; do
	  id=$(basename $inFile .xml)
      doTransformation $id
	done
else
	doTransformation $(basename $1 .xml)
fi
