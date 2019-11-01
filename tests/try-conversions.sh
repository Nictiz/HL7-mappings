#!/bin/bash

ada_instances=$(find .. -path '../ada_2_fhir/*/ada_instance/*.xml') # Limit to ada_2_fhir
for instance_path in $ada_instances; do
  instance_file=$(basename $instance_path)
  project_folder=$(dirname $instance_path)/..
  transformation_paths=
  for transformation_path in $(find $project_folder/payload/ -name *.xsl); do
    echo "Transforming $instance_file with $transformation_path"
    java -jar /usr/share/java/Saxon-HE.jar -quit:on -warnings:recover -s:$instance_path -xsl:$transformation_path > /dev/null
  done
done
