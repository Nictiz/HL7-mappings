#!/bin/bash
export wd=`dirname $0`
export wdsvrl=${wd}/../schematron_svrl
export wdxml=${wd}/../xml-JGZ
export wdutil=${wd}/../xsl/sch-utils
export wdxmlsvrloutput=${wd}/../xml-JGZ_svrl

export saxon=${wd}/../../../../YATC-tools/saxon/saxon.jar

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
d_version_svrls=()
d_version_usecases=()
# Get all the SVRL and use case directories
for f_version in "${folders_version[@]}"
do
    #echo get files in $f_version
    # check if the SVRLs are present
    echo Transforming files of JGZ $(basename -- "$f_version") ...
    d_svrls=()
    d_usecases=()
    for version_content in $wd/$f_version/*
    do
        DIRECTORY=$version_content
        d_content=$(basename -- "$DIRECTORY")
        if [[ $d_content == hl7*_closed_warnings_svrl ]] ;then
            d_svrls+=($version_content)
        fi
        if [[ -d $version_content/hl7_instance ]]; then
            #echo usecase: $d_content 
            d_usecases+=($version_content)
        fi
    done

    #echo SVRLs: ${d_svrls[@]}

    for d_usecase in $d_usecases
    do
        export FOLDER=$d_usecase
        export name_usecase=$(basename -- "$FOLDER")

        if [[ "$name_usecase" == "dossieroverdracht" ]]; then
            #echo "do dossieroverdracht"
            rm -r ${d_usecase}/hl7_instance_svrl/*
            mkdir -p ${d_usecase}/hl7_instance_svrl
            for hl7_instance in $d_usecase/hl7_instance/*
            do
                for d_svrl in ${d_svrls[@]}
                do
                    if [ -f $d_svrl/jgz-versturenDossieroverdrachtbericht-03.xsl ]; then
                        name_hl7_instance=$(basename -- "$hl7_instance")
                        #echo hl7_instance: $hl7_instance, svlr: $d_svrl/jgz-versturenDossieroverdrachtbericht-03.xsl
                        echo $name_hl7_instance
                        
                        java -jar ${saxon} -xsl:${d_svrl}/jgz-versturenDossieroverdrachtbericht-03.xsl -s:${hl7_instance} -o:${d_usecase}/hl7_instance_svrl/${name_hl7_instance}
                        #echo "`date` ($f) convert svrl to html"
                        java -jar ${saxon} -xsl:${wd}/svrl2html.xsl -s:${d_usecase}/hl7_instance_svrl/${name_hl7_instance} -o:${d_usecase}/hl7_instance_svrl/${name_hl7_instance%.*}.html
                        rm -f ${d_usecase}/hl7_instance_svrl/${name_hl7_instance}
                    fi
                done
            done
        fi
    done
done




