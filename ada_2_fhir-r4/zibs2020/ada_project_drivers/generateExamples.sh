#!/bin/bash

### CHECK BEFORE RUNNING ####
inputDir=../ada_instance
outputDir=../fhir_instance

function doTransformation {
    input=$1
    
    echo Converting $input
    noDriverId=${input/-bundled/}
    baseId=${noDriverId:0:-3}
    
    echo Removing previous output
    rm -f "$outputDir"/"$noDriverId"*.xml
    
    if [[ -f "$baseId"-driver.xsl ]]; then
    	xslPath="$baseId"-driver.xsl
    else
    	xslPath=nl-core-driver.xsl
    fi
    
    java -jar "$saxonPath" -s:"$inputDir/$input.xml" -xsl:$xslPath -o:"$outputDir/$noDriverId.xml"
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
      if [[ ! -f "$inputDir"/"$id"-bundled.xml ]]; then
        doTransformation $id
	  fi
	done
else
	doTransformation $(basename $1 .xml)
fi
