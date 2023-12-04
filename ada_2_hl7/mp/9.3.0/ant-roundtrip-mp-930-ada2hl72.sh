
#!/bin/bash
echo "MP9 3.0 ada2hl7 roundtrip ada2hl7 ..." 

ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2hl7-mp-930.xml roundtrip_ada_2_hl7_930 >ant-roundtrip.log

echo "Done"

read -p "Press any key to resume ..."


