#!/bin/zsh

# 2022-11-22 HvdL
# profile MP 9.2.0 XSLT transformations

# Location of the script
ME_DIR="$( cd "$( dirname "${0}" )" && pwd )"

# assume we are in scripts
ROOT_DIR="$( dirname "$ME_DIR" )"

# Timestamp  
STAMP_FORMAT="%Y-%m-%d_%H-%M-%S"
STAMP=$(date +"$STAMP_FORMAT")

# all relevant Saxon versions
saxon_9_7_0_18="$HOME/.ant/lib/saxon9he-9.7.0.18.jar" # used by Itzos (PE version)
# saxon_9_7_0_21="$HOME/.ant/lib/saxon9he-9.7.0.21.jar" # max 9.7 version
saxon_9_8_0_15="$HOME/.ant/lib/saxon9he-9.8.0.15.jar" # used by Nictiz
saxon_9_9_1_8="$HOME/.ant/lib/saxon9he-9.9.1.8.jar"   # max 9.9 version
saxon_11_4="$HOME/.ant/lib/saxon-he-11.4.jar"         # most recent 11 version


INPUT_DIR="$ROOT_DIR/HL7-mappings"
output_dir="$ROOT_DIR/HL7-mappings/profiling"

# Current Saxon version
SAXON_PATH="${saxon_9_7_0_18}"
saxon_version=$( echo ${SAXON_PATH} | rev | cut -d'/' -f1 | cut -d'.' -f 2-  | cut -d'-' -f1 | rev )

# check paths
# echo $ME_DIR
# echo $ROOT_DIR
# echo $INPUT_DIR
# echo $output_dir
# echo $SAXON_PATH
#
# exit 0

# ---------------------
# read properties global.properties
# 

file="${INPUT_DIR}/_ant-buildfiles/ant-include/global.properties"

