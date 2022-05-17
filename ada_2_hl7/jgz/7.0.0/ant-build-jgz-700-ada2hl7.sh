#!/bin/zsh

echo ant ada2hl7 JGZ 7.0.0 build...
ant -f _ant-buildfiles/ant-publish/build-ada2hl7-jgz-700.xml
# >`dirname $0`/ant-build.log

echo Done
