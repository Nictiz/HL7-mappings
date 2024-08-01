<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:nfa2a="http://www.nictiz.nl/functions/ada2ada" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="ada_2_ada_mp.xsl"/>
    <xsl:import href="../../../util/uuid.xsl"/>
    <xsl:import href="../../../util/mp-functions.xsl"/>
    <xsl:import href="../../../util/datetime.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- the macAddress for uuid generation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xd:doc>
        <xd:desc>Start template</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <!-- first add reference id's, which we need to add reference to groups that will be in bouwstenen group -->
        <xsl:variable name="newAdaXmlRefId" as="element()?">
            <xsl:apply-templates select="@* | node()" mode="addReferenceId"/>
        </xsl:variable>
        <xsl:apply-templates select="$newAdaXmlRefId" mode="ada907_2_920"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Add a temp reference id for the groups that will be moved to bouwstenen group</xd:desc>
    </xd:doc>
<!--    <xsl:template match="(product | zorgverlener[not(zorgverlener)] | zorgaanbieder[not(zorgaanbieder)][not(ancestor::documentgegevens)] | contactpersoon | informant/persoon)[not(adaextension/reference_id/@value)]" mode="addReferenceId">-->
    <!-- Match expression was not XSLT2 compliant. Changed to: -->
    <xsl:template match="product[not(adaextension/reference_id/@value)] | zorgverlener[not(zorgverlener)][not(adaextension/reference_id/@value)] | zorgaanbieder[not(zorgaanbieder)][not(ancestor::documentgegevens)][not(adaextension/reference_id/@value)] | contactpersoon[not(adaextension/reference_id/@value)] | informant/persoon[not(adaextension/reference_id/@value)]" mode="addReferenceId">
        <xsl:variable name="precedingNodesCount" select="count(preceding::*[local-name() = current()/local-name()])"/>

        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="addReferenceId"/>
            <adaextension>
                <reference_id value="{concat('ada2ada_', local-name(), '_', $precedingNodesCount + 1)}"/>
            </adaextension>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> add schema, should be overridden from a calling use case specific xslt </xd:desc>
    </xd:doc>
    <xsl:template match="adaxml" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">../../../9.2.0/<xsl:value-of select="data/*/local-name()"/>/ada_schemas/ada_<xsl:value-of select="data/*/local-name()"/>.xsd</xsl:attribute>
            <xsl:apply-templates select="node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> update top level element </xd:desc>
    </xd:doc>
    <xsl:template match="adaxml/data/*" mode="ada907_2_920">
        <xsl:copy>
            <!-- bestaande attributen kopiëren -->
            <xsl:apply-templates select="@*" mode="#current"/>
            <!-- app en formName attribuut alsnog overschrijven -->
            <xsl:attribute name="app">mp-mp92</xsl:attribute>
            <xsl:variable name="mapTrans" select="$mapTransaction[@usecase = local-name(current())]/mp920"/>
            <!-- transaction attributes -->
            <xsl:attribute name="formName" select="$mapTrans/@formName"/>
            <xsl:attribute name="transactionRef" select="$mapTrans/@transactionRef"/>
            <xsl:attribute name="transactionEffectiveDate" select="$mapTrans/@transactionEffectiveDate"/>

            <xsl:apply-templates select="patient | medicamenteuze_behandeling" mode="#current"/>

            <!-- the bouwstenen stuff -->
            <xsl:variable name="theBouwstenen" as="element()">
                <bouwstenen>
                    <xsl:for-each-group select=".//informant/persoon[not(rol_of_functie[@code = '2'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.4'])]" group-by="adaextension/reference_id/@value">
                        <contactpersoon>
                            <xsl:attribute name="id" select="adaextension/reference_id/@value"/>
                            <xsl:apply-templates select="node()" mode="#current"/>
                        </contactpersoon>
                    </xsl:for-each-group>
                    <xsl:for-each-group select=".//product" group-by="adaextension/reference_id/@value">
                        <farmaceutisch_product>
                            <xsl:attribute name="id" select="adaextension/reference_id/@value"/>
                            <xsl:apply-templates select="node()" mode="#current"/>
                        </farmaceutisch_product>
                    </xsl:for-each-group>
                    <xsl:for-each-group select=".//zorgverlener[not(zorgverlener)]" group-by="adaextension/reference_id/@value">
                        <xsl:copy>
                            <xsl:attribute name="id" select="adaextension/reference_id/@value"/>
                            <!-- zorgverlener_identificatienummer 1..* R, but we may not have it -->
                            <xsl:choose>
                                <xsl:when test="not((zorgverlener_identificatienummer | zorgverlener_identificatie_nummer)[@value | @nullFlavor | @root])">
                                    <zorgverlener_identificatienummer nullFlavor="NI"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer)" mode="#current"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- naamgegevens -->
                            <xsl:apply-templates select="zorgverlener_naam | naamgegevens" mode="#current"/>
                            <xsl:apply-templates select="specialisme" mode="#current"/>
                            <!-- copy the other elements -->
                            <xsl:apply-templates select="node()[not(self::zorgverlener_identificatienummer | self::zorgverlener_identificatie_nummer | self::zorgverlener_naam | self::naamgegevens | self::specialisme)]" mode="#current"/>
                        </xsl:copy>
                    </xsl:for-each-group>
                    <!-- and the thuiszorg professionals see issue https://bits.nictiz.nl/browse/ZIB-1075 -->
                    <xsl:for-each-group select=".//informant/persoon[rol_of_functie[@code = '2'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.4']]" group-by="adaextension/reference_id/@value">
                        <xsl:variable name="zaId" select="generate-id(.)"/>
                        <zorgverlener>
                            <xsl:attribute name="id" select="adaextension/reference_id/@value"/>
                            <!-- zorgverlener identificatienummer is 1..* R, maar we hebben die niet in 907 -->
                            <zorgverlener_identificatienummer nullFlavor="NI"/>
                            <xsl:apply-templates select="naamgegevens" mode="#current"/>
                            <xsl:apply-templates select="adresgegevens" mode="#current"/>
                            <zorgaanbieder>
                                <zorgaanbieder datatype="reference" value="{$zaId}"/>
                            </zorgaanbieder>
                        </zorgverlener>
                        <zorgaanbieder id="{$zaId}">
                            <!-- zorgaanbieder identificatienummer en naam is 1..x R, maar we hebben die niet in 907 -->
                            <zorgaanbieder_identificatienummer nullFlavor="NI"/>
                            <organisatie_naam nullFlavor="NI"/>
                            <!-- adresgegevens not in 907 either, but required in 920, see MP-407 -->
                            <adresgegevens>
                                <straat/>
                                <huisnummer/>
                                <postcode/>
                                <woonplaats/>
                            </adresgegevens>
                            <!-- organisatieType not yet MP 920 transacties, so will give ada schema error, see MP-408 -->
                            <organisatie_type code="T2" displayName="Thuiszorg" codeSystem="{$oidRoleCodeNLOrganizations}" codeSystemName="{$oidMap[@oid=$oidRoleCodeNLOrganizations]/@displayName}"/>
                        </zorgaanbieder>
                    </xsl:for-each-group>
                    <xsl:for-each-group select=".//zorgaanbieder[not(zorgaanbieder)][not(ancestor::documentgegevens)]" group-by="adaextension/reference_id/@value">
                        <xsl:copy>
                            <xsl:attribute name="id" select="adaextension/reference_id/@value"/>
                            <!-- zorgaanbieder_identificatienummer 1..* R, but we may not have it -->
                            <xsl:choose>
                                <xsl:when test="not((zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer)[@value | @nullFlavor | @root])">
                                    <zorgaanbieder_identificatienummer nullFlavor="NI"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer)" mode="#current"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- organisatie_naam 1..1 R, but we may not have it -->
                            <xsl:choose>
                                <xsl:when test="not(organisatie_naam[@value])">
                                    <organisatie_naam nullFlavor="NI"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="organisatie_naam" mode="#current"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:apply-templates select="node()[not(self::zorgaanbieder_identificatienummer | self::zorgaanbieder_identificatie_nummer | self::organisatie_naam)]" mode="#current"/>
                        </xsl:copy>
                    </xsl:for-each-group>
                    <xsl:if test="self::sturen_medicatievoorschrift">
                        <xsl:for-each select="medicamenteuze_behandeling/medicatieafspraak/lichaamslengte">
                            <xsl:copy>
                                <xsl:apply-templates select="@* | node()" mode="#current"/>
                            </xsl:copy>
                        </xsl:for-each>
                        <xsl:for-each select="medicamenteuze_behandeling/medicatieafspraak/lichaamsgewicht">
                            <xsl:copy>
                                <xsl:apply-templates select="@* | node()" mode="#current"/>
                            </xsl:copy>
                        </xsl:for-each>
                    </xsl:if>
                </bouwstenen>
            </xsl:variable>
            <xsl:if test="$theBouwstenen/*">
                <xsl:copy-of select="$theBouwstenen"/>
            </xsl:if>
            <xsl:apply-templates select="documentgegevens | voorstelgegevens" mode="#current"/>

        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> handling for medicatieafspraak, mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:apply-templates select="identificatie | afspraakdatum" mode="#current"/>
            <!-- gebruiksperiode -->
            <!-- zijn er gegevens voor gebruiksperiode, structuur is anders in 9.2.0 -->
            <xsl:if test="(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @unit | @nullFlavor]">
                <xsl:call-template name="_handleGebruiksperiode"/>
            </xsl:if>
            <xsl:apply-templates select="*[not(self::identificatie | self::afspraakdatum)]" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Gebruiksinstructie/HerhaalperiodeCyclischSchema/@unit=dag (920)
            Gebruiksinstructie/HerhaalperiodeCyclischSchema/@unit=d (907)
        </xd:desc>
    </xd:doc>
    <xsl:template match="herhaalperiode_cyclisch_schema" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:attribute name="unit">
                <xsl:value-of select="replace(@unit, '^d$', 'dag')"/>
            </xsl:attribute>
        </xsl:copy>
    </xsl:template>



    <xd:doc>
        <xd:desc> handling for verstrekkingsverzoek, only for non-reference transactions, so with proper 907 conceptId. Mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek[not(@conceptId) or @conceptId = '2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19963']" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:apply-templates select="identificatie | datum | auteur" mode="#current"/>
            <xsl:apply-templates select="te_verstrekken_geneesmiddel" mode="#current"/>
            <xsl:apply-templates select="te_verstrekken_hoeveelheid" mode="#current"/>
            <xsl:apply-templates select="*[not(self::identificatie | self::datum | self::auteur | self::te_verstrekken_geneesmiddel | self::te_verstrekken_hoeveelheid)]" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> Handle relaties_ketenzorg to relatie_contact and/or relatie_zorgepisode</xd:desc>
    </xd:doc>
    <xsl:template match="relaties_ketenzorg" mode="ada907_2_920">

        <xsl:for-each select="identificatie_contactmoment">
            <relatie_contact>
                <identificatienummer>
                    <xsl:apply-templates select="@*" mode="#current"/>
                </identificatienummer>
            </relatie_contact>
        </xsl:for-each>

        <xsl:for-each select="identificatie_episode">
            <relatie_zorgepisode>
                <identificatienummer>
                    <xsl:apply-templates select="@*" mode="#current"/>
                </identificatienummer>
            </relatie_zorgepisode>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc>handling for toedieningsafspraak</xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsafspraak" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:apply-templates select="identificatie | afspraakdatum" mode="#current"/>
            <!-- gebruiksperiode -->
            <!-- zijn er gegevens voor gebruiksperiode, structuur is anders in 9.2.0 -->
            <xsl:if test="(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @unit | @nullFlavor]">
                <xsl:call-template name="_handleGebruiksperiode"/>
            </xsl:if>
            <xsl:apply-templates select="*[not(self::identificatie | self::afspraakdatum)]" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>handling for toedieningsafspraak aanvullende_informatie</xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsafspraak/aanvullende_informatie" mode="ada907_2_920">
        <!-- code to string datatype -->
        <toedieningsafspraak_aanvullende_informatie value="{nfa2a:code-2-string(.)}"/>        
    </xsl:template>

    <xd:doc>
        <xd:desc>handling for toedieningsafspraak reden_afspraak</xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsafspraak/reden_afspraak" mode="ada907_2_920">
        <!-- change of string datatype to code -->
        <toedieningsafspraak_reden_wijzigen_of_staken code="OTH" codeSystem="{$oidHL7NullFlavor}" displayName="overig" originalText="{@value}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>handling for verstrekking aanvullende_informatie</xd:desc>
    </xd:doc>
    <xsl:template match="verstrekking/aanvullende_informatie" mode="ada907_2_920">
        <medicatieverstrekking_aanvullende_informatie>
            <xsl:apply-templates select="@* | node()" mode="ada907_2_920"/>
        </medicatieverstrekking_aanvullende_informatie>
    </xsl:template>


    <xd:doc>
        <xd:desc> handling for verstrekking, mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="verstrekking" mode="ada907_2_920">
        <medicatieverstrekking>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </medicatieverstrekking>
    </xsl:template>


    <xd:doc>
        <xd:desc> handling for medicatie_gebruik, mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_gebruik" mode="ada907_2_920">
        <medicatiegebruik>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:apply-templates select="identificatie | registratiedatum | gebruik_indicator | volgens_afspraak_indicator | stoptype" mode="#current"/>
            <!-- zijn er gegevens voor gebruiksperiode, structuur is anders in 9.2.0 -->
            <xsl:if test="(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @unit | @nullFlavor]">
                <xsl:call-template name="_handleGebruiksperiode"/>
            </xsl:if>
            <xsl:apply-templates select="*[not(self::identificatie | self::registratiedatum | self::gebruik_indicator | self::volgens_afspraak_indicator | self::stoptype)]" mode="#current"/>
        </medicatiegebruik>
    </xsl:template>


    <xd:doc>
        <xd:desc> do not copy the original gebruiksperiode stuff, they are handled ín the mp building block </xd:desc>
    </xd:doc>
    <xsl:template match="gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode" mode="ada907_2_920"/>

    <xd:doc>
        <xd:desc>Handle toedieningsschema, order of elements. We do have ada schema with is_flexibel, but in different order </xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsschema" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:apply-templates select="node()[not(self::is_flexibel | self::interval)]" mode="#current"/>
            <xsl:apply-templates select="is_flexibel | interval" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>datatype has been updated from dateTime to time</xd:desc>
    </xd:doc>
    <xsl:template match="toedientijd" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:attribute name="datatype">time</xsl:attribute>
            <xsl:attribute name="value">
                <xsl:choose>
                    <xsl:when test="@value castable as xs:dateTime">
                        <xsl:value-of select="substring-after(@value, 'T')"/>
                    </xsl:when>
                    <xsl:when test="@value castable as xs:time">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="starts-with(@value, 'T')">
                        <xsl:value-of select="replace(@value, '.+\{(.+)\}', '$1')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>handling for verstrekkingsverzoek/verbruiksperiode, different concept naming from zibs 2020</xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek/verbruiksperiode" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>

            <xsl:for-each select="ingangsdatum[@value | @nullFlavor]">
                <start_datum_tijd>
                    <xsl:apply-templates select="@*" mode="#current"/>
                </start_datum_tijd>
            </xsl:for-each>
            <xsl:for-each select="einddatum[@value | @nullFlavor]">
                <eind_datum_tijd>
                    <xsl:apply-templates select="@*" mode="#current"/>
                </eind_datum_tijd>
            </xsl:for-each>
            <xsl:for-each select="duur[@value | @unit | @nullFlavor]">
                <tijds_duur>
                    <xsl:apply-templates select="@*" mode="#current"/>
                </tijds_duur>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc>move lichaamslengte en lichaamsgewicht </xd:desc>
    </xd:doc>
    <xsl:template match="lichaamslengte | lichaamsgewicht" mode="ada907_2_920"/>

    <xd:doc>
        <xd:desc>sturen_medicatievoorschrift, TODO: adapt for 920</xd:desc>
    </xd:doc>
    <xsl:template match="sturen_medicatievoorschrift" mode="ada907_2_920">
        <xsl:copy>
            <!-- attributen kopiëren -->
            <xsl:apply-templates select="@*" mode="#current"/>
            <!-- update the app attribute -->
            <xsl:attribute name="app">mp-mp92</xsl:attribute>
            <xsl:apply-templates select="patient | medicamenteuze_behandeling" mode="#current"/>
            <xsl:for-each select="medicamenteuze_behandeling/medicatieafspraak/(lichaamslengte | lichaamsgewicht)">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> datum van 9.0.7 naar 9 2.0 </xd:desc>
    </xd:doc>
    <!--<xsl:template match="(medicatieafspraak | toedieningsafspraak)/afspraakdatum" mode="ada907_2_920">-->
    <!-- Match expression was not XSLT2 compliant. Changed to: -->
    <xsl:template match="medicatieafspraak/afspraakdatum | toedieningsafspraak/afspraakdatum" mode="ada907_2_920">
        <xsl:element name="{concat(local-name(..), '_datum_tijd')}">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> datum van 9.0.7 naar 9 2.0 </xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek/datum" mode="ada907_2_920">
        <xsl:element name="{concat(local-name(..), '_datum_tijd')}">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> datum van 9.0.7 naar 9 2.0 </xd:desc>
    </xd:doc>
    <xsl:template match="verstrekking/aanschrijfdatum" mode="ada907_2_920">
        <xsl:element name="aanschrijf_datum">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:element>
    </xsl:template>


    <xd:doc>
        <xd:desc> replacement of terminology codes for reden wijzigen staken </xd:desc>
    </xd:doc>
    <xsl:template match="reden_wijzigen_of_staken | reden_wijzigen_of_stoppen_gebruik" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:for-each select="$mapRedenwijzigenstaken[mp907[@code = current()/@code][@codeSystem = current()/@codeSystem]][mp920]">
                <xsl:copy-of select="mp920/@*"/>
                <!-- but we do want to keep the original displayName, if present -->
                <xsl:if test="string-length(@displayName) gt 0"><xsl:copy-of select="@displayName"></xsl:copy-of></xsl:if>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> handling for doseerinstructie, mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="doseerinstructie" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="doseerduur" mode="#current"/>
            <xsl:apply-templates select="volgnummer" mode="#current"/>
            <xsl:apply-templates select="*[not(self::doseerduur | self::volgnummer)]" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="criterium/code" mode="ada907_2_920">
        <criterium>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </criterium>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="toedieningsduur" mode="ada907_2_920">
        <xsl:copy>
            <tijds_duur>
                <xsl:apply-templates select="@* | node()" mode="#current"/>
            </tijds_duur>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="verstrekking/datum" mode="ada907_2_920">
        <medicatieverstrekkings_datum_tijd>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </medicatieverstrekkings_datum_tijd>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="medicatie_gebruik/registratiedatum" mode="ada907_2_920">
        <medicatiegebruik_datum_tijd>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </medicatiegebruik_datum_tijd>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="medicatie_gebruik/gerelateerde_afspraak/identificatie_medicatieafspraak" mode="ada907_2_920">
        <identificatie>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </identificatie>
    </xsl:template>

    <xd:doc>
        <xd:desc> stoptype van 9.0.7 naar 9 2.0 </xd:desc>
    </xd:doc>
    <!--<xsl:template match="(medicatieafspraak | toedieningsafspraak | medicatie_gebruik)/stoptype" mode="ada907_2_920">-->
    <!-- Match expression was not XSLT2 compliant. Changed to: -->
    <xsl:template match="medicatieafspraak/stoptype | toedieningsafspraak/stoptype | medicatie_gebruik/stoptype" mode="ada907_2_920">
        <xsl:element name="{concat(local-name(..), '_stop_type')}">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle zorgverlener</xd:desc>
    </xd:doc>
    <xsl:template match="voorschrijver | verstrekkingsverzoek/auteur | auteur_is_zorgverlener | informant_is_zorgverlener" mode="ada907_2_920">
        <xsl:copy>
            <zorgverlener datatype="reference" value="{zorgverlener/adaextension/reference_id/@value}"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> remove double nesting of stuff which is sometimes still present in 9.0.7  </xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener/naamgegevens[naamgegevens] | zorgverlener/zorgverlener_naam[naamgegevens] | zorgaanbieder[not(parent::zorgverlener)][zorgaanbieder]" mode="ada907_2_920">
        <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:template>


    <xd:doc>
        <xd:desc>this is not a reference thing in the dataset, so override the default template that assumes it is</xd:desc>
    </xd:doc>
    <xsl:template match="documentgegevens/auteur/auteur_is_zorgaanbieder" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>this is not a reference thing in the dataset, so override the default template that assumes it is</xd:desc>
    </xd:doc>
    <xsl:template match="documentgegevens/auteur/auteur_is_zorgaanbieder/zorgaanbieder[not(zorgaanbieder_identificatienummer/(@value | @nullFlavor))]" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <zorgaanbieder_identificatienummer nullFlavor="NI"/>
            <xsl:apply-templates select="node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>this is a reference thing in the dataset</xd:desc>
    </xd:doc>
