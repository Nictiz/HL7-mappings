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
    <xsl:import href="./../wiki/ADA2test-wiki-table.xsl"/>
    <xsl:import href="./mp-functions.xsl"/>
    <!-- override ada release file and transaction to be handled, which may be overridden by calling template -->
    <xsl:param name="adaReleaseFile" select="document('../../../projects/mp-mp9/definitions/mp-mp9-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.102</xsl:param>
    <xsl:param name="transactionType">raadplegen</xsl:param>

    <xsl:param name="date-conversion-xml" select="document('./date_conversion.xml')"/>

    <xsl:variable name="voorbeeld-string">
        <xsl:choose>
            <xsl:when test="$transactionType != 'raadplegen'">
                <xsl:value-of select="' [voorbeeldgegevens, mag gevuld met eigen testgegevens]'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>

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
    </xsl:template>

    <xd:doc>
        <xd:desc>Override of the adaxml/data template from the imported stylesheet. Makes it a bit nicer for MP</xd:desc>
    </xd:doc>
    <xsl:template match="adaxml/data/*">
        <xsl:variable name="patient" select="./patient"/>
        <xsl:variable name="patient-achternaam" select="$patient/naamgegevens/geslachtsnaam/achternaam/@value"/>
        <!-- Build a variable tabel which is tailored for output in documentation, such as wiki -->
        <xsl:variable name="tabel" as="element()">
            <tabellen xmlns="">
                <!-- tabel voor patiënt -->
                <xsl:apply-templates select="$patient" mode="maak-tabel"/>
                <!-- tabel voor documentgegevens -->
                <xsl:apply-templates select=".//(documentgegevens)" mode="maak-tabel"/>
                <!-- tabel voor iedere therapeutische bouwsteen -->
                <xsl:apply-templates select=".//(medicatieafspraak | toedieningsafspraak | medicatie_gebruik)" mode="maak-tabel"/>
                <!-- tabelrijen voor iedere logistieke bouwsteen -->
                <xsl:for-each select=".//(verstrekkingsverzoek | verstrekking)">
                    <xsl:variable name="level" select="xs:int(1)"/>
                    <tabel xmlns="" type="{./local-name()}" title="{nf:element-name(.)}">
                        <xsl:apply-templates select="./identificatie" mode="maak-tabel-rij"/>
                        <xsl:for-each select="./(datum | aanschrijfdatum)[@value]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:configurable-T-date(./.., ., false())}"/>
                        </xsl:for-each>
                        <!-- auteur -->
                        <xsl:for-each select="./(auteur)[.//(@value | @code)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:zorgverlener-string(.))}"/>
                        </xsl:for-each>
                        <xsl:apply-templates select="./verstrekker" mode="maak-tabel-rij">
                            <xsl:with-param name="element-name">Verstrekker<xsl:value-of select="$voorbeeld-string"/></xsl:with-param>
                        </xsl:apply-templates>
                        <xsl:for-each select="./(te_verstrekken_hoeveelheid | verstrekte_hoeveelheid)[.//@value]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:element-waarde(./aantal/@value, ./eenheid/@displayName)}"/>
                        </xsl:for-each>
                        <xsl:apply-templates select="./aantal_herhalingen" mode="maak-tabel-rij"/>
                        <xsl:for-each select=".//product[.//(@code | @value)]">
                            <xsl:call-template name="tabelrijen-product"/>
                        </xsl:for-each>
                        <xsl:for-each select="./verbruiksperiode[.//(@value)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:periode-string(., gebruiksperiode_start, gebruiksperiode, gebruiksperiode_eind)}"/>
                        </xsl:for-each>
                        <xsl:apply-templates select="./verbruiksduur" mode="maak-tabel-rij"/>
                        <!-- beoogd verstrekker -->
                        <xsl:for-each select="./beoogd_verstrekker[.//(@value | @code)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:zorgverlener-string(.))}"/>
                        </xsl:for-each>
                        <xsl:apply-templates select="./(distributievorm | aanvullende_wensen | aanvullende_informatie | afleverlocatie | toelichting)" mode="maak-tabel-rij"/>
                        <xsl:for-each select="./(relatie_naar_medicatieafspraak | relatie_naar_verstrekkingsverzoek)[.//@value]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{./identificatie/@value}"/>
                        </xsl:for-each>
                        <!-- MBH identificatie -->
                        <xsl:apply-templates select="./../identificatie[.//(@value)]" mode="maak-tabel-rij">
                            <xsl:with-param name="element-name">MBH identificatie</xsl:with-param>
                        </xsl:apply-templates>
                    </tabel>
                </xsl:for-each>
            </tabellen>
        </xsl:variable>
        <xsl:text>
