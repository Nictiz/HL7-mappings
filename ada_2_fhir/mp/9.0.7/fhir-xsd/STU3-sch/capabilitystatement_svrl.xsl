<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:saxon="http://saxon.sf.net/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:f="http://hl7.org/fhir" xmlns:h="http://www.w3.org/1999/xhtml" version="2.0">
    <!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->

    <axsl:param name="archiveDirParameter"/>
    <axsl:param name="archiveNameParameter"/>
    <axsl:param name="fileNameParameter"/>
    <axsl:param name="fileDirParameter"/>
    <axsl:variable name="document-uri">
        <axsl:value-of select="document-uri(/)"/>
    </axsl:variable>

    <!--PHASES-->


    <!--PROLOG-->

    <axsl:output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" method="xml" omit-xml-declaration="no" standalone="yes" indent="yes"/>

    <!--XSD TYPES FOR XSLT2-->


    <!--KEYS AND FUNCTIONS-->


    <!--DEFAULT RULES-->


    <!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
    <!--This mode can be used to generate an ugly though full XPath for locators-->

    <axsl:template match="*" mode="schematron-select-full-path">
        <axsl:apply-templates select="." mode="schematron-get-full-path"/>
    </axsl:template>

    <!--MODE: SCHEMATRON-FULL-PATH-->
    <!--This mode can be used to generate an ugly though full XPath for locators-->

    <axsl:template match="*" mode="schematron-get-full-path">
        <axsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
        <axsl:text>/</axsl:text>
        <axsl:choose>
            <axsl:when test="namespace-uri()=''">
                <axsl:value-of select="name()"/>
            </axsl:when>
            <axsl:otherwise>
                <axsl:text>*:</axsl:text>
                <axsl:value-of select="local-name()"/>
                <axsl:text>[namespace-uri()='</axsl:text>
                <axsl:value-of select="namespace-uri()"/>
                <axsl:text>']</axsl:text>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:variable name="preceding" select="count(preceding-sibling::*[local-name()=local-name(current())                                   and namespace-uri() = namespace-uri(current())])"/>
        <axsl:text>[</axsl:text>
        <axsl:value-of select="1+ $preceding"/>
        <axsl:text>]</axsl:text>
    </axsl:template>
    <axsl:template match="@*" mode="schematron-get-full-path">
        <axsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
        <axsl:text>/</axsl:text>
        <axsl:choose>
            <axsl:when test="namespace-uri()=''">@<axsl:value-of select="name()"/>
            </axsl:when>
            <axsl:otherwise>
                <axsl:text>@*[local-name()='</axsl:text>
                <axsl:value-of select="local-name()"/>
                <axsl:text>' and namespace-uri()='</axsl:text>
                <axsl:value-of select="namespace-uri()"/>
                <axsl:text>']</axsl:text>
            </axsl:otherwise>
        </axsl:choose>
    </axsl:template>

    <!--MODE: SCHEMATRON-FULL-PATH-2-->
    <!--This mode can be used to generate prefixed XPath for humans-->

    <axsl:template match="node() | @*" mode="schematron-get-full-path-2">
        <axsl:for-each select="ancestor-or-self::*">
            <axsl:text>/</axsl:text>
            <axsl:value-of select="name(.)"/>
            <axsl:if test="preceding-sibling::*[name(.)=name(current())]">
                <axsl:text>[</axsl:text>
                <axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
                <axsl:text>]</axsl:text>
            </axsl:if>
        </axsl:for-each>
        <axsl:if test="not(self::*)">
            <axsl:text/>/@<axsl:value-of select="name(.)"/>
        </axsl:if>
    </axsl:template>
    <!--MODE: SCHEMATRON-FULL-PATH-3-->
    <!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->

    <axsl:template match="node() | @*" mode="schematron-get-full-path-3">
        <axsl:for-each select="ancestor-or-self::*">
            <axsl:text>/</axsl:text>
            <axsl:value-of select="name(.)"/>
            <axsl:if test="parent::*">
                <axsl:text>[</axsl:text>
                <axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
                <axsl:text>]</axsl:text>
            </axsl:if>
        </axsl:for-each>
        <axsl:if test="not(self::*)">
            <axsl:text/>/@<axsl:value-of select="name(.)"/>
        </axsl:if>
    </axsl:template>

    <!--MODE: GENERATE-ID-FROM-PATH -->

    <axsl:template match="/" mode="generate-id-from-path"/>
    <axsl:template match="text()" mode="generate-id-from-path">
        <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
        <axsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
    </axsl:template>
    <axsl:template match="comment()" mode="generate-id-from-path">
        <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
        <axsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
    </axsl:template>
    <axsl:template match="processing-instruction()" mode="generate-id-from-path">
        <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
        <axsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
    </axsl:template>
    <axsl:template match="@*" mode="generate-id-from-path">
        <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
        <axsl:value-of select="concat('.@', name())"/>
    </axsl:template>
    <axsl:template match="*" mode="generate-id-from-path" priority="-0.5">
        <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
        <axsl:text>.</axsl:text>
        <axsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
    </axsl:template>

    <!--MODE: GENERATE-ID-2 -->

    <axsl:template match="/" mode="generate-id-2">U</axsl:template>
    <axsl:template match="*" mode="generate-id-2" priority="2">
        <axsl:text>U</axsl:text>
        <axsl:number level="multiple" count="*"/>
    </axsl:template>
    <axsl:template match="node()" mode="generate-id-2">
        <axsl:text>U.</axsl:text>
        <axsl:number level="multiple" count="*"/>
        <axsl:text>n</axsl:text>
        <axsl:number count="node()"/>
    </axsl:template>
    <axsl:template match="@*" mode="generate-id-2">
        <axsl:text>U.</axsl:text>
        <axsl:number level="multiple" count="*"/>
        <axsl:text>_</axsl:text>
        <axsl:value-of select="string-length(local-name(.))"/>
        <axsl:text>_</axsl:text>
        <axsl:value-of select="translate(name(),':','.')"/>
    </axsl:template>
    <!--Strip characters-->
    <axsl:template match="text()" priority="-1"/>

    <!--SCHEMA SETUP-->

    <axsl:template match="/">
        <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" title="" schemaVersion="">
            <axsl:comment>
                <axsl:value-of select="$archiveDirParameter"/>   <axsl:value-of select="$archiveNameParameter"/>   <axsl:value-of select="$fileNameParameter"/>   <axsl:value-of select="$fileDirParameter"/>
            </axsl:comment>
            <svrl:ns-prefix-in-attribute-values uri="http://hl7.org/fhir" prefix="f"/>
            <svrl:ns-prefix-in-attribute-values uri="http://www.w3.org/1999/xhtml" prefix="h"/>
            <svrl:active-pattern>
                <axsl:attribute name="document">
                    <axsl:value-of select="document-uri(/)"/>
                </axsl:attribute>
                <axsl:attribute name="name">Global</axsl:attribute>
                <axsl:apply-templates/>
            </svrl:active-pattern>
            <axsl:apply-templates select="/" mode="M2"/>
            <svrl:active-pattern>
                <axsl:attribute name="document">
                    <axsl:value-of select="document-uri(/)"/>
                </axsl:attribute>
                <axsl:attribute name="name">Global 1</axsl:attribute>
                <axsl:apply-templates/>
            </svrl:active-pattern>
            <axsl:apply-templates select="/" mode="M3"/>
            <svrl:active-pattern>
                <axsl:attribute name="document">
                    <axsl:value-of select="document-uri(/)"/>
                </axsl:attribute>
                <axsl:attribute name="name">CapabilityStatement</axsl:attribute>
                <axsl:apply-templates/>
            </svrl:active-pattern>
            <axsl:apply-templates select="/" mode="M4"/>
        </svrl:schematron-output>
    </axsl:template>

    <!--SCHEMATRON PATTERNS-->


    <!--PATTERN Global-->

    <svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Global</svrl:text>

    <!--RULE -->

    <axsl:template match="f:extension" priority="1001" mode="M2">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:extension"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ext-1: Must have either extensions or value[x], not both</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M2"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:modifierExtension" priority="1000" mode="M2">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:modifierExtension"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ext-1: Must have either extensions or value[x], not both</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M2"/>
    </axsl:template>
    <axsl:template match="text()" priority="-1" mode="M2"/>
    <axsl:template match="@*|node()" priority="-2" mode="M2">
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M2"/>
    </axsl:template>

    <!--PATTERN Global 1-->

    <svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Global 1</svrl:text>

    <!--RULE -->

    <axsl:template match="f:*" priority="1000" mode="M3">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:*"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="@value|f:*|h:div"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@value|f:*|h:div">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>global-1: All FHIR elements must have a @value or children</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/>
    </axsl:template>
    <axsl:template match="text()" priority="-1" mode="M3"/>
    <axsl:template match="@*|node()" priority="-2" mode="M3">
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/>
    </axsl:template>

    <!--PATTERN CapabilityStatement-->

    <svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CapabilityStatement</svrl:text>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement" priority="1031" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(parent::f:contained and f:contained)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(parent::f:contained and f:contained)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>dom-2: If the resource is contained in another resource, it SHALL NOT contain nested Resources</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(parent::f:contained and f:text)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(parent::f:contained and f:text)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>dom-1: If the resource is contained in another resource, it SHALL NOT contain any narrative</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>dom-4: If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))]))"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))]))">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>dom-3: If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="count(f:rest)=count(distinct-values(f:rest/f:mode/@value))"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(f:rest)=count(distinct-values(f:rest/f:mode/@value))">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-8: There can only be one REST declaration per mode.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="count(f:document[f:mode/@value='producer'])=count(distinct-values(f:document[f:mode/@value='producer']/f:profile/f:reference/@value)) and count(f:document[f:mode/@value='consumer'])=count(distinct-values(f:document[f:mode/@value='consumer']/f:profile/f:reference/@value))"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(f:document[f:mode/@value='producer'])=count(distinct-values(f:document[f:mode/@value='producer']/f:profile/f:reference/@value)) and count(f:document[f:mode/@value='consumer'])=count(distinct-values(f:document[f:mode/@value='consumer']/f:profile/f:reference/@value))">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-7: The set of documents must be unique by the combination of profile and mode.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:implementation)) or (f:kind/@value != 'capability')"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:implementation)) or (f:kind/@value != 'capability')">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-15: Capability Statements of kind 'instance' do not have implementation elements.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:messaging/f:endpoint)) or f:kind/@value = 'instance'"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:messaging/f:endpoint)) or f:kind/@value = 'instance'">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-3: Messaging end-point is required (and is only permitted) when a statement is for an implementation.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:software) or exists(f:implementation)) or (f:kind/@value != 'requirements')"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:software) or exists(f:implementation)) or (f:kind/@value != 'requirements')">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-14: Capability Statements of kind 'requirements' do not have software or implementation elements.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="count(f:software | f:implementation | f:description) &gt; 0"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(f:software | f:implementation | f:description) &gt; 0">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-2: A Capability Statement SHALL have at least one of description, software, or implementation element.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="exists(f:rest) or exists(f:messaging) or exists(f:document)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="exists(f:rest) or exists(f:messaging) or exists(f:document)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-1: A Capability Statement SHALL have at least one of REST, messaging or document element.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:text/h:div" priority="1030" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:text/h:div"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(descendant-or-self::*[not(local-name(.)=('a', 'abbr', 'acronym', 'b', 'big', 'blockquote', 'br', 'caption', 'cite', 'code', 'col', 'colgroup', 'dd', 'dfn', 'div', 'dl', 'dt', 'em', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'hr', 'i', 'img', 'li', 'ol', 'p', 'pre', 'q', 'samp', 'small', 'span', 'strong', 'sub', 'sup', 'table', 'tbody', 'td', 'tfoot', 'th', 'thead', 'tr', 'tt', 'ul', 'var'))]) and not(descendant-or-self::*/@*[not(name(.)=('abbr', 'accesskey', 'align', 'alt', 'axis', 'bgcolor', 'border', 'cellhalign', 'cellpadding', 'cellspacing', 'cellvalign', 'char', 'charoff', 'charset', 'cite', 'class', 'colspan', 'compact', 'coords', 'dir', 'frame', 'headers', 'height', 'href', 'hreflang', 'hspace', 'id', 'lang', 'longdesc', 'name', 'nowrap', 'rel', 'rev', 'rowspan', 'rules', 'scope', 'shape', 'span', 'src', 'start', 'style', 'summary', 'tabindex', 'title', 'type', 'valign', 'value', 'vspace', 'width'))])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                    test="not(descendant-or-self::*[not(local-name(.)=('a', 'abbr', 'acronym', 'b', 'big', 'blockquote', 'br', 'caption', 'cite', 'code', 'col', 'colgroup', 'dd', 'dfn', 'div', 'dl', 'dt', 'em', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'hr', 'i', 'img', 'li', 'ol', 'p', 'pre', 'q', 'samp', 'small', 'span', 'strong', 'sub', 'sup', 'table', 'tbody', 'td', 'tfoot', 'th', 'thead', 'tr', 'tt', 'ul', 'var'))]) and not(descendant-or-self::*/@*[not(name(.)=('abbr', 'accesskey', 'align', 'alt', 'axis', 'bgcolor', 'border', 'cellhalign', 'cellpadding', 'cellspacing', 'cellvalign', 'char', 'charoff', 'charset', 'cite', 'class', 'colspan', 'compact', 'coords', 'dir', 'frame', 'headers', 'height', 'href', 'hreflang', 'hspace', 'id', 'lang', 'longdesc', 'name', 'nowrap', 'rel', 'rev', 'rowspan', 'rules', 'scope', 'shape', 'span', 'src', 'start', 'style', 'summary', 'tabindex', 'title', 'type', 'valign', 'value', 'vspace', 'width'))])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>txt-1: The narrative SHALL contain only the basic html formatting elements and attributes described in chapters 7-11 (except section 4 of chapter 9) and 15 of the HTML 4.0 standard, &lt;a&gt; elements (either name or href), images and internally contained style attributes</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="descendant::text()[normalize-space(.)!=''] or descendant::h:img[@src]"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="descendant::text()[normalize-space(.)!=''] or descendant::h:img[@src]">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>txt-2: The narrative SHALL have some non-whitespace content</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:contact/f:telecom" priority="1029" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:contact/f:telecom"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:value)) or exists(f:system)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:value)) or exists(f:system)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpt-2: A system is required if a value is provided.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:contact/f:telecom/f:period" priority="1028" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:contact/f:telecom/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:useContext/f:valueQuantity" priority="1027" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:useContext/f:valueQuantity"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:code)) or exists(f:system)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:code)) or exists(f:system)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>qty-3: If a code for the unit is present, the system SHALL also be present</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:useContext/f:valueRange" priority="1026" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:useContext/f:valueRange"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:low/f:value/@value)) or not(exists(f:high/f:value/@value)) or (number(f:low/f:value/@value) &lt;= number(f:high/f:value/@value))"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:low/f:value/@value)) or not(exists(f:high/f:value/@value)) or (number(f:low/f:value/@value) &lt;= number(f:high/f:value/@value))">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>rng-2: If present, low SHALL have a lower value than high</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:useContext/f:valueRange/f:low" priority="1025" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:useContext/f:valueRange/f:low"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:code)) or exists(f:system)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:code)) or exists(f:system)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>qty-3: If a code for the unit is present, the system SHALL also be present</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:useContext/f:valueRange/f:high" priority="1024" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:useContext/f:valueRange/f:high"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:code)) or exists(f:system)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:code)) or exists(f:system)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>qty-3: If a code for the unit is present, the system SHALL also be present</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:profile" priority="1023" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:profile"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:profile/f:identifier/f:period" priority="1022" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:profile/f:identifier/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:profile/f:identifier/f:assigner" priority="1021" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:profile/f:identifier/f:assigner"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest" priority="1020" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="count(f:resource)=count(distinct-values(f:resource/f:type/@value))"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(f:resource)=count(distinct-values(f:resource/f:type/@value))">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-9: A given resource can only be described once per RESTful mode.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest/f:resource" priority="1019" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest/f:resource"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="count(f:searchParam)=count(distinct-values(f:searchParam/f:name/@value))"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(f:searchParam)=count(distinct-values(f:searchParam/f:name/@value))">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-12: Search parameter names must be unique in the context of a resource.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest/f:resource/f:profile" priority="1018" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest/f:resource/f:profile"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest/f:resource/f:profile/f:identifier/f:period" priority="1017" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest/f:resource/f:profile/f:identifier/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest/f:resource/f:profile/f:identifier/f:assigner" priority="1016" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest/f:resource/f:profile/f:identifier/f:assigner"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest/f:operation/f:definition" priority="1015" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest/f:operation/f:definition"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest/f:operation/f:definition/f:identifier/f:period" priority="1014" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest/f:operation/f:definition/f:identifier/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:rest/f:operation/f:definition/f:identifier/f:assigner" priority="1013" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:rest/f:operation/f:definition/f:identifier/f:assigner"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging" priority="1012" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="exists(f:supportedMessage) != exists(f:event)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="exists(f:supportedMessage) != exists(f:event)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>cpb-16: A Capability Statement messaging element SHALL have either supportedMessage or event element, but not both.</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:supportedMessage/f:definition" priority="1011" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:supportedMessage/f:definition"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:supportedMessage/f:definition/f:identifier/f:period" priority="1010" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:supportedMessage/f:definition/f:identifier/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:supportedMessage/f:definition/f:identifier/f:assigner" priority="1009" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:supportedMessage/f:definition/f:identifier/f:assigner"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:event/f:request" priority="1008" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:event/f:request"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:event/f:request/f:identifier/f:period" priority="1007" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:event/f:request/f:identifier/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:event/f:request/f:identifier/f:assigner" priority="1006" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:event/f:request/f:identifier/f:assigner"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:event/f:response" priority="1005" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:event/f:response"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:event/f:response/f:identifier/f:period" priority="1004" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:event/f:response/f:identifier/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:messaging/f:event/f:response/f:identifier/f:assigner" priority="1003" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:messaging/f:event/f:response/f:identifier/f:assigner"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:document/f:profile" priority="1002" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:document/f:profile"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:document/f:profile/f:identifier/f:period" priority="1001" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:document/f:profile/f:identifier/f:period"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>per-1: If present, start SHALL have a lower value than end</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>

    <!--RULE -->

    <axsl:template match="f:CapabilityStatement/f:document/f:profile/f:identifier/f:assigner" priority="1000" mode="M4">
        <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:CapabilityStatement/f:document/f:profile/f:identifier/f:assigner"/>

        <!--ASSERT -->

        <axsl:choose>
            <axsl:when test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])"/>
            <axsl:otherwise>
                <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">
                    <axsl:attribute name="location">
                        <axsl:apply-templates select="." mode="schematron-select-full-path"/>
                    </axsl:attribute>
                    <svrl:text>ref-1: SHALL have a contained resource if a local reference is provided</svrl:text>
                </svrl:failed-assert>
            </axsl:otherwise>
        </axsl:choose>
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>
    <axsl:template match="text()" priority="-1" mode="M4"/>
    <axsl:template match="@*|node()" priority="-2" mode="M4">
        <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
    </axsl:template>
</axsl:stylesheet>
