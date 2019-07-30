<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="./../../tools/xsl_ada_2_wiki/adainstance_2_wikitable.xsl"/>
    <xsl:import href="./peri-functions.xsl"/>
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
    <!-- override ada release file and transaction to be handled -->
    <xsl:param name="adaReleaseFile" select="document('../../../projects/perinatologie/definitions/peri20-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.102</xsl:param>

    <xsl:param name="date-conversion-xml" select="document('./date_conversion-peri.xml')"/>
    <xsl:param name="do-ada-files" select="true()"/>
    <xsl:param name="doc-ada-new" select="document('./ada_new/kernset_geboortezorg_23.xml')"/>


    <!-- donkerblauw -->
    <xsl:variable name="tabelkop-achtergrond-kleur">#1F497D;</xsl:variable>
    <xsl:variable name="tabelkop-font-kleur">white</xsl:variable>
    <!-- grijzig -->
    <xsl:variable name="element-achtergrond-kleur">#E3E3E3;</xsl:variable>
    <xsl:variable name="elementwaarde-achtergrond-kleur">white</xsl:variable>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:text>
__NUMBEREDHEADINGS__
{{{IssueBox|Deze pagina is nog in bewerking}}
[[Bestand:Nictiz_logo_PO_rechts_rgb.png |link=https://www.nictiz.nl/|rechts|Naar nictiz.nl]]

=Addenda voor inhoudelijke gegevens=</xsl:text>
        <xsl:apply-templates select="adaxml/data/*"/>
        <xsl:text>
[[Categorie:Kwalificatie]]</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc>Override of the adaxml/data template from the imported stylesheet ADA2test-wiki-table.xsl. Makes it a bit nicer for Peri</xd:desc>
    </xd:doc>
    <xsl:template match="adaxml/data/*">
        <xsl:variable name="vrouw" select="vrouw"/>
        <xsl:variable name="vrouw-bsn" select="$vrouw/burgerservicenummer/@value"/>
        <!-- Build a variable tabel which is tailored for output in documentation, such as wiki -->
        <xsl:variable name="tabel" as="element()">
            <tabellen xmlns="">
                <!-- tabel voor vrouw -->
                <xsl:apply-templates select="$vrouw" mode="maak-tabel"/>
                <!-- tabel voor anamnese -->
                <xsl:apply-templates select="$vrouw/anamnese" mode="maak-tabel"/>
                <!-- tabellen voor de rest -->
                <xsl:apply-templates select="./(zorgverlening | zorgverlenerzorginstelling | obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap | zwangerschap | bevalling | uitkomst_per_kind | medisch_onderzoek | postnatale_fase)" mode="maak-tabel"/>
            </tabellen>
        </xsl:variable>
        <xsl:text>
==Scenario </xsl:text>
        <xsl:value-of select="./@title"/>
        <xsl:text> (voor vrouw met BSN: </xsl:text>
        <xsl:value-of select="normalize-space(string-join($vrouw-bsn, ' '))"/>
        <xsl:text>)==
</xsl:text>
        <xsl:value-of select="concat('&lt;section begin=', $vrouw-bsn, ' /&gt;')"/>
        <xsl:apply-templates select="$tabel/tabel[@type eq 'vrouw']"/>
        <xsl:value-of select="concat('&lt;section end=', $vrouw-bsn, ' /&gt;')"/>
        <xsl:for-each select="$tabel/tabel[not(@type eq 'vrouw')]">
            <xsl:text>
=== </xsl:text>
            <xsl:value-of select="./@title"/>
            <xsl:text> ===
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=', ./@type, '_', $vrouw-bsn, ' /&gt;')"/>
            <xsl:apply-templates select="."/>
            <xsl:value-of select="concat('&lt;section end=', ./@type, '_', $vrouw-bsn, ' /&gt;')"/>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a nested 'tabel' from which it is easy to generate wiki or other documentation</xd:desc>
        <xd:param name="in">The ada vrouw which contents are rendered in the nested 'tabel'</xd:param>
    </xd:doc>
    <xsl:template name="tabel-vrouw" match="vrouw" mode="maak-tabel">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <tabel xmlns="" type="{./local-name()}" title="Vrouw">
                <xsl:apply-templates select="./*[not(local-name() eq 'anamnese')]" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="xs:int(1)"/>
                </xsl:apply-templates>
            </tabel>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a nested 'tabel' from which it is easy to generate wiki or other documentation</xd:desc>
        <xd:param name="in">The ada vrouw template which contents are rendered in the 'tabel'</xd:param>
        <xd:param name="adaxml-vrouw">The collection of ada vrouw containing test data</xd:param>
    </xd:doc>
    <xsl:template name="tabel-vrouw-dekkingsgraad" match="vrouw" mode="maak-tabel-vrouw-dekkingsgraad">
        <xsl:param name="in" select="."/>
        <xsl:param name="adaxml-vrouw" as="element(vrouw)*"/>
        <xsl:for-each select="$in">
            <tabel xmlns="" type="{./local-name()}" title="Vrouw">
                <xsl:apply-templates select="./*[not(local-name() eq 'anamnese')][not(ends-with(local-name(), '-start'))]" mode="maak-tabel-rij-dekkingsgraad">
                    <xsl:with-param name="level" select="xs:int(1)"/>
                    <xsl:with-param name="adaxml-element" select="$adaxml-vrouw"/>
                </xsl:apply-templates>
            </tabel>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>Template for dekkingsgraad making use of the ada_new instance as context. Supplies all fields.</xd:desc>
        <xd:param name="adaxml-gz">The adaxml instance(s) so that the coverage of the available fields from ada_new instance can be determined.</xd:param>
    </xd:doc>
    <xsl:template match="/kernset_geboortezorg" mode="dekkingsgraad">
        <xsl:param name="adaxml-gz" as="element(kernset_geboortezorg)*"/>
        <xsl:variable name="vrouw" select="./vrouw"/>
        <xsl:variable name="vrouw-bsn" select="string-join($adaxml-gz/vrouw/burgerservicenummer/@value, ' - ')"/>
        <!-- Build a variable tabel which is tailored for output in documentation, such as wiki -->
        <xsl:variable name="tabel" as="element()">
            <tabellen xmlns="">
                <!-- tabel voor vrouw -->
                <xsl:apply-templates select="$doc-ada-new/*/vrouw" mode="maak-tabel-vrouw-dekkingsgraad">
                    <xsl:with-param name="adaxml-vrouw" select="$adaxml-gz/vrouw"/>
                </xsl:apply-templates>
                <!-- tabel voor anamnese -->
                <xsl:apply-templates select="$doc-ada-new/*/vrouw/anamnese" mode="maak-tabel-dekkingsgraad">
                    <xsl:with-param name="adaxml-element" select="$adaxml-gz/vrouw/anamnese"/>
                </xsl:apply-templates>
                <!-- tabellen voor de rest -->
                <xsl:apply-templates select="./(zorgverlening | zorgverlenerzorginstelling | obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap | zwangerschap | bevalling | uitkomst_per_kind | medisch_onderzoek | postnatale_fase)" mode="maak-tabel-dekkingsgraad">
                    <xsl:with-param name="adaxml-element" select="$adaxml-gz/*"/>
                </xsl:apply-templates>
            </tabellen>
        </xsl:variable>
        <xsl:text>
==Scenario </xsl:text>
        <xsl:value-of select="./@title"/>
        <xsl:text> (voor vrouw met BSN: </xsl:text>
        <xsl:value-of select="normalize-space(string-join($vrouw-bsn, ' '))"/>
        <xsl:text>)==
</xsl:text>
        <xsl:value-of select="concat('&lt;section begin=', $vrouw-bsn, ' /&gt;')"/>
        <xsl:apply-templates select="$tabel/tabel[@type eq 'vrouw']"/>
        <xsl:value-of select="concat('&lt;section end=', $vrouw-bsn, ' /&gt;')"/>
        <xsl:for-each select="$tabel/tabel[not(@type eq 'vrouw')]">
            <xsl:text>
=== </xsl:text>
            <xsl:value-of select="./@title"/>
            <xsl:text> ===
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=', ./@type, '_', $vrouw-bsn, ' /&gt;')"/>
            <xsl:apply-templates select="."/>
            <xsl:value-of select="concat('&lt;section end=', ./@type, '_', $vrouw-bsn, ' /&gt;')"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> change the birth year of 'vrouw' if so indicated by the date config xml</xd:desc>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>
    </xd:doc>
    <xsl:template match="vrouw/geboortedatum" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:variable name="output0time" select="false()" as="xs:boolean"/>
        <xsl:variable name="current-element" select="."/>
        <xsl:variable name="conversion-element">
            <xsl:sequence select="$date-conversion-xml//kernset_geboortezorg[@id eq $current-element/ancestor::kernset_geboortezorg/@id]/vrouw/geboortedatum"/>
        </xsl:variable>

        <xsl:variable name="new-date" as="element()">
            <geboortedatum>
                <xsl:attribute name="value">
                    <xsl:choose>
                        <xsl:when test="count($conversion-element/*) gt 0">
                            <xsl:variable name="years" select="translate($conversion-element/*/@dayTimeDuration, 'PY', '')"/>
                            <!-- Please note that with the HE Saxon version, only english output for format-date is supported, the PE version however uses the localisation of your system -->
                            <xsl:value-of select="replace(format-date(xs:date($conversion-element/*/@value), '[D] [Mn,*-3]'), 'maa', 'mrt')"/>
                            <xsl:value-of select="concat(' in het jaar: (jaar van ', $conversion-element/*/@base, ')')"/>
                            <xsl:if test="$years castable as xs:int and xs:int($years) gt 0">
                                <xsl:value-of select="concat(' ', $conversion-element/*/@sign, ' ', $years, ' ', nf:unit-string(xs:double($years), 'jaar'))"/>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$current-element/@value castable as xs:dateTime">
                                    <xsl:value-of select="nf:formatDate($current-element/@value)"/>
                                    <xsl:variable name="time" select="nf:formatTime(nf:getTime($current-element/@value), $output0time)"/>
                                    <xsl:value-of select="
                                            if ($time) then
                                                concat(', om ', $time)
                                            else
                                                ()"/>
                                </xsl:when>
                                <xsl:when test="$current-element/@value castable as xs:date">
                                    <xsl:value-of select="nf:formatDate($current-element/@value)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$current-element/@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </geboortedatum>
        </xsl:variable>
        <xsl:element name="gegevenselement" namespace="">
            <xsl:attribute name="level" select="$level"/>
            <xsl:attribute name="naam" select="nf:element-name(.)"/>
            <xsl:attribute name="waarde" select="nf:maak-waarde-basedon-valuedomain($new-date, nf:get-concept-value-domain(.))"/>
        </xsl:element>

    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a gegevenselement for the variable 'tabel' with a possibly configurable date</xd:desc>
        <xd:param name="level">The indent level in the table - defaults to 1 but should be passed</xd:param>
    </xd:doc>
    <xsl:template match="datum | datum_betrokkenheid | datum_controle | datum_einde_zorgverantwoordelijkheid | datum_start_zorgverantwoordelijkheid | datum_verwijzing | definitieve_a_terme_datum | geboortedatum[not(ancestor::vrouw)] |tijdstip_actief_meepersen |tijdstip_begin_actieve_ontsluiting |tijdstip_breken_vliezen | voeding_kind_datum" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:configurable-T-date-peri(., false())}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc> only vorige_baring is present in vorige_uitkomst_per_kind in dataset 2.3, so no reason to nest the vorige_baring under group 'vorige_uitkomst_per_kind'</xd:desc>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>
    </xd:doc>
    <xsl:template match="vorige_uitkomst_per_kind" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./vorige_baring" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Vorige uitkomst per kind - vorige baring</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="current-element">the ada xml element in the current bouwsteen that has a date to be converted</xd:param>
        <xd:param name="output0time">whether or not an input-time of 00:00 should be outputted in the text</xd:param>
    </xd:doc>
    <xsl:function name="nf:configurable-T-date-peri" as="xs:string">
        <xsl:param name="current-element" as="element()?"/>
        <xsl:param name="output0time" as="xs:boolean?"/>
        <xsl:variable name="ada-transaction-id" select="$current-element/ancestor::data/*/@id"/>
        <xsl:variable name="conversion_element">
            <xsl:choose>
                <xsl:when test="$current-element/local-name() = 'datum'">
                    <xsl:choose>
                        <xsl:when test="$current-element/ancestor::diagnose">
                            <!-- This only works because all of the test scenario's have max 1 diagnose group -->
                            <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]//diagnose/datum"/>
                        </xsl:when>
                        <xsl:when test="$current-element/ancestor::diagnoseinterventie_postpartum">
                             <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/postnatale_fase/diagnoseinterventie_postpartum/datum"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>                
                <xsl:when test="$current-element/local-name() = 'datum_betrokkenheid'">
                    <!-- take rangnummer kind in to account in case of multiple birth (twin or more) -->
                    <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/uitkomst_per_kind[not(rangnummer_kind) or not($current-element/ancestor::uitkomst_per_kind//rangnummer_kind) 
                        or rangnummer_kind/@value = $current-element/ancestor::uitkomst_per_kind//rangnummer_kind/@value]//*[local-name() eq $current-element/local-name()]"/>
                </xsl:when>
                <xsl:when test="$current-element/local-name() = 'geboortedatum'">
                    <xsl:choose>
                        <xsl:when test="$current-element/ancestor::vorige_baring">
                            <!-- This only works because all of the test scenario's have max 1 prior pregnancy and
                            all prior pregnancies only have one child, if this changes this part needs to be smarter-->
                            <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap/eerdere_bevalling/vorige_baring/geboortedatum"/>
                        </xsl:when>
                        <xsl:when test="$current-element/ancestor::uitkomst_per_kind">
                            <!-- take rangnummer kind in to account in case of multiple birth (twin or more) -->
                            <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/uitkomst_per_kind[not(rangnummer_kind) or not($current-element/../rangnummer_kind) or rangnummer_kind/@value = $current-element/../rangnummer_kind/@value]/geboortedatum"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$current-element/local-name() = 'definitieve_a_terme_datum'">
                    <xsl:choose>
                        <xsl:when test="$current-element/ancestor::obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap">
                            <!-- This only works because all of the test scenario's have max 1 prior pregnancy,
                                if this changes this part needs to be smarter-->
                            <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap/definitieve_a_terme_datum"/>
                        </xsl:when>
                        <xsl:when test="$current-element/ancestor::zwangerschap">
                            <!-- take rangnummer kind in to account in case of multiple birth (twin or more) -->
                            <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/zwangerschap/definitieve_a_terme_datum"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$current-element/local-name() = ('tijdstip_breken_vliezen', 'tijdstip_actief_meepersen')">
                    <!-- take rangnummer kind in to account in case of multiple birth (twin or more) -->
                    <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/uitkomst_per_kind[not(rangnummer_kind) or not($current-element/../../demografische_gegevens/rangnummer_kind) or rangnummer_kind/@value = $current-element/../../demografische_gegevens/rangnummer_kind/@value]/*[local-name() = $current-element/local-name()]"/>
                    
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]//*[local-name() eq $current-element/local-name()]"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="string-output" as="xs:string*">
            <xsl:choose>
                <xsl:when test="count($conversion_element/*) gt 0">
                    <xsl:variable name="days" select="translate($conversion_element/*/@dayTimeDuration, 'PD', '')"/>
                    <xsl:value-of select="$conversion_element/*/@base"/>
                    <xsl:if test="$days castable as xs:int and xs:int($days) gt 0">
                        <xsl:value-of select="concat($conversion_element/*/@sign, ' ', $days, ' ', nf:unit-string(xs:double($days), 'dag'))"/>
                    </xsl:if>
                    <xsl:if test="$current-element/@value castable as xs:dateTime">
                        <xsl:variable name="time" select="nf:formatTime(nf:getTime($current-element/@value), $output0time)"/>
                        <xsl:value-of select="
                                if ($time) then
                                    concat(', om ', $time)
                                else
                                    ()"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="$current-element/@value castable as xs:dateTime">
                            <xsl:value-of select="nf:formatDate($current-element/@value)"/>
                            <xsl:variable name="time" select="nf:formatTime(nf:getTime($current-element/@value), $output0time)"/>
                            <xsl:value-of select="
                                    if ($time) then
                                        concat(', om ', $time)
                                    else
                                        ()"/>
                        </xsl:when>
                        <xsl:when test="$current-element/@value castable as xs:date">
                            <xsl:value-of select="nf:formatDate($current-element/@value)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$current-element/@value"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="normalize-space(string-join($string-output, ''))"/>
    </xsl:function>


     <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:zorgaanbieder-string" as="xs:string*">
        <xsl:param name="in" as="element()?"/>
        <xsl:value-of select="string-join($in/zorgaanbieder/zorgaanbieder_identificatie_nummer//concat(@root, ' - ', @value), ' ')"/>
        <xsl:value-of select="string-join($in/zorgaanbieder/organisatie_naam//@value, ' ')"/>
        <xsl:if test="$in//afdeling_specialisme/@displayName">
            <xsl:value-of select="concat(' - ', $in//specialisme/@displayName, '. ')"/>
        </xsl:if>
        <xsl:value-of select="string-join($in/zorgaanbieder/adres//string-join(@value | @displayName, ' - '), ' ')"/>
        <xsl:value-of select="string-join($in/zorgaanbieder/telefoon_email//string-join(@value | @displayName, ' - '), ' ')"/>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:zorgverlener-string" as="xs:string*">
        <xsl:param name="in" as="element()?"/>
        <xsl:value-of select="string-join($in/zorgverlener/zorgverlener_naam//@value, ' ')"/>
        <xsl:if test="$in//specialisme/@displayName">
            <xsl:value-of select="concat(' - ', $in//specialisme/@displayName, '. ')"/>
        </xsl:if>
        <xsl:value-of select="string-join($in//zorgaanbieder/organisatie_naam/@value, ' ')"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:persoon-string" as="xs:string*">
        <xsl:param name="in" as="element(persoon)?"/>
        <xsl:value-of select="string-join($in/naamgegevens//@value, ' ')"/>
        <xsl:if test="$in/rol_of_functie/@displayName">
            <xsl:value-of select="concat(' - ', $in/rol_of_functie/@displayName, '. ')"/>
        </xsl:if>
        <xsl:value-of select="string-join($in/adresgegevens//@value, ' ')"/>
    </xsl:function>



</xsl:stylesheet>