==Patiënt </xsl:text>
        <xsl:value-of select="normalize-space(string-join($patient/naamgegevens//*[not(local-name() eq 'naamgebruik')]/@value, ' '))"/>
        <xsl:text>==
</xsl:text>
        <xsl:value-of select="concat('&lt;section begin=', $patient-achternaam, ' /&gt;')"/>
        <xsl:apply-templates select="$tabel/tabel[@type eq 'patient']"/>
        <xsl:value-of select="concat('&lt;section end=', $patient-achternaam, ' /&gt;')"/>
        <xsl:if test=".//documentgegevens">
            <xsl:text>
===Documentgegevens </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text> ===
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=DG_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="$tabel/tabel[@type eq 'documentgegevens']"/>
            <xsl:value-of select="concat('&lt;section end=DG_', $patient-achternaam, ' /&gt;')"/>
        </xsl:if>
        <xsl:if test=".//medicatieafspraak">
            <xsl:text>
===Medicatieafspraken </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text> ===
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=MA_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="$tabel/tabel[@type eq 'medicatieafspraak']"/>
            <xsl:value-of select="concat('&lt;section end=MA_', $patient-achternaam, ' /&gt;')"/>
        </xsl:if>
        <xsl:if test=".//verstrekkingsverzoek">

            <xsl:text>
===Verstrekkingsverzoeken </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text> ===
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=VV_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="$tabel/tabel[@type eq 'verstrekkingsverzoek']"/>
            <xsl:value-of select="concat('&lt;section end=VV_', $patient-achternaam, ' /&gt;')"/>
        </xsl:if>
        <xsl:if test=".//toedieningsafspraak">
            <xsl:text>
===Toedieningsafspraken </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text> ===
		</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=TA_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="$tabel/tabel[@type eq 'toedieningsafspraak']"/>
            <xsl:value-of select="concat('&lt;section end=TA_', $patient-achternaam, ' /&gt;')"/>
        </xsl:if>
        <xsl:if test=".//verstrekking">
            <xsl:text>
===Verstrekkingen </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text> ===
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=MVE_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="$tabel/tabel[@type eq 'verstrekking']"/>
            <xsl:value-of select="concat('&lt;section end=MVE_', $patient-achternaam, ' /&gt;')"/>
        </xsl:if>
        <xsl:if test=".//medicatie_gebruik">
            <xsl:text>
