<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../../../../util/constants.xsl"/>
    <xsl:import href="../../../../../util/uuid.xsl"/>
    <xsl:import href="../../../../../util/mp-functions.xsl"/>
    <xsl:import href="../../../../../util/datetime.xsl"/>
    <xsl:import href="../../../../ada/AddConceptIds.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml instance -->
    <xsl:param name="schemaFileString" as="xs:string?">../mp/9.2.0/medicatiegegevens_met_references/ada_schemas/sturen_medicatiegegevens.xsd</xsl:param>
    <!-- the macAddress for uuid generation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>


    <xd:doc>
        <xd:desc>Start template</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <!-- first add reference id's, which we need to add reference to groups that will be in bouwstenen group -->
        <xsl:variable name="newAdaXml" as="element()?">
            <xsl:apply-templates select="@* | node()" mode="addReferenceId"/>
        </xsl:variable>
        <xsl:apply-templates select="$newAdaXml"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Add a temp reference id for the groups that will be moved to bouwstenen group</xd:desc>
    </xd:doc>
    <xsl:template match="product | zorgverlener[not(zorgverlener)] | zorgaanbieder[not(zorgaanbieder)] | contactpersoon" mode="addReferenceId">
        <xsl:copy>
            <xsl:attribute name="referenceId">
                <!-- in ada the id must start with alphanumeric, a uuid may start with digit, so we add a dummy string 'uuid_' to avoid schema errors in ada instances -->
                <xsl:value-of select="concat('uuid_', uuid:get-uuid(.))"/>
            </xsl:attribute>
            <xsl:apply-templates select="@* | node()" mode="addReferenceId"/>
        </xsl:copy>
    </xsl:template>
      

    <xd:doc>
        <xd:desc>Copy template in addReferenceId mode. Adds temporary id's for ada group elements that are now in bouwstenen group in 9 2.0 version</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="addReferenceId">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="addReferenceId"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc> add schema, should be overridden from a calling use case specific xslt </xd:desc>
    </xd:doc>
    <xsl:template match="adaxml">
        <xsl:variable name="noConceptIdAdaXml">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd</xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:variable>
        <xsl:apply-templates select="$noConceptIdAdaXml" mode="addConceptId"/>
    </xsl:template>


    <xd:doc>
        <xd:desc> update top level element </xd:desc>
    </xd:doc>
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
                    <farmaceutisch_product>
                        <xsl:attribute name="id" select="@referenceId"/>
                        <xsl:apply-templates select="node()"/>
                    </farmaceutisch_product>
                </xsl:for-each>
                <xsl:for-each select=".//zorgverlener[not(zorgverlener)]">
                    <xsl:copy>
                        <xsl:attribute name="id" select="@referenceId"/>
                        <xsl:apply-templates select="node()"/>
                    </xsl:copy>
                </xsl:for-each>
                <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)]">
                    <xsl:copy>
                        <xsl:attribute name="id" select="@referenceId"/>
                        <xsl:apply-templates select="node()"/>
                    </xsl:copy>
                </xsl:for-each>
            </bouwstenen>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc> handling for medicatieafspraak, mostly different order in elements. </xd:desc>
    </xd:doc>
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


    <xd:doc>
        <xd:desc> handling for verstrekkingsverzoek, only for non-reference transactions, so with proper 907 conceptId. Mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek[not(@conceptId) or @conceptId = '2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19963']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="identificatie | datum | auteur"/>
            <xsl:apply-templates select="te_verstrekken_geneesmiddel"/>
            <xsl:apply-templates select="te_verstrekken_hoeveelheid"/>
            <xsl:apply-templates select="*[not(self::identificatie | self::datum | self::auteur | self::te_verstrekken_geneesmiddel | self::te_verstrekken_hoeveelheid)]"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>handling for toedieningsafspraak</xd:desc>
    </xd:doc>
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

    <xd:doc>
        <xd:desc>handling for toedieningsafspraak aanvullende_informatie</xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsafspraak/aanvullende_informatie">
        <xsl:element name="{concat(local-name(..), '_', local-name(.))}"/>
    </xsl:template>


    <xd:doc>
        <xd:desc> handling for verstrekking, mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="verstrekking">
        <medicatieverstrekking>
            <xsl:apply-templates select="@* | node()"/>
        </medicatieverstrekking>
    </xsl:template>


    <xd:doc>
        <xd:desc> handling for medicatie_gebruik, mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_gebruik">
        <medicatiegebruik>
            <xsl:apply-templates select="@* | node()"/>
        </medicatiegebruik>
    </xsl:template>


    <xd:doc>
        <xd:desc> do not copy the original gebruiksperiode stuff, they are handled ín the mp building block </xd:desc>
    </xd:doc>
    <xsl:template match="gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode"/>

    <xd:doc>
        <xd:desc>handling for verstrekkingsverzoek/verbruiksperiode, different concept naming from zibs 2020</xd:desc>
    </xd:doc>
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


    <xd:doc>
        <xd:desc>move lichaamslengte en lichaamsgewicht </xd:desc>
    </xd:doc>
    <xsl:template match="lichaamslengte | lichaamsgewicht"/>

    <xd:doc>
        <xd:desc>sturen_medicatievoorschrift, TODO: adapt for 920</xd:desc>
    </xd:doc>
    <xsl:template match="sturen_medicatievoorschrift">
        <xsl:copy>
            <!-- attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- update the app attribute -->
            <xsl:attribute name="app">mp-mp920</xsl:attribute>
            <xsl:apply-templates select="patient | medicamenteuze_behandeling"/>
            <xsl:for-each select="medicamenteuze_behandeling/medicatieafspraak/(lichaamslengte | lichaamsgewicht)">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> datum van 9.0.7 naar 9 2.0 </xd:desc>
    </xd:doc>
    <xsl:template match="(medicatieafspraak | toedieningsafspraak)/afspraakdatum">
        <xsl:element name="{concat(local-name(..), '_datum_tijd')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek/datum">
        <xsl:element name="{concat(local-name(..), '_datum')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> handling for doseerinstructie, mostly different order in elements. </xd:desc>
    </xd:doc>
    <xsl:template match="doseerinstructie">
        <xsl:copy>
            <xsl:apply-templates select="doseerduur"/>
            <xsl:apply-templates select="volgnummer"/>
            <xsl:apply-templates select="*[not(self::doseerduur | self::volgnummer)]"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="criterium/code">
        <criterium>
            <xsl:apply-templates select="@* | node()"/>
        </criterium>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="toedieningsduur">
        <xsl:copy>
            <tijds_duur>
                <xsl:apply-templates select="@* | node()"/>
            </tijds_duur>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="verstrekking/datum">
        <medicatieverstrekkings_datum_tijd>
            <xsl:apply-templates select="@* | node()"/>
        </medicatieverstrekkings_datum_tijd>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="medicatie_gebruik/registratiedatum">
        <medicatiegebruik_datum_tijd>
            <xsl:apply-templates select="@* | node()"/>
        </medicatiegebruik_datum_tijd>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="medicatie_gebruik/gerelateerde_afspraak/identificatie_medicatieafspraak">
        <identificatie>
            <xsl:apply-templates select="@* | node()"/>
        </identificatie>
    </xsl:template>

    <xd:doc>
        <xd:desc> stoptype van 9.0.7 naar 9 2.0 </xd:desc>
    </xd:doc>
    <xsl:template match="(medicatieafspraak | toedieningsafspraak)/stoptype">
        <xsl:element name="{concat(local-name(..), '_stop_type')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="voorschrijver | verstrekkingsverzoek/auteur | auteur_is_zorgverlener | informant_is_zorgverlener">
       <xsl:copy>
            <zorgverlener datatype="reference" value="{zorgverlener/@referenceId}"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc> remove double nesting of stuff which is sometimes still  present in 9.0.7  </xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener/naamgegevens/naamgegevens | zorgverlener/zorgverlener_naam[naamgegevens] | zorgaanbieder/zorgaanbieder">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="(verstrekkingsverzoek/beoogd_verstrekker | toedieningsafspraak/verstrekker | verstrekking/verstrekker | zorgverlener/zorgaanbieder )[zorgaanbieder]">
       <xsl:copy>
            <zorgaanbieder datatype="reference" value="{zorgaanbieder/@referenceId}"/>
        </xsl:copy>
    </xsl:template> 
    
    <xd:doc>
        <xd:desc>There is a double nested zorgaanbieder in the bouwstenen/zorgverlener group, but not in the original 907 zorgverlener/zorgaanbieder. Special handling here for the reference</xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener/zorgaanbieder[not(zorgaanbieder)]">
        <xsl:copy>
            <zorgaanbieder datatype="reference" value="{@referenceId}"/>
        </xsl:copy>
    </xsl:template> 

    <xd:doc>
        <xd:desc>Handle the now references to bouwstenen folder for product</xd:desc>
    </xd:doc>
    <xsl:template match="afgesproken_geneesmiddel | te_verstrekken_geneesmiddel | geneesmiddel_bij_toedieningsafspraak | verstrekt_geneesmiddel">
        <xsl:copy>
            <farmaceutisch_product datatype="reference" value="{product/@referenceId}"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the now references to bouwstenen folder for gebruiksproduct</xd:desc>
    </xd:doc>
    <xsl:template match="gebruiks_product">
        <gebruiksproduct>
            <farmaceutisch_product datatype="reference" value="{product/@referenceId}"/>
        </gebruiksproduct>
    </xsl:template>

    <xd:doc>
        <xd:desc> ordering update ingredient </xd:desc>
    </xd:doc>
    <xsl:template match="ingredient">
        <xsl:copy>
            <xsl:apply-templates select="ingredient_code"/>
            <xsl:apply-templates select="sterkte"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc>  some more brilliant name changes in zibs 2020 </xd:desc>
    </xd:doc>
    <xsl:template match="hoeveelheid_ingredient">
        <ingredient_hoeveelheid>
            <xsl:apply-templates select="@* | node()"/>
        </ingredient_hoeveelheid>
    </xsl:template>
    <xd:doc>
        <xd:desc>  some more brilliant name changes in zibs 2020 </xd:desc>
    </xd:doc>
    <xsl:template match="hoeveelheid_product">
        <product_hoeveelheid>
            <xsl:apply-templates select="@* | node()"/>
        </product_hoeveelheid>
    </xsl:template>


    <xd:doc>
        <xd:desc> relaties </xd:desc>
    </xd:doc>
    <xsl:template match="relatie_naar_medicatieafspraak | relatie_naar_verstrekkingsverzoek">
        <xsl:element name="{replace(local-name(), '(relatie_naar)(.+)', 'relatie$2')}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> relaties </xd:desc>
    </xd:doc>
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

    <xd:doc>
        <xd:desc> relaties </xd:desc>
    </xd:doc>
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


    <xd:doc>
        <xd:desc> zorgverlener specialisme "toevoegen" als het ontbreekt </xd:desc>
    </xd:doc>
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


    <xd:doc>
        <xd:desc> aantal | waarde </xd:desc>
    </xd:doc>
    <xsl:template match="aantal/min | waarde/min">
        <minimum_waarde>
            <xsl:apply-templates select="@* | node()"/>
        </minimum_waarde>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="aantal/vaste_waarde | waarde/vaste_waarde">
        <nominale_waarde>
            <xsl:apply-templates select="@* | node()"/>
        </nominale_waarde>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="aantal/max | waarde/max">
        <maximum_waarde>
            <xsl:apply-templates select="@* | node()"/>
        </maximum_waarde>
    </xsl:template>


    <xd:doc>
        <xd:desc> zorgverlener_identificatie_nummer </xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener_identificatie_nummer">
        <xsl:element name="zorgverlener_identificatienummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>


    <xd:doc>
        <xd:desc> zorgaanbieder_identificatie_nummer </xd:desc>
    </xd:doc>
    <xsl:template match="zorgaanbieder_identificatie_nummer">
        <xsl:element name="zorgaanbieder_identificatienummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>


    <xd:doc>
        <xd:desc> no conceptIds </xd:desc>
    </xd:doc>
    <xsl:template match="@conceptId"/>


    <xd:doc>
        <xd:desc> Kopieer verder alles 1-op-1 </xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc> helper template </xd:desc>
        <xd:param name="in"/>
    </xd:doc>
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


</xsl:stylesheet>
