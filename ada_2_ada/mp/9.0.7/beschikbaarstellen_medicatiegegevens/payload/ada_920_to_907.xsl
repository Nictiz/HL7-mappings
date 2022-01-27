<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">
    <xsl:import href="../../../../../util/constants.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- mode=ada_920_to_907MG -->
    <!-- add schema -->
    <xsl:template match="adaxml">
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="data/beschikbaarstellen_medicatiegegevens">
                    <xsl:attribute name="xsi:noNamespaceSchemaLocation"
                        >../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- update ada app -->
    <xsl:template match="adaxml/data/*">
        <xsl:copy>
            <!-- bestaande attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- app attribuut alsnog overschrijven -->
            <xsl:attribute name="app">mp-mp907</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- Script om MP ada instances te converteren van 9.1.0 naar 9.0.7 -->
    <xsl:template match="(medicatieafspraak | toedieningsafspraak)/afspraak_datum_tijd">
        <xsl:element name="afspraakdatum">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    <xd:doc>
        <xd:desc>Gebruiksinstructie/HerhaalperiodeCyclischSchema/@unit=dag (920)
            Gebruiksinstructie/HerhaalperiodeCyclischSchema/@unit=d (907)
        </xd:desc>
    </xd:doc>
    <xsl:template match="herhaalperiode_cyclisch_schema">
        <xsl:copy>
            <xsl:attribute name="unit">d</xsl:attribute>
        </xsl:copy>
    </xsl:template>
    <!-- toedieningsschema is_flexibel verwijderen -->
    <xsl:template match="is_flexibel"/>
    <!-- zorgverlener_identificatie_nummer -->
    <!--    <xsl:template
        match="zorgverlener_identificatienummer[not(ancestor::voorschrijver)][not(ancestor::beoogd_verstrekker)]">
        <xsl:element name="zorgverlener_identificatie_nummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>-->
    <!-- lichaamslengte en lichaamsgewicht toevoegen bij de MA in sturen_medicatievoorschrift als er maar één MA is -->
    <xsl:template match="lichaamslengte | lichaamsgewicht"/>
    <xsl:template
        match="sturen_medicatievoorschrift[lichaamslengte | lichaamsgewicht][count(*/medicatieafspraak) = 1]/medicamenteuze_behandeling/medicatieafspraak">
        <xsl:variable name="insertBefore" as="xs:string*"
            select="'aanvullende_informatie', 'kopie_indicator', 'toelichting'"/>
        <xsl:copy>
            <!-- attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="*[not(local-name() = $insertBefore)]"/>
            <xsl:apply-templates select="ancestor::sturen_medicatievoorschrift/lichaamslengte"/>
            <xsl:apply-templates select="ancestor::sturen_medicatievoorschrift/lichaamsgewicht"/>
            <xsl:apply-templates select="*[local-name() = $insertBefore]"/>
        </xsl:copy>
    </xsl:template>
    <!-- stoptype -->
    <xsl:template match="stoptype">
        <xsl:copy>
            <!-- attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <!-- tijdelijk -->
                <xsl:when test="@code = '112171000146100'">
                    <xsl:attribute name="value">1</xsl:attribute>
                    <xsl:attribute name="code">1</xsl:attribute>
                    <xsl:attribute name="codeSystem"
                        >2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1</xsl:attribute>
                    <xsl:attribute name="displayName">Tijdelijk</xsl:attribute>
                </xsl:when>
                <!-- definitief -->
                <xsl:when test="@code = '112161000146106'">
                    <xsl:attribute name="value">2</xsl:attribute>
                    <xsl:attribute name="code">2</xsl:attribute>
                    <xsl:attribute name="codeSystem"
                        >2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1</xsl:attribute>
                    <xsl:attribute name="displayName">Definitief</xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>

    <!--stick to the 9.0.7 sequence-->
    <xsl:template match="medicamenteuze_behandeling/toedieningsafspraak">
        <toedieningsafspraak>
            <xsl:apply-templates select="gebruiksperiode/start_datum_tijd" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="gebruiksperiode/eind_datum_tijd" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="identificatie" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="toedieningsafspraak_datum_tijd" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="gebruiksperiode/tijds_duur" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="geannuleerd_indicator" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="toedieningsafspraak_stop_type" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="verstrekker" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="reden_afspraak" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="geneesmiddel_bij_toedieningsafspraak"
                mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="gebruiksinstructie" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="toedieningsafspraak_aanvullende_informatie"
                mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="toelichting" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="relatie_naar_medicatieafspraak" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="adaextension" mode="ada_920_to_907MG"/>
        </toedieningsafspraak>
    </xsl:template>

    <xsl:template match="verstrekker" mode="ada_920_to_907MG">
        <verstrekker>
            <xsl:variable name="thiszorgaanbiederVal" select="string(zorgaanbieder/@value)"/>
            <xsl:apply-templates select="//zorgaanbieder[@id = $thiszorgaanbiederVal]" mode="deref">
                <xsl:with-param name="ancestor" select="'verstrekker'" tunnel="yes"/>
            </xsl:apply-templates>
        </verstrekker>
    </xsl:template>

    <!--zorgaanbieder target-->
    <xsl:template match="bouwstenen/zorgaanbieder" mode="deref">
        <xsl:param name="ancestor" tunnel="yes"/>
        <zorgaanbieder>
            <xsl:copy-of select="@comment"/>
            <xsl:apply-templates>
                <xsl:with-param name="ancestor"> </xsl:with-param>
            </xsl:apply-templates>
        </zorgaanbieder>
    </xsl:template>

    <xsl:template match="zorgaanbieder_identificatienummer">
        <xsl:param name="ancestor" tunnel="yes"/>
        <xsl:variable name="name">
            <xsl:choose>
                <xsl:when test="$ancestor eq 'verstrekker'">zorgaanbieder_identificatie_nummer</xsl:when>
                <xsl:otherwise>zorgaanbieder_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$name}">
            <xsl:if test="@value">
                <xsl:attribute name="value" select="@value"/>
            </xsl:if>
            <xsl:if test="@datatype">
                <xsl:attribute name="datatype" select="@datatype"/>
            </xsl:if>
            <xsl:if test="@root">
                <xsl:attribute name="root" select="@root"/>
            </xsl:if>
            <xsl:if test="@nullFlavor">
                <xsl:attribute name="nullFlavor" select="@nullFlavor"/>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="toedieningsafspraak_datum_tijd" mode="ada_920_to_907MG">
        <afspraakdatum datatype="{@datatype}" value="{@value}"/>
    </xsl:template>

    <!--farmaceutisch_product via reference (@value in 920) = product (in 907)-->
    <xsl:template match="geneesmiddel_bij_toedieningsafspraak" mode="ada_920_to_907MG">
        <geneesmiddel_bij_toedieningsafspraak>
            <xsl:variable name="thisfarmaceutisch_productVal"
                select="string(farmaceutisch_product/@value)"/>
            <xsl:apply-templates
                select="//farmaceutisch_product[@id = $thisfarmaceutisch_productVal]" mode="deref"/>
        </geneesmiddel_bij_toedieningsafspraak>
    </xsl:template>

    <xsl:template match="bouwstenen/farmaceutisch_product" mode="deref">
        <product>
            <xsl:apply-templates/>
        </product>
    </xsl:template>

    <!--stick to the 9.0.7 sequence-->
    <xsl:template match="medicamenteuze_behandeling/medicatieafspraak">
        <medicatieafspraak>
            <xsl:apply-templates select="gebruiksperiode/start_datum_tijd" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="gebruiksperiode/eind_datum_tijd" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="identificatie" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="medicatieafspraak_datum_tijd" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="gebruiksperiode/tijds_duur" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="medicatieafspraak_stop_type" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="relatie_medicatieafspraak" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="relatie_medicatiegebruik" mode="ada_920_to_907MG"/>
            <!--relaties_ketenzorg niet in 920-->
            <xsl:apply-templates select="voorschrijver" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="reden_wijzigen_of_staken" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="reden_van_voorschrijven" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="afgesproken_geneesmiddel" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="gebruiksinstructie" mode="ada_920_to_907MG"/>
            <!--lichaamslengte* niet in 920-->
            <xsl:apply-templates select="aanvullende_informatie" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="toelichting" mode="ada_920_to_907MG"/>
            <xsl:apply-templates select="adaextension" mode="ada_920_to_907MG"/>
        </medicatieafspraak>
    </xsl:template>



    <xsl:template match="gebruiksperiode/start_datum_tijd" mode="ada_920_to_907MG">
        <gebruiksperiode_start datatype="{@datatype}" value="{@value}"/>
    </xsl:template>

    <xsl:template match="gebruiksperiode/eind_datum_tijd" mode="ada_920_to_907MG">
        <gebruiksperiode_eind datatype="{@datatype}" value="{@value}"/>
    </xsl:template>

    <xsl:template match="identificatie" mode="ada_920_to_907MG">
        <identificatie root="{@root}" value="{@value}"/>
    </xsl:template>

    <xsl:template match="medicatieafspraak_datum_tijd" mode="ada_920_to_907MG">
        <afspraakdatum datatype="{@datatype}" value="{@value}"/>
    </xsl:template>

    <xsl:template match="gebruiksperiode/tijds_duur" mode="ada_920_to_907MG">
        <gebruiksperiode datatype="duration" unit="{@unit}" value="{@value}"/>
    </xsl:template>

    <xsl:template match="medicatieafspraak_stop_type" mode="ada_920_to_907MG">
        <stoptype datatype="{@datatype}" code="{@code}" codeSystem="{@codeSystem}"
            codeSystemName="{@codeSystemName}" codeSystemVersion="{@codeSystemVersion}"
            value="{@value}" displayName="displayName" preferred="@preferred"
            originalText="originalText"/>
    </xsl:template>

    <xsl:template match="relatie_medicatieafspraak" mode="ada_920_to_907MG">
        <relatie_naar_afspraak_of_gebruik>
            <xsl:apply-templates/>
        </relatie_naar_afspraak_of_gebruik>
    </xsl:template>

    <xsl:template match="relatie_medicatiegebruik" mode="ada_920_to_907MG">
        <relatie_naar_afspraak_of_gebruik>
            <xsl:apply-templates/>
        </relatie_naar_afspraak_of_gebruik>
    </xsl:template>

    <xsl:template match="voorschrijver" mode="ada_920_to_907MG">
        <voorschrijver>
            <xsl:variable name="thisZorgverlenerVal" select="string(zorgverlener/@value)"/>
            <xsl:apply-templates select="//zorgverlener[@id = $thisZorgverlenerVal]" mode="deref">
                <xsl:with-param name="ancestor" select="'zorgverlener'" tunnel="yes"/>
            </xsl:apply-templates>
        </voorschrijver>
    </xsl:template>

    <xsl:template match="bouwstenen/zorgverlener" mode="deref">
        <zorgverlener>
            <xsl:apply-templates/>
        </zorgverlener>
    </xsl:template>

    <xsl:template match="zorgverlener_identificatienummer">
        <zorgverlener_identificatienummer>
            <xsl:if test="@nullFlavor">
                <xsl:attribute name="nullFlavor" select="@nullFlavor"/>
            </xsl:if>
            <xsl:if test="@datatype">
                <xsl:attribute name="datatype" select="@datatype"/>
            </xsl:if>
            <xsl:if test="@value">
                <xsl:attribute name="value" select="@value"/>
            </xsl:if>
            <xsl:apply-templates/>
        </zorgverlener_identificatienummer>
    </xsl:template>

    <xsl:template match="zorgverlener/naamgegevens">
        <naamgegevens>
            <naamgegevens>
                <xsl:apply-templates mode="allButconceptId"/>
            </naamgegevens>
        </naamgegevens>
        <!--        < datatype="{@}" unit="{@}" value="{@}"/>-->
    </xsl:template>

    <!--sla de 'verstekeling zorgaanbieder' over, dan naar ref-->
    <xsl:template match="zorgverlener/zorgaanbieder[zorgaanbieder]">
        <xsl:apply-templates/>
    </xsl:template>

    <!--zorgaanbieder ref, dan naar target-->
    <xsl:template match="zorgverlener/zorgaanbieder/zorgaanbieder">
        <xsl:variable name="thiszorgaanbiederVal" select="string(@value)"/>
        <xsl:apply-templates select="//zorgaanbieder[@id = $thiszorgaanbiederVal]" mode="deref"/>
    </xsl:template>







    <xsl:template match="*" mode="allButconceptId">
        <xsl:copy select=".">
            <xsl:for-each select="@*[not(name() eq 'conceptId')]">
                <xsl:attribute name="{name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates mode="allButconceptId"/>
        </xsl:copy>
    </xsl:template>



    <!--            
            < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   
    <xsl:template match="">
        < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   
    <xsl:template match="">
        < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   
    <xsl:template match="">
        < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   
    <xsl:template match="">
        < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   
    <xsl:template match="">
        < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   
    <xsl:template match="">
        < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   
    <xsl:template match="">
        < datatype="{@}" unit="{@}" value="{@}"/>
    </xsl:template>   -->
    <!--
    <!-\- Update concept id, if an old one has been left behind -\->
    <xsl:template match="gebruiksperiode_start[@conceptId='1.2.3.4.5.12345.20132.1']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="conceptId">2.16.840.1.113883.2.4.3.11.999.77.11.1.20132.1</xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
    <!-\- Update concept id, if an old one has been left behind -\->
    <xsl:template match="gebruiksperiode_eind[@conceptId='1.2.3.4.5.12345.20132.2']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="conceptId">2.16.840.1.113883.2.4.3.11.999.77.11.1.20132.2</xsl:attribute>
        </xsl:copy>
    </xsl:template>-->
    <!-- Kopieer verder alles 1-op-1; match="@* | node()"-->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!--ignore these-->

    <xsl:template match="@conceptId"/>
    <xsl:template match="bouwstenen"/>
</xsl:stylesheet>
