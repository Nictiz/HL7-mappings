

#!/bin/bash
echo "ant mp9 3.0 fhir2ada2fhir roundtrip" 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-fhir2ada-mp9-30.xml roundtrip_fhir_2_ada_2_fhir > ant-roundtrip.log

echo "Done"

read -p "Press any key to resume ..."

