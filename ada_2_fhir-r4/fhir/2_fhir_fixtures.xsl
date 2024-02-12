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
<!-- Purpose: do handling for FHIR fixtures for examples and/or Touchstone fixtures
-->
<xsl:stylesheet xmlns="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:util="urn:hl7:utilities" xmlns:uuid="http://www.uuid.org" version="2.0" exclude-result-prefixes="#all">

    <xd:doc>
        <xd:desc>Whether to generate a user instruction description text from the structured information, typically only needed for test instances.</xd:desc>
    </xd:doc>
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>

    <xd:doc>
        <xd:desc>Usecasename for resource id. Optional, no default.</xd:desc>
    </xd:doc>
    <xsl:param name="usecase" as="xs:string?"/>

    <xd:doc>
        <xd:desc>Create the ext-RenderedDosageInstruction extension from ADA InstructionsForUse.</xd:desc>
        <xd:param name="in">The ADA instance to extract the rendered dosage instruction from. 
            Override for default function in mp-InstructionsForUse so that we can generate instruction text based on structured data.</xd:param>
    </xd:doc>
    <xsl:template name="ext-RenderedDosageInstruction" mode="ext-RenderedDosageInstruction" match="gebruiksinstructie" as="element(f:extension)?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">
            <xsl:for-each select="omschrijving[@value != '']">
                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-RenderedDosageInstruction">
                    <valueString>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="$generateInstructionText">
                                    <xsl:value-of select="nf:gebruiksintructie-string(..)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </valueString>
                </extension>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template for creating logicalId for Touchstone. Adheres to requirements in MM-1752. Profilename-usecase-uniquestring.</xd:desc>
        <xd:param name="in">The ada element for which to create a logical id. Optional. Used to find profileName. Defaults to context.</xd:param>
        <xd:param name="uniqueString">The unique string with which to create a logical id. Optional. If not given a uuid will be generated.</xd:param>
        <xd:param name="profile"/>
    </xd:doc>
    <xsl:template name="generateLogicalId" match="*" mode="generateLogicalId">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="uniqueString" as="xs:string?"/>
        <!-- NOTE: this does not work if you have two ada element names which may end up in different FHIR profiles, the function simply selects the first one found -->
        <xsl:param name="profile" as="xs:string?" select="nf:get-profilename-from-adaelement($in)"/>

        <xsl:variable name="logicalIdStartString" as="xs:string*">
            <xsl:choose>
                <xsl:when test="$profile = ($profilenameHealthcareProvider, $profilenameHealthcareProviderOrganization)">
                    <xsl:value-of select="replace(replace(replace($profile, 'HealthcareProvider', 'HPrv'), 'Organization', 'Org'), 'Location', 'Loc')"/>
                </xsl:when>
                <xsl:when test="$profile = ($profileNameHealthProfessionalPractitioner, $profileNameHealthProfessionalPractitionerRole)">
                    <xsl:value-of select="replace(replace(replace($profile, 'HealthProfessional', 'HPrf'), 'Practitioner', 'Prac'), 'Role', 'Rol')"/>
                </xsl:when>
                <xsl:when test="self::farmaceutisch_product">
                    <xsl:value-of select="replace($profile, 'PharmaceuticalProduct', 'PhPrd')"/>
                </xsl:when>
                <xsl:when test="self::medicatieafspraak | self::wisselend_doseerschema | self::verstrekkingsverzoek | self::toedieningsafspraak | self::medicatieverstrekking | self::medicatiegebruik | self::medicatietoediening">
                    <xsl:value-of select="replace(replace(replace(replace(replace(replace($profile, 'Agreement', 'Agr'), 'Medication', 'Med'), 'Administration', 'Adm'), 'Dispense', 'Dsp'), 'Request', 'Req'), 'VariableDosingRegimen', 'VarDosReg')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$profile"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$usecase"/>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="string-length($uniqueString) le $maxLengthFHIRLogicalId - 2 and string-length($uniqueString) gt 0">
                <xsl:value-of select="replace(nf:assure-logicalid-length(nf:assure-logicalid-chars(concat(string-join($logicalIdStartString, '-'), '-', $uniqueString))), '\.', '-')"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                <xsl:value-of select="nf:assure-logicalid-length(nf:assure-logicalid-chars(concat(string-join($logicalIdStartString, '-'), '-', uuid:get-uuid(.))))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>remove dots which are not accepted in filenames in Touchstone and also the special characters which are not allowed in FHIR</xd:desc>
        <xd:param name="in">The input string to be replaced</xd:param>
    </xd:doc>
    <xsl:function name="nf:removeSpecialCharsAndDotForTouchstone">
        <xsl:param name="in" as="xs:string?"/>
        
        <xsl:value-of select="replace(nf:removeSpecialCharacters($in), '\.', '-')"/>
        
    </xsl:function>


    <xd:doc>
        <xd:desc> Generates a timestamp of the amount of 100 nanosecond intervals from 15 October 1582, in UTC time.
        Override this function here to use a stable timestamp in order to create stable uuids</xd:desc>
        <xd:param name="node"/>
    </xd:doc>
    <xsl:function name="uuid:generate-timestamp">
        <xsl:param name="node"/>
        <!-- date calculation automatically goes correct when you add the timezone information, in this case that is UTC. -->
        <xsl:variable name="duration-from-1582" as="xs:dayTimeDuration">
            <!-- fixed date for stable uuid for test purposes -->
            <xsl:sequence select="xs:dateTime('2022-01-01T00:00:00.000Z') - xs:dateTime('1582-10-15T00:00:00.000Z')"/>
        </xsl:variable>
        <xsl:variable name="random-offset" as="xs:integer">
            <xsl:sequence select="uuid:next-nr($node) mod 1000000000000"/>
        </xsl:variable>
        <!-- do the math to get the 100 nano second intervals -->
        <xsl:sequence select="(days-from-duration($duration-from-1582) * 24 * 60 * 60 + hours-from-duration($duration-from-1582) * 60 * 60 + minutes-from-duration($duration-from-1582) * 60 + seconds-from-duration($duration-from-1582)) * 1000 * 10000 + $random-offset"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Override this function here to use a stable timestamp in order to create stable uuids</xd:desc>
    </xd:doc>
    <xsl:function name="uuid:generate-clock-id" as="xs:string">
        <xsl:sequence select="'0000'"/>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Override this function to avoid the use of generate-id which generates a new id every execution. Instead use string-to-codepoints of a combination of profile and groupingkey</xd:desc>
        <xd:param name="node"/>
    </xd:doc>
    <xsl:function name="uuid:next-nr" as="xs:integer">
        <xsl:param name="node"/>
        <xsl:sequence select="xs:integer(nf:product-sum(string-to-codepoints(concat($node/@profile,nf:getGroupingKeyDefault($node)))[position() lt 500]))"/>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Using a combination of addition and multiplication to generate a 'large' integer that is as unique as possible. For example: for a basic Medication resource, this leads to a 40+ character long integer. Others will usually be longer.</xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:product-sum" as="xs:integer">
        <xsl:param name="in"/>
        <xsl:sequence select="if (count($in) = 1) then $in[1] else (if (count($in) mod 3 = 0) then $in[1] * nf:product-sum($in[position()>1]) else $in[1] + nf:product-sum($in[position()>1]))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
        <xd:param name="outputDir">The outputDir for the resource, defaults to 'current dir'.</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doResourceInResultdoc">
        <xsl:param name="outputDir" select="'.'"/>
        <xsl:result-document href="{$outputDir}/{f:id/@value}.xml">
            <xsl:copy-of select="."/>
        </xsl:result-document>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance. Override the logicalId generation for our Touchstone resources with the goal to remove oids from filenames.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak | wisselend_doseerschema | verstrekkingsverzoek | toedieningsafspraak | medicatieverstrekking | medicatiegebruik | medicatietoediening" mode="_generateId">
        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <xsl:when test="identificatie[@root][@value]">
                    <xsl:for-each select="(identificatie[@root][@value])[1]">
                        <!-- we remove '.' in root oid and '_' in extension to enlarge the chance of staying in 64 chars -->
                        <xsl:value-of select="replace(@value, '_', '')"/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                    <xsl:value-of select="nf:get-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:call-template name="generateLogicalId">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>
