#!bin/bash

echo ant mp9 30 ada2fhir-r4 Touchstone Cert build ...
ant -f _ant-buildfiles/ant-publish/build-ada2fhir-mp9-30-TS-Cert.xml convert_ada_2_fhir_30 >ant-build.log
echo Done