===Medicatiegebruik </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text> ===
</xsl:text>
            <xsl:value-of select="concat('&lt;section begin=MGB_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="$tabel/tabel[@type eq 'medicatie_gebruik']"/>
            <xsl:value-of select="concat('&lt;section end=MGB_', $patient-achternaam, ' /&gt;')"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a nested 'tabel' from which it is easy to generate wiki or other documentation</xd:desc>
        <xd:param name="in">The ada therapeutic building block which contents are rendered in the nested 'tabel'</xd:param>
    </xd:doc>
    <xsl:template name="tabel-ther-bouwsteen" match="medicatieafspraak | toedieningsafspraak | medicatie_gebruik" mode="maak-tabel">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <xsl:variable name="level" select="xs:int(1)"/>
            <tabel xmlns="" type="{./local-name()}" title="{nf:element-name(.)}">
                <xsl:apply-templates select="./identificatie" mode="maak-tabel-rij"/>
                <xsl:for-each select="./(afspraakdatum | registratiedatum)">
                    <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:configurable-T-date(./.., ., false())}"/>
                </xsl:for-each>
                <xsl:apply-templates select="./(gebruik_indicator | volgens_afspraak_indicator)[@value | @nullFlavor]" mode="maak-tabel-rij"/>
                <xsl:variable name="gebruiksperiode-waarde" select="nf:periode-string(., gebruiksperiode_start, gebruiksperiode, gebruiksperiode_eind)"/>
                <xsl:if test="./(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @nullFlavor]">
                    <gegevenselement xmlns="" level="{$level}" naam="Gebruiksperiode" waarde="{$gebruiksperiode-waarde}"/>
                </xsl:if>
                <xsl:apply-templates select="./(geannuleerd_indicator | stoptype)" mode="maak-tabel-rij"/>
                <xsl:for-each select="./relatie_naar_afspraak_of_gebruik/*">
                    <xsl:variable name="element-name" as="xs:string*">
                        <xsl:value-of select="nf:element-name(./..)"/>
                        <xsl:choose>
                            <xsl:when test="./local-name() eq 'identificatie'">
                                <xsl:value-of select="': MA'"/>
                            </xsl:when>
                            <xsl:when test="./local-name() eq 'identificatie_23288'">
                                <xsl:value-of select="': TA'"/>
                            </xsl:when>
                            <xsl:when test="./local-name() eq 'identificatie_23289'">
                                <xsl:value-of select="': MGB'"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="{$level}" naam="{string-join($element-name)}" waarde="{./@value}"/>
                </xsl:for-each>
                <xsl:for-each select="./(voorschrijver | verstrekker)">
                    <xsl:apply-templates select="." mode="maak-tabel-rij">
                        <xsl:with-param name="element-name" select="concat(nf:element-name(.), $voorbeeld-string)"/>
                    </xsl:apply-templates>
                </xsl:for-each>
                <xsl:for-each select="./(reden_afspraak | reden_wijzigen_of_staken)">
                    <xsl:choose>
                        <xsl:when test="./../local-name() eq 'medicatieafspraak'">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{./@value}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="./reden_van_voorschrijven/probleem/probleem_naam[@code]">
                    <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(./../..)}" waarde="{nf:element-code-waarde(.)}"/>
                </xsl:for-each>
                <xsl:for-each select=".//product[.//(@code | @value)]">
                    <xsl:call-template name="tabelrijen-product"/>
                </xsl:for-each>
                <xsl:for-each select="./gebruiksinstructie">
                    <groep xmlns="" level="{$level}" naam="{nf:element-name(.)}">
                        <xsl:variable name="level" select="xs:int($level + 1)"/>
                        <xsl:for-each select="./omschrijving[.//(@value | @code)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{concat($gebruiksperiode-waarde, ', ' ,nf:configurable-T-date(./../.., ., false()))}"/>
                        </xsl:for-each>
                        <xsl:apply-templates select="./(toedieningsweg | aanvullende_instructie)" mode="maak-tabel-rij">
                            <xsl:with-param name="level" select="$level"/>
                        </xsl:apply-templates>
                        <xsl:variable name="amount-doseerinstructies" select="count(./doseerinstructie[.//(@value | @code)])" as="xs:integer"/>
                        <xsl:for-each select="./doseerinstructie[.//(@value | @code)]">
                            <!-- todo expliciet sorteren op volgnummer -->
                            <xsl:variable name="element-name" as="xs:string*">
                                <xsl:value-of select="nf:element-name(.)"/>
                                <xsl:if test="$amount-doseerinstructies gt 1">
                                    <xsl:value-of select="./volgnummer/@value"/>
                                </xsl:if>
                            </xsl:variable>
                            <gegevenselement xmlns="" level="{$level}" naam="{$element-name}" waarde="{nf:dosering-string(., $amount-doseerinstructies)}"/>
                        </xsl:for-each>
                        <!-- herhaalperiode cyclisch schema -->
                        <xsl:apply-templates select="./herhaalperiode_cyclisch_schema" mode="maak-tabel-rij">
                            <xsl:with-param name="level" select="$level"/>
                        </xsl:apply-templates>
                    </groep>
                </xsl:for-each>
                <xsl:for-each select="./gerelateerde_afspraak/*">
                    <xsl:variable name="element-name" as="xs:string*">
                        <xsl:value-of select="nf:element-name(./..)"/>
                        <xsl:choose>
                            <xsl:when test="./local-name() eq 'identificatie_medicatieafspraak'">
                                <xsl:value-of select="': MA'"/>
                            </xsl:when>
                            <xsl:when test="./local-name() eq 'identificatie_toedieningsafspraak'">
                                <xsl:value-of select="': TA'"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{$element-name}" waarde="{./@value}"/>
                </xsl:for-each>
                <xsl:for-each select="./gerelateerde_verstrekking/*">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(./..)}" waarde="{./@value}"/>
                </xsl:for-each>
                <!-- informant -->
                <xsl:for-each select="./informant[.//(@value | @code)]">
                    <xsl:variable name="waarde" as="xs:string*">
                        <xsl:choose>
                            <xsl:when test="./persoon">Persoon: <xsl:value-of select="nf:persoon-string(./persoon)"/></xsl:when>
                            <xsl:when test="./informant_is_patient/@value = 'true'">Patiënt</xsl:when>
                            <xsl:when test="./informant_is_zorgverlener[.//(@value | @code)]">Zorgverlener<xsl:value-of select="$voorbeeld-string"/>: <xsl:value-of select="nf:zorgverlener-string(./informant_is_zorgverlener)"/></xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{$waarde}"/>
                </xsl:for-each>
                <!-- auteur -->
                <xsl:for-each select="./auteur[.//(@value | @code)]">
                    <xsl:variable name="waarde" as="xs:string*">
                        <xsl:choose>
                            <xsl:when test="./auteur_is_patient/@value = 'true'">Patiënt</xsl:when>
                            <xsl:when test="./auteur_is_zorgverlener[.//(@value | @code)]">Zorgverlener<xsl:value-of select="$voorbeeld-string"/>: <xsl:value-of select="nf:zorgverlener-string(./auteur_is_zorgverlener)"/></xsl:when>
                            <xsl:when test="./auteur_is_zorgaanbieder[.//(@value | @code)]">Zorgaanbieder<xsl:value-of select="$voorbeeld-string"/>: <xsl:value-of select="nf:zorgaanbieder-string(./auteur_is_zorgaanbieder)"/></xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{$waarde}"/>
                </xsl:for-each>
                <!-- reden gebruik -->
                <xsl:apply-templates select="./(reden_gebruik | reden_wijzigen_of_stoppen_gebruik)" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="$level"/>
                </xsl:apply-templates>
                <!-- gewicht en lengte -->
                <xsl:for-each select="./(lichaamslengte/lengte_waarde | lichaamsgewicht/gewicht_waarde)[@value]">
                    <xsl:variable name="date-append-string">
                        <xsl:for-each select="./../(lengte_datum_tijd | gewicht_datum_tijd)[@value]">
                            <xsl:value-of select="concat('. Gemeten: ', nf:configurable-T-date(./../.., ., false()))"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(./..)}" waarde="{./normalize-space(concat(@value, ' ', @unit, $date-append-string))}"/>
                </xsl:for-each>
                <xsl:apply-templates select="./(kopie_indicator | toelichting | aanvullende_informatie)" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="$level"/>
                </xsl:apply-templates>
                <xsl:for-each select="./relatie_naar_medicatieafspraak[.//@value]">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{./identificatie/@value}"/>
                </xsl:for-each>
                <!-- MBH identificatie -->
                <xsl:apply-templates select="./../identificatie[.//(@value)]" mode="maak-tabel-rij">
                    <xsl:with-param name="element-name">MBH identificatie</xsl:with-param>
                </xsl:apply-templates>
            </tabel>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a nested 'tabel' from which it is easy to generate wiki or other documentation</xd:desc>
        <xd:param name="in">The ada patient which contents are rendered in the nested 'tabel'</xd:param>
    </xd:doc>
    <xsl:template name="tabel-patient" match="patient" mode="maak-tabel">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <tabel xmlns="" type="{./local-name()}" title="Patiënt">
                <xsl:for-each select="./naamgegevens[.//@value]">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{normalize-space(string-join(.//*[not(local-name() eq 'naamgebruik')]/@value, ' '))}"/>
                </xsl:for-each>
                <xsl:for-each select="./(adresgegevens)[.//@value]">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{normalize-space(string-join(.//(@value|@displayName), ' '))}"/>
                </xsl:for-each>
                <xsl:apply-templates select="./contactgegevens/(telefoonnummers | email_adressen)[.//@value]" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="xs:int(1)"/>
                </xsl:apply-templates>
                <xsl:for-each select="./(patient_identificatienummer | identificatienummer)">
                    <xsl:variable name="waarde" as="xs:string">
                        <xsl:choose>
                            <xsl:when test="./@root eq $oidBurgerservicenummer">
                                <xsl:value-of select="concat(./@value, ' [BSN]')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat(./@value, ' met root OID ''', ./@root, '''')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{normalize-space($waarde)}"/>
                </xsl:for-each>
                <xsl:apply-templates select="./(geboortedatum | meerling_indicator | overlijdens_indicator | datum_overlijden)[@value] | ./geslacht[@code]" mode="maak-tabel-rij"/>
            </tabel>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a nested 'tabel' from which it is easy to generate wiki or other documentation</xd:desc>
        <xd:param name="in">The ada documentgegevens which contents are rendered in the nested 'tabel'</xd:param>
    </xd:doc>
    <xsl:template name="tabel-documentgegevens" match="documentgegevens" mode="maak-tabel">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <xsl:variable name="level" select="xs:int(1)"/>
            <tabel xmlns="" type="{./local-name()}" title="{nf:element-name(.)}">
                <xsl:for-each select="./document_datum[@value]">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{nf:configurable-T-date(./../.., ., false())}"/>
                </xsl:for-each>
                <!-- auteur -->
                <xsl:if test="./auteur/auteur_is_patient/@value = 'true'">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(./auteur)}" waarde="Patiënt"/>
                </xsl:if>
                <xsl:for-each select="./auteur[auteur_is_zorgaanbieder[.//(@value | @code)]]">
                    <groep xmlns="" level="{$level}" naam="Auteur - zorgaanbieder{$voorbeeld-string}">
                        <xsl:variable name="level" select="xs:int($level + 1)"/>
                        <xsl:variable name="waarde" as="xs:string*"/>
                        <xsl:apply-templates select="./auteur_is_zorgaanbieder/zorgaanbieder/(zorgaanbieder_identificatie_nummer | organisatie_naam | afdeling_specialisme)" mode="maak-tabel-rij">
                            <xsl:with-param name="level" select="$level"/>
                        </xsl:apply-templates>
                        <xsl:for-each select="./auteur_is_zorgaanbieder/zorgaanbieder/(.//adresgegevens)[.//@value]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{normalize-space(string-join(.//(@value|@displayName), ' '))}"/>
                        </xsl:for-each>
                        <xsl:apply-templates select="./auteur_is_zorgaanbieder/zorgaanbieder/(.//contactgegevens/(telefoonnummers | email_adressen))" mode="maak-tabel-rij">
                            <xsl:with-param name="level" select="$level"/>
                        </xsl:apply-templates>
                    </groep>
                </xsl:for-each>
                <xsl:for-each select="./(verificatie_patient | verificatie_zorgverlener)">
                    <xsl:variable name="waarde" as="xs:string*">
                        <xsl:for-each select="./*[starts-with(local-name(), 'geverifieerd_met')]">
                            <xsl:choose>
                                <xsl:when test="./@value = ('true')">Ja</xsl:when>
                                <xsl:when test="./@value = ('false')">Nee</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="./@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:for-each select="./verificatie_datum">
                            <xsl:value-of select="concat(': ', nf:configurable-T-date((), ., false()))"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{$waarde}"/>
                </xsl:for-each>
                <!--  -->
                <xsl:apply-templates select="./(gebruik_indicator | volgens_afspraak_indicator)[@value | @nullFlavor]" mode="maak-tabel-rij"/>
                <xsl:variable name="gebruiksperiode-waarde" select="nf:periode-string(., gebruiksperiode_start, gebruiksperiode, gebruiksperiode_eind)"/>
                <xsl:if test="./(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @nullFlavor]">
                    <gegevenselement xmlns="" level="{$level}" naam="Gebruiksperiode" waarde="{$gebruiksperiode-waarde}"/>
                </xsl:if>
                <xsl:apply-templates select="./(geannuleerd_indicator | stoptype)" mode="maak-tabel-rij"/>
                <xsl:for-each select="./relatie_naar_afspraak_of_gebruik/*">
                    <xsl:variable name="element-name" as="xs:string*">
                        <xsl:value-of select="nf:element-name(./..)"/>
                        <xsl:choose>
                            <xsl:when test="./local-name() eq 'identificatie'">
                                <xsl:value-of select="': MA'"/>
                            </xsl:when>
                            <xsl:when test="./local-name() eq 'identificatie_23288'">
                                <xsl:value-of select="': TA'"/>
                            </xsl:when>
                            <xsl:when test="./local-name() eq 'identificatie_23289'">
                                <xsl:value-of select="': MGB'"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="{$level}" naam="{string-join($element-name)}" waarde="{./@value}"/>
                </xsl:for-each>
                <xsl:for-each select="./(voorschrijver | verstrekker)">
                    <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:zorgverlener-string(.))}"/>
                </xsl:for-each>
                <xsl:for-each select="./(reden_afspraak | reden_wijzigen_of_staken)">
                    <xsl:choose>
                        <xsl:when test="./../local-name() eq 'medicatieafspraak'">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{./@value}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="./reden_van_voorschrijven/probleem/probleem_naam[@code]">
                    <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(./../..)}" waarde="{nf:element-code-waarde(.)}"/>
                </xsl:for-each>
                <xsl:for-each select=".//product[.//(@code | @value)]">
                    <xsl:call-template name="tabelrijen-product"/>
                </xsl:for-each>
                <xsl:for-each select="./gebruiksinstructie">
                    <groep xmlns="" level="{$level}" naam="{nf:element-name(.)}">
                        <xsl:variable name="level" select="xs:int($level + 1)"/>
                        <xsl:for-each select="./omschrijving[.//(@value | @code)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{concat($gebruiksperiode-waarde, ', ' ,nf:configurable-T-date(./../.., ., false()))}"/>
                        </xsl:for-each>
                        <xsl:apply-templates select="./(toedieningsweg | aanvullende_instructie)" mode="maak-tabel-rij">
                            <xsl:with-param name="level" select="$level"/>
                        </xsl:apply-templates>
                        <xsl:variable name="amount-doseerinstructies" select="count(./doseerinstructie[.//(@value | @code)])" as="xs:integer"/>
                        <xsl:for-each select="./doseerinstructie[.//(@value | @code)]">
                            <!-- todo expliciet sorteren op volgnummer -->
                            <xsl:variable name="element-name" as="xs:string*">
                                <xsl:value-of select="nf:element-name(.)"/>
                                <xsl:if test="$amount-doseerinstructies gt 1">
                                    <xsl:value-of select="./volgnummer/@value"/>
                                </xsl:if>
                            </xsl:variable>
                            <gegevenselement xmlns="" level="{$level}" naam="{$element-name}" waarde="{nf:dosering-string(., $amount-doseerinstructies)}"/>
                        </xsl:for-each>
                        <!-- herhaalperiode cyclisch schema -->
                        <xsl:apply-templates select="./herhaalperiode_cyclisch_schema" mode="maak-tabel-rij">
                            <xsl:with-param name="level" select="$level"/>
                        </xsl:apply-templates>
                    </groep>
                </xsl:for-each>

                <xsl:for-each select="./gerelateerde_afspraak/*">
                    <xsl:variable name="element-name" as="xs:string*">
                        <xsl:value-of select="nf:element-name(./..)"/>
                        <xsl:choose>
                            <xsl:when test="./local-name() eq 'identificatie_medicatieafspraak'">
                                <xsl:value-of select="': MA'"/>
                            </xsl:when>
                            <xsl:when test="./local-name() eq 'identificatie_toedieningsafspraak'">
                                <xsl:value-of select="': TA'"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{$element-name}" waarde="{./@value}"/>
                </xsl:for-each>
                <xsl:for-each select="./gerelateerde_verstrekking/*">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(./..)}" waarde="{./@value}"/>
                </xsl:for-each>
                <!-- informant -->
                <xsl:for-each select="./informant[.//(@value | @code)]">
                    <xsl:variable name="waarde" as="xs:string*">
                        <xsl:choose>
                            <xsl:when test="./persoon">Persoon: <xsl:value-of select="nf:persoon-string(./persoon)"/></xsl:when>
                            <xsl:when test="./informant_is_patient/@value = 'true'">Patiënt</xsl:when>
                            <xsl:when test="./informant_is_zorgverlener[.//(@value | @code)]">Zorgverlener: <xsl:value-of select="nf:zorgverlener-string(./informant_is_zorgverlener)"/></xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{$waarde}"/>
                </xsl:for-each>
                <!-- reden gebruik -->
                <xsl:apply-templates select="./(reden_gebruik | reden_wijzigen_of_stoppen_gebruik)" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="$level"/>
                </xsl:apply-templates>
                <!-- gewicht en lengte -->
                <xsl:for-each select="./(lichaamslengte/lengte_waarde | lichaamsgewicht/gewicht_waarde)[@value]">
                    <xsl:variable name="date-append-string">
                        <xsl:for-each select="./../(lengte_datum_tijd | gewicht_datum_tijd)[@value]">
                            <xsl:value-of select="concat('. Gemeten: ', nf:configurable-T-date(./../.., ., false()))"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(./..)}" waarde="{./normalize-space(concat(@value, ' ', @unit, $date-append-string))}"/>
                </xsl:for-each>
                <xsl:apply-templates select="./(kopie_indicator | toelichting | aanvullende_informatie)" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="$level"/>
                </xsl:apply-templates>
                <xsl:for-each select="./relatie_naar_medicatieafspraak[.//@value]">
                    <gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{./identificatie/@value}"/>
                </xsl:for-each>
                <!-- MBH identificatie -->
                <xsl:for-each select="./../identificatie[.//(@value | @code)]">
                    <gegevenselement xmlns="" level="1" naam="MBH identificatie" waarde="{./@value}"/>
                </xsl:for-each>
            </tabel>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template name="tabelrijen-product">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:choose>
            <!-- gecodeerd geneesmiddel -->
            <xsl:when test=".[not(product_specificatie)]">
                <!-- product codes sorten van specifiek naar generiek -->
                <!-- TODO functie maken die naam maakt -->
                <xsl:variable name="naam-prim">Geneesmiddel - primaire code</xsl:variable>
                <xsl:variable name="naam-gene">Geneesmiddel - generiekere code</xsl:variable>
                <xsl:for-each select="./product_code[@codeSystem = $oidGStandaardZInummer]">
                    <gegevenselement xmlns="" level="{$level}" naam="{$naam-prim}" waarde="{nf:element-code-waarde(.)}"/>
                </xsl:for-each>
                <xsl:for-each select="./product_code[@codeSystem = $oidGStandaardHPK]">
                    <xsl:choose>
                        <xsl:when test="./../product_code[@codeSystem = $oidGStandaardZInummer]">
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-gene}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-prim}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="./product_code[@codeSystem = $oidGStandaardPRK]">
                    <xsl:choose>
                        <xsl:when test="./../product_code[@codeSystem = ($oidGStandaardZInummer, $oidGStandaardHPK)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-gene}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-prim}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="./product_code[@codeSystem = $oidGStandaardGPK]">
                    <xsl:choose>
                        <xsl:when test="./../product_code[@codeSystem = ($oidGStandaardZInummer, $oidGStandaardHPK, $oidGStandaardPRK)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-gene}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-prim}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="./product_code[@codeSystem = $oidGStandaardSSK]">
                    <xsl:choose>
                        <xsl:when test="./../product_code[@codeSystem = ($oidGStandaardZInummer, $oidGStandaardHPK, $oidGStandaardPRK, $oidGStandaardGPK)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-gene}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-prim}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="./product_code[@codeSystem = $oidGStandaardSNK]">
                    <xsl:choose>
                        <xsl:when test="./../product_code[@codeSystem = ($oidGStandaardZInummer, $oidGStandaardHPK, $oidGStandaardPRK, $oidGStandaardGPK, $oidGStandaardSSK)]">
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-gene}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <gegevenselement xmlns="" level="{$level}" naam="{$naam-prim}" waarde="{nf:element-code-waarde(.)}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <!-- 'magistraal' -->
            <xsl:when test="./product_specificatie">
                <xsl:for-each select="./product_specificatie">
                    <groep xmlns="" level="{$level}" naam="{concat('Geneesmiddel - ', nf:element-name(.))}">
                        <xsl:variable name="level" select="xs:int($level + 1)"/>
                        <xsl:apply-templates select="./(product_naam | omschrijving | farmaceutische_vorm | ingredient)[.//(@value | @code)]" mode="maak-tabel-rij">
                            <xsl:with-param name="level" select="$level"/>
                        </xsl:apply-templates>
                    </groep>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="sterkte" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(3)"/>
        <xsl:variable name="numerator" select="./hoeveelheid_ingredient"/>
        <xsl:variable name="denominator" select="./hoeveelheid_product"/>
        <xsl:variable name="sterkte-string" as="xs:string*">
            <xsl:value-of select="concat($numerator/waarde/@value, ' ', nf:unit-string($numerator/waarde/@value, $numerator/eenheid/@displayName), ' per ')"/>
            <xsl:value-of select="concat($denominator/waarde/@value, ' ', nf:unit-string($denominator/waarde/@value, $denominator/eenheid/@displayName))"/>
        </xsl:variable>
        <xsl:for-each select=".[.//(@value | @code)]">
            <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{$sterkte-string}"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="ingredient" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(2)"/>
        <!-- change the sequence so that ingredient code is first row -->
        <groep xmlns="" level="{$level}" naam="{nf:element-name(.)}">
            <xsl:apply-templates select="./ingredient_code" mode="maak-tabel-rij">
                <xsl:with-param name="level" select="xs:int($level + 1)"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="./*[local-name() ne 'ingredient_code']" mode="maak-tabel-rij">
                <xsl:with-param name="level" select="xs:int($level + 1)"/>
            </xsl:apply-templates>
        </groep>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="adresgegevens" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)" as="xs:int"/>
        <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:adres-string(.))}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="naamgegevens[not(naamgegevens)]" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)" as="xs:int"/>
        <gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:naam-string(.))}"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template to get rid of nested naamgegevens which unfortunately ended up in dataset</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="naamgegevens[naamgegevens]" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)" as="xs:int"/>
        <xsl:apply-templates select="node()" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
        </xsl:apply-templates>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="current-bouwsteen">ada bouwsteen of the input ada instance xml</xd:param>
        <xd:param name="current-element">the ada xml element in the current bouwsteen that has a date to be converted</xd:param>
        <xd:param name="output0time">whether or not a time of 00:00 should be outputted in the text</xd:param>
    </xd:doc>
    <xsl:function name="nf:configurable-T-date" as="xs:string">
        <xsl:param name="current-bouwsteen" as="element()?"/>
        <xsl:param name="current-element" as="element()?"/>
        <xsl:param name="output0time" as="xs:boolean?"/>
        <xsl:variable name="conversion_element">
            <xsl:choose>
                <xsl:when test="$current-bouwsteen[local-name() eq 'beschikbaarstellen_medicatieoverzicht']">
                    <xsl:sequence select="$date-conversion-xml//*[@id eq $current-bouwsteen/@id]//*[local-name() eq $current-element/local-name()]"/>
                </xsl:when>
                <xsl:when test="$current-bouwsteen[identificatie]">
                    <xsl:sequence select="$date-conversion-xml//medicamenteuze_behandeling/*[@id eq $current-bouwsteen/identificatie/@value][@root eq $current-bouwsteen/identificatie/@root]//*[local-name() eq $current-element/local-name()]"/>
                </xsl:when>
                <xsl:when test="$current-bouwsteen/..[identificatie]">
                    <xsl:sequence select="$date-conversion-xml//medicamenteuze_behandeling[@id eq $current-bouwsteen/../identificatie/@value][@root eq $current-bouwsteen/../identificatie/@root]//*[local-name() eq $current-element/local-name()]"/>
                </xsl:when>
                <xsl:when test="$current-bouwsteen[not(identificatie)]">
                    <!-- geen identificatie, let's try and find a possible configurable date using bsn and product_code -->
                    <xsl:variable name="patient-bsn" select="$current-bouwsteen/../../patient/identificatienummer[@root = $oidBurgerservicenummer]"/>
                    <xsl:variable name="product_code" select="$current-bouwsteen//product_code"/>
                    <xsl:sequence select="$date-conversion-xml//medicamenteuze_behandeling/*[@bsn = $patient-bsn/@value][@productcode = $product_code/@code]//*[local-name() eq $current-element/local-name()]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$date-conversion-xml//*[local-name() eq $current-element/local-name()]"/>
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
                    <xsl:value-of select="$conversion_element/*/@value"/>
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
        <xsl:value-of select="normalize-space(string-join($in/zorgverlener/(zorgverlener_naam | naamgegevens)//@value, ' '))"/>
        <xsl:if test="$in//specialisme/@displayName">
            <xsl:value-of select="concat(' - ', $in//specialisme/@displayName, '. ')"/>
        </xsl:if>
        <xsl:value-of select="normalize-space(string-join($in//zorgaanbieder/organisatie_naam/@value, ' '))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Outputs a human readable string for a period with a possible start, duration, end date. The actual dates may be replaced by a configurable "T"-date with an addition of subtraction of a given number of days..</xd:desc>
        <xd:param name="current-bouwsteen">The current MP building block, for example: medicatieafspraak or toedieningsafspraak.</xd:param>
        <xd:param name="start-date">start date of the period</xd:param>
        <xd:param name="periode">duration of the period</xd:param>
        <xd:param name="end-date">end date of the period</xd:param>
    </xd:doc>
    <xsl:function name="nf:periode-string" as="xs:string?">
        <xsl:param name="current-bouwsteen"/>
        <xsl:param name="start-date"/>
        <xsl:param name="periode"/>
        <xsl:param name="end-date"/>

        <xsl:for-each select="$current-bouwsteen">
            <xsl:variable name="waarde" as="xs:string*">
                <xsl:if test="$start-date[@value]">Vanaf <xsl:value-of select="nf:configurable-T-date(., $start-date, false())"/></xsl:if>
                <xsl:if test="$start-date[@value] and ($periode[@value] | $end-date[@value])">
                    <xsl:value-of select="', '"/>
                </xsl:if>
                <xsl:if test="$periode/@value">gedurende <xsl:value-of select="concat($periode/@value, ' ', nf:unit-string($periode/@value, $periode/@unit))"/></xsl:if>
                <xsl:if test="$end-date[@value]"> tot en met <xsl:value-of select="nf:configurable-T-date(., $end-date, true())"/>
                </xsl:if>
                <xsl:if test="not($periode[@value]) and not($end-date[@value])"><xsl:if test="$start-date[@value]">, </xsl:if>tot nader order</xsl:if>
            </xsl:variable>
            <xsl:value-of select="normalize-space(string-join($waarde))"/>
        </xsl:for-each>
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

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:naam-string" as="xs:string*">
        <xsl:param name="in" as="element(naamgegevens)?"/>
        <xsl:value-of select="string-join($in//@value, ' ')"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:adres-string" as="xs:string*">
        <xsl:param name="in" as="element(adresgegevens)?"/>
        <xsl:value-of select="string-join($in//(@value | @displayName), ' ')"/>
    </xsl:function>


</xsl:stylesheet>
