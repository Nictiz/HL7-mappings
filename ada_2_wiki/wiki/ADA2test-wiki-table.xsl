<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA xml to wiki table(s) <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2018-06-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="text" encoding="UTF-16"/>
    <xsl:include href="date-functions.xsl"/>
    <xsl:import href="wiki-functions.xsl"/>
    <xsl:param name="adaReleaseFile" select="document('../../../projects/mp-mp9/definitions/mp-mp9-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.102</xsl:param>

    <!-- donkerblauw -->
    <xsl:variable name="tabelkop-achtergrond-kleur">#1F497D;</xsl:variable>
    <xsl:variable name="tabelkop-font-kleur">white</xsl:variable>
    <!-- grijzig -->
    <xsl:variable name="element-achtergrond-kleur">#E3E3E3;</xsl:variable>
    <xsl:variable name="elementwaarde-achtergrond-kleur">white</xsl:variable>

    <xsl:variable name="oid-nullFlavor">2.16.840.1.113883.5.1008</xsl:variable>
    <xsl:variable name="oid-BSN">2.16.840.1.113883.2.4.6.3</xsl:variable>


    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:text>
__NUMBEREDHEADINGS__
{{IssueBox|Deze pagina is nog in bewerking}}
[[Bestand:Nictiz_logo_PO_rechts_rgb.png |link=https://www.nictiz.nl/|rechts|Naar nictiz.nl]]

=Addenda voor inhoudelijke gegevens=</xsl:text>
        <xsl:apply-templates select="adaxml/data/*"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="adaxml/data/*">
        <xsl:variable name="patient" select=".//*[local-name() = 'patient']"/>
        <xsl:variable name="patient-achternaam" select="$patient/naamgegevens/geslachtsnaam/achternaam/@value"/>
        <xsl:variable name="tabel" as="element()">
            <tabellen xmlns="">
                <!-- Een tabel per top-level group -->
                <xsl:for-each select="./*">
                    <xsl:if test="nf:get-concept-type(.) eq 'group'">
                        <tabel xmlns="" type="{./local-name()}" title="{nf:element-name(.)}">
                            <!-- een tabelrij (gegevenselement of groep) per onderliggend dataset concept -->
                            <xsl:apply-templates select="./*" mode="maak-tabel-rij"/>
                        </tabel>
                    </xsl:if>
                </xsl:for-each>
            </tabellen>
        </xsl:variable>
        <xsl:variable name="transactie-shortname" select="./@shortName"/>
        <xsl:for-each select="$tabel/tabel">
            <xsl:text>
==</xsl:text>
            <xsl:value-of select="./@title"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text>==
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=', ./@type, '_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="."/>
            <xsl:value-of select="concat('&lt;section end=', ./@type, '_', $patient-achternaam, ' /&gt;')"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a nested 'tabel' from which it is easy to generate wiki or other documentation. 
            This way the processing to make a table is separated from specific wiki-stuff. 
            Other ways to output this table (csv?) is then easier to create.</xd:desc>
        <xd:param name="in">The ada group element which contents are first rendered in this nested 'tabel'</xd:param>
    </xd:doc>
    <xsl:template name="tabel-default" match="*" mode="maak-tabel">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <tabel xmlns="" type="{./local-name()}" title="{nf:element-name(.)}">
                <xsl:apply-templates select="./*" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="xs:int(1)"/>
                </xsl:apply-templates>
            </tabel>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates a nested 'tabel' from which it is easy to generate wiki or other documentation
            This way the processing to make a table is separated from specific wiki-stuff. 
            Other ways to output this table (csv?) is then easier to create.</xd:desc>
        <xd:param name="in">The ada group element which contents are rendered in the nested 'tabel'. 
            This is typically an empty ada xml which contains all possible elements (but was not instantiated with content data).</xd:param>
        <xd:param name="adaxml-element">The collection of ada element containing test data</xd:param>
    </xd:doc>
    <xsl:template name="tabel-default-dekkingsgraad" match="*[not(ends-with(local-name(),'-start'))]" mode="maak-tabel-dekkingsgraad">
        <xsl:param name="in" select="."/>
        <xsl:param name="adaxml-element" as="element()*"/>
        <xsl:variable name="local-element-name" select="local-name($in)"/>
        <xsl:for-each select="$in">
            <tabel xmlns="" type="{$local-element-name}" title="{nf:element-name(.)}">
                <xsl:apply-templates select="./*[not(ends-with(local-name(),'-start'))]" mode="maak-tabel-rij-dekkingsgraad">
                    <xsl:with-param name="level" select="xs:int(1)"/>
                    <xsl:with-param name="adaxml-element" select="$adaxml-element[local-name()=$local-element-name]/*"/>
                </xsl:apply-templates>
            </tabel>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>Actually creates wiki from a table that was generated before, see template with mode 'maak-tabel'</xd:desc>
        <xd:param name="current-table">The table to create a wiki table from</xd:param>
    </xd:doc>
    <xsl:template match="tabel">
        <xsl:param name="current-table" select="."/>
        <xsl:variable name="tabel-diepte" select="max($current-table//*[not(*)]/count(ancestor-or-self::*))"/>
        <xsl:for-each select="$current-table">
            <xsl:call-template name="startWikiTable">
                <xsl:with-param name="tabel-diepte" select="$tabel-diepte"/>
                <xsl:with-param name="title" select="./@title"/>
            </xsl:call-template>
            <xsl:apply-templates select="./*" mode="doWikiRow">
                <xsl:with-param name="tabel-diepte" select="$tabel-diepte"/>
            </xsl:apply-templates>
            <!-- end wiki table -->
            <xsl:text>
|}</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="tabel-diepte"/>
    </xd:doc>
    <xsl:template name="gegevenselement" match="gegevenselement" mode="doWikiRow">
        <xsl:param name="tabel-diepte"/>
        <xsl:variable name="waarde" select="./@waarde" as="xs:string?"/>
        <xsl:variable name="level" select="./@level" as="xs:int?"/>
        <xsl:variable name="element-naam" select="./@naam" as="xs:string?"/>
        <xsl:text>
|-style="vertical-align:top; background-color: </xsl:text>
        <xsl:value-of select="$element-achtergrond-kleur"/>
        <xsl:text>;"</xsl:text>
        <xsl:choose>
            <xsl:when test="$level lt $tabel-diepte - 1">
                <xsl:text>
|colspan="</xsl:text>
                <xsl:value-of select="$tabel-diepte - $level"/>
                <xsl:text>"|</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>
||</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$element-naam"/>
        <xsl:text>
|style="background-color: </xsl:text>
        <xsl:value-of select="$elementwaarde-achtergrond-kleur"/>
        <xsl:text>;"|</xsl:text>
        <xsl:value-of select="$waarde"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="tabel-diepte"/>
    </xd:doc>
    <xsl:template match="groep" mode="doWikiRow">
        <xsl:param name="tabel-diepte"/>
        <xsl:variable name="element-naam" select="./@naam"/>
        <xsl:variable name="level" select="./@level" as="xs:int"/>
        <xsl:text>
|-style="vertical-align:top; background-color: </xsl:text>
        <xsl:value-of select="$element-achtergrond-kleur"/>
        <xsl:text>;"  
|colspan="</xsl:text>
        <xsl:value-of select="$tabel-diepte - ($level - 1)"/>
        <xsl:text>"|</xsl:text>
        <xsl:value-of select="$element-naam"/>
        <xsl:text>
|-style="vertical-align:top; background-color: </xsl:text>
        <xsl:value-of select="$element-achtergrond-kleur"/>
        <xsl:text>;"</xsl:text>
        <xsl:text>
|rowspan="</xsl:text>
        <xsl:value-of select="1 + count(.//*) + count(.//*[local-name() eq 'groep'])"/>
        <xsl:text>"|</xsl:text>
        <!-- nu de elementen/groepen in deze groep -->
        <xsl:apply-templates select="./*" mode="doWikiRow">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="tabel-diepte" select="$tabel-diepte"/>
        </xsl:apply-templates>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="title"/>
        <xd:param name="tabel-diepte"/>
    </xd:doc>
    <xsl:template name="startWikiTable">
        <xsl:param name="title" select="nf:element-name(.)"/>
        <xsl:param name="tabel-diepte"/>
        <xsl:text>
{| class="wikitable" width="85%"
|style="background-color: </xsl:text>
        <xsl:value-of select="$tabelkop-achtergrond-kleur"/>
        <xsl:text>; color: </xsl:text>
        <xsl:value-of select="$tabelkop-font-kleur"/>
        <xsl:text>; font-weight: bold; text-align:center;"  colspan="</xsl:text>
        <xsl:value-of select="$tabel-diepte"/>
        <xsl:text>" | </xsl:text>
        <xsl:value-of select="$title"/>
        <xsl:text>
|-style="background-color: </xsl:text>
        <xsl:value-of select="$tabelkop-achtergrond-kleur"/>
        <xsl:text>; color: </xsl:text>
        <xsl:value-of select="$tabelkop-font-kleur"/>
        <xsl:text>; text-align:left;" 
|colspan="</xsl:text>
        <xsl:value-of select="$tabel-diepte - 1"/>
        <xsl:text>" width="25%"| Gegevenselement
|| Waarde
</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>

        <xd:param name="element-name">Optional param to override the default element name</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)" as="xs:int"/>
        <xsl:param name="element-name" select="nf:element-name(.)" as="xs:string?"/>
        <xsl:variable name="concept-type" select="nf:get-concept-type(.)"/>
        <xsl:variable name="value-domain" select="nf:get-concept-value-domain(.)"/>

        <xsl:choose>
            <xsl:when test="$concept-type eq 'group'">
                <groep xmlns="" level="{$level}" naam="{$element-name}">
                    <xsl:apply-templates select="./*" mode="maak-tabel-rij">
                        <xsl:with-param name="level" select="xs:int($level + 1)"/>
                    </xsl:apply-templates>
                </groep>
            </xsl:when>
            <xsl:otherwise>
                <!-- item -->
                <xsl:element name="gegevenselement" namespace="">
                    <xsl:attribute name="level" select="$level"/>
                    <xsl:attribute name="naam" select="$element-name"/>
                    <xsl:attribute name="waarde" select="nf:maak-waarde-basedon-valuedomain(.,$value-domain)"/>                   
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>

        <xd:param name="element-name">Optional param to override the default element name</xd:param>
        <xd:param name="adaxml-element"/>
    </xd:doc>
    <xsl:template match="*[not(ends-with(local-name(),'-start'))]" mode="maak-tabel-rij-dekkingsgraad">
        <xsl:param name="level" select="xs:int(1)" as="xs:int"/>
        <xsl:param name="element-name" select="nf:element-name(.)" as="xs:string?"/>
        <xsl:param name="adaxml-element" as="element()*"/>
        <xsl:variable name="local-element-name" select="local-name(.)"/>
        <xsl:variable name="concept-type" select="nf:get-concept-type(.)"/>
        <xsl:variable name="value-domain" select="nf:get-concept-value-domain(.)"/>

        <xsl:choose>
            <xsl:when test="$concept-type eq 'group'">
                <groep xmlns="" level="{$level}" naam="{$element-name}">
                    <xsl:apply-templates select="./*" mode="maak-tabel-rij-dekkingsgraad">
                        <xsl:with-param name="level" select="xs:int($level + 1)"/>
                        <xsl:with-param name="adaxml-element" select="$adaxml-element[local-name()=$local-element-name]/*"/>
                    </xsl:apply-templates>
                </groep>
            </xsl:when>
            <xsl:otherwise>
                <!-- item -->
                <xsl:variable name="adaxml-item" select="if ($adaxml-element[local-name()=$local-element-name]) then $adaxml-element[local-name()=$local-element-name] else $adaxml-element/*[local-name()=$local-element-name]"/>
                <xsl:element name="gegevenselement" namespace="">
                    <xsl:attribute name="level" select="$level"/>
                    <xsl:attribute name="naam" select="$element-name"/>
                    <xsl:variable name="waarde" as="xs:string*">
                        <!-- only add unique entries -->
                        <xsl:for-each-group select="$adaxml-item" group-by="nf:getGroupingKeyDefault(.)">                            
                             <xsl:value-of select="nf:maak-waarde-basedon-valuedomain(.,$value-domain)"/>
                        </xsl:for-each-group>
                    </xsl:variable>
                    <xsl:attribute name="waarde" select="string-join($waarde, ' - ')"/>
                      
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="current-element"/>
    </xd:doc>
    <xsl:function name="nf:element-name" as="xs:string?">
        <xsl:param name="current-element"/>
        <xsl:variable name="local-name" select="$current-element/local-name()"/>
        <xsl:variable name="name">
            <xsl:choose>
                <xsl:when test="substring($local-name, string-length($local-name), 1) = 'q'">
                    <xsl:value-of select="concat(substring($local-name, 1, string-length($local-name) - 1), '?')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$local-name"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="translate(nf:first-cap($name), '_', ' ')"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:first-cap" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:value-of select="concat(upper-case(substring($in, 1, 1)), substring($in, 2))"/>
    </xsl:function>



    <xd:doc>
        <xd:desc/>
        <xd:param name="code-in"/>
    </xd:doc>
    <xsl:function name="nf:element-code-waarde" as="xs:string?">
        <xsl:param name="code-in" as="element()?"/>
        <xsl:for-each select="$code-in[@originalText|@displayName|@codeSystem|@code|@codeSystemName]">
            <xsl:variable name="waarde" as="xs:string*">
                <xsl:value-of select="normalize-space(concat(./@originalText, ' ', ./@displayName))"/>
                <xsl:value-of select="concat(' (code = ''', ./@code, ''' in codeSystem ''')"/>
                <xsl:choose>
                    <xsl:when test="./@codeSystemName">
                        <xsl:value-of select="./@codeSystemName"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="./@codeSystem"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="''')'"/>
            </xsl:variable>
            <xsl:value-of select="normalize-space(string-join($waarde))"/>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="waarde"/>
        <xd:param name="eenheid"/>
    </xd:doc>
    <xsl:function name="nf:element-waarde" as="xs:string?">
        <xsl:param name="waarde"/>
        <xsl:param name="eenheid"/>
        <xsl:choose>
            <xsl:when test="$eenheid and $waarde castable as xs:double">
                <xsl:value-of select="concat($waarde, ' ', nf:unit-string($waarde, $eenheid))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="nf:first-cap(normalize-space(string-join($waarde, ' ')))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Maakt een waardestring gebaseerd op het valuedomain (datatype) uit de ada release file</xd:desc>
        <xd:param name="in">Het gegevenselement uit ada waar het om gaat</xd:param>
        <xd:param name="value-domain">Het waardedomein van dit gegevenselement</xd:param>
    </xd:doc>
    <xsl:function name="nf:maak-waarde-basedon-valuedomain" as="xs:string*">
        <xsl:param name="in" as="element()?"></xsl:param>
        <xsl:param name="value-domain" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$value-domain = ('string', 'text')">
                <!-- let's check if there is a date in here -->
                <xsl:choose>
                    <xsl:when test="substring($in/@value, 1, 10) castable as xs:date">
                        <xsl:value-of select="nf:formatDate($in/@value)"/>
                        <xsl:value-of select="concat(' ', nf:formatTime(nf:getTime($in/@value), true()))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- not a date, probably a T-string of some sort -->
                        <xsl:variable name="separated-pipe" select="tokenize($in/@value, '\|')" as="xs:string*"/>
                        <xsl:choose>
                            <xsl:when test="upper-case($separated-pipe[1]) = ('T', 'CURRENTDATE')">
                                <!-- T|-|P150D -->
                                <xsl:variable name="correction" select="replace($separated-pipe[3], 'P', '')"/>
                                <xsl:variable name="correction-timequantity" select="replace($correction, '[a-zA-Z\s]+', '')"/>
                                <xsl:variable name="correction-timeunit" select="replace($correction, '[0-9\s]+', '')"/>
                                <xsl:value-of select="string-join($separated-pipe[position() lt 3], ' ')"/>
                                <xsl:value-of select="concat(' ', $correction-timequantity, ' ')"/>
                                <xsl:choose>
                                    <xsl:when test="$correction-timeunit eq 'D'">dagen</xsl:when>
                                    <xsl:otherwise>Not yet supported time unit: "<xsl:value-of select="$correction-timeunit"/>"</xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$in/@value"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:when>
            <xsl:when test="$value-domain = ('count', 'decimal')">
                <xsl:value-of select="$in/@value"/>
            </xsl:when>
            <xsl:when test="$value-domain = ('boolean')">
                <xsl:choose>
                    <xsl:when test="lower-case($in/@value) = ('true', 'waar', 'ja')">Ja</xsl:when>
                    <xsl:when test="lower-case($in/@value) = ('false', 'onwaar', 'nee')">Nee</xsl:when>
                    <xsl:when test="$in/@nullFlavor">
                        <xsl:value-of select="concat('NullFlavor: ', $in/@nullFlavor)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$in/@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$value-domain = ('quantity', 'duration')">
                <xsl:value-of select="nf:element-waarde($in/@value, $in/@unit)"/>
            </xsl:when>
            <xsl:when test="$value-domain eq 'code'">
                <xsl:value-of select="nf:element-code-waarde($in)"/>
            </xsl:when>
            <xsl:when test="$value-domain eq 'identifier'">
                <xsl:choose>
                    <xsl:when test="$in/@root">
                        <xsl:value-of select="concat($in/@value, ' (in identificerend systeem: ', $in/@root, ')')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$in/@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$value-domain = ('date', 'datetime')">
                <xsl:choose>
                    <xsl:when test="substring($in/@value, 1, 10) castable as xs:date">
                        <xsl:value-of select="nf:formatDate($in/@value)"/>
                        <xsl:value-of select="concat(' ', nf:formatTime(nf:getTime($in/@value), true()))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- not a date, probably a T-string of some sort -->
                        <xsl:variable name="separated-pipe" select="tokenize($in/@value, '\|')" as="xs:string*"/>
                        <xsl:choose>
                            <xsl:when test="upper-case($separated-pipe[1]) = ('T', 'CURRENTDATE')">
                                <!-- T|-|P150D -->
                                <xsl:variable name="correction" select="replace($separated-pipe[3], 'P', '')"/>
                                <xsl:variable name="correction-timequantity" select="replace($correction, '[a-zA-Z\s]+', '')"/>
                                <xsl:variable name="correction-timeunit" select="replace($correction, '[0-9\s]+', '')"/>
                                <xsl:value-of select="string-join($separated-pipe[position() lt 3], ' ')"/>
                                <xsl:value-of select="concat(' ', $correction-timequantity, ' ')"/>
                                <xsl:choose>
                                    <xsl:when test="$correction-timeunit eq 'D'">dagen</xsl:when>
                                    <xsl:otherwise>Not yet supported time unit: "<xsl:value-of select="$correction-timeunit"/>"</xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
        
    </xsl:function>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="currentConcept"/>
    </xd:doc>
    <xsl:function name="nf:get-concept-type" as="xs:string">
        <xsl:param name="currentConcept"/>
        <xsl:value-of select="$adaReleaseFile/ada/applications/application/views/view[@transactionId eq $transactionId]/dataset[1]//concept[@id = $currentConcept/@conceptId]/@type"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="currentConcept"/>
    </xd:doc>
    <xsl:function name="nf:get-concept-value-domain" as="xs:string">
        <xsl:param name="currentConcept"/>
        <xsl:value-of select="$adaReleaseFile/ada/applications/application/views/view[@transactionId eq $transactionId]/dataset[1]//concept[@id = $currentConcept/@conceptId]/valueDomain/@type"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyDefault" as="xs:string?">
        <xsl:param name="in" as="element()?"/>
        <xsl:value-of select="normalize-space(upper-case(concat(string-join($in//@value, ''), string-join($in//@root, ''), string-join($in//@code, ''), string-join($in//@codeSystem, ''), string-join($in//@nullFlavor, ''))))"/>
    </xsl:function>
    


</xsl:stylesheet>
