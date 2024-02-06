


#!/bin/bash
echo "MP9 3.0 ada2hl7 build ..." 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2hl7-mp-930.xml  >ant-build.log

echo "Done"

read -p "Press any key to resume ..."


