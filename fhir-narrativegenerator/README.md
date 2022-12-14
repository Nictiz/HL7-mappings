# FHIR Narrative generator

Add Narratives to FHIR resources.

## Features:

1. Processes all resources in Bundles and Lists too
2. Skips any contained resource (invariant dom-1) - https://www.hl7.org/fhir/STU3/domainresource-definitions.html#DomainResource.text
3. Leaves any pre-existing text alone unless they are of type generated or extensions AND parameter $override = 'true'
4. Known extensions and modifierExtensions are processed
5. No external calls are made to resolve anything. This means that references should have a display and codes a display. Fallback is implemented
6. For a number of FHIR code systems on required bindings, translations have been added, otherwise fallback to the code
    
## Usage

The narrative generator is implemented in XSL. There are different ways to run the narrative generator:

* For direct inclusion in other templates, the file `util/NarrativeGenerator.xsl` can be used.
* To transform an existing FHIR resource file, the file `addNarratives.xsl` can be used.
* To transform a complete directory (including subdirectories) with FHIR resource file, the ANT build file `build.xml` can be used. A single input dir can be set using the `input.dir` parameter, or a `dirset` with the required directories can be defined by a file that includes the build file. Note: the files are re-formatted after adding the Narrative.

