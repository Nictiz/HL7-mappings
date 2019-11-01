#!/bin/bash

# Try to run all the ada_2_fhir transformations to test if they still work. The
# script will exit with a non-zero error code if an error occurs.
#
# This script is mainly used for CI testing with Travis, and so assumes an
# Ubuntu environment with Saxon-HE installed using apt. An alternative path
# to the Saxon-HE jar can be specified as argument to this script.

# Read path to Saxon jar or use default location
if [ $# -ne 1 ]; then
  saxon_path="/usr/share/java/Saxon-HE.jar"
else
  saxon_path=$1
fi

# Remove the temporary output dir and exit with the given status code
function exitScript {
  rm -r $output_dir
  exit $1
}

scriptdir=$(realpath --relative-to $(pwd) $(dirname $0))

# Create a temporary output dir
output_dir=$scriptdir/output
mkdir -p $output_dir

# Iterate over all ADA instances somewhere in the ada_2_fhir folder hierarchy
ada_instances=$(find $scriptdir/.. -path '*ada_2_fhir/*/ada_instance/*.xml')
for instance_path in $ada_instances; do
  instance_file=$(basename $instance_path)
  project_folder=$(realpath --relative-to $(pwd) $(dirname $instance_path)/..)
  
  # Apply all the transformation XSLT's in the corresponding project folder,
  # except for the *_2_fhir_resources.xsl files as the test would take too
  # much time
  for transformation_path in $(find $project_folder/payload/ -name *2_fhir.xsl); do
    echo "Transforming $instance_file with $(basename $transformation_path) in $project_folder"
    java -jar $saxon_path -quit:on -warnings:recover -s:$instance_path -xsl:$transformation_path -o:$output_dir/tmp.xml > /dev/null
	
	# Exit on the first error we encounter
	exit_status=$?
	if [ $exit_status -ne 0 ]; then
	  exitScript $exit_status
	fi
  done
done

exitScript 0
