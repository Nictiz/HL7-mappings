There is a variety of batch files in this folder that will execute stuff for you. They all use an ant script located in _ant-buildfiles\ant-publish : build-ada2hl7-mp-930.xml

* ant-setup-mp-930-ada2hl7.bat
Refreshes ada schema's from a local ada project folder (configured in the imported ant build file build-ada2hl7-mp-include.xml with property ada.project.source.dir) and ada instances from a local "ada refs" folder (configured in the imported ant build file build-ada2hl7-mp-include.xml with property ada.refs). Does this for the use cases (transactions) as specified in the ant script.

* ant-build-mp-930-ada2hl7.bat
Generates hl7 instances based on ada_instances. Sometimes also cda_instances. All configured in the ant build script.

* ant-schematronvalidate-results-mp-930-ada2hl7.bat
**Does basis hl7 schematron validation (the generic schematrons based on the templates) by using SVRL XSLT conversion. The result is per use case folder a 'validate_hl7_instance' folder with an XML file per validated hl7 instance XML file. 
**Also does a summarise action per use case, and places the results in the mp/9.2.0/validate folder. This results in one XML per use case and will either indicate a 'pass' or a fail per instance in that use case. In case of fail the failed_asserts are also copied in that xml. Doing a search on the string 'fail' in the folder 'validate' is the manual action still needed (if you don't want to read the ant log files).

* ant-schemavalidate-mp-930-ada2hl7.bat
Does a schemavalidate. Wait for the task to finish, should any errors occur this is outputted on the command prompt. If everything passes, it ends with a pause without reporting any error.

* ant-setup-build-validate-mp-930-ada2hl7
Does everything as described above consecutively. Does the schemavalidate as the last step to get max attention for the output on command prompt.

* ant-schematron-only-results-mp-930-ada2hl7.bat
Created for convenience purposes. Only does the second step from ant-schematronvalidate-results-mp-930-ada2hl7.bat. Normally not needed, but since the first step takes quite some time, during develop/test phase it can be convenient to sometimes only run the summarise step.

