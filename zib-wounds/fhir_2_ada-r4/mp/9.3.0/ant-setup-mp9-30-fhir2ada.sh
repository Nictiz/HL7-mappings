#!/bin/bash
echo "ant mp9 3.0 fhir2ada-4 setup" 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-fhir2ada-mp9-30.xml setup > ant-setup.log

echo "Done"

read -p "Press any key to resume ..."

