# Mapping guidelines

The mapping from a zib or ADA instance to a FHIR resource is not always one-to-one. Sometimes a single zib results in multiple resources, sometimes a zib can be transformed in different ways, and sometimes even multiple zibs are represented using a single resource. This raises the question on how to organize the transformation stylesheets: based on what they transform (i.e. by zibs) or based on what they produce (i.e. by FHIR profile). Here the choice is made to organize _stylesheets_ by zibs, and have _templates_ in each stylesheet for every resource that is produced. This works, except for the last of the three situations -- in that case, the "guest" zibs are mapped into the stylesheet of the focal profile (see below).

## Files and folders
Files and folders are organized in the following way:

1. In the folder `payload/[version]`, a stylesheet file called `nl-core-[zib name].xsl` is created for each zib profile that is added to (or changed in) that version of the package.
2. The file `payload/nl-core-[version].xsl` contains an import to all the stylesheets relevant to that version of the package.
3. The file `payload/nl-core-latest.xsl` always references the latest version of the package.

## Metadata
Transforming ADA instances to FHIR is a two-pass process: first all metadata (like instance ids) is built for every (possible) translation of ADA to FHIR, and this metadata is then used during the actual transformations for constructing references and such. In order to construct this metadata, a mapping between ADA and the possible resulting resource types and profile names is defined in the `ada2resourceType` variable in `../fhir/2_fhir_fhir_include.xsl`.

## The profile template(s)
In each zib stylesheet, a "profile template" is created for each profile that represents the zib or a part of it. This template has a name _and_ mode equal to the profile id, and a match on the ADA element that is transformed. In most circumstances, it is the only (transformation) template in the stylesheet, but there are some special situations which are described below.

The template should perform a "pure" mapping from an ADA instance to a FHIR resource instance. The usage context should be left out of this level; for example, the mapping should not be aware of whether the result is to be used within a Bundle or as a single instance. There are various utility templates and functions (like `insertLogicalId` and `makeReference`) to abstract away all these kind of considerations.

Most of the ADA input content can be mapped one-on-one to the FHIR output. For just about every data type, a template is available to transform the ADA element to a FHIR element. See the files `../fhir/2_fhir_fhir_include.xsl` and `../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl`.

### Specific guidelines
#### Parameters
Each profile template SHOULD have an optional parameter called `$in` that contains the ADA object being transformed, defaulting to the current context.

Each profile template SHOULD have an optional parameter called `$subject` containing the ADA object of the patient to which the zib instance applies. Of course, this doesn't apply when the instance is not about a patient.

Additional parameters may be used as desired, as long as they are documented properly.

#### Profile name variable
For each FHIR profile add a variable of the form `profileName[English zib name]` to the respective template. This variable should be used whenever this profile needs to be referenced, instead of stating the profile name directly. This ensures a smaller risk on typos in the profile name and makes it easier to change a profile name in all relevant templates.

Example:

    <xsl:variable name="profileNamePatient">nl-core-Patient</xsl:variable>

#### Logical id
In each template that is used to map an ADA instance to a FHIR resource instance, a logical id should be added to the resulting FHIR instance. This is done by invoking the template `insertLogicalId`. Note that the parameter `profile` may be used whenever there is no one-on-one relation between the ADA element and FHIR resource.

Example:

    <xsl:call-template name="insertLogicalId">
        <xsl:with-param name="profile" select="$profileNamePatient"/>
    </xsl:call-template>
                
#### `meta.profile` element
In each profile template, the `.meta.profile` element should be added to the resulting FHIR instance. This is done by:

* the `nf:get-full-profilename-from-adaelement(.)` function whenever there is an one-on-one relation between the ADA element and FHIR resource (see the variable `ada2resourceType` in `../fhir/2_fhir_fhir_include.xsl`);
* `concat($urlBaseNictizProfile, $profileName[English zib name])` in all other cases.

### Zibs resulting in multiple FHIR resources
Sometimes, the transformation of a single ADA instance can result in multiple FHIR resources. For example, zib HeartRate has a focal Observation profile that represents the zib itself, and two associated Observation profiles for the concepts HeartbeatRegularity and InterpretationHeartRate (which are referenced from the focal Observation).

As described above, a profile template is created for each resource that needs to be created, with name and mode set to the profile id and a match on the corresponding ADA element. The template for the focal profile normally acts as the entry point for the transformation. So in addition to producing the focal resource, it is also responsible for kicking off the transformations to the associated resources. The result of the transformation is thus a _set_ of resources.

### Zibs having multiple translations
A zib can also have different meanings depending on the context. For example, zib Procedure can represent a planned or a performed procedure, resulting in either a ServiceRequest or a Procedure resource.

In this case there again is a profile template for each resource that needs to be created (but all are matching on the same ADA instance). This means that the choice of the template to use is usually made by the caller of the template.

If a choice as to which transformation can be made based on the content of the ADA instance, a wrapper template can be defined to call the proper template. It usually will have a name and mode set to `nl-core-[zib name]` (which is available, as the different versions of the profiles will have some postfix attached to their name) and a match on the ADA element being transformed.

### Multiple zibs resulting in single FHIR resource
In some rare situations, multiple zibs end up in the same FHIR resource. For example zib Nationality, which will usually be mapped to an element in the Patient resource.

In this situation, there is no stylesheet or profile template for the "guest" zibs. Instead, the ADA instance for which the result should end up in the focal resource is defined as a parameter to the template of the focal resource. This means that it is up to the caller of the template to preprocess the ADA input in such a way that the template is invoked with the proper parameter.

## The `_generateDisplay` template(s)
For each profile template, there must be a template with mode set to `_generateDisplay` and a match on the ADA instance element. This template is used to generate a display for references to the resulting instance.

## Branching strategy and pull requests
For each addition or change, a new branch is made. Each branch may only be merged back by means of a reviewed pull request.

There are different situations:
* A new profile is added to the FHIR package. In this case, a branch is made from master with name "zib2024-[zib name]" and the stylesheet is added to the folder corresponding with the package release. When the profile is added to the package, the new work is merged with master.
* A profile is changed in the new version of the FHIR package. In this case, a new branch is made with the issue key as its name, the existing stylesheet is copied to the folder corresponding with the new package release (and the `nl-core-[package version].xsl` file is updated), and the changes are applied to the copy. When the profile is added to the package, the new work is merged to master.
* The change is due to an error or omission in the implementation of the existing profile. In this case, a new branch is made with the issue key as its name and the existing stylesheet is changed. Since this change may affect existing implementations, a review is required from downstream projects before it is merged to master.