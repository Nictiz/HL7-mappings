echo "ant lab 3.0.0 ada2fhir mapping" 
echo "setup ..."
ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2fhir-lab-300.xml setup_lab300 setup 2>&1 | tee `dirname $0`/ant-setup.log

echo "build ada2fhir..."
ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2fhir-lab-300.xml convert_ada_2_fhir_300 2>&1 | tee `dirname $0`/ant-setup.log

echo "validate XSD ada2fhir ..."
ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2fhir-lab-300.xml schemavalidate_fhir_300 2>&1 | tee `dirname $0`/ant-setup.log

echo "validate SCH ada2fhir ..."
ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2fhir-lab-300.xml schematronvalidate_fhir_300 2>&1 | tee `dirname $0`/ant-setup.log

echo "build ada2fhir examples..."
ant -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2fhir-lab-300.xml convert_ada_2_fhir_examples_300 2>&1 | tee `dirname $0`/ant-setup.log

echo "Done"

