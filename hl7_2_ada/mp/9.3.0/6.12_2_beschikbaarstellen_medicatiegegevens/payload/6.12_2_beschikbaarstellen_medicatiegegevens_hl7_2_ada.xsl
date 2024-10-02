<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../hl7_2_ada_mp_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>

    <!--    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="false()"/>-->
    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="true()"/>
    <xsl:variable name="logLevel" select="$logDEBUG"/>

    <xsl:variable name="transactionName">beschikbaarstellen_medicatiegegevens</xsl:variable>
    <xsl:variable name="transactionOid">2.16.840.1.113883.2.4.3.11.60.20.77.4.301</xsl:variable>
    <xsl:variable name="transactionEffectiveDate" as="xs:dateTime">2022-02-07T00:00:00</xsl:variable>
    <xsl:variable name="adaFormname">medicatiegegevens</xsl:variable>
    <xsl:variable name="mpVersion">mp93</xsl:variable>

    <xd:doc>
        <xd:desc>Template voor converteren van de 6.12 XML</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="verstrekkingslijst-612" select="//hl7:QURX_IN990113NL/hl7:ControlActProcess/hl7:subject/hl7:MedicationDispenseList"/>
        <xsl:choose>
            <!-- alleen inhoudelijke conversie als er ook een verstrekkingenlijst is -->
            <xsl:when test="$verstrekkingslijst-612">
                <xsl:call-template name="Verstrekking_612">
                    <xsl:with-param name="dispense-lists" select="$verstrekkingslijst-612"/>
                </xsl:call-template>
            </xsl:when>
            <!-- anders alleen root element om valide xml in output te hebben -->
            <xsl:otherwise>
                <beschikbaarstellen_medicatiegegevens app="mp-{$mpVersion}" shortName="{$transactionName}" formName="{$adaFormname}" transactionRef="{$transactionOid}" transactionEffectiveDate="{$transactionEffectiveDate}" prefix="mp-" language="nl-NL"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Converteert een verstrekkingenlijst</xd:desc>
        <xd:param name="dispense-lists"/>
    </xd:doc>
    <xsl:template name="Verstrekking_612">
        <xsl:param name="dispense-lists" as="element()*"/>

        <xsl:variable name="adaXml">
            <xsl:if test="$logLevel = $logDEBUG">
                <xsl:comment>Generated from HL7v3 verstrekkingenlijst 6.12 xml with message id (QURX_IN990113NL/id) <xsl:value-of select="concat('root: ', /hl7:QURX_IN990113NL/hl7:id/@root, ' and extension: ', /hl7:QURX_IN990113NL/hl7:id/@extension)"/>.</xsl:comment>
            </xsl:if>
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../beschikbaarstellen_medicatiegegevens/ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd">
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <xsl:for-each select="$dispense-lists">
                        <xsl:variable name="patient" select="./hl7:subject/hl7:Patient"/>
                        <xsl:variable name="dispense-events" select="./hl7:component/hl7:medicationDispenseEvent"/>
                        <beschikbaarstellen_medicatiegegevens app="mp-mp93" shortName="{$transactionName}" formName="{$adaFormname}" transactionRef="{$transactionOid}" transactionEffectiveDate="{$transactionEffectiveDate}" prefix="mp-" language="nl-NL">
                            <xsl:attribute name="title">Generated from HL7v3 verstrekkingenlijst 6.12 xml</xsl:attribute>
                            <xsl:attribute name="id" select="tokenize(base-uri(), '/')[last()]"/>
                            <xsl:for-each select="$patient">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180601000000"/>
                            </xsl:for-each>
                            <xsl:for-each select="$dispense-events">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.110_20130521000000_2_MP93">
                                    <xsl:with-param name="current-dispense-event" select="."/>
                                    <xsl:with-param name="transaction" select="$transactionName"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </beschikbaarstellen_medicatiegegevens>
                    </xsl:for-each>
                </data>
            </adaxml>
        </xsl:variable>

        <xsl:variable name="adaXmlWithBouwstenen">
            <xsl:choose>
                <xsl:when test="$deduplicateAdaBouwstenen = true()">
                    <xsl:variable name="adaXmlDeduplicated">
                        <xsl:apply-templates select="$adaXml" mode="deduplicateBouwstenenStep1"/>
                    </xsl:variable>
                    <xsl:apply-templates select="$adaXmlDeduplicated" mode="deduplicateBouwstenenStep2"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- don't deduplicate the bouwstenen -->
                    <xsl:apply-templates select="$adaXml" mode="handleBouwstenen"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:apply-templates select="$adaXmlWithBouwstenen" mode="handleMP92AdaNameChanges"/>

    </xsl:template>

    <xd:doc>
        <xd:desc> Medication Dispense Event 6.12 </xd:desc>
        <xd:param name="current-dispense-event"/>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.110_20130521000000_2_MP93">
        <xsl:param name="current-dispense-event" select="."/>
        <xsl:param name="transaction" select="$transactionName"/>
        <medicamenteuze_behandeling>
            <!-- mbh id is not known in 6.12. We fake it using https://bits.nictiz.nl/browse/MP-572 -->
            <xsl:variable name="PRK" select="(hl7:product/hl7:dispensedMedication/hl7:MedicationKind/(hl7:code | hl7:code/hl7:translation)[@codeSystem = $oidGStandaardPRK][@code])[1]"/>
            <xsl:variable name="HPK" select="(hl7:product/hl7:dispensedMedication/hl7:MedicationKind/(hl7:code | hl7:code/hl7:translation)[@codeSystem = $oidGStandaardHPK][@code])[1]"/>
            <identificatie>
                <xsl:choose>
                    <xsl:when test="$PRK">
                        <xsl:attribute name="value" select="$PRK/@code"/>
                        <xsl:attribute name="root" select="$genericMBHidPRK"/>
                    </xsl:when>
                    <xsl:when test="$HPK">
                        <xsl:attribute name="value" select="$HPK/@code"/>
                        <xsl:attribute name="root" select="$genericMBHidHPK"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="value" select="$current-dispense-event/hl7:id/@extension"/>
                        <xsl:attribute name="root" select="concat($concatOidMBH, $current-dispense-event/hl7:id/@root)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </identificatie>
            <xsl:call-template name="mp9-toedieningsafspraak-from-mp612-MP93">
                <xsl:with-param name="current-dispense-event" select="$current-dispense-event"/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
        </medicamenteuze_behandeling>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle an hl7 dispenseEvent and create an ada toedieningsafspraak element.</xd:desc>
        <xd:param name="current-dispense-event">The input hl7 dispenseEvent, defaults to context.</xd:param>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="mp9-toedieningsafspraak-from-mp612-MP93" match="hl7:medicationDispenseEvent" mode="MP93">
        <xsl:param name="current-dispense-event" select="." as="element()?"/>
        <xsl:param name="transaction" select="$transactionName"/>
        <!-- let's sort the available hl7:medicationAdministrationRequest's in chronological order -->
        <!-- mar = medicationAdministrationRequest  -->
        <xsl:variable name="mar-sorted" as="element(hl7:medicationAdministrationRequest)*">
            <xsl:for-each select="$current-dispense-event/hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest">
                <xsl:sort data-type="number" select="nf:appendDate2DateTime((.//hl7:effectiveTime | .//hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]/hl7:low/@value)"/>
                <!-- tested this with xsl:sequence, but the later use of for-each to iterate through the variable $mar does not respect the sorted order, 
                  but takes the input order from the input xml -->
                <!-- the xslt2 perform-sort function has the same result (probably for same reason, since it uses sequence as well) -->
                <!-- so we are using copy-of here to preserve order, even though it is known to perform worse -->
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <!--issue MP-371 copy-of (in $mar-sorted) causes namespace-uri-from-QName to fail, use a regex instead -->
        <!-- gebruiksperiode-start bij eenmalig gebruik-->
        <xsl:variable name="effectiveTimes-eenmalig" select="$mar-sorted/hl7:effectiveTime[not(@xsi:type) or replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'TS']"/>

        <!-- variable that contains all IVL_TS in all of the medicationAdministrationRequest's -->
        <xsl:variable name="IVL_TS" as="element()*" select="$mar-sorted//(hl7:effectiveTime | hl7:comp)[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']"/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$current-dispense-event">
            <toedieningsafspraak>
                <!-- identificatie -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <!-- identificatie -->
                    <xsl:if test="$logLevel = $logDEBUG">
                        <xsl:comment>The toedieningsafspraak/id is converted from the medicationDispenseEvent/id. root preconcatenated, extension copied.</xsl:comment>
                    </xsl:if>
                    <xsl:for-each select="hl7:id[@extension]">
                        <identificatie root="{concat($concatOidTA, @root)}" value="{@extension}"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- er is geen afspraakdatum in een 6.12 verstrekkingenbericht -->
                <!-- benaderen met verstrekkingsdatum -->
                <xsl:if test="$logLevel = $logDEBUG">
                    <xsl:comment>Afspraakdatum is benaderd met de verstrekkingsdatum (medicationDispenseEvent/effectiveTime)</xsl:comment>
                </xsl:if>
                <!-- afspraakdatum -->
                <xsl:for-each select="hl7:effectiveTime[@value]">
                    <toedieningsafspraak_datum_tijd>
                        <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, nf:determine_date_precision(./@value))"/>
                    </toedieningsafspraak_datum_tijd>
                </xsl:for-each>
                <!-- gebruiksperiode -->
                <xsl:variable name="inhoudGebruiksperiode" as="element(gebruiksperiode)">
                    <gebruiksperiode>
                        <!-- gebruiksperiode-start -->
                        <!-- in 6.12 kun je alleen een conclusie trekken over gebruiksperiode-start, als álle MARs een IVL_TS/low/@value hebben, dus hier checken we of er géén mar is zonder IVL_TS/low -->
                        <!-- extra possibility to allow for empty namespace because the copy-of in $mar-sorted has a bug in Saxon 9.9.1.7: namespace is somehow not resolved properly in a copied-of variable -->
                        <xsl:if test="count($mar-sorted) gt 0 and not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']/hl7:low/@value)])">
                            <!-- okay, alle mar's hebben een IVL_TS/low, pfieuw -->
                            <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de laagste low als gebruiksperiode startdatum -->
                            <!-- omdat $mar gesorteerd is, is dat de eerste $IVL_TS -->
                            <xsl:call-template name="mp9-gebruiksperiode-start">
                                <xsl:with-param name="inputValue" select="$IVL_TS[1]/hl7:low/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="count($effectiveTimes-eenmalig[not(@nullFlavor)]) = 1">
                                <xsl:if test="$logLevel = $logDEBUG">
                                    <xsl:comment>gebruiksperiode-start bij eenmalig gebruik</xsl:comment>
                                </xsl:if>
                                <xsl:call-template name="mp9-gebruiksperiode-start">
                                    <xsl:with-param name="inputValue" select="$effectiveTimes-eenmalig/@value"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="count($effectiveTimes-eenmalig[@nullFlavor]) = 1">
                                <xsl:if test="$logLevel = $logDEBUG">
                                    <xsl:comment>gebruiksperiode-start nullFlavor</xsl:comment>
                                </xsl:if>
                                <xsl:call-template name="mp9-gebruiksperiode-start">
                                    <xsl:with-param name="nullFlavor" select="$effectiveTimes-eenmalig/@nullFlavor"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="count($effectiveTimes-eenmalig) = 0"><!-- do nothing --></xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="level" select="$logWARN"/>
                                    <xsl:with-param name="msg">Found more than one instruction for eenmalig gebruik. Not supported to convert this into structured information for gebruiksperiode-start</xsl:with-param>
                                </xsl:call-template>
                                <xsl:if test="$logLevel = $logDEBUG">
                                    <xsl:comment>Found more than one instruction for eenmalig gebruik in dispense event with id <xsl:value-of select="$current-dispense-event/hl7:id/@extension"/>. Not supported to convert this into structured information for gebruiksperiode-start</xsl:comment>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>

                        <!-- alleen tijds_duur output bij 1 MAR die een width heeft, 
                            of als alle MAR's dezelfde width én dezelfde startdatum (of absentie daarvan) hebben. 
                            Bij meerdere MAR's met verschillende startdatum berekenen we indien mogelijk de einddatum -->
                        <xsl:variable name="AllIVL_TSHaveWidth" as="xs:boolean" select="count($IVL_TS) gt 0 and (count($IVL_TS) = count($IVL_TS[hl7:width]))"/>
                        <xsl:variable name="comparedWidth" as="element()*">
                            <xsl:for-each-group select="$IVL_TS" group-by="concat(hl7:width/@value, hl7:width/@unit)">
                                <xsl:sequence select="hl7:width"/>
                            </xsl:for-each-group>
                        </xsl:variable>
                        <xsl:variable name="AllorNoneIVL_TSHaveStartDate" as="xs:boolean" select="count($IVL_TS/hl7:low) = 0 or count($IVL_TS) = count($IVL_TS[hl7:low])"/>
                        <xsl:variable name="comparedStartDate" as="element()*">
                            <xsl:for-each-group select="$IVL_TS" group-by="hl7:low/@value">
                                <xsl:sequence select="hl7:low"/>
                            </xsl:for-each-group>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) = 1]">
                                <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                                    <tijds_duur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="count($IVL_TS[hl7:width]) gt 0">
                                <!-- width in IVL_TS : do they all have width/(absence of) startdate and if so, are they all the same? -->
                                <xsl:if test="$AllIVL_TSHaveWidth and $AllorNoneIVL_TSHaveStartDate and count($comparedWidth) = 1 and count($comparedStartDate) lt 2">
                                    <tijds_duur value="{$comparedWidth/@value}" unit="{nf:convertTime_UCUM2ADA_unit($comparedWidth/@unit)}"/>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>

                        <!-- gebruiksperiode-eind -->
                        <!-- in 6.12 kun je een conclusie trekken over gebruiksperiode-eind, als álle MARs een IVL_TS/high/@value hebben óf allemaal een start en een width-->
                        <!--  zonder startdatum 'zweven' de periodes en kun je geen uitspraak doen over totale gebruiksduur-->
                        <!--  zonder width is de gebruiksperiode tot nader order en wordt er geen gebruiksperiode-eind opgenomen-->
                        <xsl:choose>
                            <xsl:when test="$AllIVL_TSHaveWidth and $AllorNoneIVL_TSHaveStartDate and count($comparedWidth) = 1 and count($comparedStartDate) lt 2">
                                <!-- we already have tijds_duur, no need to calculate eind, so do nothing here -->
                            </xsl:when>
                            <!-- alle MARs IVL_TS/high/@value-->
                            <xsl:when test="count($mar-sorted) gt 0 and not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']/hl7:high/@value)])">
                                <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de hoogste high als gebruiksperiode einddatum -->
                                <xsl:variable name="eind-datums" as="element()*">
                                    <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                                        <xsl:sort data-type="number" select="nf:appendDate2DateTime(./@value)"/>
                                        <xsl:sequence select="."/>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:call-template name="mp9-gebruiksperiode-eind">
                                    <xsl:with-param name="inputValue" select="$eind-datums[last()]/@value"/>
                                </xsl:call-template>
                            </xsl:when>
                            <!-- alle MAR's een low én een width bij meer dan 1 MAR -->
                            <xsl:when test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) gt 1] and not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']/(hl7:low/@value and hl7:width[@unit = 'd']/@value))])">
                                <!-- alle mar's hebben een low en een width. einddatums uitrekenen -->
                                <xsl:variable name="einddatums" as="element()*">
                                    <xsl:for-each select="$IVL_TS">
                                        <xsl:variable name="hl7-start-datum" select="hl7:low/@value"/>
                                        <!-- width is altijd in dagen in 6.12 -->
                                        <xsl:variable name="hl7-width-in-days" select="hl7:width/@value"/>
                                        <!-- TODO: als van $hl7-start-datum geen dateTime kan worden gemaakt, valt dit hier om: -->
                                        <xsl:variable name="xml-start-datum" as="xs:dateTime" select="xs:dateTime(nf:formatHL72XMLDate(nf:appendDate2DateTime($hl7-start-datum), 'SECOND'))"/>
                                        <xsl:variable name="xml-eind-datum" select="xs:dateTime($xml-start-datum + xs:dayTimeDuration(concat('P', $hl7-width-in-days, 'D')))"/>
                                        <xml-eind-datum value="{$xml-eind-datum}"/>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="einddatums-sorted" as="xs:dateTime*">
                                    <xsl:for-each select="$einddatums/@value">
                                        <xsl:sort data-type="text" select="."/>
                                        <xsl:copy-of select="."/>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:call-template name="mp9-gebruiksperiode-eind">
                                    <xsl:with-param name="inputValue" select="nf:format2HL7Date(xs:string($einddatums-sorted[last()]), 'seconds')"/>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </gebruiksperiode>
                </xsl:variable>
                <xsl:if test="$inhoudGebruiksperiode[@* | *]">
                    <xsl:choose>
                        <xsl:when test="$inhoudGebruiksperiode[tijds_duur][gebruiksperiode_eind]">
                            <gebruiksperiode>
                                <xsl:copy-of select="$inhoudGebruiksperiode/(gebruiksperiode_start | gebruiksperiode_eind)"/>
                            </gebruiksperiode>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:copy-of select="$inhoudGebruiksperiode"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>

                <!-- geannuleerd indicator en stoptype wordt niet ondersteund in 6.12, geen output hiervoor-->
                <!-- verstrekker -->
                <xsl:variable name="hl7Verstrekker" as="element()*">
                    <xsl:choose>
                        <!-- should be in hl7:responsibleParty -->
                        <xsl:when test="hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
                            <xsl:sequence select="hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization"/>
                        </xsl:when>
                        <!-- okay, sigh, we'll try to fall back on hl7:performer -->
                        <xsl:when test="hl7:performer/hl7:assignedPerson/hl7:representedOrganization">
                            <xsl:sequence select="hl7:performer/hl7:assignedPerson/hl7:representedOrganization"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:for-each select="$hl7Verstrekker">
                    <verstrekker>
                        <xsl:call-template name="mp92-zorgaanbieder">
                            <xsl:with-param name="hl7CurrentOrganization" select="."/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>
                <!-- reden afspraak wordt niet ondersteund in 6.12 -->
                <!--         <reden_afspraak value="reden afspraak TA"/>-->
                <!-- geneesmiddel_bij_toedieningsafspraak  -->
                <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
                    <geneesmiddel_bij_toedieningsafspraak>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000-MP920">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </geneesmiddel_bij_toedieningsafspraak>
                </xsl:for-each>

                <xsl:apply-templates select="$current-dispense-event/hl7:product" mode="MP92">
                    <xsl:with-param name="effectiveTimes-eenmalig" select="$effectiveTimes-eenmalig"/>
                    <xsl:with-param name="hl7-current-comp" select="."/>
                    <xsl:with-param name="mar-sorted" select="$mar-sorted"/>
                </xsl:apply-templates>

                <!-- 6.12 kent geen aanvullende informatie en toelichting in vrije tekst -->
                <!--<aanvullende_informatie value="16" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.14.2053" displayName="Melding lareb"/>
         <toelichting value="toelichting bij TA"/>-->
                <!-- MP 6.1x heeft wel een relatie naar het voorschrift (medicatieafspraak + verstrekkingsverzoek) en die stoppen we in relatie_medicatieafspraak. -->
                <relatie_medicatieafspraak>
                    <xsl:choose>
                        <xsl:when test=".//hl7:product/hl7:dispensedMedication/hl7:directTargetOf/hl7:prescription/hl7:id[@root | @extension]">
                            <xsl:call-template name="handleII">
                                <xsl:with-param name="in" select=".//hl7:product/hl7:dispensedMedication/hl7:directTargetOf/hl7:prescription/hl7:id[@root | @extension]"/>
                                <xsl:with-param name="elemName">identificatie</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <identificatie value="UNK" root="{$oidHL7NullFlavor}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </relatie_medicatieafspraak>

            </toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
