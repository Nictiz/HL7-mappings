echo ant imm 2.0 ada2fhir-r4 setup ...
ant -f "`dirname "$0"`/_ant-buildfiles/ant-publish/build-ada2fhir-imm-20.xml" setup &> `dirname $0`/ant-setup.log
echo Done