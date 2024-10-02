# Mapping guidelines

## Creating a zib stylesheet

1. In the folder `payload/[version]`, create a new file `nl-core-[zib name].xsl`. It is convenient to copy an already existing template (preferably one that maps to the same FHIR resource).
2. Fill in the template documentation string as appropriate.
3. Create at least the following three templates:
    1. A "main" template with a name _and_ mode of the resulting profile id.
    2. A helper template with mode `_generateDisplay` and a match on the ADA instance element, to generate a display for references to the resulting instance.
4. Open the file `all_zibs.xsl` in the `payload/[version]` directory and add import of the new template.
5. Open the file `../fhir/2_fhir_fhir_include.xsl` and in the variable `ada2resourceType`, add the appropriate line(s) for the new mapping.
6. Open the file `ada_project_drivers/_driverInclude.xsl` and in the template `_applyNlCoreTemplate`, add the appropriate line(s) for the new mapping (note: whereas the previous step is required for all transformations, this part is needed specifically for ada instances from the zib2020 ADA project, it is not relevant for inclusions from other projects).

## Mapping the ADA instance to FHIR (aka the "main" template)

In general, a single template is needed to transform an ADA instance to a FHIR instance -- although in some cases an ADA instance might result in multiple FHIR instances and in other cases multiple ADA instances may be needed to create a single FHIR instance. In the former case, multiple templates (aligned to the profile id's) will be present, while in the latter case there generally will be one "main" template that accepts the "helper ADA instances" as parameter.

The template should perform a "pure" mapping from an ADA instance to FHIR resource instance. The usage context should be left out of this level -- for example, the mapping should not be aware of whether the result is to be used within a Bundle or as a single instance. That being said, there are two global parameters, `populateId` and `referencingStrategy` that will control the generation of resource id's and the way referneces are created. However, the templates at this level shouldn't consider this information. Instead, the templates `insertLogicalId` and `makeReference` (specified in `../fhir/2_fhir_fhir_include.xsl`) should be called.

The main template should always define the parameter `in` to specify the context to work on (with a default on the current context). In addition, for each reference that is to be generated, a parameter should be defined that accepts and ADA instance or ADA `reference` element, and defaults the element where inline references in the ADA instance can be found.

Most of the input ADA content can be mapped one-on-one to the FHIR output. For just about every datatype, a template is available to transform the ADA element to a FHIR element. See the file `../fhir/2_fhir_fhir_include.xsl` and `../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl`.

### Specific guidelines

##### Profile name variable
For each FHIR profile add a variable of the form `profileName[English zib name]` to the respective template. This variable should be used whenever this profile needs to be referenced, instead of stating the profile name directly. This ensures a smaller risk on typos in the profile name and makes it easier to change a profile name in all relevant templates.

Example: `<xsl:variable name="profileNamePatient">nl-core-Patient</xsl:variable>`

##### Logical id
In each template that is used to map an ADA instance to a FHIR resource instance, a logical id should be added to the resulting FHIR instance. This is done by invoking the template `insertLogicalId`. Note that the parameter `profile` should always be specified for consistency and to be future-proof, even though it's only necessary whenever there is no one-on-one relation between the ada element and FHIR resource.

Example:

                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePatient"/>
                </xsl:call-template>

                
##### `meta.profile` element
In each template that is used to map an ADA instance to a FHIR resource instance, the `.meta.profile` element should be added to the resulting FHIR instance. This is done by:
* the `nf:get-full-profilename-from-adaelement(.)` function whenever there is an one-on-one relation between the ada element and FHIR resource (see the variable `ada2resourceType` in `2_fhir_fhir_include.xsl`);
* `concat($urlBaseNictizProfile, $profileName[English zib name])` in all other cases.

## Schematron
The Schematron file found in the `util` folder can be used to validate XSLT files to see if they meet the expected structure and contain the necessary templates and other elements to function in the zib2020 structure.

Mainly works on the XSLT files in the `payload` folder, but can be extended to work on "drivers" in the `ada_project_driver` folder.

Configure an XSLT Validation Scenario in Oxygen to apply the `.sch`-file to an XSLT.
