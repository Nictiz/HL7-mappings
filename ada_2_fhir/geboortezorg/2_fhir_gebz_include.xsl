<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="../zibs2017/payload/zib-LaboratoryTestResult-Observation-2.1.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_nl-core-patient.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_nl-core-relatedperson.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_nl-core-organization.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_nl-core-practitioner.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_zib-pregnancy.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-maternalrecord.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-observation.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_zib-laboratory-testresult-observation.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-procedure.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-composition.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_mappings.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- dateT may be given for relative dates, only applicable for test instances -->
    <xsl:param name="dateT" as="xs:date?"/>

    <!-- ada instances -->
    <xsl:param name="patient-ada" as="element()*">
        <xsl:apply-templates select="//(prio1_huidig | prio1_vorig | prio1_vorige_zwangerschap | bevallingsgegevens_23)/vrouw" mode="vrouw-ada"/>
    </xsl:param>

    <xsl:param name="partner-ada" as="element()*">
        <xsl:apply-templates select="//(prio1_huidig | prio1_vorig | prio1_vorige_zwangerschap | bevallingsgegevens_23)/vrouw/partner" mode="partner-ada"/>
    </xsl:param>

    <xsl:variable name="kind-ada" as="element()*">
        <xsl:apply-templates select="//(prio1_huidig | prio1_vorig | prio1_vorige_zwangerschap | bevallingsgegevens_23)/uitkomst_per_kind" mode="kind-ada"/>
    </xsl:variable>

    <xsl:param name="zorginstelling-ada" as="element()*">
        <xsl:apply-templates select="//(prio1_huidig | prio1_vorig | prio1_vorige_zwangerschap | bevallingsgegevens_23)/zorgverlenerzorginstelling" mode="zorginstelling-ada"/>
    </xsl:param>

    <xsl:param name="zorgverlener-ada" as="element()*">
        <xsl:apply-templates select="//(prio1_huidig | prio1_vorig | prio1_vorige_zwangerschap | bevallingsgegevens_23)/zorgverlenerzorginstelling" mode="zorgverlener-ada"/>
    </xsl:param>

    <!-- unique patients -->
    <xsl:variable name="patients" as="element()*">
        <!-- Patiënten -->
        <xsl:for-each-group select="$patient-ada" group-by="
                string-join(for $att in nf:ada-pat-id(identificatienummer | patient_identificatie_nummer | patient_identification_number)/(@root, @value)
                return
                    $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-patient xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="current-group()[1]/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPatientEntry-2.1">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-patient>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>

    <!-- partner -->
    <xsl:variable name="relatedPersons" as="element(f:RelatedPerson)*">
        <xsl:for-each select="//partner">
            <xsl:call-template name="nl-core-relatedperson-2.0">
                <xsl:with-param name="in" select="$partner-ada"/>
                <xsl:with-param name="logicalId" select="replace(persoonsnaam/achternamen/@value, ' ', '-')"/>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- pregnancyNo -->
    <xsl:variable name="pregnancyNo">
        <xsl:for-each select="//(prio1_huidig | prio1_vorig | prio1_vorige_zwangerschap | bevallingsgegevens_23)/zwangerschap">
            <xsl:choose>
                <xsl:when test="graviditeit">
                    <xsl:value-of select="graviditeit/@value"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="1"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:variable>

    <!-- zorginstelling -->
    <xsl:variable name="organizations" as="element(f:Organization)*">
        <xsl:for-each select="//zorgverlenerzorginstelling">
            <xsl:call-template name="nl-core-organization-2.0">
                <xsl:with-param name="in" select="$zorginstelling-ada"/>
                <xsl:with-param name="logicalId" select="nf:removeSpecialCharacters(replace(zorginstelling/naam_zorginstelling/@value, ' ', '-'))"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- zorgverlener -->
    <xsl:variable name="practitioners" as="element(f:Practitioner)*">
        <xsl:for-each select="//zorgverlenerzorginstelling">
            <xsl:call-template name="nl-core-practitioner-2.0">
                <xsl:with-param name="in" select="$zorgverlener-ada"/>
                <xsl:with-param name="logicalId" select="replace(zorgverlener/naam_zorgverlener/@value, ' ', '-')"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- zorgverlener rollen -->
    <xsl:variable name="practitionerRoles" as="element(f:PractitionerRole)*">
        <xsl:for-each select="//zorgverlenerzorginstelling">
            <xsl:call-template name="nl-core-practitionerrole-2.0">
                <xsl:with-param name="in" select="$zorgverlener-ada"/>
                <xsl:with-param name="logicalId" select="replace(concat(zorgverlener/naam_zorgverlener/@value, '-', replace(zorginstelling/naam_zorginstelling/@value, ' ', '-')), ' ', '-')"/>
                <xsl:with-param name="organizationRef" as="element(f:reference)">
                    <reference xmlns="http://hl7.org/fhir" value="Organization/{replace(zorginstelling/naam_zorginstelling/@value, ' ', '-')}"/>
                </xsl:with-param>
                <xsl:with-param name="practitionerRef" as="element(f:reference)*">
                    <reference xmlns="http://hl7.org/fhir" value="Practitioner/{replace(zorgverlener/naam_zorgverlener/@value, ' ', '-')}"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- zwangerschapsdossier -->
    <xsl:variable name="episodesofcare" as="element(f:EpisodeOfCare)*">
        <xsl:for-each select="//zwangerschap">
            <xsl:call-template name="bc-maternal-record">
                <xsl:with-param name="logicalId" select="concat('dossier-', $vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="pregnancyId" select="concat($vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="organizationId" select="$organizations/f:id/@value"/>
                <xsl:with-param name="practitionerId" select="$practitioners/f:id/@value"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- zwangerschap -->
    <xsl:variable name="conditions" as="element(f:Condition)*">
        <xsl:for-each select="//zwangerschap">
            <xsl:call-template name="zib-pregnancy">
                <xsl:with-param name="logicalId" select="concat($vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="dossierId" select="concat('dossier-', $vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="pregnancyId" select="concat($vrouwId, '-zwangerschap-', $pregnancyNo)"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- observations -->
    <xsl:variable name="observations" as="element(f:Observation)*">
        <!-- maternale onderzoekgegevens -->
        <xsl:for-each select="//(bloedgroep_vrouw | rhesus_d_factor_vrouw | rhesus_c_factor | hb)">
            <xsl:variable name="labtest-ada" as="element()*">
                <xsl:call-template name="convertToADAlabtest"/>
            </xsl:variable>
            <xsl:variable name="elementName" select="name(.)"/>
            <xsl:for-each select="$labtest-ada">
                <xsl:call-template name="zib-LaboratoryTestResult-Observation-2.1">
                    <xsl:with-param name="in" select="." as="element()*"/>
                    <xsl:with-param name="logicalId" select="concat(replace($elementName, '_', '-'), '-zwangerschap-', $pregnancyNo)"/>
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:for-each>
        <!-- zwangerschaps- en bevallingsgegevens -->
        <xsl:for-each select="//(graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | definitieve_a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | tijdstip_begin_actieve_ontsluiting | hoeveelheid_bloedverlies | conditie_perineum_postpartum)">
            <xsl:call-template name="bc-observation">
                <xsl:with-param name="logicalId" select="concat(replace(name(.), '_', '-'), '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="dossierId" select="concat('dossier-', $vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="pregnancyId" select="concat($vrouwId, '-zwangerschap-', $pregnancyNo)"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- kindspecifieke uitkomstgegevens -->
        <xsl:variable name="childNo" select="string(count(preceding-sibling::*[name() = name(current())]) + 1)"/>
        <xsl:for-each select="//(baring/(kindspecifieke_maternale_gegevens | kindspecifieke_uitkomstgegevens)/(tijdstip_actief_meepersen | type_partus | lichamelijk_onderzoek_kind/(apgarscore_na_5_min | geboortegewicht)))">
            <xsl:call-template name="bc-observation">
                <xsl:with-param name="logicalId" select="concat(replace(name(.), '_', '-'), '-zwangerschap-', $pregnancyNo, '-kind-', $childNo)"/>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="dossierId" select="concat('dossier-', $vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="pregnancyId" select="concat($vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="childId" select="concat('zwangerschap-', $pregnancyNo, '-kind-', $childNo)"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- bevalling, geboorte en obstetrische verrichtingen -->
    <xsl:variable name="procedures" as="element(f:Procedure)*">
        <!-- bevalling -->
        <xsl:for-each select="//bevalling">
            <xsl:call-template name="bc-procedure">
                <xsl:with-param name="logicalId" select="concat(replace(name(.), '_', '-'), '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="dossierId" select="concat('dossier-', $vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                <xsl:with-param name="pregnancyId" select="concat($vrouwId, '-zwangerschap-', $pregnancyNo)"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- geboorte en obstetrische verrichtingen -->
        <xsl:for-each select="//uitkomst_per_kind">
            <xsl:variable name="childNo" select="string(count(preceding-sibling::*[name() = name(current())]) + 1)"/>
            <xsl:for-each select="baring | baring/kindspecifieke_uitkomstgegevens/vaginale_kunstverlossing_groep/vaginale_kunstverlossing">
                <xsl:call-template name="bc-procedure">
                    <xsl:with-param name="logicalId" select="concat(replace(name(.), '_', '-'), '-zwangerschap-', $pregnancyNo, '-kind-', $childNo)"/>
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    <xsl:with-param name="dossierId" select="concat('dossier-', $vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                    <xsl:with-param name="pregnancyId" select="concat($vrouwId, '-zwangerschap-', $pregnancyNo)"/>
                    <xsl:with-param name="childId" select="concat('zwangerschap-', $pregnancyNo, '-kind-', $childNo)"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:variable>

    <!-- Kind -->
    <xsl:variable name="children" as="element(f:Patient)*">
        <xsl:for-each select="//uitkomst_per_kind">
            <xsl:variable name="childNo" select="string(count(preceding-sibling::*[name() = name(current())]) + 1)"/>
            <xsl:call-template name="nl-core-patient-2.1">
                <xsl:with-param name="in" select="$kind-ada"/>
                <xsl:with-param name="logicalId" select="concat('zwangerschap-', $pregnancyNo, '-kind-', $childNo)"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- Composition -->
    <xsl:variable name="composition" as="element(f:Composition)*">
        <xsl:for-each select=".">
            <xsl:call-template name="bc-composition">
                <xsl:with-param name="logicalId">
                    <xsl:value-of select="concat('samenvatting-zwangerschap', $pregnancyNo)"/>
                </xsl:with-param>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="entries">
                    <xsl:copy-of select="$patients/f:entry | $children | $organizations | $practitioners | $practitionerRoles | $episodesofcare | $conditions | $procedures | $observations"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <!-- alle bouwstenen -->
    <xsl:variable name="bouwstenen" as="element()*">
        <xsl:for-each select="$composition">
            <xsl:apply-templates select="." mode="doCreateTransactionBundleEntry"/>
        </xsl:for-each>
        <xsl:for-each select="$patients">
            <entry xmlns="http://hl7.org/fhir">
                <xsl:copy-of select="f:entry/f:fullUrl"/>
                <xsl:copy-of select="f:entry/f:resource"/>
                <request>
                    <method value="PUT"/>
                    <url value="{concat('Patient/', f:entry/f:resource/f:Patient/f:id/@value)}"/>
                </request>
            </entry>
        </xsl:for-each>
        <xsl:for-each select="$relatedPersons | $children | $organizations | $practitioners | $practitionerRoles | $episodesofcare | $conditions | $procedures | $observations">
            <xsl:apply-templates select="." mode="doCreateTransactionBundleEntry"/>
        </xsl:for-each>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Creates transaction bundle entry for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template name="createTransactionBundleEntry" match="f:Resource/* | f:Patient | f:RelatedPerson | f:Organization | f:Practitioner | f:PractitionerRole | f:Condition | f:EpisodeOfCare | f:Observation | f:Procedure | f:Composition" mode="doCreateTransactionBundleEntry">
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{nf:get-fhir-uuid(.)}"/>
            <resource>
                <xsl:apply-templates select="." mode="ResultOutput"/>
            </resource>
            <request>
                <method value="PUT"/>
                <url value="{concat(name(.),'/',f:id/@value)}"/>
            </request>
        </entry>
    </xsl:template>

    <xsl:variable name="conditionalIDs">
        <xsl:copy-of select="($patients/f:entry/f:resource/f:Patient | $organizations | $practitioners)/f:id"/>
    </xsl:variable>

    <xsl:template name="conditionalTransform" match="node() | @*" mode="doConditionalTransform doConditionalTransformElements">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="doConditionalTransformElements">
                <xsl:with-param name="resourceID">
                    <xsl:copy-of select="$conditionalIDs"/>
                </xsl:with-param>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template name="setConditionalURL" match="f:Bundle/f:entry/f:request/f:url" mode="doConditionalTransformElements">
        <xsl:param name="resourceID"/>
        <xsl:variable name="resource" select="ancestor::f:entry/f:resource/*"/>
        <xsl:variable name="node" select="."/>
        <xsl:for-each select="$resourceID">
            <xsl:choose>
                <xsl:when test="$resource/f:id/@value = $resourceID/f:id/@value">
                    <url xmlns="http://hl7.org/fhir" value="{concat(substring-before($node/@value,'/'),'?identifier=',$resource/f:identifier/f:value/@value)}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$node"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="removeConditionalID" match="f:reference" mode="doConditionalTransformElements">
        <xsl:param name="resourceID"/>
        <xsl:variable name="bundle" select="ancestor::f:Bundle"/>
        <xsl:variable name="node" select="."/>
        <xsl:variable name="referenceID" select="substring-after($node/@value, '/')"/>
        <xsl:for-each select="$resourceID">
            <xsl:choose>
                <xsl:when test="$referenceID = $resourceID/f:id/@value">
                    <reference xmlns="http://hl7.org/fhir" value="{$bundle/f:entry[f:resource/*/f:id/@value=$referenceID]/f:fullUrl/@value}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$node"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="setConditionalReference" match="f:id" mode="doConditionalTransformElements">
        <xsl:param name="resourceID"/>
        <xsl:variable name="node" select="."/>
        <xsl:for-each select="$resourceID">
            <xsl:choose>
                <xsl:when test="$node/@value = $resourceID/f:id/@value"> </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$node"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
