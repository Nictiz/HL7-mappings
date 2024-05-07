#!/bin/bash
export wd=`dirname $0`
export wdsvrl=${wd}/../schematron_svrl
export wdxml=${wd}/../xml-JGZ
export wdutil=${wd}/../xsl/sch-utils
export wdxmlsvrloutput=${wd}/../xml-JGZ_svrl

export dirSaxon=${wd}/lib/saxon-9
export dirSaxon6=${wd}/lib/saxon-6

export xmlFiles=${wdxml}/*

echo " `date`"

# Get the folders of the JGZ versions available
folders_version=()
for input_version in "$@"; do
    for f in $wd/../*
    do
        export folder=$f
        export f_folder=$(basename -- "$folder")
        # Get the folders of the JGZ versions available
        if [[ "$f_folder" != "util" ]]; then
            if [[ $input_version == "" ]]
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

if [[ ${#folders_version[@]} != ${#@} ]]
then
    folders_version+=($folder)
    echo "Version not found"
    exit 1 
fi

echo "Validate version(s) ${folders_version[@]}"

for f in "${folders_version[@]}"
do
    echo get files in $f
done




