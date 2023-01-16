#!/bin/bash
### Created this shell script to convert the spark dispatcher logs accessible as HTML to CSV so that we can use the data for different purposes.
# src: https://blog.knoldus.com/parsing-html-table-to-csv-through-shell-script/
#
# 2022-11-22 adjusted for xslt profile html:
# - don't remove the original file
# - adjust the number of lines to remove
# - rewrite the 'clean_text' function
#   - remove first line with capitals
#   - add 'sep=' line to tell Excel the separator
#   - fix the number of columns to match the profiling file
#   - rewrite the test when to insert a new line
#   - fix the decimal separator from dot to comma

# Timestamp  
STAMP_FORMAT="%Y-%m-%d_%H-%M-%S"
STAMP=$(date +"$STAMP_FORMAT")

html_clean()
{
    html_file="$1"

    sed -e 's/<[^>]*>//g' "$html_file" | awk '$1=$1' | sed '1,7d' | sed '$d' | sed '$d' > /tmp/${STAMP}_dump.txt
}

clean_text()
{
    COUNTER=1
    echo -n "" > /tmp/${STAMP}_textfile
    while read -r line
    do
        if [[ "${line}" =~ ^[0-9]+\.[0-9]*$ ]]; then
            echo "${line//./,}" >> /tmp/${STAMP}_textfile
        else
            echo "$line" >> /tmp/${STAMP}_textfile
        fi
        let COUNTER+=1
        if [ $COUNTER -eq 9 ]; then
            echo -n $'\n' >> /tmp/${STAMP}_textfile
            let COUNTER=1
        fi
    done < /tmp/${STAMP}_dump.txt
}

create_csv()
{
    output_file="$1"

    echo "sep=;" > "${output_file}"
    awk -v RS='' '{gsub("\n", "; "); print}' /tmp/${STAMP}_textfile >> "${output_file}"

    # cleaning up
    rm -f /tmp/${STAMP}_dump.txt /tmp/${STAMP}_textfile
}

# check_status()
# {
# prev_date=$(date --date="5 days ago" +'%Y/%m/%d')
# time=$(date +"%T")
# H=`date +"%T" | cut -f 1 -d ':'`
# M=`date +"%T" | cut -c 4`
# grep "$prev_date $H:$M[0-9]:[0-9][0-9]" rawfile.csv > csvfile.csv
# }

### Main script starts here

html_table="${1:-./table.html}"
output_csv="${2:-./output.csv}"

# echo "html_table = ${html_table}"
# echo "output_csv = ${output_csv}"

html_clean "${html_table}"
clean_text
create_csv "${output_csv}"
# check_status

# mv rawfile.csv "${output_csv}"