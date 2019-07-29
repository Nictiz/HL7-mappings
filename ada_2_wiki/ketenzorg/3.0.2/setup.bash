#!/bin/bash

export destDir=`dirname $0`
export sourceDir=${destDir}/../../../../projects/ketenzorg3.0

if [ -e "${sourceDir}" ]; then
    if [ ! -e "${destDir}/beschikbaarstellen" ]; then
        mkdir "${destDir}/beschikbaarstellen"
    fi
    if [ -e "${destDir}/beschikbaarstellen/definitions" ]; then
        rm -rf "${destDir}/beschikbaarstellen/definitions"
    fi
    
    cp -rp "${sourceDir}/definitions" "${destDir}/beschikbaarstellen/"
else
    echo "Directory missing: $sourceDir"
    exit 1
fi
