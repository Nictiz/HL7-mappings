echo ant cio 200 ada2fhir setup ...
ant -Drun-ivy=false -f `dirname $0`/_ant-buildfiles/ant-publish/build-ada2fhir-cio-200.xml setup 2>&1 | tee `dirname $0`/ant-setup.log