while IFS='=' read -r key value
do
    key=$(echo $key | tr '.' '_')
    if ! [[ "${key}" == "" ]] && ! [[ "${key}" =~ ^\#.* ]]; then
      eval ${key}=\${value}
    fi
done < "$file"

# ---------------------
# profile_xsl
#
# profile the xsl and save the transformed xml
# ---------------------
function profile_xsl {
    source="$1"
    xslt_2_ada="$2"
    xsl_2_out="$3"
    output_dir="$4"
    # profile="$3"
    # output_prefix="$4"

    output="${output_dir}/output/$( basename ${source} )"
    output_ada="${output_dir}/ada/$( basename ${source} )"
    output_warning="${output_dir}/result/warning_${saxon_version}_$( basename ${source} )"
    file_size=$( stat -f %z ${source} )

    # echo "source = ${source}"
    # echo "output_ada = ${output_ada}"
    # echo "output = ${output}"
    # echo "xslt_2_ada = ${xslt_2_ada}"
    # echo "xsl_2_out = ${xsl_2_out}"

    TMPFILE=$(mktemp)
    TMPFILE2=$(mktemp)

    # XSL parameters
    searchURL='http://dummy'
    logLevel='logWARN' # --> logERROR in productie, geeft dat nog nieuwe waardes?

    java -cp "$SAXON_PATH" net.sf.saxon.Transform \
        -s:"${source}" -xsl:"${xslt_2_ada}" -o:"${output_ada}" \
        -repeat:10 searchURL="${searchURL}" 2> $TMPFILE
    java -cp "$SAXON_PATH" net.sf.saxon.Transform \
        -s:"${output_ada}" -xsl:"${xslt_2_out}" -o:"${output}" \
        -repeat:10 searchURL="${searchURL}" 2> $TMPFILE2


    cat $TMPFILE1 

    grep -E 'WARNING|WARN|ERROR' $TMPFILE > /dev/null
    if [[ "$?" -eq 0 ]] ; then
        cp $TMPFILE ${output_warning}.in.txt
    fi
    grep -E 'WARNING|WARN|ERROR' $TMPFILE2 > /dev/null
    if [[ "$?" -eq 0 ]] ; then
        cp $TMPFILE2 ${output_warning}.out.txt
    fi

        # -TP:"${profile}" \
    
    # get the average results of the last 6 transformations
    in_result=$( grep 'Average execution time' "$TMPFILE" | cut -d':' -f2 | cut -d'm' -f1 | awk '$1=$1' | tr '.' ',')
    out_result=$( grep 'Average execution time' "$TMPFILE2" | cut -d':' -f2 | cut -d'm' -f1 | awk '$1=$1' | tr '.' ',')

    # echo "in_result = ${in_result}"
    # echo "out_result = ${out_result}"

    echo 'SIZE;'"${file_size}"';IN;'"${in_result}"';OUT;'"${out_result};"$( basename ${source} )
}

# ---------------------
# parse_profile_results
#
# extract data and convert to CSV
# ---------------------
function parse_profile_results {
    profile_in="$1"
    csv_out="$2"

    "${ME_DIR}/html-2-csv.sh" "${profile_in}" "${csv_out}"    
}

# ---------------------
# get_total_time
#
# extract the 'total time' line
# and add to separate CSV
# ---------------------

function get_total_time {
    local profile_file="$1"
    local result_out="$2"
    local prefix="$3"

    # get the file creation time of the profile file, 
    # to get as close as possible to the actual time the profiling is done.
    local created=$(stat -t '%Y-%m-%d %H:%M:%S' -f %SB "$profile_file")

    echo -n "${prefix};${created};" >> "${result_out}"
    grep 'Total time:' "${profile_file}" | sed -e 's/<[^>]*>//g' | cut -d':' -f2 | awk '$1=$1' | tr '.' ',' >> "${result_out}"
}

# ---------------------
# run_transformation
#
# create directories and run transformations
# ---------------------

function run_transformation {
    local usecase="$1"
    local in_format="$2"
    local in_version="$3"
    local out_format="$4"
    local out_version="$5"
    local original_in_dir="$6"
    local original_out_dir="$7"

    local in_out_version="${in_format}_${in_version}_2_${out_format}_${out_version}"

    echo prepare for "${usecase} ${in_out_version}"
    echo

    local base_dir="${output_dir}/${usecase}/${in_out_version}"
    original_in="${base_dir}/original"
    profile_result="${base_dir}/result"

    mkdir -p "${original_in}"
    mkdir -p "${base_dir}/ada"
    mkdir -p "${base_dir}/output"
    mkdir -p "${profile_result}"

    # copy originals for easier access
    cd "${original_in_dir}/${in_format}_instance"
    for f in $(ls -1 *.xml); do
        cp $f "${original_in}/"
    done

    cd "${original_in}"
    xslt_2_ada=$( ls -1 ${original_in_dir}/payload/*${usecase}*.xsl )
    xslt_2_out=$( ls -1 ${original_out_dir}/payload/*${usecase}*.xsl )

    echo "xslt_2_ada = ${xslt_2_ada}"
    echo "xslt_2_out = ${xslt_2_out}"

    echo -n '' > "${profile_result}/${saxon_version}_result.csv"

    echo transforming for "${usecase} ${in_out_version}"
    echo

    for f in $(ls -1 *.xml); do
        result=$( profile_xsl $f ${xslt_2_ada} ${xslt_2_out} ${base_dir} )

        echo "${saxon_version};${result};${usecase};${in_out_version}" >> "${profile_result}/${saxon_version}_result.csv"
    done
}

# ---------------------
# profiling 9.2.0 to 9.2.0 transformations
# ---------------------

function 920_profiling {
    # for usecase in ${usecase_mg} ${usecase_av} ${usecase_mv}; do
    for usecase in ${usecase_mg}; do

        # voorlopig even alleen 9.2.0
        version='9.2.0'
        fhir_input="${INPUT_DIR}/fhir_2_ada-r4"
        fhir_output="${INPUT_DIR}/ada_2_fhir-r4"
        hl7_input="${INPUT_DIR}/hl7_2_ada"
        hl7_output="${INPUT_DIR}/ada_2_hl7"

        usecase_dir="mp/${version}/${usecase}"

        fhir_in_dir="$fhir_input/${usecase_dir}"
        hl7_in_dir="$hl7_input/${usecase_dir}"
        fhir_out_dir="$fhir_output/${usecase_dir}"
        hl7_out_dir="$hl7_output/${usecase_dir}"

        # for s in ${saxon_9_7_0_18} ${saxon_9_8_0_15} ${saxon_9_9_1_8} ${saxon_11_4}; do
        for s in  ${saxon_11_4}; do

            # Current Saxon version
            saxon_version=$( echo ${s} | rev | cut -d'/' -f1 | cut -d'.' -f 2- | cut -d'-' -f1 | rev )
            echo working with ${saxon_version}

            run_transformation "${usecase}" 'fhir' "${version}" 'hl7' "${version}" "${fhir_in_dir}" "${hl7_out_dir}"
            run_transformation "${usecase}" 'hl7' "${version}" 'fhir' "${version}" "${hl7_in_dir}" "${fhir_out_dir}"
        done
    done
}

# ---------------------
# start main script
# ---------------------

# voorlopig even 1 usecase
# usecase="${usecase_mg}"

# for usecase in ${usecase_mg} ${usecase_av} ${usecase_mv}; do
for usecase in ${usecase_mg}; do

    # versie 6.12 -> MP9 v3
    in_version='6.12'
    out_version='9.2.0'
    hl7_input="${INPUT_DIR}/hl7_2_ada"
    hl7_output="${INPUT_DIR}/ada_2_hl7"

    usecase_dir="mp/${out_version}/${usecase}"

    hl7v3_612_in_dir="$hl7_input/mp/9.2.0/6.12_2_${usecase}"
    hl7_out_dir="$hl7_output/${usecase_dir}"

    # for s in ${saxon_9_7_0_18} ${saxon_9_8_0_15} ${saxon_9_9_1_8} ${saxon_11_4}; do
    for s in ${saxon_9_7_0_18}; do

        # Current Saxon version
        saxon_version=$( echo ${s} | rev | cut -d'/' -f1 | cut -d'.' -f 2- | cut -d'-' -f1 | rev )
        echo working with ${saxon_version}

        # run_transformation "${usecase}" 'fhir' "${version}" 'hl7' "${version}" "${fhir_in_dir}" "${hl7_out_dir}"
        run_transformation "${usecase}" 'hl7' "${in_version}" 'hl7' "${out_version}" "${hl7v3_612_in_dir}" "${hl7_out_dir}"
    done
done

# average=$( profile_xsl "${file_in}" "${xsl_in}" "${usecase_mg}_2_ada.html" "ada")
# prefix="${usecase_mg};${average}"
# # get_total_time "${usecase_mg}_2_ada.html" "${usecase_mg}_profiletotal.csv" "${prefix}"
# # parse_profile_results "${usecase_mg}_2_ada.html" "${usecase_mg}.csv"