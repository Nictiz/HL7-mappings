echo "ant lab 3.0.0 ada2hl7 mapping" 
echo "setup ..."
ant -Drun-ivy=false -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2hl7-lab-300.xml setup_lab300 convert_ada_2_hl7_300 schemavalidate_hl7_300 schematronvalidate_hl7_300 convert_ada_2_hl7_examples_300 2>&1 | tee `dirname $0`/ant-setup.log

#echo "build ada2hl7..."
#ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2hl7-lab-300.xml convert_ada_2_hl7_300 2>&1 | tee `dirname $0`/ant-setup.log

#echo "validate XSD ada2hl7 ..."
#ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2hl7-lab-300.xml schemavalidate_hl7_300 2>&1 | tee `dirname $0`/ant-setup.log

#echo "validate SCH ada2hl7 ..."
#ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2hl7-lab-300.xml schematronvalidate_hl7_300 2>&1 | tee `dirname $0`/ant-setup.log

#echo "build ada2hl7 examples..."
#ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2hl7-lab-300.xml convert_ada_2_hl7_examples_300 2>&1 | tee `dirname $0`/ant-setup.log

echo "Done"

