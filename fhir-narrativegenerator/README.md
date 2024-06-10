# FHIR Narrative generator

Add Narratives to FHIR resources.

## FHIR versions

Both FHIR STU3 and FHIR R4 are supported. The narrative generator needs to be explicitly told which FHIR version to target.

## Features:

1. Processes all resources in Bundles and Lists too
2. Skips any contained resource (invariant dom-1) - https://www.hl7.org/fhir/STU3/domainresource-definitions.html#DomainResource.text
3. Leaves any pre-existing text alone unless they are of type generated or extensions AND parameter $override = 'true'
4. Known extensions and modifierExtensions are processed
5. No external calls are made to resolve anything. This means that references should have a display and codes a display. Fallback is implemented
6. For a number of FHIR code systems on required bindings, translations have been added, otherwise fallback to the code

## Usage

The narrative generator is implemented in XSL. There are different ways to run the narrative generator:

* For direct inclusion in other templates, the file `util/NarrativeGenerator.xsl` (FHIR STU3) or `util/NarrativeGenerator-R4.xsl` (FHIR R4) can be used.
* To transform an existing FHIR resource file, the file `addNarratives.xsl` (FHIR STU3) or `addNarratives-R4.xsl` (FHIR R4) can be used.
* To transform a complete directory (including subdirectories) with FHIR resource file, the ANT build file `build.xml` can be used.
  * A single input dir can be set using the `in.dir` parameter.
  * Or a `dirset` with id of `in.dirs` with the required directories can be defined by a file that includes the build file.
  * If files in these dirsets need to be left alone, the parameter/property `files.to.exclude` can be provided with all the file name patters to exclude (comma separated).
  * The FHIR version can be selected using the `fhir.version` parameter (either 'STU3' or 'R4'). If this parameter is absent, FHIR STU3 is used.
  Note: the files are re-formatted after adding the Narrative.
