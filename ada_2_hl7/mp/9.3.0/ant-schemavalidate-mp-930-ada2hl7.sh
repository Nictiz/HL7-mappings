#!/bin/bash
echo "MP9 3.0 ada2hl7 schemavalidate ..." 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2hl7-mp-930.xml schemavalidate_hl7_930 >ant-validate.log

echo "Done"

read -p "Press any key to resume ..."


