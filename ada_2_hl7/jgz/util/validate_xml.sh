#!/bin/bash
export wd=`dirname $0`
export wdsvrl=${wd}/../schematron_svrl
export wdxml=${wd}/../xml-JGZ
export wdutil=${wd}/../xsl/sch-utils
export wdxmlsvrloutput=${wd}/../xml-JGZ_svrl

export dirSaxon=${wd}/lib/saxon-9
export dirSaxon6=${wd}/lib/saxon-6

export xmlFiles=${wdxml}/*

# Get the folders of the JGZ versions available
folders_version=()
arguments=()
if [[ ${#@} -gt "0" ]]; then
    arguments=$@
else
    arguments=('all')
fi

if [[  $1 == "help" || $1 == "man" ]]
then
    echo "Pass the versions for validation as arguments. No argument will validate all versions"
    exit 1 
fi

for input_version in ${arguments[@]}; do
    for f in $wd/../*
    do
        export folder=$f
        export f_folder=$(basename -- "$folder")
        # Get the folders of the JGZ versions available
        if [[ "$f_folder" != "util" ]]; then
            if [[ $input_version == "all" ]]
            then
                folders_version+=($folder)
            fi
            if [[ $input_version == $f_folder ]]
            then
                folders_version+=($folder)
            fi
        fi
    done
done

# Exit if there is no folder found for the versions in the arguments 
if [[  ${#@} -gt 0 && ${#folders_version[@]} != ${#@} ]]
then
    folders_version+=($folder)
    echo "Version not found"
    exit 1 
fi

#echo "Validate version(s) ${folders_version[@]}"

# Get all the SVRL and use case directories
for f_version in "${folders_version[@]}"
do
    #echo get files in $f_version
    # check if the SVRLs are present
    d_svrl=()
    for version_content in $wd/$f_version/*
    do
        DIRECTORY=$version_content
        d_content=$(basename -- "$DIRECTORY")
        if [[ $d_content == hl7*_svrl ]] ;then
            d_svrl+=($d_content)
        fi
        if [[ -d $version_content/hl7_instance ]]; then
            echo usecase: $d_content 
            d_usecase=$version_content
        fi
    done
    echo SVRLs: ${d_svrl[@]}
done

# Get the svrl files

# Get the HL7 instances

# Validate the HL7 instances with the corresponding svrl and convert to HTML




