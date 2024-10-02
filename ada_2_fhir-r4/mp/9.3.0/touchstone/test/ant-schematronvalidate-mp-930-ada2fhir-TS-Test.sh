#!bin/bash

echo ant mp9 30 ada2fhir-r4 Touchstone Test schematronvalidate...
ant -f _ant-buildfiles/ant-publish/build-ada2fhir-mp9-30-TS-Test.xml schematronvalidate_fhir_30 > ant-schematronvalidate.log

echo Done

