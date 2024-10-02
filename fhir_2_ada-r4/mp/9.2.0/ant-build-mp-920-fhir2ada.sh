#!/bin/bash

echo ant mp 920 fhir2ada-r4 build...
ant -f ./_ant-buildfiles/ant-publish/build-fhir2ada-mp-920.xml > ant-build.log
echo Done

read -p "Press any key to resume ..."
