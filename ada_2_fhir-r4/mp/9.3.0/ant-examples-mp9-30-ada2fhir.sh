#!/bin/bash
echo "ant mp9 3.0 ada2fhir-r4 examples" 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2fhir-mp9-30.xml convert_ada_2_fhir_examples -Ddate.T=2023-01-01 > ant-examples.log

echo "Done"

read -p "Press any key to resume ..."

