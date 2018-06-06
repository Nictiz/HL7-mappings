<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:nictiz-functions" exclude-result-prefixes="#all" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 25, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> ahenket</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="theDECOR" select="/decor"/>
    <xsl:key name="templateAssociations" match="templateAssociation" use="concat(@templateId, @effectiveDate)"/>
    <xsl:key name="templatesById" match="template" use="@id"/>
    <xsl:key name="templatesFull" match="template" use="concat(@id, @effectiveDate)"/>
    <xsl:key name="conceptsById" match="dataset//concept[not(ancestor::history | ancestor::conceptList)]" use="@id"/>
    <xsl:key name="conceptsFull" match="dataset//concept[not(ancestor::history)]" use="concat(@id, @effectiveDate)"/>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:element name="stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
            <xsl:namespace name="hl7" select="'urn:hl7-org:v3'"/>
            <xsl:namespace name="xsi" select="'http://www.w3.org/2001/XMLSchema-instance'"/>
            <xsl:namespace name="xsl" select="'http://www.w3.org/1999/XSL/Transform'"/>
            <xsl:namespace name="xs" select="'http://www.w3.org/2001/XMLSchema'"/>
            <xsl:attribute name="version" select="'20'"/>
            <xsl:element name="include" namespace="http://www.w3.org/1999/XSL/Transform">
                <xsl:attribute name="href" select="'../hl7_include.xsl'"/>
            </xsl:element>
            <xsl:for-each select="//template[@id]">
                <xsl:sort select="@id"/>
                <xsl:sort select="@effectiveDate" order="descending"/>
                <xsl:text>&#x0a;    </xsl:text>
                <xsl:text>&#x0a;    </xsl:text>
                <xsl:comment>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="
                            if (@displayName[string-length() > 0]) then
                                @displayName
                            else
                                @name"/>
                    <xsl:text> </xsl:text>
                </xsl:comment>
                <xsl:text>&#x0a;    </xsl:text>
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="template">
        <xsl:variable name="templateAssociations" select="local:getTemplateAssociation(@id, @effectiveDate)" as="element(templateAssociation)*"/>
        <xsl:element name="xsl:template">
            <xsl:attribute name="name" select="local:templateToName(.)"/>
            <xsl:for-each select="attribute[not(@prohibited = 'true')] | element[not(@conformance = 'NP')] | include[not(@conformance = 'NP')]">
                <xsl:choose>
                    <xsl:when test="self::attribute">
                        <xsl:apply-templates select=".">
                            <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:when test="self::element">
                        <xsl:apply-templates select=".">
                            <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:when test="self::choice">
                        <xsl:apply-templates select=".">
                            <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                        </xsl:apply-templates>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="templateAssociations"/>
    </xd:doc>
    <xsl:template match="attribute">
        <xsl:param name="templateAssociations" as="element(templateAssociation)*"/>
        <xsl:variable name="attrName" select="@name"/>
        <xsl:variable name="attrConcepts" select="local:getAssociatedConcepts($templateAssociations, @id)"/>
        <xsl:variable name="elemDatatype" select="replace(parent::element/@datatype, '^(.+)(..*)?', '$1')"/>
        <xsl:if test="not($attrName = 'nullFlavor') or not(@isOptional = 'true')">
            <xsl:choose>
                <xsl:when test="parent::element">
                    <xsl:attribute name="{$attrName}">
                        <xsl:choose>
                            <xsl:when test="@value">
                                <xsl:value-of select="@value"/>
                            </xsl:when>
                            <xsl:when test="$attrName = 'xsi:type'">
                                <xsl:value-of select="$elemDatatype"/>
                            </xsl:when>
                            <xsl:when test="count($attrConcepts[@type = 'item']) ge 1">
                                <xsl:text>{</xsl:text>
                                <xsl:value-of select="string-join(distinct-values($attrConcepts/@shortName), ' | ')"/>
                                <xsl:text>/(@code, @value)[1]}</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- Handle vocabulary? Is this an attribute on a datatypes element causing duplicates? -->
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="xsl:attribute">
                        <xsl:attribute name="name" select="$attrName"/>
                        <xsl:choose>
                            <xsl:when test="@value">
                                <xsl:value-of select="@value"/>
                            </xsl:when>
                            <xsl:when test="$attrName = 'xsi:type'">
                                <xsl:value-of select="$elemDatatype"/>
                            </xsl:when>
                            <xsl:when test="count($attrConcepts[@type = 'item']) ge 1">
                                <xsl:attribute name="select">
                                    <xsl:attribute name="select">
                                        <xsl:value-of select="$attrConcepts/@shortName"/>
                                        <xsl:text>/(@code, @value)[1]</xsl:text>
                                    </xsl:attribute>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- Handle vocabulary? Is this an attribute on a datatypes element causing duplicates? -->
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="templateAssociations"/>
    </xd:doc>
    <xsl:template match="element">
        <xsl:param name="templateAssociations" as="element(templateAssociation)*"/>
        <xsl:variable name="elemName" select="
                if (contains(@name, '[')) then
                    substring-before(@name, '[')
                else
                    @name"/>
        <xsl:variable name="elemConcepts" select="local:getAssociatedConcepts($templateAssociations, @id)"/>
        <xsl:variable name="elemDatatype" select="replace(@datatype, '^(.+)(..*)?', '$1')"/>
        <xsl:variable name="elemNameLocal" select="replace($elemName, '^.*:', '')"/>
        <xsl:variable name="elemNamePrefix" select="replace($elemName, '^(.*):.*', '$1')"/>
        <xsl:variable name="elemPrefixNS">
            <xsl:choose>
                <xsl:when test="string-length(namespace-uri-for-prefix($elemNamePrefix, $theDECOR)) = 0">
                    <xsl:value-of select="'urn:hl7-org:v3'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="namespace-uri-for-prefix($elemNamePrefix, $theDECOR)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="containedTemplate" select="local:getTemplate(@contains, @flexibility)" as="element(template)?"/>
        <xsl:variable name="containedAssociations" select="local:getTemplateAssociation($containedTemplate/@id, $containedTemplate/@effectiveDate)"/>
        <xsl:variable name="containedElemConcepts" select="local:getAssociatedConcepts($containedAssociations, $containedTemplate/*/@id)"/>
        <xsl:choose>
            <!-- Informatie verstrekt over werkwijze JGZ (id = 2.16.840.1.113883.2.4.3.11.60.100.2.3.476) zit raar gekoppeld -->
            <xsl:when test="count($elemConcepts[@type = 'item']) ge 1 and not($elemConcepts[@id = '2.16.840.1.113883.2.4.3.11.60.100.2.3.476']) and $elemDatatype">
                <xsl:comment><xsl:text> Item(s) :: </xsl:text><xsl:value-of select="$elemConcepts/@shortName"/></xsl:comment>
                <xsl:choose>
                    <xsl:when test="$elemNameLocal = 'buildingNumberSuffix'">
                        <xsl:element name="xsl:if">
                            <xsl:attribute name="test" select="string-join(distinct-values($elemConcepts[@type = 'item']/@shortName), ' | ')"/>
                            <xsl:element name="{if ($elemPrefixNS = 'urn:hl7-org:v3') then $elemNameLocal else $elemName}" namespace="{$elemPrefixNS}">
                                <xsl:element name="xsl:value-of">
                                    <xsl:attribute name="select">
                                        <xsl:text>string-join(</xsl:text>
                                        <xsl:value-of select="string-join(distinct-values($elemConcepts[@type = 'item']/@shortName), ' | ')"/>
                                        <xsl:text>, ' ')</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="xsl:for-each">
                            <xsl:attribute name="select" select="string-join(distinct-values($elemConcepts[@type = 'item']/@shortName), ' | ')"/>
                            <xsl:element name="xsl:call-template">
                                <xsl:attribute name="name" select="concat('make', $elemDatatype, 'Value')"/>
                                <xsl:choose>
                                    <xsl:when test="attribute[@name = 'xsi:type'][not(@isOptional = 'true')][not(@prohibited = 'true')]"/>
                                    <xsl:otherwise>
                                        <xsl:element name="xsl:with-param">
                                            <xsl:attribute name="name">xsiType</xsl:attribute>
                                            <xsl:attribute name="select">''</xsl:attribute>
                                        </xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:element name="xsl:with-param">
                                    <xsl:attribute name="name">elemName</xsl:attribute>
                                    <xsl:value-of select="$elemNameLocal"/>
                                </xsl:element>
                                <xsl:if test="count(property/@unit) = 1">
                                    <xsl:element name="xsl:with-param">
                                        <xsl:attribute name="name">unit</xsl:attribute>
                                        <xsl:value-of select="property/@unit"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:element>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@contains">
                <xsl:choose>
                    <xsl:when test="$elemConcepts | $containedElemConcepts">
                        <xsl:element name="xsl:for-each">
                            <xsl:attribute name="select" select="string-join(distinct-values($elemConcepts/@shortName | $containedElemConcepts/@shortName), ' | ')"/>
                            <xsl:element name="{if ($elemPrefixNS = 'urn:hl7-org:v3') then $elemNameLocal else $elemName}" namespace="{$elemPrefixNS}">
                                <xsl:call-template name="elementContent">
                                    <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                                </xsl:call-template>
                                <xsl:comment><xsl:text> Template :: </xsl:text><xsl:value-of select="$containedTemplate/@displayName"/><xsl:text> </xsl:text></xsl:comment>
                                <xsl:element name="xsl:call-template">
                                    <xsl:attribute name="name" select="local:templateToName($containedTemplate)"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="{if ($elemPrefixNS = 'urn:hl7-org:v3') then $elemNameLocal else $elemName}" namespace="{$elemPrefixNS}">
                            <xsl:call-template name="elementContent">
                                <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                            </xsl:call-template>
                            <xsl:comment><xsl:text> Template :: </xsl:text><xsl:value-of select="$containedTemplate/@displayName"/><xsl:text> </xsl:text></xsl:comment>
                            <xsl:element name="xsl:call-template">
                                <xsl:attribute name="name" select="local:templateToName($containedTemplate)"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$elemConcepts">
                <xsl:element name="xsl:for-each">
                    <xsl:attribute name="select" select="string-join(distinct-values($elemConcepts/@shortName | $containedElemConcepts/@shortName), ' | ')"/>
                    <xsl:element name="{if ($elemPrefixNS = 'urn:hl7-org:v3') then $elemNameLocal else $elemName}" namespace="{$elemPrefixNS}">
                        <xsl:call-template name="elementContent">
                            <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{if ($elemPrefixNS = 'urn:hl7-org:v3') then $elemNameLocal else $elemName}" namespace="{$elemPrefixNS}">
                    <xsl:call-template name="elementContent">
                        <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="templateAssociations"/>
    </xd:doc>
    <xsl:template name="elementContent">
        <xsl:param name="templateAssociations"/>
        <xsl:choose>
            <xsl:when test="count(text) = 1">
                <xsl:value-of select="text"/>
            </xsl:when>
            <xsl:when test="count(vocabulary) = 1 and vocabulary[@code]">
                <xsl:copy-of select="vocabulary/@code"/>
                <xsl:copy-of select="vocabulary/@codeSystem"/>
                <xsl:copy-of select="vocabulary/@codeSystemName"/>
                <xsl:copy-of select="vocabulary/@codeSystemVersion"/>
                <xsl:copy-of select="vocabulary/@displayName"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- Handle vocabulary? -->
            </xsl:otherwise>
        </xsl:choose>
        <xsl:for-each select="attribute[not(@prohibited = 'true')] | element[not(@conformance = 'NP')] | include[not(@conformance = 'NP')] | choice">
            <xsl:choose>
                <xsl:when test="self::attribute">
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="self::element">
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="self::include">
                    <xsl:apply-templates select="."/>
                </xsl:when>
                <xsl:when test="self::choice">
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                    </xsl:apply-templates>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="include">
        <xsl:variable name="includedTemplate" select="local:getTemplate(@ref, @flexibility)" as="element(template)"/>
        <xsl:variable name="templateAssociations" select="local:getTemplateAssociation($includedTemplate/@id, $includedTemplate/@effectiveDate)"/>
        <xsl:for-each select="$includedTemplate/attribute[not(@prohibited = 'true')] | $includedTemplate/element[not(@conformance = 'NP')] | $includedTemplate/include[not(@conformance = 'NP')] | $includedTemplate/choice">
            <xsl:choose>
                <xsl:when test="self::attribute">
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="self::element">
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="self::include">
                    <xsl:apply-templates select="."/>
                </xsl:when>
                <xsl:when test="self::choice">
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                    </xsl:apply-templates>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="templateAssociations"/>
    </xd:doc>
    <xsl:template match="choice[@maximumMultiplicity = '1']">
        <xsl:param name="templateAssociations"/>
        <xsl:element name="xsl:choose">
            <xsl:for-each select="attribute[not(@prohibited = 'true')] | element[not(@conformance = 'NP')] | include[not(@conformance = 'NP')] | choice">
                <xsl:element name="xsl:when">
                    <xsl:choose>
                        <xsl:when test="self::attribute">
                            <xsl:attribute name="test">'TODO-X-Attribuut hoort niet in choice'</xsl:attribute>
                            <xsl:apply-templates select=".">
                                <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                            </xsl:apply-templates>
                        </xsl:when>
                        <xsl:when test="self::element">
                            <xsl:variable name="elemConcepts" select="local:getAssociatedConcepts($templateAssociations, @id)"/>
                            <xsl:variable name="containedTemplate" select="local:getTemplate(@contains, @flexibility)" as="element(template)?"/>
                            <xsl:variable name="containedAssociations" select="local:getTemplateAssociation($containedTemplate/@id, $containedTemplate/@effectiveDate)"/>
                            <xsl:variable name="containedElemConcepts" select="local:getAssociatedConcepts($containedAssociations, $containedTemplate/*/@id)"/>
                            <xsl:choose>
                                <xsl:when test="$elemConcepts | $containedElemConcepts">
                                    <xsl:attribute name="test" select="string-join(distinct-values($elemConcepts/@shortName | $containedElemConcepts/@shortName), ' | ')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="test">'TODO-X'</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:apply-templates select=".">
                                <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                            </xsl:apply-templates>
                        </xsl:when>
                        <xsl:when test="self::include">
                            <xsl:variable name="includedTemplate" select="local:getTemplate(@ref, @flexibility)" as="element(template)"/>
                            <xsl:variable name="includedAssociations" select="local:getTemplateAssociation($includedTemplate/@id, $includedTemplate/@effectiveDate)"/>
                            <xsl:variable name="elemConcepts" select="local:getAssociatedConcepts($includedAssociations, @id)"/>
                            <xsl:choose>
                                <xsl:when test="$elemConcepts">
                                    <xsl:attribute name="test" select="string-join(distinct-values($elemConcepts/@shortName), ' | ')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="test">'TODO-X-Include in choice'</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:apply-templates select="."/>
                        </xsl:when>
                        <xsl:when test="self::choice">
                            <xsl:attribute name="test">'TODO-X-Choice in choice'</xsl:attribute>
                            <xsl:apply-templates select=".">
                                <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                            </xsl:apply-templates>
                        </xsl:when>
                    </xsl:choose>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="templateAssociations"/>
    </xd:doc>
    <xsl:template match="choice[not(@maximumMultiplicity = '1')]">
        <xsl:param name="templateAssociations"/>
        <xsl:for-each select="attribute[not(@prohibited = 'true')] | element[not(@conformance = 'NP')] | include[not(@conformance = 'NP')] | choice">
            <xsl:element name="xsl:if">
                <xsl:choose>
                    <xsl:when test="self::attribute">
                        <xsl:attribute name="test">'TODO-X-Attribuut hoort niet in choice'</xsl:attribute>
                        <xsl:apply-templates select=".">
                            <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:when test="self::element">
                        <xsl:variable name="elemConcepts" select="local:getAssociatedConcepts($templateAssociations, @id)"/>
                        <xsl:variable name="containedTemplate" select="local:getTemplate(@contains, @flexibility)" as="element(template)?"/>
                        <xsl:variable name="containedAssociations" select="local:getTemplateAssociation($containedTemplate/@id, $containedTemplate/@effectiveDate)"/>
                        <xsl:variable name="containedElemConcepts" select="local:getAssociatedConcepts($containedAssociations, $containedTemplate/*/@id)"/>
                        <xsl:choose>
                            <xsl:when test="$elemConcepts | $containedElemConcepts">
                                <xsl:attribute name="test" select="string-join(distinct-values($elemConcepts/@shortName | $containedElemConcepts/@shortName), ' | ')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="test">'TODO-X'</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:apply-templates select=".">
                            <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:when test="self::include">
                        <xsl:variable name="includedTemplate" select="local:getTemplate(@ref, @flexibility)" as="element(template)"/>
                        <xsl:variable name="includedAssociations" select="local:getTemplateAssociation($includedTemplate/@id, $includedTemplate/@effectiveDate)"/>
                        <xsl:variable name="elemConcepts" select="local:getAssociatedConcepts($includedAssociations, @id)"/>
                        <xsl:choose>
                            <xsl:when test="$elemConcepts">
                                <xsl:attribute name="test" select="string-join(distinct-values($elemConcepts/@shortName), ' | ')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="test">'TODO-X-Include in choice'</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                    <xsl:when test="self::choice">
                        <xsl:attribute name="test">'TODO-X-Choice in choice'</xsl:attribute>
                        <xsl:apply-templates select=".">
                            <xsl:with-param name="templateAssociations" select="$templateAssociations"/>
                        </xsl:apply-templates>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="id"/>
        <xd:param name="effectiveDate"/>
    </xd:doc>
    <xsl:function name="local:getTemplate" as="element(template)?">
        <xsl:param name="id" as="xs:string?"/>
        <xsl:param name="effectiveDate" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="string-length($id) gt 0 and string-length($effectiveDate) gt 0">
                <xsl:copy-of select="$theDECOR/key('templatesFull', concat($id, $effectiveDate))"/>
            </xsl:when>
            <xsl:when test="string-length($id) gt 0">
                <xsl:variable name="templatesById" select="$theDECOR/key('templatesById', $id)" as="element(template)*"/>
                <xsl:copy-of select="$templatesById[@effectiveDate = max($templatesById/xs:dateTime(@effectiveDate))]"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="id"/>
        <xd:param name="effectiveDate"/>
    </xd:doc>
    <xsl:function name="local:getTemplateAssociation" as="element(templateAssociation)*">
        <xsl:param name="id" as="xs:string?"/>
        <xsl:param name="effectiveDate" as="xs:string?"/>
        <xsl:if test="string-length($id) gt 0 and string-length($effectiveDate) gt 0">
            <xsl:copy-of select="$theDECOR/key('templateAssociations', concat($id, $effectiveDate))"/>
        </xsl:if>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="id"/>
        <xd:param name="effectiveDate"/>
    </xd:doc>
    <xsl:function name="local:getConcept" as="element(concept)">
        <xsl:param name="id" as="xs:string"/>
        <xsl:param name="effectiveDate" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="string-length($id) gt 0 and string-length($effectiveDate) gt 0">
                <xsl:copy-of select="$theDECOR/key('conceptsFull', concat($id, $effectiveDate))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="conceptsById" select="key('conceptsById', $id)" as="element(concept)*"/>
                <xsl:copy-of select="$conceptsById[@effectiveDate = max($conceptsById/@effectiveDate)]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="templateAssociations"/>
        <xd:param name="elementId"/>
    </xd:doc>
    <xsl:function name="local:getAssociatedConcepts" as="element(concept)*">
        <xsl:param name="templateAssociations" as="element(templateAssociation)*"/>
        <xsl:param name="elementId" as="xs:string*"/>
        <xsl:for-each select="$templateAssociations/concept[@elementId = $elementId]">
            <xsl:copy-of select="local:getConcept(@ref, @effectiveDate)"/>
        </xsl:for-each>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="template"/>
    </xd:doc>
    <xsl:function name="local:templateToName">
        <xsl:param name="template" as="element(template)"/>
        <xsl:text>template_</xsl:text>
        <xsl:value-of select="$template/@id"/>
        <xsl:text>_</xsl:text>
        <xsl:value-of select="replace($template/@effectiveDate, '[^\d]', '')"/>
    </xsl:function>
</xsl:stylesheet>
