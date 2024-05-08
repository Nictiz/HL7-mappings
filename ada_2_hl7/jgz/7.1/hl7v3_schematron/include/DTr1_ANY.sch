<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 ANY - ANY 
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="ANY">
    <!-- partType, integrityCheckAlgorithm='SHA-1', mediaType='text/plain', represention='TXT', inclusive='true' 
        are or have an XML schema default. Latest versions of Saxon 9.7.0.19 will assume this schema default if the instance doesn't carry it and bark even without the instance carrying the attribute. -->
   <assert role="error"
           test="every $elm in descendant-or-self::* satisfies $elm[             not(@nullFlavor) or             (@nullFlavor                        and not(@* except (@xsi:type|@xsi:nil|@classCode|@typeCode|@determinerCode|@moodCode|@nullFlavor|@partType|@codeSystem[. =  '2.16.840.1.113883.5.139']|@codeSystemName[. = 'TimingEvent']|@integrityCheckAlgorithm[. = 'SHA-1']|@inverted[. = 'false']|@mediaType[. = 'text/plain']|@operator[. = 'I']|@representation[. = 'TXT']|@inclusive[. = 'true']|@unit[. = '1']) | * | text()[string-length(normalize-space()) gt 0])) or             (@nullFlavor = ('OTH', 'NA', 'UNC') and not(@* except (@xsi:type|@xsi:nil|@*:valueSet|@*:valueSetVersion|@codeSystem|@codeSystemName|@codeSystemVersion|@extension|@nullFlavor|@partType|@integrityCheckAlgorithm[. = 'SHA-1']|@mediaType[. = 'text/plain']|@operator[. = 'I']|@representation[. = 'TXT']|@inclusive[. = 'true']|@unit[. = '1'])) and (@extension | @codeSystem | *[local-name()='originalText'] | *[local-name()='translation']))         ]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ANY">dtr1-1-ANY: if there is a nullFlavor, there shall be no text or other attribute or element, unless it's nullFlavor='OTH' or 'NA' 
        (@codeSystem, &lt;originalText&gt; or &lt;translation&gt; may have a value), or nullFlavor 'UNC' (@extension or &lt;originalText&gt; may have a value). Found: &lt;<value-of select="name()"/>
      <value-of select="for $att in (@* except @nullFlavor) return concat(' ', name($att), '=&#34;', $att, '&#34;')"/>&gt;<value-of select="for $elm in * return concat('&lt;', name($elm), '... /&gt;')"/>&lt;/<value-of select="name()"/>&gt;</assert>
</rule>
