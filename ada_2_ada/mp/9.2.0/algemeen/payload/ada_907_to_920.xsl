<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../../../../util/constants.xsl"/>
    <xsl:import href="../../../../../util/mp-functions.xsl"/>
    <xsl:import href="../../../../../util/datetime.xsl"/>
    <xsl:import href="../../../../ada/AddConceptIds.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml instance -->
    <xsl:param name="schemaFileString" as="xs:string?">../mp/9.2.0/medicatiegegevens_met_references/ada_schemas/sturen_medicatiegegevens.xsd</xsl:param>

    <xsl:variable name="theZorgverleners"> </xsl:variable>

    <xsl:template match="/">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>

    <!-- add schema -->
    <xsl:template match="adaxml">
        <xsl:variable name="newAdaXml">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd</xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:variable>
        <xsl:apply-templates select="$newAdaXml" mode="addConceptId"/>
    </xsl:template>

    <!-- update top level element -->
    <xsl:template match="adaxml/data/*">
        <xsl:copy>
            <!-- bestaande attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- app en formName attribuut alsnog overschrijven -->
            <xsl:attribute name="app">mp-mp920</xsl:attribute>
            <xsl:if test="@formName = 'uitwisselen_medicatiegegevens'">
                <xsl:attribute name="formName">medicatiegegevens</xsl:attribute>
            </xsl:if>
            <!-- transaction attributes -->
            <xsl:choose>
                <!-- medicatiegegevens_met_references -->
                <xsl:when test="@transactionRef = '2.16.840.1.113883.2.4.3.11.60.20.77.4.134'">
                    <xsl:attribute name="transactionRef">2.16.840.1.113883.2.4.3.11.60.20.77.4.174</xsl:attribute>
                    <xsl:attribute name="transactionEffectiveDate">2021-04-07T09:27:30</xsl:attribute>
                </xsl:when>
                <xsl:when test="@transactionRef = '2.16.840.1.113883.2.4.3.11.60.20.77.4.102'">
                    <xsl:attribute name="transactionRef">2.16.840.1.113883.2.4.3.11.60.20.77.4.172</xsl:attribute>
                    <xsl:attribute name="transactionEffectiveDate">2021-04-02T09:33:39</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="patient | medicamenteuze_behandeling"/>
            <!-- the bouwstenen stuff -->
            <bouwstenen>
                <xsl:for-each select=".//product">
                    <xsl:variable name="theId" select="nf:generate-productref-id(.)"/>
                    <farmaceutisch_product>
                        <xsl:attribute name="id" select="$theId"/>
                        <xsl:apply-templates select="node()"/>
                    </farmaceutisch_product>
                </xsl:for-each>
                <xsl:for-each select=".//zorgverlener">
                    <xsl:variable name="theId" select="generate-id(.)"/>
                    <xsl:copy>
                        <xsl:attribute name="id" select="$theId"/>
                        <xsl:apply-templates select="node()"/>
                    </xsl:copy>
                </xsl:for-each>
                <xsl:for-each select=".//zorgaanbieder">
                    <xsl:variable name="theId" select="generate-id(.)"/>
                    <xsl:copy>
                        <xsl:attribute name="id" select="$theId"/>
                        <xsl:apply-templates select="node()"/>
                    </xsl:copy>
                </xsl:for-each>
            </bouwstenen>
        </xsl:copy>
    </xsl:template>

    <!-- handling for medicatieafspraak, mostly different order in elements. -->
    <xsl:template match="medicatieafspraak">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="identificatie | afspraakdatum"/>
            <!-- gebruiksperiode -->
            <!-- zijn er gegevens voor gebruiksperiode, structuur is anders in 9.2.0 -->
            <xsl:if test="(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @unit | @nullFlavor]">
                <xsl:call-template name="_handleGebruiksperiode"/>
            </xsl:if>
            <xsl:apply-templates select="*[not(self::identificatie | self::afspraakdatum)]"/>
        </xsl:copy>
    </xsl:template>

    <!-- handling for verstrekkingsverzoek, only for non-reference transactions, so with proper 907 conceptId. Mostly different order in elements. -->
    <xsl:template match="verstrekkingsverzoek[not(@conceptId) or @conceptId = '2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19963']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="identificatie | datum | auteur"/>
            <xsl:apply-templates select="te_verstrekken_geneesmiddel"/>
            <xsl:apply-templates select="te_verstrekken_hoeveelheid"/>
            <xsl:apply-templates select="*[not(self::identificatie | self::datum | self::auteur | self::te_verstrekken_geneesmiddel | self::te_verstrekken_hoeveelheid)]"/>
        </xsl:copy>
    </xsl:template>



    <xsl:template match="toedieningsafspraak">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="identificatie | afspraakdatum"/>
            <!-- gebruiksperiode -->
            <!-- zijn er gegevens voor gebruiksperiode, structuur is anders in 9.2.0 -->
            <xsl:if test="(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @unit | @nullFlavor]">
                <xsl:call-template name="_handleGebruiksperiode"/>
            </xsl:if>
            <xsl:apply-templates select="*[not(self::identificatie | self::afspraakdatum)]"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="toedieningsafspraak/aanvullende_informatie">
        <xsl:element name="{concat(local-name(..), '_', local-name(.))}"/>
    </xsl:template>

    <!-- handling for verstrekking, mostly different order in elements. -->
    <xsl:template match="verstrekking">
        <medicatieverstrekking>
            <xsl:apply-templates select="@* | node()"/>
        </medicatieverstrekking>
    </xsl:template>

    <!-- handling for medicatie_gebruik, mostly different order in elements. -->
    <xsl:template match="medicatie_gebruik">
        <medicatiegebruik>
            <xsl:apply-templates select="@* | node()"/>
        </medicatiegebruik>
    </xsl:template>

    <!-- do not copy the original gebruiksperiode stuff, they are handled ín the mp building block -->
    <xsl:template match="gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode"/>

    <xsl:template match="verstrekkingsverzoek/verbruiksperiode">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>

            <xsl:for-each select="ingangsdatum[@value | @nullFlavor]">
                <start_datum_tijd>
                    <xsl:apply-templates select="@*"/>
                </start_datum_tijd>
            </xsl:for-each>
            <xsl:for-each select="einddatum[@value | @nullFlavor]">
                <eind_datum_tijd>
                    <xsl:apply-templates select="@*"/>
                </eind_datum_tijd>
            </xsl:for-each>
            <xsl:for-each select="duur[@value | @unit | @nullFlavor]">
                <tijds_duur>
                    <xsl:apply-templates select="@*"/>
                </tijds_duur>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <!-- lichaamslengte en lichaamsgewicht verplaatsen -->
    <xsl:template match="lichaamslengte | lichaamsgewicht"/>
    <xsl:template match="sturen_medicatievoorschrift">
        <xsl:copy>
            <!-- attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- update the app attribute -->
            <xsl:attribute name="app">mp-mp910</xsl:attribute>
            <xsl:apply-templates select="patient | medicamenteuze_behandeling"/>
            <xsl:for-each select="medicamenteuze_behandeling/medicatieafspraak/(lichaamslengte | lichaamsgewicht)">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <!-- datum van 9.0.7 naar 9 2.0 -->
    <xsl:template match="(medicatieafspraak | toedieningsafspraak)/afspraakdatum">
        <xsl:element name="{concat(local-name(..), '_datum_tijd')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="verstrekkingsverzoek/datum">
        <xsl:element name="{concat(local-name(..), '_datum')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- handling for doseerinstructie, mostly different order in elements. -->
    <xsl:template match="doseerinstructie">
        <xsl:copy>
            <xsl:apply-templates select="doseerduur"/>
            <xsl:apply-templates select="volgnummer"/>
            <xsl:apply-templates select="*[not(self::doseerduur | self::volgnummer)]"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="criterium/code">
        <criterium>
            <xsl:apply-templates select="@* | node()"/>
        </criterium>
    </xsl:template>

    <xsl:template match="toedieningsduur">
        <xsl:copy>
            <tijds_duur>
                <xsl:apply-templates select="@* | node()"/>
            </tijds_duur>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="verstrekking/datum">
        <medicatieverstrekkings_datum_tijd>
            <xsl:apply-templates select="@* | node()"/>
        </medicatieverstrekkings_datum_tijd>
    </xsl:template>

    <xsl:template match="medicatie_gebruik/registratiedatum">
        <medicatiegebruik_datum_tijd>
            <xsl:apply-templates select="@* | node()"/>
        </medicatiegebruik_datum_tijd>
    </xsl:template>

    <xsl:template match="medicatie_gebruik/gerelateerde_afspraak/identificatie_medicatieafspraak">
        <identificatie>
            <xsl:apply-templates select="@* | node()"/>
        </identificatie>
    </xsl:template>
    <!-- stoptype van 9.0.7 naar 9 2.0 -->
    <xsl:template match="(medicatieafspraak | toedieningsafspraak)/stoptype">
        <xsl:element name="{concat(local-name(..), '_stop_type')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="voorschrijver | verstrekkingsverzoek/auteur | auteur_is_zorgverlener | informant_is_zorgverlener">
        <xsl:variable name="theId" select="generate-id(zorgverlener)"/>
        <xsl:copy>
            <zorgverlener datatype="reference" value="{$theId}"/>
        </xsl:copy>
    </xsl:template>

    <!-- remove double nesting of stuff which is sometimes still  present in 9.0.7  -->
    <xsl:template match="zorgverlener/naamgegevens/naamgegevens | zorgverlener/zorgverlener_naam[naamgegevens] | zorgaanbieder/zorgaanbieder">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <xsl:template match="zorgverlener/zorgaanbieder | verstrekkingsverzoek/beoogd_verstrekker | toedieningsafspraak/verstrekker | verstrekking/verstrekker">
        <xsl:variable name="theId" select="generate-id(zorgaanbieder)"/>
        <xsl:copy>
            <zorgaanbieder datatype="reference" value="{$theId}"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="afgesproken_geneesmiddel | te_verstrekken_geneesmiddel | geneesmiddel_bij_toedieningsafspraak | verstrekt_geneesmiddel">
        <xsl:variable name="theId" select="nf:generate-productref-id(product)"/>
        <xsl:copy>
            <farmaceutisch_product datatype="reference" value="{$theId}"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="gebruiks_product">
        <xsl:variable name="theId" select="nf:generate-productref-id(product)"/>
        <gebruiksproduct>
            <farmaceutisch_product datatype="reference" value="{$theId}"/>
        </gebruiksproduct>
    </xsl:template>

    <!-- ordering update ingredient -->
    <xsl:template match="ingredient">
        <xsl:copy>
            <xsl:apply-templates select="ingredient_code"/>
            <xsl:apply-templates select="sterkte"/>
        </xsl:copy>
    </xsl:template>

    <!-- and some more brilliant name changes -->
    <xsl:template match="hoeveelheid_ingredient">
        <ingredient_hoeveelheid>
            <xsl:apply-templates select="@* | node()"/>
        </ingredient_hoeveelheid>
    </xsl:template>
    <xsl:template match="hoeveelheid_product">
        <product_hoeveelheid>
            <xsl:apply-templates select="@* | node()"/>
        </product_hoeveelheid>
    </xsl:template>

    <!-- relaties -->
    <xsl:template match="relatie_naar_medicatieafspraak | relatie_naar_verstrekkingsverzoek">
        <xsl:element name="{replace(local-name(), '(relatie_naar)(.+)', 'relatie$2')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="gerelateerde_afspraak[*]">
        <xsl:for-each select="identificatie_medicatieafspraak">
            <relatie_medicatieafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()"/>
                </identificatie>
            </relatie_medicatieafspraak>
        </xsl:for-each>
        <xsl:for-each select="identificatie_toedieningsafspraak">
            <relatie_toedieningsafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()"/>
                </identificatie>
            </relatie_toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="relatie_naar_afspraak_of_gebruik[*]">
        <xsl:for-each select="identificatie">
            <relatie_medicatieafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()"/>
                </identificatie>
            </relatie_medicatieafspraak>
        </xsl:for-each>
        <xsl:for-each select="identificatie_23288">
            <relatie_toedieningsafspraak>
                <identificatie>
                    <xsl:apply-templates select="@* | node()"/>
                </identificatie>
            </relatie_toedieningsafspraak>
        </xsl:for-each>
        <xsl:for-each select="identificatie_23289">
            <relatie_medicatiegebruik>
                <identificatie>
                    <xsl:apply-templates select="@* | node()"/>
                </identificatie>
            </relatie_medicatiegebruik>
        </xsl:for-each>
    </xsl:template>

    <!-- zorgverlener specialisme "toevoegen" als het ontbreekt -->
    <xsl:template match="zorgverlener[not(specialisme)]">
        <xsl:copy>
            <!-- attributen kopiëren en alle elementen die vóór specialisme komen -->
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="zorgverlener_identificatienummer | naamgegevens"/>
            <specialisme code="UNK" codeSystem="{$oidHL7NullFlavor}"/>
            <!-- copy the other elements -->
            <xsl:apply-templates select="*[not(self::zorgverlener_identificatienummer)][not(self::naamgegevens)]"/>
        </xsl:copy>
    </xsl:template>

    <!-- aantal | waarde -->
    <xsl:template match="aantal/min | waarde/min">
        <minimum_waarde>
            <xsl:apply-templates select="@* | node()"/>
        </minimum_waarde>
    </xsl:template>
    <xsl:template match="aantal/vaste_waarde | waarde/vaste_waarde">
        <nominale_waarde>
            <xsl:apply-templates select="@* | node()"/>
        </nominale_waarde>
    </xsl:template>
    <xsl:template match="aantal/max | waarde/max">
        <maximum_waarde>
            <xsl:apply-templates select="@* | node()"/>
        </maximum_waarde>
    </xsl:template>

    <!-- zorgverlener_identificatie_nummer -->
    <xsl:template match="zorgverlener_identificatie_nummer">
        <xsl:element name="zorgverlener_identificatienummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- zorgaanbieder_identificatie_nummer -->
    <xsl:template match="zorgaanbieder_identificatie_nummer">
        <xsl:element name="zorgaanbieder_identificatienummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- no conceptIds -->
    <xsl:template match="@conceptId"/>

    <!-- Kopieer verder alles 1-op-1 -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- helper template -->
    <xsl:template name="_handleGebruiksperiode">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <gebruiksperiode>
                <xsl:for-each select="gebruiksperiode_start[@value | @nullFlavor]">
                    <start_datum_tijd>
                        <xsl:apply-templates select="@*"/>
                    </start_datum_tijd>
                </xsl:for-each>
                <xsl:for-each select="gebruiksperiode_eind[@value | @nullFlavor]">
                    <eind_datum_tijd>
                        <xsl:apply-templates select="@*"/>
                    </eind_datum_tijd>
                </xsl:for-each>
                <xsl:for-each select="gebruiksperiode[@value | @unit | @nullFlavor]">
                    <tijds_duur>
                        <xsl:apply-templates select="@*"/>
                    </tijds_duur>
                </xsl:for-each>
            </gebruiksperiode>
        </xsl:for-each>
    </xsl:template>

    <xsl:function name="nf:generate-productref-id" as="xs:string?">
        <xsl:param name="inProduct" as="element()?"/>
        
        <xsl:variable name="mainGstdLevel" select="nf:get-main-gstd-level($inProduct/product_code)"/>
        
        <xsl:value-of select="$inProduct/product_code[@codeSystem = $mainGstdLevel]/concat(@code, '-', @codeSystem)"/>
        

    </xsl:function>


</xsl:stylesheet>
