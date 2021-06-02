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
    <xsl:import href="../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:param name="fhirVersion" select="'R4'"/>

    <!-- Here all overrules be placed -->
    
    <xsl:variable name="zib2020Oid" select="'2.16.840.1.113883.2.4.3.11.60.40.1'"/>
    
    <xsl:variable name="ada2resourceType">
        <nm:map ada="patient" resource="Patient"/>
        <nm:map ada="probleem" resource="Condition"/>
        <nm:map ada="verrichting" resource="Procedure"/>
        <nm:map ada="zorgverlener" resource="PractitionerRole"/>
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
                    <xsl:call-template name="getFhirMetadataForAdaEntry">
                        <xsl:with-param name="type">patient</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:if>
        
        <xsl:if test="$in//zorgverlener[not(zorgverlener)][not(@datatype = 'reference')]">
            <xsl:variable name="identifier" select="nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer)"/>
            <xsl:for-each-group select="$in//zorgverlener[not(zorgverlener)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
                concat($identifier/@root,
                $identifier/normalize-space(@value))">
                <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="getFhirMetadataForAdaEntry">
                        <xsl:with-param name="type">zorgverlener</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:if>
        
        <!-- General rule for all zib root concepts -->
        <xsl:for-each-group select="$in//*[starts-with(@conceptId, $zib2020Oid) and ends-with(@conceptId, '.1.1')][not(local-name() = ('patient','zorgverlener'))]" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:call-template name="getFhirMetadataForAdaEntry">
                <xsl:with-param name="type">
                    <xsl:value-of select="local-name()"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="getFhirMetadataForAdaEntry">
        <xsl:param name="type" as="xs:string"/> <!-- zib name? resource type? -->
        <nm:resource type="{$type}">
            <xsl:if test="./@id">
                <nm:ada-id>
                    <xsl:value-of select="@id"/>
                </nm:ada-id>
            </xsl:if>
            <nm:group-key>
                <xsl:value-of select="current-grouping-key()"/>
            </nm:group-key>
            <!-- Unless overruled, fullUrl is always a uuid? -->
            <xsl:variable name="fullUrl">
                <xsl:value-of select="nf:get-fhir-uuid(current-group()[1])"/>
            </xsl:variable>
            <nm:full-url>
                <xsl:value-of select="$fullUrl"/>
            </nm:full-url>
            <xsl:if test="$referById">
                <nm:logical-id>
                    <xsl:choose>
                        <xsl:when test="
                            (:not($uuid) and :)
                            $type = 'patient' and string-length(nf:get-resourceid-from-token(.)) gt 0">
                            <xsl:value-of select="nf:get-resourceid-from-token(.)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="current-group()[1]" mode="generateId">
                                <xsl:with-param name="fullUrl" select="$fullUrl" tunnel="yes"/>
                            </xsl:apply-templates>
                        </xsl:otherwise>
                    </xsl:choose>
                </nm:logical-id>
            </xsl:if>
            <nm:reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="generateDisplay"/>
            </nm:reference-display>
        </nm:resource>
    </xsl:template>
    
    <!-- For example -->
    <xsl:template match="patient" mode="generateId">
        <xsl:param name="fullUrl" tunnel="yes"/>
        <xsl:choose>
            <!-- Tries to match patient to token -->
            <xsl:when test="string-length(nf:get-resourceid-from-token(.)) gt 0">
                <xsl:value-of select="nf:get-resourceid-from-token(.)"/>
            </xsl:when>
            <xsl:when test="naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value">
                <xsl:value-of select="upper-case(nf:removeSpecialCharacters(normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value, ' '))))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="patient" mode="generateDisplay">
        <xsl:value-of select="normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
    </xsl:template>
    
    <xsl:template match="zorgverlener" mode="generateId">
        <xsl:param name="fullUrl" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="(zorgverlener_identificatienummer)[@value | @root]">
                <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join((zorgverlener_identificatienummer)[1]/(@value | @root), ''))))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="zorgverlener" mode="generateDisplay">
        <xsl:variable name="personIdentifier" select="nf:ada-zvl-id(.//zorgverlener_identificatienummer[1] | .//zorgverlener_identificatie_nummer[1] | .//health_professional_identification_number[1])/@value"/>
        <xsl:variable name="personName" select=".//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | .//name_information[1]//*[not(name() = 'name_usage')]/@value"/>
        <xsl:variable name="organizationName" select=".//organisatie_naam[1]/@value | .//organization_name[1]/@value"/>
        <xsl:variable name="specialty" select=".//(specialisme | specialty)[not(@codeSystem = $oidHL7NullFlavor)][1]/@displayName"/>
        <xsl:variable name="role" select=".//zorgverleners_rol/(@displayName, @code)[1] | .//health_professional_role/(@displayName, @code)[1]"/>
        
        <xsl:choose>
            <xsl:when test="$personName">
                <xsl:value-of select="normalize-space(string-join($personName, ' '))"/>
            </xsl:when>
            <xsl:when test="$role">
                <xsl:value-of select="normalize-space($role)"/>
            </xsl:when>
            <xsl:when test="$personIdentifier">
                <xsl:value-of select="normalize-space($personIdentifier)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- Generic (fallback) templates, each zib transformation should(?) have more relevant id and display generation mechanisms -->
    <xsl:template match="*" mode="generateId">
        <xsl:param name="fullUrl" tunnel="yes"/>
        <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
    </xsl:template>
    <xsl:template match="*" mode="generateDisplay">
        <xsl:choose>
            <xsl:when test="*[ends-with(local-name(), '_naam')][@displayName or @originalText]">
                <xsl:value-of select="(*[ends-with(local-name(), '_naam')]/(@displayName, @originalText))[1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="local-name()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Override STU3 function to be able to not only input an ADA element, but also a fhirMetaData element -->
    <xsl:function name="nf:getGroupingKeyDefault" as="xs:string?">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <!-- is fhirMetaData-element -->
            <xsl:when test="$in/nm:group-key">
                <xsl:value-of select="$in/nm:group-key"/>
            </xsl:when>
            <!-- otherwise assume ADA-element -->
            <xsl:when test="$in">
                <xsl:value-of select="upper-case(string-join(($in//@value, $in//@root, $in//@unit, $in//@code[not(../@codeSystem = $oidHL7NullFlavor)], $in//@codeSystem[not(. = $oidHL7NullFlavor)])/normalize-space(), ''))"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    
    <!-- Outputs reference if input is ADA, fhirMetadata or ADA reference element -->
    <xsl:template name="makeReference">
        <xsl:param name="in" select="." as="element()*"/> <!-- Could be an ADA instance or an ADA reference element -->
        <xsl:param name="elementName" as="xs:string" required="yes"/>
        <xsl:param name="wrapIn" as="xs:string?"/>
        <xsl:param name="fhirMetadata" tunnel="yes" as="element()*"/>
        
        <xsl:variable name="groupKey" select="nf:getGroupingKeyDefault($in)"/>
        <xsl:variable name="element" as="element()?">
            <xsl:choose>
                <xsl:when test="$in[@datatype = 'reference' and @value]">
                    <xsl:copy-of select="$fhirMetadata[@type = $elementName and nm:ada-id = $in/@value]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$fhirMetadata[@type = $elementName and nm:group-key = $groupKey]"/> 
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="identifier" select="identificatienummer[normalize-space(@value | @nullFlavor)]"/>
        
        <!-- Debug -->
        <xsl:if test="not($ada2resourceType/nm:map[@ada = $elementName])">
            <xsl:message terminate="yes">Cannot map ada elementName to FHIR resource type ($ada2resourceType)</xsl:message>
        </xsl:if>
        
        <xsl:variable name="populatedReference" as="element()*">
            <xsl:choose>
                <xsl:when test="$element/nm:logical-id">
                    <reference value="{concat($ada2resourceType/nm:map[@ada = $elementName]/@resource, '/', $element/nm:logical-id)}"/>
                </xsl:when>
                <xsl:when test="$referById and $element/nm:fullurl">
                    <reference value="{$element/nm:fullurl}"/>
                </xsl:when>
                <xsl:when test="$identifier">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="($identifier[not(@root = $mask-ids-var)], $identifier)[1]"/>
                        </xsl:call-template>
                    </identifier>
                </xsl:when>
                <xsl:when test="local-name() = $elementName and .[@value]">
                    
                </xsl:when>
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
