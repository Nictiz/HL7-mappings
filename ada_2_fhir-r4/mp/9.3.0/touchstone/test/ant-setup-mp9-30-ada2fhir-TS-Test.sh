#!/bin/bash

echo mp9 30 ada2fhir-r4 Touchstone Test setup ...
ant -f _ant-buildfiles/ant-publish/build-ada2fhir-mp9-30-TS-Test.xml setup_30 >ant-setup.log

echo Done
