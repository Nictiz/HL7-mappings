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
<!-- Templates of the form 'make<datatype/flavor>Value' correspond to ART-DECOR supported datatypes / HL7 V3 Datatypes R1 -->
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:include href="../../util/constants.xsl"/>
    <xsl:include href="../../util/uuid.xsl"/>
    
    <xd:doc>
        <xd:desc>Returns an ISO 8601 date or dateTime string based on HL7v3 ts input string, and calculated precision <xd:p>Calculation is done by calling nf:determine_date_precision($dateTime)</xd:p>
            <xd:p>Example nf:formatHL72XMLDate(hl7:effectiveTime/@value)</xd:p>
            <xd:p><xd:b>return</xd:b> date or dateTime. If no date or dateTime can be produced, a non-fatal error is issued and $input-hl7-date is returned as-is</xd:p>
        </xd:desc>
        <xd:param name="input-hl7-date">HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatHL72XMLDate" as="xs:string">
        <xsl:param name="input-hl7-date" as="xs:string"/>
        
        <xsl:value-of select="nf:formatHL72XMLDate($input-hl7-date, nf:determine_date_precision($input-hl7-date))"/>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Returns an ISO 8601 date or dateTime string based on HL7v3 ts input string, and requested precision. <xd:p>Example nf:formatHL72XMLDate(hl7:effectiveTime/@value, nf:determine_date_precision(hl7:effectiveTime/@value))</xd:p>
            <xd:p><xd:b>return</xd:b> date or dateTime. If no date or dateTime can be produced, a non-fatal error is issued and <xd:ref type="parameter" name="input-hl7-date"/> is returned as-is</xd:p>
        </xd:desc>
        <xd:param name="input-hl7-date">HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz</xd:param>
        <xd:param name="precision">Coded string indicator for requested precision. Use DAY for date and SECOND for dateTime. Note that if the input does not allow for dateTime, fallback to date is applied.</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatHL72XMLDate" as="xs:string">
        <xsl:param name="input-hl7-date" as="xs:string"/>
        <!-- precision determines the picture of the date format, currently only use case for day or second. -->
        <xsl:param name="precision"/>
        
        <xsl:variable name="yyyy">
            <xsl:if test="string-length($input-hl7-date) ge 4">
                <xsl:value-of select="substring($input-hl7-date, 1, 4)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="mm">
            <xsl:if test="string-length($input-hl7-date) ge 6">
                <xsl:value-of select="substring($input-hl7-date, 5, 2)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="dd" as="xs:string?">
            <xsl:if test="string-length($input-hl7-date) ge 8">
                <xsl:value-of select="substring($input-hl7-date, 7, 2)"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="HH" as="xs:string?">
            <xsl:if test="string-length($input-hl7-date) ge 10">
                <xsl:value-of select="substring($input-hl7-date, 9, 2)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="MM" as="xs:string?">
            <xsl:if test="string-length($input-hl7-date) ge 12">
                <xsl:value-of select="substring($input-hl7-date, 11, 2)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="SS" as="xs:string?">
            <xsl:if test="string-length($input-hl7-date) ge 14">
                <xsl:value-of select="substring($input-hl7-date, 13, 2)"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="sss" as="xs:string?">
            <xsl:if test="matches($input-hl7-date, '^\d+(\.\d+)')">
                <xsl:value-of  select="replace($input-hl7-date, '^\d+(\.\d+)', '$1')"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="TZ" as="xs:string?">
            <xsl:if test="matches($input-hl7-date, '^\d+(\.\d+)')">
                <xsl:value-of select="replace($input-hl7-date, '.*([+-]\d{2,4})$', '$1')"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="str_date" select="concat($yyyy, '-', $mm, '-', $dd)"/>
        <xsl:variable name="str_time" select="concat($HH, ':', $MM, ':', $SS, $sss, $TZ)"/>
        <xsl:variable name="str_datetime" select="concat($str_date, 'T', $str_time)"/>
        <xsl:choose>
            <xsl:when test="upper-case($precision) = ('SECOND', 'SECONDE', 'SECONDS', 'SECONDEN', 'SEC', 'S') and $str_datetime castable as xs:dateTime">
                <xsl:value-of select="$str_datetime"/>
            </xsl:when>
            <xsl:when test="upper-case($precision) = ('DAY', 'DAG', 'DAYS', 'DAGEN', 'D') and $str_date castable as xs:date">
                <xsl:value-of select="$str_date"/>
            </xsl:when>
            <xsl:when test="$str_date castable as xs:dateTime">
                <xsl:value-of select="$str_date"/>
            </xsl:when>
            <xsl:when test="$str_date castable as xs:date">
                <xsl:value-of select="$str_date"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$input-hl7-date"/>
                <xsl:message terminate="no">Could not determine xml date from input: '<xsl:value-of select="$input-hl7-date"/>' with precision: '<xsl:value-of select="$precision"/>'.</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns DAY if the input is &lt;= 8 characters, or SECOND otherwise</xd:desc>
        <xd:param name="input-hl7-date">HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz</xd:param>
    </xd:doc>
    <xsl:function name="nf:determine_date_precision">
        <xsl:param name="input-hl7-date"/>
        <xsl:choose>
            <xsl:when test="string-length($input-hl7-date) le 8">DAY</xsl:when>
            <!--<xsl:when test="string-length($input-hl7-date) gt 8">SECOND</xsl:when>-->
            <xsl:otherwise>SECOND</xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>appends an HL7 date with zeros so that an XML dateTime can be created or dates can be compared </xd:desc>
        <xd:param name="inputDate">HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz</xd:param>
    </xd:doc>
    <xsl:function name="nf:appendDate2DateTime" as="xs:string?">
        <xsl:param name="inputDate" as="xs:string?"/>
        
        <!-- split date/time from subseconds/timezone (if any) -->
        <xsl:variable name="yyyymmddHHMMSS" select="replace($inputDate, '^(\d+).*', '$1')"/>
        <xsl:variable name="ssZZzz" select="substring($inputDate, string-length(replace($inputDate, '^(\d+).*', '$1')) + 1)"/>
        
        <xsl:value-of select="concat(substring(concat($yyyymmddHHMMSS, '00000000000000'), 1, 14), $ssZZzz)"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns the fixed conceptId attribute value for a named XSD complexType</xd:desc>
        <xd:param name="schemaFragment">XSD Schema to retrieve the xs:complexType from</xd:param>
    </xd:doc>
    <xsl:function name="nf:getADAComplexTypeConceptId" as="attribute(conceptId)?">
        <xsl:param name="schemaFragment" as="element(xs:complexType)?"/>
        <xsl:variable name="conceptId" select="$schemaFragment/xs:attribute[@name = 'conceptId']/@fixed"/>
        
        <xsl:if test="$conceptId">
            <xsl:attribute name="conceptId" select="$conceptId"/>
        </xsl:if>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Returns the type value for a named XSD element</xd:desc>
        <xd:param name="schemaFragment">XSD Schema to retrieve the typed element from</xd:param>
        <xd:param name="elementName">Name of the element to retrieve the type for</xd:param>
    </xd:doc>
    <xsl:function name="nf:getADAComplexTypeName" as="xs:string?">
        <xsl:param name="schemaFragment" as="node()*"/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:value-of select="$schemaFragment//xs:element[@name = $elementName]/@type"/>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Returns a named XSD complexType</xd:desc>
        <xd:param name="schemaFragment">XSD Schema to retrieve the typed element from</xd:param>
        <xd:param name="complexTypeName">Name of the xs:complexType to retrieve the conceptId for</xd:param>
    </xd:doc>
    <xsl:function name="nf:getADAComplexType" as="element()?">
        <xsl:param name="schemaFragment" as="node()*"/>
        <xsl:param name="complexTypeName" as="xs:string?"/>
        <xsl:copy-of select="$schemaFragment//xs:complexType[@name = $complexTypeName]"/>
    </xsl:function>

    <xd:doc>
        <xd:desc> appends an HL7 date with zeros so that an XML date or dateTime can be created </xd:desc>
        <xd:param name="inputDate">HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz</xd:param>
    </xd:doc>
    <xsl:function name="nf:appendDate2DateOrTime" as="xs:string?">
        <xsl:param name="inputDate"/>
        
        <!-- split date/time from subseconds/timezone (if any) -->
        <xsl:variable name="yyyymmddHHMMSS" select="replace($inputDate, '^(\d+).*', '$1')"/>
        <xsl:variable name="ssZZzz" select="substring($inputDate, string-length(replace($inputDate, '^(\d+).*', '$1')) + 1)"/>
        
        <xsl:choose>
            <xsl:when test="string-length($yyyymmddHHMMSS) gt 8">
                <xsl:value-of select="concat(substring(concat($yyyymmddHHMMSS, '00000000000000'), 1, 14), $ssZZzz)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="substring(concat($yyyymmddHHMMSS, '00000000'), 1, 8)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc> Returns an array of ADA elements based on an array of HL7v3 AND elements that have an @xsi:type attribute to determine the type with. 
            <xd:p>After the type is determined, the element is handed off to handleXX for further processing. Failure to determine type is a fatal error.</xd:p>
            <xd:p>Supported values for @xsi:type (datatypes releases 1 in namespace "urn:hl7-org:v3"): BL (boolean), CS (code), CV (code), CE (code), CD (code), CO (code), II (identifier), PQ (quantity), ST (string), TS (date)</xd:p></xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="dodatatype">Boolean. If true creates relevant @datatype attribute on the output.</xd:param>
        <xd:param name="codeMap">Array of map elements to be used to map input HL7v3 codes to output ADA codes if those differ. For codeMap expect one or more elements like this:
            <xd:p><xd:pre>&lt;map inCode="xx" inCodeSystem="yy" value=".." code=".." codeSystem=".." codeSystemName=".." codeSystemVersion=".." displayName=".." originalText=".."/&gt;</xd:pre></xd:p>
            <xd:p>If input @code | @codeSystem matches, copy the other attributes from this element. Expected are usually @code, @codeSystem, @displayName, others optional. 
                In some cases the @value is required in ADA. The $codeMap may then to be used to supply that @value based on @inCode / @inCodeSystem. If the @code / @codeSystem 
                are omitted, the mapping assumes you meant to copy the @inCode / @inCodeSystem.</xd:p>
            <xd:p>For @inCode and @inCodeSystem, first the input @code/@codeSystem is checked, with fallback onto @nullFlavor.</xd:p></xd:param>
        <xd:param name="codeSystem">CS has no codeSystem so it has to be supplied from external. Usually <xd:ref type="variable" name="oidHL7ActStatus"/> or <xd:ref type="variable" name="oidHL7RoleStatus"/></xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor as code/coodeSystem/displayName</xd:param>
    </xd:doc>
    <xsl:template name="handleANY">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="dodatatype" select="false()" as="xs:boolean"/>
        <xsl:param name="codeMap" as="element()*"/>
        <xsl:param name="codeSystem" as="xs:string?"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
                <xsl:attribute name="nullFlavor" select="$nullIfMissing"/>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:variable name="xsiType" select="@xsi:type"/>
            <xsl:variable name="xsiTypePrefix" select="if (contains($xsiType,':')) then (substring-before($xsiType,':')) else ('')"/>
            <xsl:variable name="xsiTypeName" select="if (contains($xsiType,':')) then (substring-after($xsiType,':')) else ($xsiType)"/>
            <xsl:variable name="xsiTypeURI" select="namespace-uri-for-prefix($xsiTypePrefix, .)"/>
            <xsl:variable name="xsiTypeURIName" select="concat('{', $xsiTypeURI, '}:', $xsiTypeName)"/>
            
            <xsl:choose>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:BL'">
                    <xsl:call-template name="handleBL">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">boolean</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:CS'">
                    <xsl:call-template name="handleCS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="codeSystem" select="$codeSystem"/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">code</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:CV' or $xsiTypeURIName = '{urn:hl7-org:v3}:CE' or $xsiTypeURIName = '{urn:hl7-org:v3}:CD' or $xsiTypeURIName = '{urn:hl7-org:v3}:CO'">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">code</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:II'">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">identifier</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:PQ'">
                    <xsl:call-template name="handlePQ">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">quantity</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:ST'">
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">string</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:TS'">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">date</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">Cannot determine the datatype based on @xsi:type, or value not supported: <xsl:value-of select="$xsiType"/></xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Copy ENXP parts as faithful as possible to HCIM 2017 nl.zorg.part.NameInformation. Calculate name usage code. Submit unstructured name in last_name </xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="language">Optional. Default: nl-NL. Determines the name of the child elements to create for this datatype</xd:param>
        <xd:param name="unstructurednameElement">Name of the element to put stuff in if there are no name parts. The HCIM does not support this but the ADA format might.</xd:param>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema</xd:param>
        <xd:param name="schemaFragment">Optional. XSD Schema complexType for naamgegevens</xd:param>
    </xd:doc>
    <xsl:template name="handleENtoNameInformation">
        <xsl:param name="in" as="element()*" required="yes"/>
        <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
        <xsl:param name="schema"><xs:schema/></xsl:param>
        <xsl:param name="schemaFragment" as="element()?"/>
        <xsl:param name="unstructurednameElement" as="xs:string?"/>
        
        <!-- Element names based on language -->
        <xsl:variable name="elemNameInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">name_information</xsl:when>
                <xsl:otherwise>naamgegevens</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmUnstructuredName">
            <xsl:choose>
                <xsl:when test="string-length($unstructurednameElement) gt 0"><xsl:value-of select="$unstructurednameElement"/></xsl:when>
                <xsl:when test="$language = 'en-US'">unstructured_name</xsl:when>
                <xsl:otherwise>ongestructureerde_naam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmFirstNames">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">first_names</xsl:when>
                <xsl:otherwise>voornamen</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmGivenName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">given_name</xsl:when>
                <xsl:otherwise>roepnaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmInitials">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">initials</xsl:when>
                <xsl:otherwise>initialen</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elemNameUsage">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">name_usage</xsl:when>
                <xsl:otherwise>naamgebruik</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">last_name</xsl:when>
                <xsl:otherwise>geslachtsnaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePrefix">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">prefix</xsl:when>
                <xsl:otherwise>voorvoegsels</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNameLastName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">last_name</xsl:when>
                <xsl:otherwise>achternaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePartner">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">last_name_partner</xsl:when>
                <xsl:otherwise>geslachtsnaam_partner</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePartnerPrefix">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">partner_prefix</xsl:when>
                <xsl:otherwise>voorvoegsels_partner</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePartnerLastName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">partner_last_name</xsl:when>
                <xsl:otherwise>geslachtsnaam_partner</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- See for the HL7 spec of name: http://www.hl7.nl/wiki/index.php/DatatypesR1:PN -->
        <xsl:for-each select="$in">
            <xsl:element name="{$elemNameInformation}">
                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, $schemaFragment/@name))"/>
                <xsl:choose>
                    <!-- Just @nullFlavor -->
                    <xsl:when test="@nullFlavor">
                        <xsl:copy-of select="@nullFlavor"/>
                    </xsl:when>
                    <xsl:when test="string-length(normalize-space(string-join(.//text(), ''))) = 0">
                        <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                    </xsl:when>
                    <!-- Structured name -->
                    <xsl:when test="*">
                        <xsl:variable name="firstNames" select="normalize-space(string-join(hl7:given[tokenize(@qualifier, '\s') = 'BR' or not(@qualifier)], ' '))"/>
                        <xsl:variable name="givenName" select="normalize-space(string-join(hl7:given[tokenize(@qualifier, '\s') = 'CL'], ' '))"/>
                        <!-- in HL7 mogen de initialen van officiële voornamen niet herhaald / gedupliceerd worden in het initialen veld -->
                        <!-- in de zib moeten de initialen juist compleet zijn, dus de initialen hier toevoegen van de officiële voornamen -->
                        <xsl:variable name="initials">
                            <xsl:for-each select="./hl7:given[tokenize(@qualifier, '\s') = 'IN']">
                                <xsl:value-of select="./text()"/>
                            </xsl:for-each>
                            <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                                <xsl:for-each select="tokenize(normalize-space(.), '\s')">
                                    <xsl:value-of select="concat(substring(., 1, 1), '.')"/>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="nameUsage">
                            <xsl:choose>
                                <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'BR'] and empty(hl7:family[tokenize(@qualifier, '\s') = 'SP'])">
                                    <xsl:element name="{$elemNameUsage}">
                                        <xsl:attribute name="value">1</xsl:attribute>
                                        <xsl:attribute name="code">NL1</xsl:attribute>
                                        <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                        <xsl:attribute name="displayName">Eigen geslachtsnaam</xsl:attribute>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'SP'] and empty(hl7:family[not(tokenize(@qualifier, '\s') = 'SP')])">
                                    <xsl:element name="{$elemNameUsage}">
                                        <xsl:attribute name="value">2</xsl:attribute>
                                        <xsl:attribute name="code">NL2</xsl:attribute>
                                        <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                        <xsl:attribute name="displayName">Geslachtsnaam partner</xsl:attribute>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'SP']/following-sibling::hl7:family[not(@qualifier) or tokenize(@qualifier, '\s') = 'BR']">
                                    <xsl:element name="{$elemNameUsage}">
                                        <xsl:attribute name="value">3</xsl:attribute>
                                        <xsl:attribute name="code">NL3</xsl:attribute>
                                        <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                        <xsl:attribute name="displayName">Geslachtsnaam partner gevolgd door eigen geslachtsnaam</xsl:attribute>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'BR']/following-sibling::hl7:family[tokenize(@qualifier, '\s') = 'SP']">
                                    <xsl:element name="{$elemNameUsage}">
                                        <xsl:attribute name="value">4</xsl:attribute>
                                        <xsl:attribute name="code">NL4</xsl:attribute>
                                        <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                        <xsl:attribute name="displayName">Eigen geslachtsnaam gevolgd door geslachtsnaam partner</xsl:attribute>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="{$elemNameUsage}">
                                        <xsl:attribute name="value">5</xsl:attribute>
                                        <xsl:attribute name="code">UNK</xsl:attribute>
                                        <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                                        <xsl:attribute name="displayName">Unknown</xsl:attribute>
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="last_name" select="normalize-space(string-join(hl7:family[tokenize(@qualifier, '\s') = 'BR' or not(@qualifier)], ''))"/>
                        <xsl:variable name="last_name_prefix">
                            <xsl:if test="hl7:prefix">
                                <xsl:choose>
                                    <!-- prefix of type VV and BR, don't look any further -->
                                    <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'BR']">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'BR'], ''))"/>
                                    </xsl:when>
                                    <!-- prefix of type VV and no family with qualifier, assume BR for both -->
                                    <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][not(hl7:family/@qualifier)]">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][not(hl7:family/@qualifier)], ''))"/>
                                    </xsl:when>
                                    <!-- prefix of type VV and first following sibling family with qualifier BR, assume BR for both -->
                                    <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']]">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']], ''))"/>
                                    </xsl:when>
                                    <!-- prefix without qualifier and no family with qualifier, assume BR for both -->
                                    <xsl:when test="hl7:prefix[not(@qualifier)][not(hl7:family/@qualifier)]">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[not(@qualifier)][not(hl7:family/@qualifier)], ''))"/>
                                    </xsl:when>
                                    <!-- prefix without qualifier and first following sibling family with qualifier BR, assume BR for both -->
                                    <xsl:when test="hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']]">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']], ''))"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:variable>
                        <xsl:variable name="last_name_partner" select="normalize-space(string-join(hl7:family[tokenize(@qualifier, '\s') = 'SP'], ''))"/>
                        <xsl:variable name="last_name_partner_prefix">
                            <xsl:if test="hl7:prefix">
                                <xsl:choose>
                                    <!-- prefix of type VV and BR, don't look any further -->
                                    <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'SP']">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'SP'], ''))"/>
                                    </xsl:when>
                                    <!-- prefix of type VV and first following sibling family with qualifier SP, assume SP for both -->
                                    <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']]">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']], ''))"/>
                                    </xsl:when>
                                    <!-- prefix without qualifier and first following sibling family with qualifier SP, assume SP for both -->
                                    <xsl:when test="hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']]">
                                        <xsl:value-of select="normalize-space(string-join(hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']], ''))"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:variable>
                        
                        <xsl:if test="string-length($firstNames) gt 0">
                            <xsl:element name="{$elmFirstNames}">
                                <xsl:attribute name="value" select="$firstNames"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmFirstNames)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="string-length($givenName) gt 0">
                            <xsl:element name="{$elmGivenName}">
                                <xsl:attribute name="value" select="$givenName"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmGivenName)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="string-length($initials) gt 0">
                            <xsl:element name="{$elmInitials}">
                                <xsl:attribute name="value" select="$initials"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmInitials)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:copy-of select="$nameUsage"/>
                        <xsl:if test="string-length($last_name) gt 0">
                            <xsl:element name="{$elmLastName}">
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastName)))"/>
                                
                                <xsl:if test="string-length($last_name_prefix) gt 0">
                                    <xsl:element name="{$elmLastNamePrefix}">
                                        <xsl:attribute name="value" select="$last_name_prefix"/>
                                        
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastNamePrefix)))"/>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:element name="{$elmLastNameLastName}">
                                    <xsl:attribute name="value" select="$last_name"/>
                                    
                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastNameLastName)))"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="string-length($last_name_partner) gt 0">
                            <xsl:element name="{$elmLastNamePartner}">
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastNamePartner)))"/>
                                
                                <xsl:if test="string-length($last_name_partner_prefix) gt 0">
                                    <xsl:element name="{$elmLastNamePartnerPrefix}">
                                        <xsl:attribute name="value" select="$last_name_partner_prefix"/>
                                        
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastNamePartnerPrefix)))"/>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:element name="{$elmLastNamePartner}">
                                    <xsl:attribute name="value" select="$last_name_partner"/>
                                    
                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastNamePartner)))"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                    </xsl:when>
                    <!-- No name parts.... assume unstructured name element was added -->
                    <xsl:otherwise>
                        <xsl:element name="{$elmUnstructuredName}">
                            <xsl:attribute name="value" select="."/>
                            
                            <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $unstructurednameElement)))"/>
                        </xsl:element>
                        <xsl:element name="{$elmLastName}">
                            <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastName)))"/>
                            
                            <xsl:element name="{$elmLastNameLastName}">
                                <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmLastNameLastName)))"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Copy address parts as faithful as possible to HCIM 2017 nl.zorg.part.AddressInformation. Calculate address code. Submit unstructured address in street
            Note: copies @code and @codeSystem for city, county and country too...
        </xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="language">Optional. Default: nl-NL. Determines the name of the child elements to create for this datatype</xd:param>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema</xd:param>
        <xd:param name="schemaFragment">Optional. XSD Schema complexType for naamgegevens</xd:param>
    </xd:doc>
    <xsl:template name="handleADtoAddressInformation">
        <xsl:param name="in" as="element()*" required="yes"/>
        <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
        <xsl:param name="schema"><xs:schema/></xsl:param>
        <xsl:param name="schemaFragment" as="element()?"/>
        
        <!-- Element names based on language -->
        <xsl:variable name="elmAddressInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">address_information</xsl:when>
                <xsl:otherwise>adresgegevens</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmStreet">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">street</xsl:when>
                <xsl:otherwise>straat</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number</xsl:when>
                <xsl:otherwise>huisnummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumberLetter">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number_letter</xsl:when>
                <xsl:otherwise>huisnummerletter</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumberAddition">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number_addition</xsl:when>
                <xsl:otherwise>huisnummertoevoeging</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumberIndication">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number_indication</xsl:when>
                <xsl:otherwise>aanduiding_bij_nummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmPostcode">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">postcode</xsl:when>
                <xsl:otherwise>postcode</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmPlaceOfResidence">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">place_of_residence</xsl:when>
                <xsl:otherwise>woonplaats</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmMunicipality">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">municipality</xsl:when>
                <xsl:otherwise>gemeente</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmCountry">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">country</xsl:when>
                <xsl:otherwise>land</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAdditionalInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">additional_information</xsl:when>
                <xsl:otherwise>additionele_informatie</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAddressType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">address_type</xsl:when>
                <xsl:otherwise>adres_soort</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <xsl:variable name="theUse" select="tokenize(@use, '\s')"/>
            <xsl:variable name="addressType">
                <xsl:for-each select="distinct-values($theUse)">
                    <xsl:choose>
                        <xsl:when test=". = 'PST'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="value">1</xsl:attribute>
                                <xsl:attribute name="code">PST</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Postal Addres</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'HP'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="value">1</xsl:attribute>
                                <xsl:attribute name="code">HP</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Primary Home</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'PHYS'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="value">1</xsl:attribute>
                                <xsl:attribute name="code">PHYS</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Visit Address</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'TMP'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="value">1</xsl:attribute>
                                <xsl:attribute name="code">TMP</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Tempory Address</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test="$theUse = 'WP'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="value">1</xsl:attribute>
                                <xsl:attribute name="code">WP</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Work Place</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'HV'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="value">1</xsl:attribute>
                                <xsl:attribute name="code">HV</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Vacation Home</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:choose>
                <xsl:when test="*">
                    <xsl:for-each select="*[not(self::hl7:streetName | self::hl7:houseNumber | self::hl7:buildingNumberSuffix | self::hl7:unitID | self::hl7:additionalLocator | self::hl7:postalCode | self::hl7:city | self::hl7:county | self::hl7:country | self::hl7:desc)]">
                        <xsl:message>WARNING: Address contains unsupported address part: <xsl:value-of select="name()"/></xsl:message>
                    </xsl:for-each>
                    
                    <xsl:variable name="street" select="hl7:streetName[not(. = '')]"/>
                    <xsl:variable name="houseNumber" select="hl7:houseNumber[not(. = '')]"/>
                    <xsl:variable name="houseNumberLetter">
                        <xsl:choose>
                            <xsl:when test="hl7:buildingNumberSuffix[matches(., ' ')]">
                                <xsl:value-of select="hl7:buildingNumberSuffix/substring-before(., ' ')[not(. = '')]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="hl7:buildingNumberSuffix[not(. = '')]"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="houseNumberAddition">
                        <xsl:choose>
                            <xsl:when test="hl7:buildingNumberSuffix[matches(., ' ')]">
                                <xsl:value-of select="hl7:buildingNumberSuffix/substring-after(., ' ')[not(. = '')]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="hl7:unitID[not(. = '')]"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="houseNumberIndication" select="hl7:additionalLocator[not(. = '')]"/>
                    <xsl:variable name="postcode" select="hl7:postalCode[not(. = '')]"/>
                    <xsl:variable name="placeOfResidence" select="hl7:city[not(. = '')]"/>
                    <xsl:variable name="municipality" select="hl7:county[not(. = '')]"/>
                    <xsl:variable name="country" select="hl7:country[not(. = '')]"/>
                    <xsl:variable name="additionalInformation" select="hl7:desc[not(. = '')]"/>
                    <xsl:element name="{$elmAddressInformation}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, $schemaFragment/@name))"/>
                        
                        <xsl:if test="$street">
                            <xsl:element name="{$elmStreet}">
                                <xsl:attribute name="value" select="$street"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmStreet)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumber">
                            <xsl:element name="{$elmHouseNumber}">
                                <xsl:attribute name="value" select="$houseNumber"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmHouseNumber)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumberLetter[not(. = '')]">
                            <xsl:element name="{$elmHouseNumberLetter}">
                                <xsl:attribute name="value" select="$houseNumberLetter"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmHouseNumberLetter)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumberAddition[not(. = '')]">
                            <xsl:element name="{$elmHouseNumberAddition}">
                                <xsl:attribute name="value" select="$houseNumberAddition"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmHouseNumberAddition)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumberIndication">
                            <xsl:element name="{$elmHouseNumberIndication}">
                                <xsl:attribute name="value" select="$houseNumberIndication"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmHouseNumberIndication)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$postcode">
                            <xsl:element name="{$elmPostcode}">
                                <xsl:attribute name="value" select="$postcode"/>
                                
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmPostcode)))"/>
                            </xsl:element>
                        </xsl:if>
                        <!-- Codes? -->
                        <xsl:if test="$placeOfResidence">
                            <xsl:element name="{$elmPlaceOfResidence}">
                                <xsl:attribute name="value" select="$placeOfResidence"/>
                                <xsl:if test="@code">
                                    <xsl:copy-of select="@code"/>
                                    <xsl:copy-of select="@codeSystem"/>
                                    <xsl:attribute name="displayName" select="$placeOfResidence"/>
                                </xsl:if>
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmPlaceOfResidence)))"/>
                            </xsl:element>
                        </xsl:if>
                        <!-- Codes? -->
                        <xsl:if test="$municipality">
                            <xsl:element name="{$elmMunicipality}">
                                <xsl:attribute name="value" select="$municipality"/>
                                <xsl:if test="@code">
                                    <xsl:copy-of select="@code"/>
                                    <xsl:copy-of select="@codeSystem"/>
                                    <xsl:attribute name="displayName" select="$municipality"/>
                                </xsl:if>
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmMunicipality)))"/>
                            </xsl:element>
                        </xsl:if>
                        <!-- Codes? -->
                        <xsl:if test="$country">
                            <xsl:element name="{$elmCountry}">
                                <xsl:attribute name="value" select="$country"/>
                                <xsl:if test="@code">
                                    <xsl:copy-of select="@code"/>
                                    <xsl:copy-of select="@codeSystem"/>
                                    <xsl:attribute name="displayName" select="$country"/>
                                </xsl:if>
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmCountry)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$additionalInformation">
                            <xsl:element name="{$elmAdditionalInformation}">
                                <xsl:attribute name="value" select="$additionalInformation"/>
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $additionalInformation)))"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:copy-of select="$addressType"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="{$elmAddressInformation}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $schemaFragment/@name)))"/>
                        <!-- No address parts... submit as street -->
                        <xsl:element name="{$elmStreet}">
                            <xsl:attribute name="value" select="."/>
                            
                            <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmStreet)))"/>
                        </xsl:element>
                        <xsl:copy-of select="$addressType"/>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Copy contact parts as faithful as possible to HCIM 2017 nl.zorg.part.ContactInformation. Calculate contact type code. </xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="language">Optional. Default: nl-NL. Determines the name of the child elements to create for this datatype</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
    </xd:doc>
    <xsl:template name="handleTELtoContactInformation">
        <xsl:param name="in" as="element()*" required="yes"/>
        <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
        <xsl:param name="conceptId" as="xs:string?"/>
        
        <!-- Element names based on language -->
        <xsl:variable name="elmContactInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">contact_information</xsl:when>
                <xsl:otherwise>contactgegevens</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmTelephoneNumbers">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">telephone_numbers</xsl:when>
                <xsl:otherwise>telefoonnummers</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmTelephoneNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">telephone_number</xsl:when>
                <xsl:otherwise>telefoonnummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmTelecomType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">telecom_type</xsl:when>
                <xsl:otherwise>telecom_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmNumberType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">number_type</xsl:when>
                <xsl:otherwise>nummer_soort</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmEmailAddresses">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">email_addresses</xsl:when>
                <xsl:otherwise>emailadressen</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmEmailAddress">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">email_address</xsl:when>
                <xsl:otherwise>emailadres</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmEmailAddressType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">email_address_type</xsl:when>
                <xsl:otherwise>email_soort</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:if test="$in">
            <xsl:variable name="telephoneNumbers" select="$in[matches(@value, '^(tel|fax):')] | $in[matches(@value, '^[\d\s\(\)+-]$')]"/>
            <xsl:variable name="emailAddresses" select="$in[matches(@value, '^mailto:')] | $in[matches(@value, '.+@[^\.]+\.')]"/>
            
            <xsl:element name="{$elmContactInformation}">
                <xsl:if test="$telephoneNumbers">
                    <xsl:element name="{$elmTelephoneNumbers}">
                        <xsl:for-each select="$telephoneNumbers">
                            <xsl:variable name="theUse" select="tokenize(@use, '\s')"/>
                            <xsl:variable name="telecomType" as="element()?">
                                <xsl:choose>
                                    <xsl:when test="matches(replace(normalize-space(@value), '[^\d]', ''), '^(31)?0[12345789]')">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">1</xsl:attribute>
                                            <xsl:attribute name="code">LL</xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.40.4.22.1</xsl:attribute>
                                            <xsl:attribute name="displayName">Landline</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="starts-with(@value, 'fax:')">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">2</xsl:attribute>
                                            <xsl:attribute name="code">FAX</xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.40.4.22.1</xsl:attribute>
                                            <xsl:attribute name="displayName">Fax</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="tokenize(@use, '\s') = 'MC'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">3</xsl:attribute>
                                            <xsl:attribute name="code">MC</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Mobiele telefoon</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="tokenize(@use, '\s') = 'PG'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">4</xsl:attribute>
                                            <xsl:attribute name="code">PG</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Pager</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="numberType" as="element()?">
                                <xsl:choose>
                                    <xsl:when test="$theUse = 'HP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Primary Home</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="$theUse = 'TMP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Temporary Address</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="$theUse = 'WP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Work place</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <xsl:element name="{$elmTelephoneNumber}">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:element>
                            <xsl:if test="$telecomType">
                                <xsl:copy-of select="$telecomType"/>
                            </xsl:if>
                            <xsl:if test="$numberType">
                                <xsl:copy-of select="$numberType"/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$emailAddresses">
                    <xsl:element name="{$elmEmailAddresses}">
                        <xsl:for-each select="$emailAddresses">
                            <xsl:variable name="theUse" select="tokenize(@use, '\s')"/>
                            <xsl:variable name="emailType" as="element()?">
                                <xsl:choose>
                                    <xsl:when test="$theUse = 'HP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Primary Home</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="$theUse = 'WP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="value">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Work place</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <xsl:element name="{$elmEmailAddress}">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:element>
                            <xsl:if test="$emailType">
                                <xsl:copy-of select="$emailType"/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:if>
                
                <xsl:if test="string-length($conceptId)">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns an array of ADA elements based on an array of HL7v3 CS elements. CS has no displayName. The code, e.g. active or completed, normally reflects the displayName too so copy code to displayName. <xd:p>Input is first rewritten into full CV elements, and then passed off to handleCV for producing the ADA output</xd:p></xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="codeMap">Array of map elements to be used to map input HL7v3 codes to output ADA codes if those differ. For codeMap expect one or more elements like this:
            <xd:p><xd:pre>&lt;map inCode="xx" inCodeSystem="yy" value=".." code=".." codeSystem=".." codeSystemName=".." codeSystemVersion=".." displayName=".." originalText=".."/&gt;</xd:pre></xd:p>
            <xd:p>If input @code | @codeSystem matches, copy the other attributes from this element. Expected are usually @code, @codeSystem, @displayName, others optional. 
                In some cases the @value is required in ADA. The $codeMap may then to be used to supply that @value based on @inCode / @inCodeSystem. If the @code / @codeSystem 
                are omitted, the mapping assumes you meant to copy the @inCode / @inCodeSystem.</xd:p>
            <xd:p>For @inCode and @inCodeSystem, first the input @code/@codeSystem is checked, with fallback onto @nullFlavor.</xd:p></xd:param>
        <xd:param name="codeSystem">CS has no codeSystem so it has to be supplied from external. Usually <xd:ref type="variable" name="oidHL7ActStatus"/> or <xd:ref type="variable" name="oidHL7RoleStatus"/></xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor as code/coodeSystem/displayName</xd:param>
    </xd:doc>
    <xsl:template name="handleCS">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="codeMap" as="element()*"/>
        <xsl:param name="codeSystem" as="xs:string" required="yes"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:variable name="rewrite" as="element()*">
            <xsl:for-each select="$in">
                <xsl:element name="{name(.)}">
                    <xsl:copy-of select="@*"/>
                    <xsl:if test="not(@codeSystem)">
                        <xsl:attribute name="codeSystem" select="$codeSystem"/>
                    </xsl:if>
                    <xsl:if test="not(@displayName)">
                        <xsl:attribute name="displayName" select="@code"/>
                    </xsl:if>
                    <xsl:copy-of select="node()"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:variable>
        <xsl:call-template name="handleCV">
            <xsl:with-param name="in" select="$rewrite"/>
            <xsl:with-param name="conceptId" select="$conceptId"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="datatype" select="$datatype"/>
            <xsl:with-param name="codeMap" select="$codeMap"/>
            <xsl:with-param name="nullIfMissing" select="$nullIfMissing"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Returns an array of ADA elements based on an array of HL7v3 CV elements. @nullFlavor is rewritten into ADA @code/@codeSystem attributes as ADA does not know @nullFlavor for coded elements.</xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="codeMap">Array of map elements to be used to map input HL7v3 codes to output ADA codes if those differ. For codeMap expect one or more elements like this:
            <xd:p><xd:pre>&lt;map inCode="xx" inCodeSystem="yy" value=".." code=".." codeSystem=".." codeSystemName=".." codeSystemVersion=".." displayName=".." originalText=".."/&gt;</xd:pre></xd:p>
            <xd:p>If input @code | @codeSystem matches, copy the other attributes from this element. Expected are usually @code, @codeSystem, @displayName, others optional. 
            In some cases the @value is required in ADA. The $codeMap may then to be used to supply that @value based on @inCode / @inCodeSystem. If the @code / @codeSystem 
            are omitted, the mapping assumes you meant to copy the @inCode / @inCodeSystem.</xd:p>
            <xd:p>For @inCode and @inCodeSystem, first the input @code/@codeSystem is checked, with fallback onto @nullFlavor.</xd:p></xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor as code/coodeSystem/displayName</xd:param>
    </xd:doc>
    <xsl:template name="handleCV">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="codeMap" as="element()*"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:variable name="theCode" select="$nullIfMissing"/>
            <xsl:variable name="theCodeSystem" select="$oidHL7NullFlavor"/>
            <xsl:variable name="out" as="element()">
                <xsl:choose>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <element code="{$nullIfMissing}" codeSystem="{$theCodeSystem}" displayName="{$nullIfMissing}"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:copy-of select="$out/@code"/>
                <xsl:copy-of select="$out/@codeSystem"/>
                <xsl:copy-of select="$out/@displayName"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:variable name="theCode">
                <xsl:choose>
                    <xsl:when test="@code">
                        <xsl:value-of select="@code"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@nullFlavor"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="theCodeSystem">
                <xsl:choose>
                    <xsl:when test="@code">
                        <xsl:value-of select="@codeSystem"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$oidHL7NullFlavor"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="out" as="element()">
                <xsl:choose>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                
                <xsl:copy-of select="$out/@value"/>
                
                <xsl:choose>
                    <xsl:when test="$out/@nullFlavor">
                        <xsl:attribute name="code" select="$out/@nullFlavor"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                        <xsl:choose>
                            <xsl:when test="$out/@displayName">
                                <xsl:copy-of select="$out/@displayName"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="$hl7NullFlavorMap[@hl7NullFlavor = $out/@nullFlavor]/@displayName"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="$out/@code"/>
                        <!-- In the case where codeMap if only used to add a @value for ADA, this saves having to repeat the @inCode and @inCodeSystem as @code resp. @codeSystem -->
                        <xsl:if test="not($out/@code) and not(empty($theCode))">
                            <xsl:attribute name="code" select="$theCode"/>
                        </xsl:if>
                        <xsl:copy-of select="$out/@codeSystem"/>
                        <xsl:if test="not($out/@codeSystem) and not(empty($theCodeSystem))">
                            <xsl:attribute name="codeSystem" select="$theCodeSystem"/>
                        </xsl:if>
                        <xsl:copy-of select="$out/@codeSystemName"/>
                        <xsl:copy-of select="$out/@codeSystemVersion"/>
                        <xsl:copy-of select="$out/@displayName"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:if test="hl7:originalText">
                    <xsl:attribute name="originalText" select="hl7:originalText"/>
                </xsl:if>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns an array of ADA elements based on an array of HL7v3 BL elements.</xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor</xd:param>
    </xd:doc>
    <xsl:template name="handleBL">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:attribute name="nullFlavor" select="$nullIfMissing"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:copy-of select="@value"/>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns an array of ADA elements based on an array of HL7v3 II elements.</xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor</xd:param>
    </xd:doc>
    <xsl:template name="handleII">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:attribute name="nullFlavor" select="$nullIfMissing"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:if test="@extension">
                    <xsl:attribute name="value" select="@extension"/>
                </xsl:if>
                <xsl:copy-of select="@root"/>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns an array of ADA elements based on an array of HL7v3 INT elements.</xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor</xd:param>
    </xd:doc>
    <xsl:template name="handleINT">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:attribute name="nullFlavor" select="$nullIfMissing"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:copy-of select="@value"/>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns an array of ADA elements based on an array of HL7v3 PQ elements.</xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor</xd:param>
    </xd:doc>
    <xsl:template name="handlePQ">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:attribute name="nullFlavor" select="$nullIfMissing"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:copy-of select="@value"/>
                <xsl:copy-of select="@unit[not(. = '1')]"/>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns an array of ADA elements based on an array of HL7v3 ST elements.</xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor</xd:param>
    </xd:doc>
    <xsl:template name="handleST">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:attribute name="nullFlavor" select="$nullIfMissing"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:if test="text()[not(normalize-space() = '')]">
                    <xsl:attribute name="value" select="."/>
                </xsl:if>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns an array of ADA elements based on an array of HL7v3 TS elements. The ADA attribute @value will be created, if the input has a @value, with as much precision as possible based on the input.</xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="conceptId">Optional value for an ADA @conceptId attribute</xd:param>
        <xd:param name="elemName">Required. Name of the ADA element to produce</xd:param>
        <xd:param name="datatype">Optional. If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise</xd:param>
        <xd:param name="nullIfMissing">Optional. If there is no element, and this has a value, create element anyway with given nullFlavor</xd:param>
    </xd:doc>
    <xsl:template name="handleTS">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="nullIfMissing" as="xs:string?"/>
        
        <xsl:if test="empty($in) and string-length($nullIfMissing) gt 0">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:attribute name="nullFlavor" select="$nullIfMissing"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
        <xsl:for-each select="$in">
            <xsl:variable name="value" as="xs:string?">
                <xsl:if test="@value">
                    <xsl:value-of select="nf:formatHL72XMLDate(@value, nf:determine_date_precision(@value))"/>
                </xsl:if>
            </xsl:variable>
            
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype">
                        <xsl:choose>
                            <xsl:when test="$value castable as xs:dateTime">dateTime</xsl:when>
                            <xsl:otherwise>date</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="string-length($value) gt 0">
                    <xsl:attribute name="value" select="$value"/>
                </xsl:if>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeADXPValue">
        <xsl:param name="xsiType">ADXP</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <!-- ADXP never occurs outside AD and never needs xsi:type -->
            <xsl:copy-of select="@code"/>
            <xsl:copy-of select="@codeSystem"/>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
    </xd:doc>
    <xsl:template name="makeBLAttribute">
        <xsl:param name="inputValue"/>
        <xsl:choose>
            <xsl:when test="$inputValue castable as xs:boolean">
                <xsl:attribute name="value" select="$inputValue"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('ja', 'yes', 'ja', 'oui', 'si')">
                <xsl:attribute name="value" select="true()"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('nee', 'no', 'nein', 'non', 'no')">
                <xsl:attribute name="value" select="false()"/>
            </xsl:when>
            <xsl:when test="string-length($inputValue) = 0">
                <!-- Do nothing -->
            </xsl:when>
            <xsl:otherwise>
                <!-- assume nullFlavor -->
                <xsl:attribute name="nullFlavor" select="$inputValue"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeBLValue">
        <xsl:param name="xsiType">BL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:variable name="inputValue" select="@value"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makeBLAttribute">
                <xsl:with-param name="inputValue" select="$inputValue"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeBNValue">
        <xsl:param name="xsiType">BN</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeBLValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elemName"/>
        <xd:param name="originalText"/>
        <xd:param name="strOriginalText"/>
        <xd:param name="translations"/>
        <xd:param name="xsiType"/>
    </xd:doc>
    <xsl:template name="makeCDValue">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:param name="translations" as="element(hl7:translation)*"/>
        <xsl:param name="xsiType" as="xs:string?">CD</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makeCodeAttribs">
                <xsl:with-param name="code" select="$code"/>
                <xsl:with-param name="codeSystem" select="$codeSystem"/>
                <xsl:with-param name="displayName" select="$displayName"/>
                <xsl:with-param name="originalText" select="$originalText"/>
                <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
            </xsl:call-template>
            <xsl:copy-of select="$translations"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elemName"/>
        <xd:param name="originalText"/>
        <xd:param name="strOriginalText"/>
        <xd:param name="translations"/>
        <xd:param name="xsiType"/>
    </xd:doc>
    <xsl:template name="makeCEValue">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:param name="translations" as="element(hl7:translation)*"/>
        <xsl:param name="xsiType" as="xs:string?">CE</xsl:param>
        <xsl:call-template name="makeCDValue">
            <xsl:with-param name="code" select="$code"/>
            <xsl:with-param name="codeSystem" select="$codeSystem"/>
            <xsl:with-param name="displayName" select="$displayName"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="originalText" select="$originalText"/>
            <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
            <xsl:with-param name="translations" select="$translations"/>
            <xsl:with-param name="xsiType" select="$xsiType"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elemName"/>
        <xd:param name="xsiType"/>
        <xd:param name="originalText"/>
        <xd:param name="translations"/>
    </xd:doc>
    <xsl:template name="makeCVValue">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="xsiType">CV</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:param name="translations" as="element(hl7:translation)*"/>
        <xsl:call-template name="makeCDValue">
            <xsl:with-param name="code" select="$code"/>
            <xsl:with-param name="codeSystem" select="$codeSystem"/>
            <xsl:with-param name="displayName" select="$displayName"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="originalText" select="$originalText"/>
            <xsl:with-param name="xsiType" select="$xsiType"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="originalText"/>
    </xd:doc>
    <xsl:template name="makeCSValue">
        <xsl:param name="xsiType">CS</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="@codeSystem = $oidHL7NullFlavor">
                    <!-- NullFlavor -->
                    <xsl:attribute name="nullFlavor" select="@code"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="code" select="@code"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="originalText"/>
    </xd:doc>
    <xsl:template name="makeCode">
        <xsl:param name="originalText"/>
        <code>
            <xsl:call-template name="makeCodeAttribs">
                <xsl:with-param name="originalText" select="$originalText"/>
            </xsl:call-template>
        </code>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="originalText"/>
        <xd:param name="strOriginalText"/>
        <xd:param name="value"/>
    </xd:doc>
    <xsl:template name="makeCodeAttribs">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
        <xsl:param name="originalText"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:param name="value" select="./@value"/>
        <xsl:choose>
            <xsl:when test="string-length($code) = 0 and (string-length($value) gt 0 or string-length($strOriginalText) gt 0)">
                <xsl:attribute name="nullFlavor" select="'OTH'"/>
            </xsl:when>
            <xsl:when test="$codeSystem = $oidHL7NullFlavor">
                <!-- NullFlavor -->
                <xsl:attribute name="nullFlavor" select="$code"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="code" select="$code"/>
                <xsl:attribute name="codeSystem" select="$codeSystem"/>
                <xsl:attribute name="displayName" select="$displayName"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="string-length($strOriginalText) gt 0">
                <xsl:call-template name="makeoriginalText2">
                    <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="makeoriginalText">
                    <xsl:with-param name="originalText" as="element()*">
                        <xsl:choose>
                            <xsl:when test="$originalText">
                                <xsl:copy-of select="$originalText"/>
                            </xsl:when>
                            <xsl:when test="not(@code) and @value">
                                <xsl:copy-of select="."/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> OriginalText with element() param </xd:desc>
        <xd:param name="originalText"/>
    </xd:doc>
    <xsl:template name="makeoriginalText">
        <xsl:param name="originalText" as="element()*"/>
        <xsl:if test="$originalText">
            <originalText>
                <xsl:value-of select="$originalText/@value"/>
            </originalText>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> OriginalText with string param </xd:desc>
        <xd:param name="strOriginalText"/>
    </xd:doc>
    <xsl:template name="makeoriginalText2">
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:if test="string-length($strOriginalText) gt 0">
            <originalText>
                <xsl:value-of select="$strOriginalText"/>
            </originalText>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="mediaType"/>
        <xd:param name="representation"/>
        <xd:param name="reference"/>
    </xd:doc>
    <xsl:template name="makeEDValue">
        <xsl:param name="xsiType">ED</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="mediaType" as="xs:string?"/>
        <xsl:param name="representation" as="xs:string?"/>
        <xsl:param name="reference" as="xs:string?"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:if test="$mediaType">
                <xsl:attribute name="mediaType" select="$mediaType"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$representation">
                    <xsl:attribute name="representation" select="$representation"/>
                </xsl:when>
                <xsl:when test="not($mediaType = 'text/plain')">
                    <xsl:attribute name="representation" select="'B64'"/>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="@value"/>
            <xsl:if test="$reference">
                <reference value="{$reference}"/>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="qualifier"/>
    </xd:doc>
    <xsl:template name="makeENXPValue">
        <xsl:param name="xsiType">ENXP</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="qualifier"/>
        <xsl:element name="{$elemName}">
            <!-- ENXP never occurs outside AD and never needs xsi:type -->
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeINTValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:attribute name="value" select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeINT.NONNEGValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeINTValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeINT.POSValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeINTValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="makeIIid">
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">id</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeIIValueBSN">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeII.NL.BSNValue">
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.AGBValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidAGB"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.BIGValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidBIGregister"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.BSNValue">
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidBurgerservicenummer"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.URAValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidURAOrganizations"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.UZIValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidUZIPersons"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="root"/>
        <xd:param name="nullFlavor"/>
    </xd:doc>
    <xsl:template name="makeIIValue">
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="root" select="@root"/>
        <xsl:param name="nullFlavor">NI</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:choose>
                <!-- extension + root ... the regular case -->
                <xsl:when test="string-length($root) gt 0 and string-length(@value) gt 0">
                    <xsl:attribute name="extension" select="@value"/>
                    <xsl:attribute name="root" select="$root"/>
                </xsl:when>
                <!-- extension + nullFlavor=UNC. Extension MAY NOT appear on its own unless with nullFlavor=UNC -->
                <xsl:when test="string-length($root) = 0 and string-length(@value) gt 0">
                    <xsl:attribute name="extension" select="@value"/>
                    <xsl:attribute name="nullFlavor">UNC</xsl:attribute>
                </xsl:when>
                <!-- nullFlavor -->
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor" select="$nullFlavor"/>
                </xsl:otherwise>
                <!--<xsl:when test="string-length($root) gt 0 and string-length(@value) = 0">
                    <xsl:attribute name="nullFlavor" select="$nullFlavor"/>
                </xsl:choose>
                <xsl:when test="string-length($root) = 0 and string-length(@value) = 0">
                    <xsl:attribute name="nullFlavor" select="$nullFlavor"/>
                </xsl:when>-->
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
    </xd:doc>
    <xsl:template name="makeNegationAttr">
        <xsl:param name="inputValue" select="@value"/>
        <xsl:choose>
            <xsl:when test="$inputValue castable as xs:boolean">
                <xsl:attribute name="negationInd" select="$inputValue = 'false'"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('ja', 'yes', 'ja', 'oui', 'si', 'waar')">
                <xsl:attribute name="negationInd" select="false()"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('nee', 'no', 'nein', 'non', 'no', 'onwaar')">
                <xsl:attribute name="negationInd" select="true()"/>
            </xsl:when>
            <xsl:when test="string-length($inputValue) = 0">
                <!-- Do nothing -->
            </xsl:when>
            <xsl:otherwise>
                <!-- assume nullFlavor -->
                <xsl:attribute name="nullFlavor" select="$inputValue"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="makeNullflavorWithToelichting">
        <xsl:attribute name="nullFlavor" select="'OTH'"/>
        <xsl:call-template name="makeoriginalText">
            <xsl:with-param name="originalText" select="."/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeONValue">
        <xsl:param name="xsiType">ON</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makePNValue">
        <xsl:param name="xsiType">PN</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="unit"/>
    </xd:doc>
    <xsl:template name="makePQValue">
        <xsl:param name="inputValue" select="./@value"/>
        <xsl:param name="xsiType">PQ</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="unit" select="./@unit"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makePQValueAttribs">
                <xsl:with-param name="value" select="$inputValue"/>
                <xsl:with-param name="unit" select="$unit"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="value"/>
        <xd:param name="unit"/>
    </xd:doc>
    <xsl:template name="makePQValueAttribs">
        <xsl:param name="value" select="@value"/>
        <xsl:param name="unit" select="@unit"/>
        <xsl:if test="$value">
            <xsl:attribute name="value" select="$value"/>
        </xsl:if>
        <xsl:if test="$unit">
            <xsl:attribute name="unit" select="$unit"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeSCValue">
        <xsl:param name="xsiType">SC</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:copy-of select="@code"/>
            <xsl:copy-of select="@codeSystem"/>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeSTValue">
        <xsl:param name="xsiType">ST</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="use"/>
    </xd:doc>
    <xsl:template name="makeTELValue">
        <xsl:param name="xsiType">TEL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="use"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:if test="$use">
                <xsl:attribute name="use" select="$use"/>
            </xsl:if>
            <xsl:attribute name="value" select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="use"/>
    </xd:doc>
    <xsl:template name="makeTEL.NL.EXTENDEDValue">
        <xsl:param name="xsiType">TEL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="use"/>
        <xsl:call-template name="makeTELValue">
            <xsl:with-param name="elemName"/>
            <xsl:with-param name="use"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="makeText">
        <text>
            <xsl:value-of select="@value"/>
        </text>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeTNValue">
        <xsl:param name="xsiType">TN</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> CDArecordTargetSDTC-NL-BSN-Minimal </xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.2_20170602000000">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:param name="language">nl-NL</xsl:param>
        
        <!-- Element names -->
        <xsl:variable name="elmPatient">
            <xsl:choose>
                <xsl:when test="not(empty($elementName))">
                    <xsl:value-of select="$elementName"/>
                </xsl:when>
                <xsl:when test="$language = 'en-US'">patient</xsl:when>
                <xsl:otherwise>patient</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmPatientIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient_identification_number</xsl:when>
                <xsl:otherwise>identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmDateOfBirth">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">date_of_birth</xsl:when>
                <xsl:otherwise>geboortedatum</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmGender">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">gender</xsl:when>
                <xsl:otherwise>geslacht</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmMultipleBirthInd">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">multiple_birth_indicator</xsl:when>
                <xsl:otherwise>meerling_indicator</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmDeceasedInd">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">deceased_indicator</xsl:when>
                <xsl:otherwise>overlijdens_indicator</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmDeceasedDate">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">date_of_death</xsl:when>
                <xsl:otherwise>datum_overlijden</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="{$elmPatient}">
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <!--<xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>-->
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="$in/hl7:id"/>
                <xsl:with-param name="elemName" select="$elmPatientIdentificationNumber"/>
            </xsl:call-template>
            <xsl:call-template name="handleTS">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:birthTime"/>
                <xsl:with-param name="elemName" select="$elmDateOfBirth"/>
            </xsl:call-template>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:administrativeGenderCode"/>
                <xsl:with-param name="elemName" select="$elmGender"/>
            </xsl:call-template>
            <xsl:call-template name="handleBL">
                <xsl:with-param name="in" select="$in/hl7:patient/*:multipleBirthInd"/>
                <xsl:with-param name="elemName" select="$elmMultipleBirthInd"/>
            </xsl:call-template>
            <!--<xsl:call-template name="handleBL">
                <xsl:with-param name="in" select="$in/hl7:patient/*:deceasedInd"/>
                <xsl:with-param name="elemName" select="$elmDeceasedInd"/>
            </xsl:call-template>
            <xsl:call-template name="handleTS">
                <xsl:with-param name="in" select="$in/hl7:patient/*:deceasedTime"/>
                <xsl:with-param name="elemName" select="$elmDeceasedDate"/>
            </xsl:call-template>-->
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Returns an XML comment on the output that marks that the output is generated content, and shows what instance (element name + hl7:id or hl7:code or hl7:templateId) it came from</xd:desc>
        <xd:param name="in">Optional explicit element to start from, if not the context node.</xd:param>
    </xd:doc>
    <xsl:template name="doGeneratedComment">
        <xsl:param name="in" select="." as="node()*"/>
        
        <xsl:variable name="firstHL7Element" select="$in/descendant-or-self::hl7:*[1]" as="element()?"/>
        
        <xsl:comment>
            <xsl:text>Generated from HL7v3 </xsl:text>
            <xsl:choose>
                <xsl:when test="$firstHL7Element">
                    <xsl:value-of select="$firstHL7Element/local-name()"/>
                    <xsl:text> </xsl:text>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
            <xsl:text>instance</xsl:text>
            
            <xsl:choose>
                <xsl:when test="$firstHL7Element/hl7:id">
                    <xsl:text> with: </xsl:text>
                    <xsl:text>&lt;id</xsl:text>
                    <xsl:for-each select="($firstHL7Element/hl7:id)[1]/@*">
                        <xsl:value-of select="concat(' ', name(), '=&quot;', ., '&quot;')"/>
                    </xsl:for-each>
                    <xsl:text>/&gt;</xsl:text>
                </xsl:when>
                <xsl:when test="$firstHL7Element/hl7:code">
                    <xsl:text> with: </xsl:text>
                    <xsl:text>&lt;code</xsl:text>
                    <xsl:for-each select="($firstHL7Element/hl7:code)[1]/@*">
                        <xsl:value-of select="concat(' ', name(), '=&quot;', ., '&quot;')"/>
                    </xsl:for-each>
                    <xsl:text>/&gt;</xsl:text>
                </xsl:when>
                <xsl:when test="$firstHL7Element/hl7:templateId">
                    <xsl:text> with: </xsl:text>
                    <xsl:text>&lt;templateId</xsl:text>
                    <xsl:for-each select="($firstHL7Element/hl7:templateId)[1]/@*">
                        <xsl:value-of select="concat(' ', name(), '=&quot;', ., '&quot;')"/>
                    </xsl:for-each>
                    <xsl:text>/&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:comment>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc> copy an element with all of it's contents in comments </xd:desc>
        <xd:param name="in"></xd:param>
    </xd:doc>
    <xsl:template name="copyElementInComment">
        <xsl:param name="in"/>
        <xsl:text disable-output-escaping="yes">
                       &lt;!--</xsl:text>
        <xsl:for-each select="$in">
            <xsl:call-template name="copyInstance"/>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes">--&gt;
</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc> copy an element with all of it's contents in comments </xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="copyInstance">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <xsl:choose>
                <xsl:when test="self::text()">
                    <xsl:value-of select="replace(., '--' ,'-\\-')"/>
                </xsl:when>
                <xsl:when test="self::comment()">
                    <xsl:text disable-output-escaping="yes">&lt;!-\-</xsl:text>
                    <xsl:value-of select="replace(., '--' ,'-\\-')"/>
                    <xsl:text disable-output-escaping="yes">-\-></xsl:text>
                </xsl:when>
                <xsl:when test="self::processing-instruction()">
                    <xsl:text disable-output-escaping="yes">&lt;?</xsl:text>
                    <xsl:value-of select="replace(., '--' ,'-\\-')"/>
                    <xsl:text disable-output-escaping="yes">?></xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy>
                        <xsl:for-each select="node()">
                            <xsl:call-template name="copyInstance"/>
                        </xsl:for-each>
                    </xsl:copy>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
