<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:saxon="http://saxon.sf.net/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:f="http://hl7.org/fhir" xmlns:h="http://www.w3.org/1999/xhtml" version="2.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
   </axsl:template><!--MODE: SCHEMATRON-FULL-PATH-3-->
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
   </axsl:template><!--Strip characters-->
   <axsl:template match="text()" priority="-1"/>

<!--SCHEMA SETUP-->

   <axsl:template match="/">
      <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" title="" schemaVersion="">
         <axsl:comment>
            <axsl:value-of select="$archiveDirParameter"/>   
		 <axsl:value-of select="$archiveNameParameter"/>  
		 <axsl:value-of select="$fileNameParameter"/>  
		 <axsl:value-of select="$fileDirParameter"/>
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
            <axsl:attribute name="name">Bundle</axsl:attribute>
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

<!--PATTERN Bundle-->

   <svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Bundle</svrl:text>

	<!--RULE -->

   <axsl:template match="f:Bundle" priority="1009" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="count(for $entry in f:entry[f:resource] return $entry[count(parent::f:Bundle/f:entry[f:fullUrl/@value=$entry/f:fullUrl/@value and ((not(f:resource/*/f:meta/f:versionId/@value) and not($entry/f:resource/*/f:meta/f:versionId/@value)) or f:resource/*/f:meta/f:versionId/@value=$entry/f:resource/*/f:meta/f:versionId/@value)])!=1])=0"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(for $entry in f:entry[f:resource] return $entry[count(parent::f:Bundle/f:entry[f:fullUrl/@value=$entry/f:fullUrl/@value and ((not(f:resource/*/f:meta/f:versionId/@value) and not($entry/f:resource/*/f:meta/f:versionId/@value)) or f:resource/*/f:meta/f:versionId/@value=$entry/f:resource/*/f:meta/f:versionId/@value)])!=1])=0">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-7: FullUrl must be unique in a bundle, or else entries with the same fullUrl must have different meta.versionId</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="not(f:type/@value = 'document') or exists(f:identifier/f:system) or exists(f:identifier/f:value)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(f:type/@value = 'document') or exists(f:identifier/f:system) or exists(f:identifier/f:value)">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-9: A document must have an identifier with a system and a value</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="not(f:entry/f:request) or (f:type/@value = 'batch') or (f:type/@value = 'transaction') or (f:type/@value = 'history')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(f:entry/f:request) or (f:type/@value = 'batch') or (f:type/@value = 'transaction') or (f:type/@value = 'history')">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-3: entry.request only for some types of bundles</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="not(f:entry/f:response) or (f:type/@value = 'batch-response') or (f:type/@value = 'transaction-response')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(f:entry/f:response) or (f:type/@value = 'batch-response') or (f:type/@value = 'transaction-response')">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-4: entry.response only for some types of bundles</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="not(f:total) or (f:type/@value = 'searchset') or (f:type/@value = 'history')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(f:total) or (f:type/@value = 'searchset') or (f:type/@value = 'history')">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-1: total only when a search or history</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="not(f:entry/f:search) or (f:type/@value = 'searchset')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(f:entry/f:search) or (f:type/@value = 'searchset')">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-2: entry.search only when a search</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="f:Bundle/f:identifier/f:period" priority="1008" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:identifier/f:period"/>

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

   <axsl:template match="f:Bundle/f:identifier/f:assigner" priority="1007" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:identifier/f:assigner"/>

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

   <axsl:template match="f:Bundle/f:entry" priority="1006" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:entry"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="not(exists(f:fullUrl[contains(string(@value), '/_history/')]))"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="not(exists(f:fullUrl[contains(string(@value), '/_history/')]))">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-8: fullUrl cannot be a version specific reference</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="exists(f:resource) or exists(f:request) or exists(f:response)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="exists(f:resource) or exists(f:request) or exists(f:response)">
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-select-full-path"/>
               </axsl:attribute>
               <svrl:text>bdl-5: must be a resource unless there's a request or response</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="f:Bundle/f:signature/f:whoReference" priority="1005" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:signature/f:whoReference"/>

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

   <axsl:template match="f:Bundle/f:signature/f:whoReference/f:identifier/f:period" priority="1004" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:signature/f:whoReference/f:identifier/f:period"/>

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

   <axsl:template match="f:Bundle/f:signature/f:whoReference/f:identifier/f:assigner" priority="1003" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:signature/f:whoReference/f:identifier/f:assigner"/>

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

   <axsl:template match="f:Bundle/f:signature/f:onBehalfOfReference" priority="1002" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:signature/f:onBehalfOfReference"/>

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

   <axsl:template match="f:Bundle/f:signature/f:onBehalfOfReference/f:identifier/f:period" priority="1001" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:signature/f:onBehalfOfReference/f:identifier/f:period"/>

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

   <axsl:template match="f:Bundle/f:signature/f:onBehalfOfReference/f:identifier/f:assigner" priority="1000" mode="M4">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="f:Bundle/f:signature/f:onBehalfOfReference/f:identifier/f:assigner"/>

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