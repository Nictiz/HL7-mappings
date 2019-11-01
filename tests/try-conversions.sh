#!/bin/bash

scriptdir=$(realpath --relative-to $(pwd) $(dirname $0))
output_dir=$scriptdir/output
mkdir -p $output_dir
ada_instances=$(find $scriptdir/.. -path '*ada_2_fhir/*/ada_instance/*.xml') # Limit to ada_2_fhir
for instance_path in $ada_instances; do
  instance_file=$(basename $instance_path)
  project_folder=$(realpath --relative-to $(pwd) $(dirname $instance_path)/..)
  for transformation_path in $(find $project_folder/payload/ -name *.xsl); do
    echo "Transforming $instance_file with $(basename $transformation_path) in $project_folder"
    java -jar /usr/share/java/Saxon-HE.jar -quit:on -warnings:recover -s:$instance_path -xsl:$transformation_path -o:$output_dir/tmp.xml > /dev/null
  done
done
rm -r $output_dir
