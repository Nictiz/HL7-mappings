
#!/bin/bash
echo "ant mp9 3.0 hl72ada2hl7 roundtrip" 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-hl72ada-mp-930.xml roundtrip_hl7_2_ada_930 > ant-roundtrip.log

echo "Done"

read -p "Press any key to resume ..."

