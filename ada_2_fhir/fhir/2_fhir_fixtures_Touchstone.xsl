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
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:util="urn:hl7:utilities" xmlns:uuid="http://www.uuid.org" xmlns:nf="http://www.nictiz.nl/functions" version="2.0" exclude-result-prefixes="#all">
    <!--    <xsl:import href="../../util/utilities.xsl"/>-->
    
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    
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
        <xsl:variable name="filter" as="element()">
            <xsl:apply-templates select="$node" mode="filter"/>
        </xsl:variable>
        <!--<xsl:message select="concat(count(string-to-codepoints(nf:getGroupingKeyDefault($filter))), ' - ',nf:getGroupingKeyDefault($filter))"></xsl:message>-->
        <xsl:sequence select="xs:integer(nf:product-sum(string-to-codepoints(nf:getGroupingKeyDefault($filter))[position() lt 500]))"/>
    </xsl:function>
    
    <xsl:template match="@* | node()" mode="filter">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="hcimroot" mode="filter"/>
    <xsl:template match="*[ends-with(@conceptId, '.1') and @value]" mode="filter">
        <xsl:param name="root" select="true()" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="$root = true()">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()" mode="#current">
                        <xsl:with-param name="root" select="false()" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
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
        <xsl:result-document href="{$outputDir}/{replace(./f:id/@value, '\.', '-')}.xml">
            <xsl:copy-of select="."/>
        </xsl:result-document>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Override function to remove special characters to comply with certain rules for id's. Touchstone also does not like . (period) in fixture id.</xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:removeSpecialCharacters" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:value-of select="replace(translate(normalize-space($in),' ._àáãäåèéêëìíîïòóôõöùúûüýÿç€ßñ?','---aaaaaeeeeiiiiooooouuuuyycEsnq'), '[^A-Za-z0-9\.-]', '')"/>
    </xsl:function>
    
</xsl:stylesheet>
