<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Parameters to be set, may be overridden by an importing stylesheet -->
    <xsl:param name="ad-transaction" select="document('../2.3.3/sturen_kernset_geboortezorg/ada_schemas/RetrieveTransaction-ks-gz-233.xml')"/>
    <xsl:param name="ad-trans-instance" select="document('../2.3.3/sturen_kernset_geboortezorg/ada_schemas/tr-2.16.840.1.113883.2.4.3.11.60.90.77.4.2437-2016-11-22T082402_instance.xml')"/>
    <xsl:param name="releaseUri" select="'http://decor.nictiz.nl/decor/services/RetrieveTransaction?id=2.16.840.1.113883.2.4.3.11.60.90.77.4.2410&amp;language=nl-NL&amp;version=2014-11-19T17:15:44&amp;format=xml'"/>
    <xsl:param name="hl7PayloadContext" select="'/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject'"/>

    <xsl:param name="ada-input" select="."/>


    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="//*[@transactionRef]">
        <xsl:variable name="transaction-concepts" as="element()">
            <transaction xmlns="">
                <!-- top level elementen from transaction -->
                <xsl:apply-templates select="$ad-transaction/dataset/concept" mode="maak-my-concept"/>
            </transaction>
        </xsl:variable>
        <xsl:comment>Schematron <xsl:value-of select="@title"/></xsl:comment>
        <sch:schema xmlns:hl7="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
            <sch:ns uri="urn:hl7-org:v3" prefix="hl7"/>
            <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
            <sch:ns uri="http://www.w3.org/XML/1998/namespace" prefix="xml"/>
            <sch:pattern id="{concat('id-', @id)}">
                <xsl:apply-templates select="$transaction-concepts/my-concept" mode="doRule"/>
            </sch:pattern>
        </sch:schema>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes concept for transaction concept  which contains all necessary info to create the schematron rules later.</xd:desc>
        <xd:param name="xpath-context">context passed in from the parent group, if applicable otherwise defaulted</xd:param>
    </xd:doc>
    <xsl:template match="concept" mode="maak-my-concept">
        <xsl:param name="xpath-context" select="$ad-trans-instance"/>
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="xpath-concept" select="($xpath-context//concept[@ref = $current-concept/@id])"/>
        <xsl:variable name="xpath-tree" select="$xpath-concept/ancestor::node()"/>
        <xsl:variable name="xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[local-name() = $current-concept/@shortName]" as="element()*"/>

        <my-concept xmlns="" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <xpath xmlns="" value="{$xpath}"/>
            <xsl:choose>
                <xsl:when test="@type = 'group'">
                    <xsl:apply-templates select="concept" mode="maak-my-concept">
                        <xsl:with-param name="xpath-context" select="$xpath-concept/.."/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@type = 'item'">
                    <xsl:copy-of select="$ada-input-concept"/>
                </xsl:when>
            </xsl:choose>
        </my-concept>
    </xsl:template>

    <xd:doc>
        <xd:desc>Takes concept from transaction (from retrieve transaction xml) and decides which schematron output to produce, 
            based on type (group/item) and valueDomain and the ada input test case.
            Context must be a concept from retrieve transaction xml.</xd:desc>
    </xd:doc>
    <xsl:template match="my-concept" mode="doRule">
        <xsl:comment><xsl:value-of select="@shortName"/></xsl:comment>
        <xsl:variable name="current-concept" select="."/>
        <xsl:choose>
            <xsl:when test="@type = 'group'">
                <xsl:choose>
                    <xsl:when test="my-concept[@type = 'item'][xs:integer(@ada-count) gt 1]">
                        <!-- We need to create a rule for this group, because it has items that may appear more than once -->
                        <sch:rule context="{xpath/@value}">
                            <xsl:apply-templates select="my-concept[@type = 'item'][xs:integer(@ada-count) gt 1]" mode="doAssert"/>
                        </sch:rule>
                    </xsl:when>
                </xsl:choose>
                <xsl:apply-templates select="my-concept[not(@type = 'item' and xs:integer(@ada-count) gt 1)]" mode="doRule"/>
            </xsl:when>
            <xsl:when test="@type = 'item' and xs:integer(@ada-count) gt 0">
                <sch:rule context="{xpath/@value}">
                    <xsl:apply-templates select="." mode="doAssert"/>
                </sch:rule>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>Non supported or empty concept/@type: '<xsl:value-of select="@type"/>'.</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Chooses what type of schematron assert to create based on value domain</xd:desc>
    </xd:doc>
    <xsl:template match="my-concept" mode="doAssert">
        <!-- create schematron assert based on valueDomain if there is a value in the ada test instance -->
        <xsl:if test="xs:integer(@ada-count) gt 0">
            <xsl:variable name="my-xpath" select="./xpath/@value"/>
            <xsl:choose>
                <xsl:when test="@valuedomain = 'datetime'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Date">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = 'code'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Code">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = 'identifier'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Identifier">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:comment>Non supported valuedomain: '<xsl:value-of select="@valuedomain"/>'.</xsl:comment>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain code</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the code</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Code">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <!--Eindverantwoordelijk in welke perinatale periode? moet aan . voldoen.-->
        <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet aan code = ''', @code, ''' voldoen.')"/></xsl:comment>
        <sch:assert role="error" test="{$context}[(@code = '{@code}' and @codeSystem = '{@codeSystem}')]/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="@displayName"/>" (code: <xsl:value-of select="@code"/>).</sch:assert>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain date or dateTime, but currently only checks date.
        TODO: should be enhanced to either check date or dateTime depending on ada test instance input</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the date(Time)</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Date">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <xsl:variable name="hl7-date" select="substring(nf:ada2hl7-datetime(@value), 1, 8)"/>
        <!--Datum x moet aan substring(@value,1,8)='xxxxxxxx' voldoen.-->
        <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet aan substring(@value,1,8)=', $hl7-date, ' voldoen.')"/></xsl:comment>
        <sch:assert role="error" test="{$context}[substring(@value, 1, 8) = '{$hl7-date}']">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="nf:ada2datestring(@value)"/>" (<xsl:value-of select="$hl7-date"/>).</sch:assert>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain date or dateTime, but currently only checks date.
            TODO: should be enhanced to either check date or dateTime depending on ada test instance input</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the date(Time)</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Identifier">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <sch:assert role="error" test="{$context}[@root='{@root}'][@extension='{@value}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met extension "<xsl:value-of select="@value"/>" en root "(<xsl:value-of select="@root"/>)".</sch:assert>
    </xsl:template>

    <xsl:function name="nf:ada2hl7-datetime">
        <xsl:param name="ada-datetime"/>
        <xsl:choose>
            <xsl:when test="$ada-datetime castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($ada-datetime), '[Y0001][M01][D01][H01][m01][s01]')"/>
            </xsl:when>
            <xsl:when test="$ada-datetime castable as xs:date">
                <xsl:value-of select="format-date(xs:date($ada-datetime), '[Y0001][M01][D01]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ada-datetime"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="nf:ada2datestring">
        <xsl:param name="ada-datetime"/>
        <xsl:choose>
            <xsl:when test="$ada-datetime castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($ada-datetime), '[D01] [Mn] [Y0001]', 'nl', 'AD', 'NL')"/>
            </xsl:when>
            <xsl:when test="$ada-datetime castable as xs:date">
                <xsl:value-of select="format-date(xs:date($ada-datetime), '[D01] [Mn] [Y0001]', 'nl', 'AD', 'NL')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ada-datetime"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
