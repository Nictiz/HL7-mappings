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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- uncomment imports only for development purposes -->
    <!--<xsl:import href="_zib2017.xsl"/>
    <xsl:import href="nl-core-patient-2.1.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="nl-core-relatedperson-2.0.xsl"/>
    <xsl:import href="zib-body-height-2.1.xsl"/>
    <xsl:import href="zib-body-weight-2.1.xsl"/>
    <xsl:import href="ext-code-specification-1.0.xsl"/>-->
    
    <!-- Please note: this problem has been created for MedMij 2019-publication. In 2020-publication there is a backwards incompatible change for zib problem profile.
         So you need to make a new XSLT for that profile version (major version 3). The change is described in MM-319. -->
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xsl:variable name="problems" as="element()*">
        <!-- probleem in problem -->
        <xsl:for-each-group select="//(probleem[not(probleem)] | problem[not(problem)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-problem xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="(probleem_naam | problem_name)/(@displayName | @originalText)"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doProblemEntry-2.1">
                    <xsl:with-param name="uuid" select="$uuid"/>
                    <xsl:with-param name="searchMode">include</xsl:with-param>
                </xsl:apply-templates>
            </unieke-problem>
        </xsl:for-each-group>
    </xsl:variable>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="problemReference" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProblemReference-2.1" as="element()+">
        <xsl:variable name="theIdentifier" select="identificatie_nummer[@value] | identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$problems[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <xsl:variable name="fullUrl" select="nf:getFullUrlOrId(($theGroupElement/f:entry)[1])"/>
                <reference value="{$fullUrl}"/>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>

        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produces a FHIR entry element with an Condition resource</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient for which this Condition is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Condition.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="problemEntry" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProblemEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl">
            <xsl:choose>
                <xsl:when test="$uuid or empty((zibroot/identificatienummer | hcimroot/identification_number)/@value)">
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:getUriFromAdaId(zibroot/identificatienummer | hcimroot/identification_number, 'Condition', false())"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <!--<xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>-->
        <xsl:param name="fhirResourceId">
            <xsl:choose>
                <xsl:when test="$referById">
                    <xsl:choose>
                        <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                            <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                        </xsl:when>
                        <!-- specific handling for MP prescribe reasons for more stable id -->
                        <xsl:when test="./ancestor::reden_van_voorschrijven[probleem/probleem_naam[@code][not(@codeSystem = $oidHL7NullFlavor)]]">
                            <xsl:variable name="patientRef" select="$patients[group-key = nf:getGroupingKeyPatient($adaPatient)]/f:entry/f:resource/f:Patient/f:id/@value" as="xs:string?"/>
                            <xsl:value-of select="concat('redenvoorschrijven', $patientRef, (upper-case(nf:removeSpecialCharacters(string-join(.//(@value | @code), '')))))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="matches($entryFullUrl, '^https?:')">
                    <xsl:value-of select="tokenize($entryFullUrl, '/')[last()]"/>
                </xsl:when>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>

        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-Problem-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                    <xsl:with-param name="dateT" select="$dateT"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of nl.zorg.Problem concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Problem">zib-Problem</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of a Condition resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-Problem-2.1" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element()" mode="doZibProblem-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>

        <xsl:variable name="patientRef" as="element()*">
            <xsl:for-each select="$adaPatient">
                <xsl:call-template name="patientReference"/>
            </xsl:for-each>
        </xsl:variable>

        <xsl:for-each select="$in">
            <xsl:variable name="currentAdaTransaction" select="./ancestor::*[ancestor::data]"/>
            <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-Problem</xsl:variable>
            <xsl:variable name="resource">
                <Condition>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <xsl:choose>
                            <xsl:when test="$referById">
                                <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <id value="{$logicalId}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>

                    <xsl:for-each select="zibroot/identificatienummer[@value] | hcimroot/identification_number[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <!-- Clinical Status, mapping https://simplifier.net/NictizSTU3-Zib2017/ProbleemStatusCodelijst-to-Condition-Clinical-Status-Codes-->
                    <!-- probleem status -->
                    <clinicalStatus>
                        <xsl:choose>
                            <xsl:when test="(problem_status | probleem_status)/@code = '73425007'">
                                <xsl:attribute name="value">inactive</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="(problem_status | probleem_status)/@code = '55561003'">
                                <xsl:attribute name="value">active</xsl:attribute>
                            </xsl:when>
                            <!--<xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>-->
                            <xsl:otherwise>
                                <xsl:attribute name="value">active</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- MM-1036 add code.specification extension -->
                        <xsl:call-template name="ext-code-specification-1.0">
                            <xsl:with-param name="in" select="problem_status | probleem_status"/>
                        </xsl:call-template>
                    </clinicalStatus>
                    
                    <!-- Verification Status-->
                    <xsl:for-each select="(verification_status | verificatie_status)/@code">
                        <verificationStatus>
                            <xsl:attribute name="value">
                                <xsl:choose>
                                    <xsl:when test=". = '415684004'">provisional</xsl:when>
                                    <xsl:when test=". = '410590009'">differential</xsl:when>
                                    <xsl:when test=". = '410605003'">confirmed</xsl:when>
                                    <xsl:when test=". = '410516002'">refuted</xsl:when>
                                    <xsl:when test=". = 'UNK'">unknown</xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                            <!-- MM-1036 add code.specification extension -->
                            <xsl:call-template name="ext-code-specification-1.0"/>                            
                        </verificationStatus>
                    </xsl:for-each>

                    <!-- Problem Type (.category) -->
                    <xsl:for-each select="(problem_type | probleem_type)[.//(@value | @code)]">
                        <category>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </category>
                    </xsl:for-each>

                    <!-- Problem Name (.code) -->
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="problem_name | probleem_naam"/>
                        </xsl:call-template>
                    </code>

                    <!-- BodySite SHALL be present when laterality or anatomical location is present in the adaxml -->
                    <xsl:variable name="problemAnatomic" select="(problem_anatomical_location | probleem_anatomische_locatie)[@value | @code]"/>
                    <xsl:variable name="problemLateral" select="(problem_laterality | probleem_lateraliteit)[@value | @code]"/>
                    <xsl:if test="$problemAnatomic | $problemLateral">
                        <bodySite>
                            <!-- extensie toevoegen als lateraliteit aanwezig is -->
                            <xsl:for-each select="$problemLateral">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/BodySite-Qualifier">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:for-each>
                            <!-- Codeableconcept toevoegen aan bodySite -->
                            <xsl:for-each select="$problemAnatomic">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </bodySite>
                    </xsl:if>

                    <!-- The problem has as subject the patient -->
                    <subject>
                        <xsl:copy-of select="$patientRef[self::f:extension]"/>
                        <xsl:copy-of select="$patientRef[self::f:reference]"/>
                        <xsl:copy-of select="$patientRef[self::f:identifier]"/>
                        <xsl:copy-of select="$patientRef[self::f:display]"/>
                    </subject>

                    <!-- OnsetPeriod -->
                    <xsl:if test="(problem_start_date | probleem_begin_datum | problem_end_date | probleem_eind_datum)[@value]">
                        <onsetPeriod>
                            <!-- StartDateTime -->
                            <xsl:if test="(problem_start_date | probleem_begin_datum)[@value]">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string((problem_start_date | probleem_begin_datum)/@value)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:if>

                            <!-- EndDateTime -->
                            <xsl:if test="(problem_end_date | probleem_eind_datum)[@value]">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string((problem_end_date | probleem_eind_datum)/@value)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:if>
                        </onsetPeriod>
                    </xsl:if>

                    <!-- FUTURE IMPLEMENTATION, AN ISSUE HAS BEEN ENTERED TO CHANGE MAPPING OF START AND END DATE, BUT THIS IS STILL TO BE APPROVED-->
                    <!-- <!-\- OnsetDatetime -\->
                    <xsl:if test="(problem_start_date | probleem_start_datum)[@value | @code]">
                        <onsetDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime"
                                        select="xs:string((problem_start_date | probleem_start_datum)/@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </onsetDateTime>
                    </xsl:if>
                    
                    <!-\- AbatementDateTime -\->
                    <xsl:if test="problem_end_date | probleem_eind_datum">
                        <abatementDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime"
                                        select="xs:string((problem_end_date | probleem_eind_datum)/@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </abatementDateTime>
                    </xsl:if>-->

                    <!-- TS    NL-CM:8.2.6        BeginDatumTijd            0..1    -->
                    <!-- assertedDate -->
                    <xsl:for-each select="(zibroot/datum_tijd | hcimroot/date_time)[@value]">
                        <assertedDate>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                    <xsl:with-param name="dateT" select="$dateT"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </assertedDate>
                    </xsl:for-each>

                    <!-- Condition.asserter is Person who asserts this condition. For a complaint, this is the informant. 
                        For a diagnosis this is normally the author. If we have an informant, let it prevail. If we have an author, use that as fallback -->
                    <!-- >     NL-CM:0.0.2        Informatiebron via nl.zorg.part.basiselementen -->
                    <xsl:variable name="zibrootInformant" select="(zibroot/informatiebron | hcimroot/information_source)/((patient_als_bron | patient_as_information_source)/patient | zorgverlener/zorgverlener | health_professional/health_professional | betrokkene_als_bron/contactpersoon | related_person_as_information_source/contact_person)"/>
                    <xsl:variable name="adaInformant" as="element()*">
                        <xsl:choose>
                            <xsl:when test="$zibrootInformant/*">
                                <xsl:sequence select="$zibrootInformant"/>
                            </xsl:when>
                            <xsl:when test="$zibrootInformant[not(@datatype) or @datatype = 'reference'][@value]">
                                <xsl:sequence select="ancestor::data//(zorgverlener | health_professional | patient | contactpersoon | contact_person)[@id = $zibrootInformant/@value]"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:variable name="informantRef" as="element()*">
                        <xsl:for-each select="$adaInformant[self::zorgverlener | self::health_professional]">
                            <xsl:call-template name="practitionerRoleReference">
                                <xsl:with-param name="useExtension" select="true()"/>
                                <xsl:with-param name="addDisplay" select="true()"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="$adaInformant[self::patient]">
                            <xsl:sequence select="$patientRef"/>
                        </xsl:for-each>
                        <xsl:for-each select="$adaInformant[self::contactpersoon | self::contact_person]">
                            <xsl:call-template name="relatedPersonReference"/>
                        </xsl:for-each>
                    </xsl:variable>

                    <!-- >     NL-CM:0.0.7        Auteur via nl.zorg.part.basiselementen -->
                    <!-- asserter -->
                    <xsl:variable name="zibrootAuteur" select="zibroot/auteur/((patient_als_auteur | patient_as_author)/patient | zorgverlener_als_auteur/zorgverlener | health_professional_as_author/health_professional | betrokkene_als_auteur/contactpersoon | related_person_as_author/contact_person)"/>
                    <xsl:variable name="adaAuteur" as="element()*">
                        <xsl:choose>
                            <xsl:when test="$zibrootAuteur/*">
                                <xsl:sequence select="$zibrootAuteur"/>
                            </xsl:when>
                            <xsl:when test="$zibrootAuteur[not(@datatype) or @datatype = 'reference'][@value]">
                                <xsl:sequence select="ancestor::data//(zorgverlener | health_professional | patient | contactpersoon | contact_person)[@id = $zibrootAuteur/@value]"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:variable name="authorRef" as="element()*">
                        <xsl:for-each select="$adaAuteur[self::zorgverlener | self::health_professional]">
                            <xsl:call-template name="practitionerRoleReference">
                                <xsl:with-param name="useExtension" select="true()"/>
                                <xsl:with-param name="addDisplay" select="true()"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="$adaAuteur[self::patient]">
                            <xsl:sequence select="$patientRef"/>
                        </xsl:for-each>
                        <xsl:for-each select="$adaAuteur[self::contactpersoon | self::contact_person]">
                            <xsl:call-template name="relatedPersonReference"/>
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:choose>
                        <xsl:when test="$informantRef">
                            <asserter>
                                <xsl:copy-of select="$informantRef[self::f:extension]"/>
                                <xsl:copy-of select="$informantRef[self::f:reference]"/>
                                <xsl:copy-of select="$informantRef[self::f:identifier]"/>
                                <xsl:copy-of select="$informantRef[self::f:display]"/>
                            </asserter>
                        </xsl:when>
                        <xsl:when test="$authorRef">
                            <asserter>
                                <xsl:copy-of select="$authorRef[self::f:extension]"/>
                                <xsl:copy-of select="$authorRef[self::f:reference]"/>
                                <xsl:copy-of select="$authorRef[self::f:identifier]"/>
                                <xsl:copy-of select="$authorRef[self::f:display]"/>
                            </asserter>
                        </xsl:when>
                    </xsl:choose>

                    <!-- Comment (.note) -->
                    <xsl:if test="(comment | toelichting)[@value]">
                        <note>
                            <text value="{(comment | toelichting)/@value}"/>
                        </note>
                    </xsl:if>

                </Condition>
            </xsl:variable>

            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
