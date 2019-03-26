<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="../../ada_2_hl7/hl7/2_hl7_hl7_include.xsl"/>
    <!-- Parameters to be set, may be overridden by an importing stylesheet -->
    <xsl:param name="doc-ad-transaction" select="document('../2.3.3/sturen_kernset_geboortezorg/ada_schemas/RetrieveTransaction-ks-gz-233.xml')"/>
    <xsl:param name="doc-ad-trans-instance" select="document('../2.3.3/sturen_kernset_geboortezorg/ada_schemas/tr-2.16.840.1.113883.2.4.3.11.60.90.77.4.2437-2016-11-22T082402_instance.xml')"/>
    <xsl:param name="releaseUri" select="'http://decor.nictiz.nl/decor/services/RetrieveTransaction?id=2.16.840.1.113883.2.4.3.11.60.90.77.4.2410&amp;language=nl-NL&amp;version=2014-11-19T17:15:44&amp;format=xml'"/>
    <xsl:param name="hl7PayloadContext" select="'/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject'"/>
    <xsl:param name="ada-input" select="."/>
    <xsl:variable name="transaction-concepts" as="element()">
        <transaction xmlns="">
            <!-- top level elementen from transaction -->
            <xsl:apply-templates select="$doc-ad-transaction/dataset/concept" mode="maak-my-concept"/>
        </transaction>
    </xsl:variable>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="//*[@transactionRef]">
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
        <xd:desc>Makes concept for transaction which contains all necessary info to create the schematron rules later.
                 Input concept is concept from transaction xml ($ad-transaction).
                 Uses ada input xml ($ada-input) for the cardinality / content checking.</xd:desc>
        <xd:param name="parent-hl7-element">the parent hl7 element in transaction xml, if applicable, otherwise defaulted to hl7:instance element</xd:param>
        <xd:param name="parent-concept">the parent concept (association) as exists in the transaction xml ($doc-ad-trans-instance), if applicable</xd:param>
        <xd:param name="override-parent-xpath">parameter to pass a custom xpath string for the parent element, 
            must get precedence over the other input parameters for calculating the appropriate xpath for this concept </xd:param>
    </xd:doc>
    <xsl:template match="concept" mode="maak-my-concept">
        <xsl:param name="parent-hl7-element" select="$doc-ad-trans-instance//hl7:instance"/>
        <xsl:param name="parent-concept" as="element(concept)?"/>
        <xsl:param name="override-parent-xpath" as="xs:string?"/>
        <xsl:param name="override-ada-input" select="$ada-input" as="node()*"/>

        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="current-xpath-concept-temp" select="$parent-hl7-element//concept[@ref = $current-concept/@id]"/>
        <!-- help statement to identify multiple template associations for this concept under the parent, 
             usually caused because the same template is used in other dataset groups that are children of this parent in hl7.-->
        <xsl:if test="count($current-xpath-concept-temp) gt 1">
            <xsl:comment>current-concept with id <xsl:value-of select="$current-concept/@id"/> has more than one template associations in it's hl7 parent</xsl:comment>
        </xsl:if>
        <xsl:if test="$current-concept/@shortName = 'werkelijke_plaats_baring_type_locatie'">
            <xsl:comment>werkelijke_plaats_baring_type_locatie</xsl:comment>
        </xsl:if>
        <xsl:variable name="current-xpath-concept" select="$current-xpath-concept-temp[1]"/>
        <xsl:variable name="relative-xpath" select="nf:get-relative-xpath($parent-hl7-element, $parent-concept, $current-xpath-concept)" as="xs:string?"/>

        <xsl:variable name="my-xpath" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$override-parent-xpath">
                    <xsl:value-of select="concat($override-parent-xpath, '/', $relative-xpath)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="xpath-tree" select="$current-xpath-concept/ancestor::node()"/>
                    <xsl:value-of select="string-join($xpath-tree/@withpredicate, '/')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="this-ada-input">
            <xsl:choose>
                <xsl:when test="$override-ada-input">
                    <xsl:sequence select="$override-ada-input"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$ada-input"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="ada-input-concept" select="$this-ada-input//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <xsl:if test="$relative-xpath">
                <relative-xpath xmlns="" value="{$relative-xpath}"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="@type = 'group'">
                    <xsl:apply-templates select="concept" mode="maak-my-concept">
                        <xsl:with-param name="parent-hl7-element" select="$current-xpath-concept/.."/>
                        <xsl:with-param name="parent-concept" select="$current-xpath-concept"/>
                        <xsl:with-param name="override-parent-xpath" select="
                                if ($override-parent-xpath) then
                                    concat($override-parent-xpath, '/', $relative-xpath)
                                else
                                    ''"/>
                        <xsl:with-param name="override-ada-input" select="$override-ada-input"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@type = 'item'">
                    <xsl:copy-of select="$ada-input-concept"/>
                </xsl:when>
            </xsl:choose>
        </my-concept>
    </xsl:template>

    <xd:doc>
        <xd:desc>Takes concept from transaction (from variable $transaction-concepts) and decides which schematron output to produce, 
            based on type (group/item) and valueDomain and the ada input test case.
            Context must be a concept from retrieve transaction xml.</xd:desc>
    </xd:doc>
    <xsl:template match="my-concept" mode="doRule">
        <xsl:comment><xsl:value-of select="concat(@shortName, ' id: ', @id)"/></xsl:comment>
        <xsl:variable name="current-concept" select="."/>
        <xsl:choose>
            <xsl:when test="@type = 'group'">
                <sch:rule context="//{my-xpath/@value}">
                    <!-- multiplicity tests in this group for the concepts in this group-->
                    <xsl:apply-templates select="my-concept" mode="doMultiplicityAssert"/>
                    <!-- content checking for items with cardinality greater than 0 -->
                    <xsl:apply-templates select="my-concept[@type = 'item' and xs:integer(@ada-count) gt 0]" mode="doAssert"/>
                </sch:rule>
                <!-- redo this template for all underlying groups -->
                <xsl:apply-templates select="my-concept[not(@type = 'item')]" mode="doRule"/>
            </xsl:when>
            <xsl:when test="@type = 'item'">
                <!-- should only happen with top level items, make a rule -->
                <sch:rule context="//{my-xpath/@value}">
                    <xsl:apply-templates select="." mode="doMultiplicityAssert"/>
                    <xsl:if test="xs:integer(@ada-count) gt 0">
                        <xsl:apply-templates select="." mode="doAssert"/>
                    </xsl:if>
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
            <xsl:variable name="my-xpath" select="./my-xpath/@value"/>
            <xsl:choose>
                <xsl:when test="@valuedomain = 'boolean'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Boolean">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = 'code'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Code">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = 'count'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Count">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = ('date', 'datetime')">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Date">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = 'identifier'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Identifier">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = 'quantity'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4Quantity">
                        <xsl:with-param name="context" select="concat('/', $my-xpath)"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@valuedomain = 'string'">
                    <xsl:apply-templates select="*[@conceptId]" mode="doAssert4String">
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
        <xd:desc>Creates multiplity assert</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="my-concept" mode="doMultiplicityAssert">
        <xsl:param name="context" as="xs:string?" select="./relative-xpath/@value"/>
        <xsl:variable name="concept-naam" select="@name"/>
        <xsl:comment><xsl:value-of select="$concept-naam"/> (<xsl:value-of select="@id"/>) moet <xsl:value-of select="@ada-count"/> keer voorkomen.</xsl:comment>
        <!--concept moet precies x keer voorkomen.-->
        <sch:let name="hl7-count" value="count({$context})"/>
        <sch:assert role="error" test="$hl7-count = {@ada-count}"><xsl:value-of select="$concept-naam"/> moet <xsl:value-of select="@ada-count"/> keer voorkomen (dataset concept id: <xsl:value-of select="@id"/>). Aantal gevonden: <sch:value-of select="$hl7-count"/></sch:assert>

    </xsl:template>
    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain boolean</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Boolean">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet waarde = ''', string-join(@value | @nullFlavor, ' '), ''' bevatten.', ' Dataset concept id: ', @conceptId, '.')"/></xsl:comment>

        <xsl:choose>
            <xsl:when test="@nullFlavor">
                <sch:assert role="error" test="{$context}[@nullFlavor = '{@nullFlavor}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="@value"/>" (nullFlavor: <xsl:value-of select="@nullFlavor"/>). Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:when>
            <xsl:otherwise>
                <sch:assert role="error" test="{$context}[@value='{@value}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde '"<xsl:value-of select="@value"/>"'. Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain code</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the code</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Code">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <!--concept moet aan x voldoen.-->
        <xsl:choose>
            <xsl:when test="@codeSystem = $oidHL7NullFlavor">
                <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet nullFlavor = ''', @code, ''' bevatten.')"/></xsl:comment>
                <sch:assert role="error" test="{$context}[@nullFlavor = '{@code}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="@displayName"/>" (nullFlavor: <xsl:value-of select="@code"/>). Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet aan code = ''', @code, ''' met codeSystem = ''', @codeSystem, '''voldoen.')"/></xsl:comment>
                <sch:assert role="error" test="{$context}[(@code = '{@code}' and @codeSystem = '{@codeSystem}')]/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="@displayName"/>" (code: <xsl:value-of select="@code"/> in codeSystem: <xsl:value-of select="@codeSystem"/>). Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain count</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Count">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet waarde = ''', string-join(@value | @nullFlavor, ' '), ''' bevatten.', ' Dataset concept id: ', @conceptId, '.')"/></xsl:comment>

        <xsl:choose>
            <xsl:when test="@nullFlavor">
                <sch:assert role="error" test="{$context}[@nullFlavor = '{@nullFlavor}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="@value"/>" (nullFlavor: <xsl:value-of select="@nullFlavor"/>). Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:when>
            <xsl:otherwise>
                <sch:assert role="error" test="{$context}[@value='{@value}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde '"<xsl:value-of select="@value"/>"'. Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain date or dateTime, but currently only checks date.
        TODO: should be enhanced to either check date or dateTime depending on ada test instance input</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the date(Time)</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Date">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <xsl:variable name="ada-hl7-date" select="substring(nf:ada2hl7-datetime(@value), 1, 8)"/>
        <xsl:variable name="ada-hl7-time" select="substring(nf:ada2hl7-datetime(@value), 9, 4)"/>
        <xsl:variable name="ada-time" select="substring-after(@value, 'T')"/>

        <xsl:choose>
            <xsl:when test="$ada-time castable as xs:time and not(substring($ada-time, 1, 5) = '00:00')">
                <!-- we don't care about seconds -->
                <!--Datum x moet aan substring(@value,1,12)='xxxxxxxx' voldoen.-->
                <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet aan substring(@value,1,12)=', $ada-hl7-date, $ada-hl7-time, ' voldoen.')"/></xsl:comment>
                <sch:assert role="error" test="{$context}[substring(@value, 1, 12) = '{$ada-hl7-date}{$ada-hl7-time}']">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="nf:ada2datestring(@value)"/>" (<xsl:value-of select="$ada-hl7-date"/><xsl:value-of select="$ada-hl7-time"/>).</sch:assert>
            </xsl:when>
            <xsl:when test="@value castable as xs:date or substring-before(@value, 'T') castable as xs:date">
                <!--Datum x moet aan substring(@value,1,8)='xxxxxxxx' voldoen.-->
                <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet aan substring(@value,1,8)=', $ada-hl7-date, ' voldoen.')"/></xsl:comment>
                <sch:assert role="error" test="{$context}[substring(@value, 1, 8) = '{$ada-hl7-date}']">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="nf:ada2datestring(@value)"/>" (<xsl:value-of select="$ada-hl7-date"/>).</sch:assert>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain quantity.</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4Quantity">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet aan waarde =', @value, ' ', @unit, ' voldoen.')"/></xsl:comment>
        <sch:assert role="error" test="{$context}[@value='{@value}'][@unit='{nf:convert_ADA_unit2UCUM(@unit)}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde '<xsl:value-of select="concat(@value, ' ', @unit)"/>'".</sch:assert>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain string.</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="doAssert4String">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <sch:assert role="error" test="{$context}[normalize-space(upper-case(text()))='{normalize-space(upper-case(@value))}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde '<xsl:value-of select="@value"/>'".</sch:assert>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain identifier</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
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

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-datetime"/>
    </xd:doc>
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

    <xd:doc>
        <xd:desc>Takes dateTime string as input and if parseable returns the xs:time</xd:desc>
        <xd:param name="xs-datetime">input date(time) string</xd:param>
    </xd:doc>
    <xsl:function name="nf:getTime" as="xs:time?">
        <xsl:param name="xs-datetime" as="xs:string?"/>

        <xsl:if test="substring-after($xs-datetime, 'T') castable as xs:time">
            <xsl:value-of select="xs:time(substring-after($xs-datetime, 'T'))"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes parent and child concept as instances from concept from instance transaction xml ($doc-ad-trans-instance) as input 
            and uses the instance transaction xml to calculate the relative xpath of the child concept</xd:desc>
        <xd:param name="parent-hl7-element"/>
        <xd:param name="child-concept"/>
    </xd:doc>
    <xsl:function name="nf:get-relative-xpath" as="xs:string?">
        <xsl:param name="parent-hl7-element" as="node()*"/>
        <xsl:param name="parent-concept" as="element(concept)?"/>
        <xsl:param name="child-concept" as="element(concept)?"/>

        <xsl:variable name="total-child-xpath-tree" select="$child-concept/ancestor::node()"/>

        <xsl:variable name="parent-concept-ref" select="$parent-concept/@ref" as="xs:string?"/>
        <xsl:variable name="child-concept-ref" select="$child-concept/@ref" as="xs:string?"/>

        <xsl:variable name="limited-xpath-tree">
            <xsl:choose>
                <xsl:when test="$parent-concept-ref">
                    <xsl:sequence select="$total-child-xpath-tree[concept/@ref = $parent-concept-ref]"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- do nothing, there is no relative path -->
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="child-xpath-tree" select="$limited-xpath-tree//concept[@ref=$child-concept-ref]/ancestor::node()"/>


        <xsl:variable name="xpath-tree" select="$child-xpath-tree[position() gt 2]"/>
        <xsl:variable name="relative-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:value-of select="$relative-xpath"/>

    </xsl:function>


</xsl:stylesheet>
