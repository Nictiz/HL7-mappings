

#!/bin/bash
echo "MP9 3.0 ada2hl7 setup build validate ..." 

echo "MP9 3.0 ada2hl7 setup ..." 
ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2hl7-mp-930.xml setup_mp930 >ant-setup.log
echo "Done with setup"


echo "MP9 3.0 ada2hl7 build ..." 
ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2hl7-mp-930.xml  >ant-build.log
echo "Done with build"


echo "MP9 3.0 ada2hl7 schematronvalidate ..." 
ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2hl7-mp-930.xml schematronvalidate_hl7_930 >ant-schematronvalidate.log
echo "Done with schematronvalidate"

echo "MP9 3.0 ada2hl7 schemavalidate ..." 
ant -Drun-ivy=false -f ./_ant-buildfiles/ant-publish/build-ada2hl7-mp-930.xml schemavalidate_hl7_930 >ant-validate.log
echo "Done with schemavalidate"

read -p "Press any key to resume ..."




