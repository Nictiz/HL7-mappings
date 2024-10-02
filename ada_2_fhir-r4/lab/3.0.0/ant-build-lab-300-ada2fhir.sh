echo "ant lab 3.0.0 ada2fhir mapping" 
#echo "setup ..."
ant -Drun-ivy=false -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2fhir-lab-300.xml convert_ada_2_fhir_300 schemavalidate_fhir_300 schematronvalidate_fhir_300 2>&1 | tee `dirname $0`/ant-setup.log

echo "Done"

