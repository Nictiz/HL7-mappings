<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to update ADA xml using a date conversion config xml.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2019-04-29 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <!-- override ada release file and transaction to be handled -->
    <xsl:param name="adaReleaseFile" select="document('../../../projects/perinatologie/definitions/peri20-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.102</xsl:param>

    <xsl:param name="date-conversion-xml" select="document('./date_conversion-peri.xml')"/>
    <xsl:param name="do-ada-files" select="true()"/>
    <xsl:param name="param-date-T" as="xs:date"/>

    <xsl:variable name="datum-T" as="xs:date">
        <xsl:choose>
            <xsl:when test="$param-date-T castable as xs:date">
                <xsl:value-of select="$param-date-T"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="xs:date($date-conversion-xml/date_conversion/datum_T/@value)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>


    <xd:doc>
        <xd:desc>Updates the date in the value attribute based on configuration date conversion xml</xd:desc>
    </xd:doc>
    <xsl:template match="
            zorgverlening/datum_start_zorgverantwoordelijkheid 
            | zorgverlening/datum_einde_zorgverantwoordelijkheid 
            | zorgverlening/verwijsdetails/datum_verwijzing 
            | vrouw/geboortedatum  
            | obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap/definitieve_a_terme_datum 
            | vorige_baring/demografische_gegevens/geboortedatum 
            | zwangerschap/definitieve_a_terme_datum 
            | zwangerschap/prenatale_controle/datum_controle
            | zwangerschap/diagnose/datum
            | bevalling/tijdstip_begin_actieve_ontsluiting
            | uitkomst_per_kind/baring/demografische_gegevens/geboortedatum
            | uitkomst_per_kind/baring/demografische_gegevens//datumtijd_vaststelling_perinatale_sterfte
            | uitkomst_per_kind/baring/kindspecifieke_maternale_gegevens/tijdstip_breken_vliezen
            | uitkomst_per_kind/baring/kindspecifieke_maternale_gegevens/tijdstip_actief_meepersen
            | uitkomst_per_kind/baring/kindspecifieke_uitkomstgegevens/betrokkenheid_kinderarts/datum_betrokkenheid
            | postnatale_fase/diagnoseinterventie_postpartum/datum
            | postnatale_fase//voeding_kind_datum
            ">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="value" select="concat(nf:adjusted-T-date-peri(.), substring(@value, 11))"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc>Basis copy template, copies everything from input to output</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Updates a date in the input ada xml element to a date based on configurable T from input date conversion xml</xd:desc>
        <xd:param name="current-element">the ada xml element that has a date to be converted</xd:param>
    </xd:doc>
    <xsl:function name="nf:adjusted-T-date-peri" as="xs:date">
        <xsl:param name="current-element" as="element()?"/>
        <xsl:variable name="ada-transaction-id" select="$current-element/ancestor::data/*/@id"/>
        <xsl:variable name="date-input">
            <xsl:choose>
                <xsl:when test="$current-element/@value castable as xs:dateTime">
                    <xsl:value-of select="xs:date(format-dateTime($current-element/@value, '[Y0001]-[M01]-[D01]'))"/>
                </xsl:when>
                <xsl:when test="$current-element/@value castable as xs:date">
                    <xsl:value-of select="$current-element/@value"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$current-element/@value"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="conversion_element">
            <xsl:choose>
                <xsl:when test="$current-element/local-name() = 'datum'">
                    <xsl:choose>
                        <xsl:when test="$current-element/ancestor::diagnose">
                            <!-- This only works because all of the test scenario's have max 1 diagnose group-->
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
                        <xsl:when test="$current-element/ancestor::vrouw">
                            <xsl:sequence select="$date-conversion-xml//*[@id = $ada-transaction-id]/vrouw/geboortedatum"/>
                        </xsl:when>
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
        <xsl:variable name="date-output" as="xs:date?">
            <xsl:choose>
                <xsl:when test="count($conversion_element/*) = 1">
                    <xsl:variable name="days" select="translate($conversion_element/*/@dayTimeDuration, 'PD', '')"/>
                    <xsl:choose>
                        <xsl:when test="contains($conversion_element/*/@dayTimeDuration, 'Y')">
                            <xsl:variable name="datum-T-year" as="xs:integer" select="year-from-date($datum-T)"/>
                            <xsl:variable name="years" select="xs:integer(translate($conversion_element/*/@dayTimeDuration, 'PY', ''))"/>
                            <xsl:variable name="new-year" as="xs:integer">
                                <xsl:choose>
                                    <xsl:when test="$conversion_element/*/@sign = ('+', 'plus', 'and')">
                                        <xsl:value-of select="$datum-T-year + $years"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$datum-T-year - $years"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="xs:date(concat($new-year, substring($date-input, 5, 6)))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- assume days -->
                            <xsl:choose>
                                <xsl:when test="$conversion_element/*/@sign = ('+', 'plus', 'and')">
                                    <xsl:value-of select="$datum-T + xs:dayTimeDuration($conversion_element/*/@dayTimeDuration)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$datum-T - xs:dayTimeDuration($conversion_element/*/@dayTimeDuration)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$date-input"/>

                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$date-output"/>
    </xsl:function>



</xsl:stylesheet>
