#!/bin/bash

export destDir=`dirname $0`
export sourceDir=${destDir}/../../../../projects/ketenzorg3.0

if [ -e "${sourceDir}" ]; then
    if [ ! -e "${destDir}/beschikbaarstellen" ]; then
        mkdir "${destDir}/beschikbaarstellen"
    fi
    
    rm -rf "${destDir}/beschikbaarstellen/ada_new"
    rm -rf "${destDir}/beschikbaarstellen/ada_schemas"
    
    cp -rp "${sourceDir}/new" "${destDir}/beschikbaarstellen/ada_new"
    cp -rp "${sourceDir}/schemas" "${destDir}/beschikbaarstellen/ada_schemas"
else
    echo "Directory missing: $sourceDir"
    exit 1
fi

if [ ! -e "${destDir}/beschikbaarstellen/ada_instance" ]; then 
    mkdir "${destDir}/beschikbaarstellen/ada_instance"
fi
if [ ! -e "${destDir}/beschikbaarstellen/fhir_instance" ]; then
    mkdir "${destDir}/beschikbaarstellen/fhir_instance"
fi
if [ ! -e "${destDir}/beschikbaarstellen/payload" ]; then
    mkdir "${destDir}/beschikbaarstellen/payload"
fi