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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:import href="../payload/nl-core-latest.xsl"/>

    <!-- Referencing strategy defaults to logicalId. See 2_fhir_fhir_include for the different options. -->
    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>

    <!-- If true, write all generated resources to disk in the fhir_instance directory. Otherwise, return all the output in a FHIR Bundle. -->
    <xsl:param name="writeOutputToDisk" select="true()" as="xs:boolean"/>
        
    <!-- Generate metadata for all ADA instances -->
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <!-- ADA instances for this project start with $zib2020Oid and end in .1, or in 9.*.* in the case of the medication related zibs -->
            <xsl:with-param name="in" select="collection('../ada_instance/')//*[starts-with(@conceptId, $zib2020Oid) and matches(@conceptId, '(\.1|9\.\d+\.\d+)$')]"/>
        </xsl:call-template>
    </xsl:param>

    <xsl:template match="//*[ends-with(local-name(), '_registratie')]/*">
        <xsl:variable name="subject" as="element()?">
            <xsl:call-template name="_resolveAdaPatient"/>
        </xsl:variable>

        <xsl:variable name="resources" as="element()*">
            <xsl:call-template name="_applyNlCoreTemplate">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
            <xsl:for-each select="referenties/*">
                <xsl:call-template name="_applyNlCoreTemplate">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
                
        <xsl:choose>
            <xsl:when test="$writeOutputToDisk">
                <xsl:for-each select="$resources">
                    <xsl:choose>
                        <!-- When a bundled version of a resource exists, ignore the current version (because we assume the bundled version contains more details) -->
                        <xsl:when test="not(ends-with(base-uri(), '-bundled.xml')) and doc-available(concat('../ada_instance/', ./f:id/@value, '-bundled.xml'))"/>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="../fhir_instance/{./f:id/@value}.xml">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- This happens when transforming a non-saved document in Oxygen -->
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Could not output to result-document without Resource.id. Outputting to console instead.</xsl:with-param>
                            </xsl:call-template>
                            <xsl:copy-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <Bundle>
                    <xsl:for-each select="$resources">
                        <entry>
                            <xsl:call-template name="_insertFullUrlById"/>
                            <resource>
                                <xsl:copy-of select="."/>
                            </resource>
                        </entry>
                    </xsl:for-each>
                </Bundle>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Extract the patient either from the special way how it is done within this project (by business identifier), or
            if that's unavailable from the Bundle (when that mechanism is used). If neither are available, nothing is
            returned.</xd:desc>
        <xd:param name="businessIdentifierRef">The element containing the business identifier reference may be absent.</xd:param>
    </xd:doc>
    <xsl:template name="_resolveAdaPatient" as="element()?">
        <xsl:param name="businessIdentifierRef" as="element()?" select="onderwerp/patient-id"/>
        
        <xsl:variable name="patient-id" select="$businessIdentifierRef/@value"/>
        <!-- Give preference to patient that is not in 'referenties' -->
        <xsl:variable name="referencedPatient" select="(collection('../ada_instance')//patient[identificatienummer/@value = $patient-id]/(self::*[not(ancestor::referenties)],self::*[ancestor::referenties]))[1]"/>
        <xsl:choose>
            <xsl:when test="$referencedPatient">
                <xsl:copy-of select="$referencedPatient"/>
            </xsl:when>
            <xsl:when test="$patient-id and not($referencedPatient)">
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logWARN"/>
                    <xsl:with-param name="msg">Could not find Patient instance with patient-id '<xsl:value-of select="$patient-id"/>'</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>The template to dynamically call the proper nl-core template on the ADA input.</xd:desc>
        <xd:param name="in">The ADA instance to output.</xd:param>
        <xd:param name="subject">The 'subject' to pass to the nl-core template.</xd:param>
    </xd:doc>
    <xsl:template name="_applyNlCoreTemplate">
        <xsl:param name="in" select="nf:ada-resolve-reference(.)"/>
        <xsl:param name="subject"/>

        <xsl:variable name="localName" select="$in/local-name()"/>
        <xsl:choose>
            <xsl:when test="$localName = 'adaextension'">
                <!-- Do nothing -->
            </xsl:when>
            
            <!-- If so required, an xsl:when condition can be added for templates that need to be called in some
                 deviating way, but it should normally not be required. -->

            <xsl:when test="$localName = 'patient'">
                <xsl:variable name="patient-id" select="$in/patient/identificatienummer/@value"/>
                <xsl:call-template name="nl-core-Patient">
                    <xsl:with-param name="nationality" select="collection('../ada_instance/')/nationaliteit_rc[onderwerp/patient-id/@value = $patient-id]"/>
                    <xsl:with-param name="maritalStatus" select="collection('../ada_instance/')/burgerlijke_staat_rc[onderwerp/patient-id/@value = $patient-id]"/>
                    <xsl:with-param name="languageProficiency" select="collection('../ada_instance/')/taalvaardigheid[onderwerp/patient-id/@value = $patient-id]"/>
                    <xsl:with-param name="contactPersons" select="collection('../ada_instance/')/contactpersoon[onderwerp/patient-id/@value = $patient-id]"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$in">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_insertFullUrlById">
        <xsl:param name="in" select="."/>   
        <xsl:param name="fhirId" select="$in/f:id/@value"/>
       
        <xsl:if test="count($fhirMetadata[nm:logical-id = $fhirId]) = 0 ">
            <xsl:call-template name="util:logMessage">
                <xsl:with-param name="level" select="$logFATAL"/>
                <xsl:with-param name="msg">_insertFullUrlById: Nothing found.</xsl:with-param>
                <xsl:with-param name="terminate" select="true()"/>
            </xsl:call-template>
        </xsl:if>
        
        <xsl:variable name="fullUrl">
            <xsl:value-of select="$fhirMetadata[nm:logical-id = $fhirId]/nm:full-url"/>
        </xsl:variable>
        
        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>