<!--    <xsl:template match="(verstrekkingsverzoek/beoogd_verstrekker | toedieningsafspraak/verstrekker | verstrekking/verstrekker | zorgverlener/zorgaanbieder)[zorgaanbieder] | auteur_is_zorgaanbieder[not(ancestor::documentgegevens)]" mode="ada907_2_920">-->
    <!-- Match expression was not XSLT2 compliant. Changed to: -->
    <xsl:template match="verstrekkingsverzoek/beoogd_verstrekker[zorgaanbieder] | toedieningsafspraak/verstrekker[zorgaanbieder] | verstrekking/verstrekker[zorgaanbieder] | zorgverlener/zorgaanbieder[zorgaanbieder] | auteur_is_zorgaanbieder[not(ancestor::documentgegevens)]" mode="ada907_2_920">
        <xsl:copy>
            <zorgaanbieder datatype="reference" value="{zorgaanbieder/adaextension/reference_id/@value}"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>There is a double nested zorgaanbieder in the bouwstenen/zorgverlener group, but not in the original 907 zorgverlener/zorgaanbieder. Special handling here for the reference</xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener/zorgaanbieder[not(zorgaanbieder)]" mode="ada907_2_920">
        <xsl:copy>
            <zorgaanbieder datatype="reference" value="{adaextension/reference_id/@value}"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the now references to bouwstenen folder for product</xd:desc>
    </xd:doc>
    <xsl:template match="afgesproken_geneesmiddel | te_verstrekken_geneesmiddel | geneesmiddel_bij_toedieningsafspraak | verstrekt_geneesmiddel" mode="ada907_2_920">
        <xsl:copy>
            <farmaceutisch_product datatype="reference" value="{product/adaextension/reference_id/@value}"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the now references to bouwstenen folder for gebruiksproduct</xd:desc>
    </xd:doc>
    <xsl:template match="gebruiks_product" mode="ada907_2_920">
        <gebruiksproduct>
            <farmaceutisch_product datatype="reference" value="{product/adaextension/reference_id/@value}"/>
        </gebruiksproduct>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the medicatiegebruik/informant/persoon</xd:desc>
    </xd:doc>
    <xsl:template match="informant/persoon" mode="ada907_2_920">
        <!-- special handling for thuiszorg, because in 920 a thuiszorg professional is conveyed using zorgverlener see issue https://bits.nictiz.nl/browse/ZIB-1075 -->
        <xsl:choose>
            <xsl:when test="rol_of_functie[@code = '2'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.4']">
                <informant_is_zorgverlener>
                    <zorgverlener datatype="reference" value="{adaextension/reference_id/@value}"/>
                </informant_is_zorgverlener>
            </xsl:when>
            <xsl:otherwise>
                <!-- simply output contactpersoon using reference -->
                <xsl:copy>
                    <contactpersoon datatype="reference" value="{adaextension/reference_id/@value}"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle contactpersoon rol</xd:desc>
    </xd:doc>
    <xsl:template match="rol_of_functie" mode="ada907_2_920">
        <rol>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:for-each select="$mapContactpersoonRol[mp907[@code = current()/@code][@codeSystem = current()/@codeSystem]][mp920]">
                <xsl:copy-of select="mp920/@*"/>
                <!-- but we do want to keep the original displayName, if present -->
                <xsl:if test="string-length(@displayName) gt 0"><xsl:copy-of select="@displayName"></xsl:copy-of></xsl:if>
            </xsl:for-each>
        </rol>
    </xsl:template>

    <xd:doc>
        <xd:desc> ordering update ingredient </xd:desc>
    </xd:doc>
    <xsl:template match="ingredient" mode="ada907_2_920">
        <xsl:copy>
            <xsl:apply-templates select="ingredient_code" mode="#current"/>
            <xsl:apply-templates select="sterkte" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>  some more brilliant name changes in zibs 2020 </xd:desc>
    </xd:doc>
    <xsl:template match="hoeveelheid_ingredient" mode="ada907_2_920">
        <ingredient_hoeveelheid>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </ingredient_hoeveelheid>
    </xsl:template>
    <xd:doc>
        <xd:desc>  some more brilliant name changes in zibs 2020 </xd:desc>
    </xd:doc>
    <xsl:template match="hoeveelheid_product" mode="ada907_2_920">
        <product_hoeveelheid>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </product_hoeveelheid>
    </xsl:template>

    <xd:doc>
        <xd:desc> relaties </xd:desc>
    </xd:doc>
    <xsl:template match="relatie_naar_medicatieafspraak | relatie_naar_verstrekkingsverzoek" mode="ada907_2_920">
        <xsl:element name="{replace(local-name(), '(relatie_naar)(.+)', 'relatie$2')}">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> relaties </xd:desc>
    </xd:doc>
    <xsl:template match="gerelateerde_afspraak[*]" mode="ada907_2_920">
        <xsl:for-each select="identificatie_medicatieafspraak">
            <relatie_medicatieafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </identificatie>
            </relatie_medicatieafspraak>
        </xsl:for-each>
        <xsl:for-each select="identificatie_toedieningsafspraak">
            <relatie_toedieningsafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </identificatie>
            </relatie_toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> relaties </xd:desc>
    </xd:doc>
    <xsl:template match="relatie_naar_afspraak_of_gebruik[*]" mode="ada907_2_920">
        <xsl:for-each select="identificatie">
            <relatie_medicatieafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </identificatie>
            </relatie_medicatieafspraak>
        </xsl:for-each>
        <xsl:for-each select="identificatie_23288">
            <relatie_toedieningsafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </identificatie>
            </relatie_toedieningsafspraak>
        </xsl:for-each>
        <xsl:for-each select="identificatie_23289">
            <relatie_medicatiegebruik>
                <identificatie>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </identificatie>
            </relatie_medicatiegebruik>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> relaties </xd:desc>
    </xd:doc>
    <xsl:template match="gerelateerde_verstrekking[*]" mode="ada907_2_920">
        <xsl:for-each select="identificatie">
            <relatie_medicatieverstrekking>
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </xsl:copy>
            </relatie_medicatieverstrekking>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> name change for min</xd:desc>
    </xd:doc>
    <xsl:template match="aantal/min | waarde/min" mode="ada907_2_920">
        <minimum_waarde>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </minimum_waarde>
    </xsl:template>
    <xd:doc>
        <xd:desc> name change for vaste_waarde</xd:desc>
    </xd:doc>
    <xsl:template match="aantal/vaste_waarde | waarde/vaste_waarde" mode="ada907_2_920">
        <nominale_waarde>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </nominale_waarde>
    </xsl:template>
  
    <xd:doc>
        <xd:desc> name change for max | waarde/max</xd:desc>
    </xd:doc>
    <xsl:template match="aantal/max | waarde/max" mode="ada907_2_920">
        <maximum_waarde>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </maximum_waarde>
    </xsl:template>


    <xd:doc>
        <xd:desc> zorgverlener_identificatie_nummer </xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener_identificatie_nummer" mode="ada907_2_920">
        <xsl:element name="zorgverlener_identificatienummer">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:element>
    </xsl:template>


    <xd:doc>
        <xd:desc> zorgaanbieder_identificatie_nummer </xd:desc>
    </xd:doc>
    <xsl:template match="zorgaanbieder_identificatie_nummer" mode="ada907_2_920">
        <xsl:element name="zorgaanbieder_identificatienummer">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>non supported nor needed stuff in MP9 2.0 </xd:desc>
    </xd:doc>
    <xsl:template match="patient-afko" mode="ada907_2_920"/>

    <xd:doc>
        <xd:desc> no conceptIds, no value for coded elements (local for ada gui), get rid of temp reference_id in adaextension </xd:desc>
    </xd:doc>
    <xsl:template match="@conceptId | *[@code]/@value | adaextension[reference_id][not(*[not(self::reference_id)])] | adaextension/reference_id" mode="ada907_2_920"/>

    <xd:doc>
        <xd:desc> Kopieer verder alles 1-op-1 </xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="ada907_2_920 addReferenceId">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> helper template </xd:desc>
        <xd:param name="in">The input bouwsteen</xd:param>
    </xd:doc>
    <xsl:template name="_handleGebruiksperiode">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <gebruiksperiode>
                <xsl:for-each select="gebruiksperiode_start[@value | @nullFlavor]">
                    <start_datum_tijd>
                        <xsl:apply-templates select="@*" mode="#current"/>
                    </start_datum_tijd>
                </xsl:for-each>
                <xsl:for-each select="gebruiksperiode_eind[@value | @nullFlavor]">
                    <eind_datum_tijd>
                        <xsl:apply-templates select="@*" mode="#current"/>
                    </eind_datum_tijd>
                </xsl:for-each>
                <xsl:for-each select="gebruiksperiode[@value | @unit | @nullFlavor]">
                    <tijds_duur>
                        <xsl:apply-templates select="@*" mode="#current"/>
                    </tijds_duur>
                </xsl:for-each>
            </gebruiksperiode>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
