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

<xsl:stylesheet 
    exclude-result-prefixes="#all" 
    xmlns="http://hl7.org/fhir"
    xmlns:f="http://hl7.org/fhir" 
    xmlns:uuid="http://www.uuid.org" 
    xmlns:local="urn:fhir:stu3:functions" 
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:param name="fhirVersion" select="'R4'"/>
    
    <xsl:import href="../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    
    <!-- Here all overrules be placed -->
    
    <xsl:variable name="zib2020Oid" select="'2.16.840.1.113883.2.4.3.11.60.40.1'"/>
    
    <xsl:variable name="ada2resourceType">
        <nm:map ada="patient" resource="Patient" profile="nl-core-Patient"/>
        <nm:map ada="probleem" resource="Condition" profile="nl-core-Problem"/>
        <nm:map ada="verrichting" resource="Procedure" profile="nl-core-Procedure"/>
        <nm:map ada="zorgaanbieder" resource="Organization" profile="nl-core-HealthcareProvider-Organization"/>
        <nm:map ada="zorgaanbieder" resource="Location" profile="nl-core-HealthcareProvider"/>
        <nm:map ada="zorgverlener" resource="PractitionerRole" profile="nl-core-HealthProfessional-PractitionerRole"/>
        <nm:map ada="zorgverlener" resource="Practitioner" profile="nl-core-HealthProfessional-Practitioner"/>
    </xsl:variable>
    
    <xsl:template name="getFhirMetadata">
        <xsl:param name="in"/>
        
        <!-- if-statement to allow for local variables -->
        <xsl:if test="$in//patient[not(patient)][not(@datatype = 'reference')]">
            <xsl:variable name="identifier" select="(identificatienummer[@root = $oidBurgerservicenummer],identificatienummer[not(@root = $oidBurgerservicenummer)])[1]"/>
            <!-- How necessary is it to add [not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] behind every group? -->
            <xsl:for-each-group select="$in//patient[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="concat($identifier/@root, $identifier/normalize-space(@value))">
                <!-- Experiment: why don't we just use nf:getGroupingKeyDefault()? Less hardly-used functions, and nobody is going to see the result anyways. -->
                <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="getFhirMetadataForAdaEntry"/>
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:if>
        
        <xsl:if test="$in//zorgverlener[not(zorgverlener)][not(@datatype = 'reference')]">
            <xsl:variable name="identifier" select="nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer)"/>
            <xsl:for-each-group select="$in//zorgverlener[not(zorgverlener)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
                concat($identifier/@root,
                $identifier/normalize-space(@value))">
                <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="getFhirMetadataForAdaEntry"/>
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:if>
        
        <!-- General rule for all zib root concepts -->
        <xsl:for-each-group select="$in//*[starts-with(@conceptId, $zib2020Oid) and ends-with(@conceptId, '.1')][not(local-name() = ('patient', 'zorgverlener'))]" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:call-template name="getFhirMetadataForAdaEntry"/>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="getFhirMetadataForAdaEntry">
        <xsl:param name="in" select="current-group()[1]"/>
        <xsl:variable name="adaElement" as="xs:string" select="$in/local-name()"/>
        <xsl:variable name="adaId" select="$in/@id"/>
        <xsl:variable name="groupKey" select="current-grouping-key()"/>
    
        <xsl:for-each select="$ada2resourceType/nm:map[@ada = $adaElement]">
            <xsl:variable name="profile" select="@profile"/>
            <nm:resource profile="{$profile}">
                <nm:resource-type>
                    <xsl:value-of select="@resource"/>
                </nm:resource-type>
                <xsl:if test="$adaId">
                    <nm:ada-id>
                        <xsl:value-of select="$adaId"/>
                    </nm:ada-id>
                </xsl:if>
                <nm:group-key>
                    <xsl:value-of select="$groupKey"/>
                </nm:group-key>
                <!-- Unless overruled, fullUrl is always a uuid? -->
                <!-- fullUrl should be unique per profile -->
                <xsl:variable name="fullUrl">
                    <xsl:value-of select="nf:get-fhir-uuid($in)"/>
                </xsl:variable>
                <nm:full-url>
                    <xsl:value-of select="$fullUrl"/>
                </nm:full-url>
                <xsl:if test="$referById">
                    <nm:logical-id>
                        <xsl:choose>
                            <xsl:when test="
                                (:not($uuid) and :)
                                $adaElement = 'patient' and string-length(nf:get-resourceid-from-token($in)) gt 0">
                                <xsl:value-of select="nf:get-resourceid-from-token($in)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="$in" mode="_generateId">
                                    <xsl:with-param name="profile" select="$profile"/>
                                    <!--<xsl:with-param name="fullUrl" select="$fullUrl" tunnel="yes"/>-->
                                </xsl:apply-templates>
                            </xsl:otherwise>
                        </xsl:choose>
                    </nm:logical-id>
                </xsl:if>
                <nm:reference-display>
                    <xsl:apply-templates select="$in" mode="_generateDisplay">
                        <xsl:with-param name="profile" select="$profile"/>
                    </xsl:apply-templates>
                </nm:reference-display>
            </nm:resource>
        </xsl:for-each>
    </xsl:template>
        
        <!-- Generic (fallback) templates, each zib transformation should(?) have more relevant id and display generation mechanisms -->
        <xsl:template match="*" mode="_generateId">
            <xsl:param name="in" select="."/>
            
            <xsl:variable name="adaElement" as="xs:string" select="$in/local-name()"/>
            <xsl:if test="count($ada2resourceType/nm:map[@ada = $adaElement]) gt 1">
                <xsl:message>Generating a uuid for an ada-element ('<xsl:value-of select="$adaElement"/>') which can produce multiple profiles can produce unreliable results.</xsl:message>
            </xsl:if>
            
            <xsl:variable name="fullUrl">
                <xsl:value-of select="nf:get-fhir-uuid($in)"/>
            </xsl:variable>
            
            <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
        </xsl:template>
        <xsl:template match="*" mode="_generateDisplay">
            <xsl:choose>
                <xsl:when test=".//*[ends-with(local-name(.), '_naam')][@value or @displayName or @originalText]">
                    <xsl:value-of select="(.//*[ends-with(local-name(.), '_naam')]/(@displayName, @originalText, @value))[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="local-name()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
        
        <!-- Outputs reference if input is ADA, fhirMetadata or ADA reference element -->
        <xsl:template name="makeReference">
            <xsl:param name="in" select="." as="element()*"/> <!-- Could be an ADA instance or an ADA reference element -->
            <xsl:param name="profile" as="xs:string" required="yes"/>
            <xsl:param name="wrapIn" as="xs:string?"/>
            <xsl:param name="fhirMetadata" tunnel="yes" as="element()*"/>
            
            <xsl:if test="count($fhirMetadata) = 0">
                <xsl:message terminate="yes">Cannot create reference because $fhirMetadata is empty or unknown.</xsl:message>
            </xsl:if>
            
            <xsl:variable name="groupKey" select="nf:getGroupingKeyDefault($in)"/>
            <xsl:variable name="element" as="element()?">
                <xsl:choose>
                    <xsl:when test="$in[@datatype = 'reference' and @value]">
                        <xsl:copy-of select="$fhirMetadata[@profile = $profile and nm:ada-id = $in/@value]"/>
                    </xsl:when>
                    <xsl:otherwise> 
                        <xsl:copy-of select="$fhirMetadata[@profile = $profile and nm:group-key = $groupKey]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="identifier" select="identificatienummer[normalize-space(@value | @nullFlavor)]"/>
            
            <!-- Debug -->
            <xsl:if test="not($ada2resourceType/nm:map[@profile = $profile])">
                <xsl:message terminate="yes">Cannot map adaElement to FHIR resource type ($ada2resourceType)</xsl:message>
            </xsl:if>
            
            <xsl:variable name="populatedReference" as="element()*">
                <xsl:choose>
                    <xsl:when test="$referById and $element/nm:logical-id">
                        <reference value="{concat($ada2resourceType/nm:map[@profile = $profile]/@resource, '/', $element/nm:logical-id)}"/>
                    </xsl:when>
                    <xsl:when test="$referById and $element/nm:fullurl">
                        <reference value="{$element/nm:fullurl}"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="string-length($element/nm:resource-type) gt 0">
                    <type value="{$element/nm:resource-type}"/>
                </xsl:if>                
                <xsl:choose>
                    <xsl:when test="$identifier and not($referById)">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="($identifier[not(@root = $mask-ids-var)], $identifier)[1]"/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:when>
                    <!--<xsl:when test="local-name() = $adaElement and .[@value]">
                        Fallback?
                    </xsl:when>-->
                </xsl:choose>
                
                <xsl:if test="string-length($element/nm:reference-display) gt 0">
                    <display value="{$element/nm:reference-display}"/>
                </xsl:if>
            </xsl:variable>
            
            <xsl:if test="count($populatedReference) &gt; 0">
                <xsl:choose>
                    <xsl:when test="$wrapIn">
                        <xsl:element name="{$wrapIn}">
                            <xsl:copy-of select="$populatedReference"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="$populatedReference"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:template>

</xsl:stylesheet>
