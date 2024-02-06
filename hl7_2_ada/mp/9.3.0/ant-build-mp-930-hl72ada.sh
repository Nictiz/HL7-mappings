#!/bin/bash
echo "ant mp9 3.0 hl72ada build" 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-hl72ada-mp-930.xml convert_hl7_2_ada_930 > ant-build.log

echo "Done"

read -p "Press any key to resume ..."

