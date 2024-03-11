

#!/bin/bash
echo "ant mp9 3.0 ada2fhir-r4 schemavalidate" 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2fhir-mp9-30.xml schemavalidate_fhir_30 > ant-schemavalidate.log

echo "Done"

read -p "Press any key to resume ..."

