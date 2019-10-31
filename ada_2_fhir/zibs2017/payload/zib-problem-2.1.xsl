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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <!--<xsl:import href="2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>
    
    <xd:doc>
        <xd:desc>Produce a FHIR entry element with an zib-Problem (Condition) resource.</xd:desc>
        <xd:param name="fullUrl">Optional. Value for the entry.fullUrl.</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Condition.id.</xd:param>
        <xd:param name="searchModes">Optional. Xml element containing search modes for the different kind of resources.</xd:param>
    </xd:doc>
    <xsl:template name="problemEntry"
        match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]"
        mode="doProblemEntry-2.1"
        as="element(f:entry)">
        <xsl:param name="fullUrl"/>
        <xsl:param name="fhirResourceId"/>
        <xsl:param name="searchModes" tunnel="yes"/>
        
        <entry>
            <fullUrl value="{$fullUrl}"/>
            <resource>
                <xsl:call-template name="zib-Problem-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                </xsl:call-template>
            </resource>
            <xsl:variable name="searchMode" select="$searchModes[resource-type/text() = 'Condition']/mode/text()" as="xs:string"/>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of nl.zorg.Problem concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Problem">zib-Problem</xd:a>.</xd:desc>
        <xd:param name="in">Node to consider in the creation of a Condition resource</xd:param>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="adaPatient">Optional. ADA patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="zib-Problem-2.1" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element()" mode="doZibProblem-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" as="element()*" tunnel="yes"/>
        
        <xsl:variable name="patientRef" as="element()*">
            <xsl:for-each select="$adaPatient">
                <xsl:call-template name="patientReference"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <xsl:variable name="currentAdaTransaction" select="./ancestor::*[ancestor::data]"/>
            
            <Condition>
                <xsl:if test="string-length($logicalId) gt 0">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Problem"/>
                </meta>
                
                <!-- Clinical Status-->
                <!-- probleem status -->
                <clinicalStatus>
                    <xsl:choose>
                        <xsl:when test="(problem_status | probleem_status)/@code = '73425007'">
                            <xsl:attribute name="value">inactive</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="(problem_status | probleem_status)/@code = '55561003'">
                            <xsl:attribute name="value">active</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <extension url="{$urlExtHL7DataAbsentReason}">
                                <valueCode value="unknown"/>
                            </extension>
                        </xsl:otherwise>
                    </xsl:choose>
                </clinicalStatus>
                <!-- Verification Status-->
                <xsl:for-each select="(verification_status | verificatie_status)/@code">
                    <verificationStatus>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test=". = '415684004'">provisional"</xsl:when>
                                <xsl:when test=". = '410590009'">differential</xsl:when>
                                <xsl:when test=". = '410605003'">confirmed</xsl:when>
                                <xsl:when test=". = '410516002'">refuted</xsl:when>
                                <xsl:when test=". = 'UNK'">unknown</xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
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
                                        <xsl:with-param name="dateTime" select="(problem_start_date | probleem_begin_datum)/@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:if>
                        
                        <!-- EndDateTime -->
                        <xsl:if test="(problem_end_date | probleem_eind_datum)[@value]">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="(problem_end_date | probleem_eind_datum)/@value"/>
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
                                    select="(problem_start_date | probleem_start_datum)/@value"/>
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
                                    select="(problem_end_date | probleem_eind_datum)/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </abatementDateTime>
                </xsl:if>-->
                
                <!-- Comment (.note) -->
                <xsl:if test="(comment | toelichting)[@value]">
                    <note>
                        <text value="{(comment | toelichting)/@value}"/>
                    </note>
                </xsl:if>
                
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build a logical ID for the zib-Problem resource.</xd:desc>
        <xd:param name="index">The index number of the resource in the scenario</xd:param>
    </xd:doc>
    <xsl:template name="problemLogicalId" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProblemLogicalId-2.1" as="xs:string">
        <xsl:param name="index"/>
        <xsl:value-of select="string-join(('problem', format-number($index, '00')), '-')"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build a reference display string for the zib-Problem resource.</xd:desc>
    </xd:doc>
    <xsl:template name="problemDisplay" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProblemDisplay-2.1" as="xs:string">
        <xsl:value-of select="(probleem_naam | problem_name)/@displayName"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build the metadata for all the zib-Problem resources.</xd:desc>
    </xd:doc>
    <xsl:template name="problemMetadata" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProblemMetadata" as="element(entry)*">
        <xsl:for-each-group select="//(probleem[not(probleem)] | problem[not(problem)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:variable name="uuid" select="uuid:get-uuid(.)"/>
            <xsl:variable name="fhirId">
                <xsl:variable name="generatedId">
                    <xsl:apply-templates mode="doProblemLogicalId-2.1" select=".">
                        <xsl:with-param name="index" select="position()"/>
                    </xsl:apply-templates>
                </xsl:variable>
                <xsl:value-of select="nff:select-id($generatedId, $uuid)"/>
            </xsl:variable>
            
            <entry xmlns="">
                <resource-type xmlns="">Condition</resource-type>
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <uuid>
                    <xsl:value-of select="$uuid"/>
                </uuid>
                <id>
                    <xsl:value-of select="$fhirId"/>
                </id>
                <display xmlns="">
                    <xsl:apply-templates mode="doProblemDisplay-2.1" select="."/>
                </display>
            </entry>
        </xsl:for-each-group>
    </xsl:template>

    <xd:doc>
        <xd:desc>Build the entries for all the zib-Problem resources.</xd:desc>
        <xd:param name="metadata">The metadata for all resources.</xd:param>
    </xd:doc>
    <xsl:template name="problemEntries" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProblemEntries" as="element(entry)*">
        <xsl:param name="metadata" tunnel="yes"/>
        
        <!-- probleem in problem -->
        <xsl:for-each-group select="//(probleem[not(probleem)] | problem[not(problem)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:variable name="currRefInfo" select="$metadata[resource-type/text() = 'Condition' and group-key/text() = current-grouping-key()]"/>
            
            <entry xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:apply-templates select="current-group()[1]" mode="doProblemEntry-2.1">
                    <xsl:with-param name="fullUrl" select="nff:uuid-to-full-url($currRefInfo/uuid)"/>
                    <xsl:with-param name="fhirResourceId" select="$currRefInfo/id"/>
                </xsl:apply-templates>
            </entry>
        </xsl:for-each-group>
    </xsl:template>
    
</xsl:stylesheet>
