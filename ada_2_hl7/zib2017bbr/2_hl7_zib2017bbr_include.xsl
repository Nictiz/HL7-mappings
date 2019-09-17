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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
    <xsl:import href="../hl7/2_hl7_hl7_include.xsl"/>
    <xsl:import href="../zib1bbr/2_hl7_zib1bbr_include.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>

    <xd:doc>
        <xd:desc>Helper template to fill person details based on ada patient</xd:desc>
    </xd:doc>
    <xsl:template name="_CdaPerson">
        <xsl:for-each select=".//naamgegevens[not(naamgegevens)][.//(@value | @code | @nullFlavor)]">
            <name>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                    <xsl:with-param name="naamgegevens" select="."/>
                </xsl:call-template>
            </name>
        </xsl:for-each>
        <xsl:for-each select="geslacht[.//(@value | @code | @nullFlavor)]">
            <administrativeGenderCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </administrativeGenderCode>
        </xsl:for-each>
        <!-- geboortedatum -->
        <xsl:for-each select="geboortedatum[.//(@value | @code | @nullFlavor)]">
            <birthTime>
                <xsl:call-template name="makeTSValueAttr"/>
            </birthTime>
        </xsl:for-each>

        <!-- overlijdens_indicator -->
        <xsl:for-each select="overlijdens_indicator[.//(@value | @code | @nullFlavor)]">
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">deceasedInd</xsl:with-param>
                <xsl:with-param name="elemNamespace">urn:hl7-org:sdtc</xsl:with-param>
                <xsl:with-param name="xsiType"/>
            </xsl:call-template>
        </xsl:for-each>

        <xsl:for-each select="datum_overlijden[.//(@value | @code | @nullFlavor)]">
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="elemName">deceasedTime</xsl:with-param>
                <xsl:with-param name="elemNamespace">urn:hl7-org:sdtc</xsl:with-param>
                <xsl:with-param name="xsiType"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- meerlingindicator -->
        <xsl:for-each select="meerling_indicator[@value | @nullFlavor]">
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">multipleBirthInd</xsl:with-param>
                <xsl:with-param name="elemNamespace">urn:hl7-org:sdtc</xsl:with-param>
                <xsl:with-param name="xsiType"/>
            </xsl:call-template>

        </xsl:for-each>
        <!-- rangnummer_kind added for peri-->
        <xsl:for-each select="rangnummer_kind[@value | @nullFlavor]">
            <xsl:call-template name="makeINTValue">
                <xsl:with-param name="elemName">multipleBirthOrderNumber</xsl:with-param>
                <xsl:with-param name="elemNamespace">urn:hl7-org:sdtc</xsl:with-param>
                <xsl:with-param name="xsiType"/>
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template>


    <xd:doc>
        <xd:desc>Helper template to fill telecom details based on ada patient</xd:desc>
    </xd:doc>
    <xsl:template name="_CdaTelecom">
        <!--Telecom gegevens-->
        <xsl:for-each select=".//telefoonnummers[.//(@value | @code | @nullFlavor)]">
            <telecom>
                <xsl:for-each select="nummer_soort/@code">
                    <xsl:attribute name="use" select="."/>
                </xsl:for-each>
                <xsl:for-each select="telefoonnummer/@value">
                    <xsl:attribute name="value">
                        <xsl:text>tel:</xsl:text>
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:for-each>
            </telecom>
        </xsl:for-each>

        <xsl:for-each select=".//email_adressen[.//(@value | @code | @nullFlavor)]">
            <telecom>
                <xsl:for-each select="email_soort/@code">
                    <xsl:attribute name="use" select="."/>
                </xsl:for-each>
                <xsl:for-each select="email_adres/@value">
                    <xsl:attribute name="value">
                        <xsl:text>mailto:</xsl:text>
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:for-each>
            </telecom>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc>Creates HL7 performing healthcare provider (uitvoerende zorgaanbieder) </xd:desc>
        <xd:param name="zorgaanbieder">ada zorgaanbieder, defaults to context element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.5_20180611000000" match="zorgaanbieder | healthcare_provider">
        <xsl:param name="zorgaanbieder" select="."/>

        <xsl:for-each select="$zorgaanbieder">
            <representedOrganization>
                <!--MP CDA Organization id name-->
                <xsl:for-each select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)">
                    <!-- MP CDA Zorgaanbieder identificaties -->
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <xsl:for-each select="organisatie_naam[.//(@value | @nullFlavor)]">
                    <xsl:element name="name">
                        <xsl:choose>
                            <xsl:when test="./@value">
                                <xsl:value-of select="./@value"/>
                            </xsl:when>
                            <xsl:when test="./@nullFlavor">
                                <xsl:attribute name="nullFlavor">
                                    <xsl:value-of select="./@nullFlavor"/>
                                </xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="contactgegevens/telefoonnummers[.//(@value | @nullFlavor)]">
                    <telecom>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.103_20180611000000"/>
                    </telecom>
                </xsl:for-each>
                <xsl:for-each select="contactgegevens/email_adressen[.//(@value | @nullFlavor)]">
                    <telecom>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.104_20180611000000"/>
                    </telecom>
                </xsl:for-each>
                <xsl:for-each select="adresgegevens[.//(@value | @nullFlavor)]">
                    <addr>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000"/>
                    </addr>
                </xsl:for-each>
                <xsl:for-each select="organisatie_type">
                    <standardIndustryClassCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </standardIndustryClassCode>
                </xsl:for-each>
                <xsl:for-each select="./afdeling_specialisme">
                    <asOrganizationPartOf>
                        <xsl:call-template name="makeCode"/>
                    </asOrganizationPartOf>
                </xsl:for-each>
            </representedOrganization>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000" match="toelichting | comment" mode="HandleComment">
        <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.0.32"/>
            <code code="48767-8" codeSystem="2.16.840.1.113883.6.1" displayName="Annotation comment"/>
            <text><xsl:value-of select="@value"/></text>
        </act>

    </xsl:template>
    <xd:doc>
        <xd:desc> name person NL - generic </xd:desc>
        <xd:param name="naamgegevens">ada naamgegevens element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000" match="naamgegevens">
        <xsl:param name="naamgegevens" select="."/>

        <xsl:variable name="varNaamgegevens" select="
                if ($naamgegevens/naamgegevens) then
                    $naamgegevens/naamgegevens
                else
                    $naamgegevens"/>

        <xsl:for-each select="$varNaamgegevens[.//(@value | @code | @nullFlavor)]">
            <xsl:for-each select="voornamen[.//(@value | @code | @nullFlavor)]">
                <given qualifier="BR">
                    <xsl:value-of select="./@value"/>
                </given>
            </xsl:for-each>
            <xsl:for-each select="initialen[.//(@value | @code | @nullFlavor)]">
                <given qualifier="IN">
                    <xsl:value-of select="nf:addEnding(./@value, '.')"/>
                </given>
            </xsl:for-each>
            <xsl:for-each select="roepnaam[.//(@value | @code | @nullFlavor)]">
                <given qualifier="CL">
                    <xsl:value-of select="./@value"/>
                </given>
            </xsl:for-each>

            <xsl:choose>
                <!-- Eigen geslachtsnaam -->
                <xsl:when test="naamgebruik/@code = 'NL1'">
                    <xsl:for-each select="geslachtsnaam/voorvoegsels[.//(@value | @code | @nullFlavor)]">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam/achternaam[.//(@value | @code | @nullFlavor)]">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <!-- 	Geslachtsnaam partner -->
                <xsl:when test="naamgebruik/@code = 'NL2'">
                    <xsl:for-each select="geslachtsnaam_partner/voorvoegsels_partner[.//(@value | @code | @nullFlavor)]">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam_partner/achternaam_partner[.//(@value | @code | @nullFlavor)]">
                        <family qualifier="SP">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                <xsl:when test="naamgebruik/@code = 'NL3'">
                    <xsl:for-each select="geslachtsnaam_partner/voorvoegsels_partner[.//(@value | @code | @nullFlavor)]">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam_partner/achternaam_partner[.//(@value | @code | @nullFlavor)]">
                        <family qualifier="SP">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam/voorvoegsels[.//(@value | @code | @nullFlavor)]">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam/achternaam[.//(@value | @code | @nullFlavor)]">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                <xsl:when test="naamgebruik/@code = 'NL4'">
                    <xsl:for-each select="geslachtsnaam/voorvoegsels[.//(@value | @code | @nullFlavor)]">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam/achternaam[.//(@value | @code | @nullFlavor)]">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam_partner/voorvoegsels_partner[.//(@value | @code | @nullFlavor)]">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam_partner/achternaam_partner[.//(@value | @code | @nullFlavor)]">
                        <family qualifier="SP">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we nemen aan NL1 - alleen de eigen naam -->
                    <xsl:for-each select="geslachtsnaam/voorvoegsels[.//(@value | @code | @nullFlavor)]">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="geslachtsnaam/achternaam[.//(@value | @code | @nullFlavor)]">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!-- suffix (nog) niet in gebruik -->
        <!-- validTime (nog) niet in gebruik -->
    </xsl:template>
    <!-- address NL - generic -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000" match="adresgegevens">
        <xsl:if test="./adres_soort[1]/@code">
            <xsl:attribute name="use" select="./adres_soort[1]/@code"/>
        </xsl:if>
        <xsl:for-each select="./straat">
            <streetName>
                <xsl:value-of select="./@value"/>
            </streetName>
        </xsl:for-each>
        <xsl:for-each select="./huisnummer">
            <houseNumber>
                <xsl:value-of select="./@value"/>
            </houseNumber>
        </xsl:for-each>
        <xsl:if test="./huisnummerletter or ./huisnummertoevoeging">
            <buildingNumberSuffix>
                <xsl:value-of select="./huisnummerletter/@value"/>
                <!-- voeg scheidende spatie toe als beide aanwezig -->
                <xsl:if test="./huisnummerletter and ./huisnummertoevoeging">
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:value-of select="./huisnummertoevoeging/@value"/>
            </buildingNumberSuffix>
        </xsl:if>
        <xsl:for-each select="./aanduiding_bij_nummer">
            <additionalLocator>
                <xsl:value-of select="./@code"/>
            </additionalLocator>
        </xsl:for-each>
        <xsl:for-each select="./postcode">
            <postalCode>
                <xsl:value-of select="nf:convertAdaNlPostcode(./@value)"/>
            </postalCode>
        </xsl:for-each>
        <xsl:for-each select="./gemeente">
            <county>
                <xsl:value-of select="./@value"/>
            </county>
        </xsl:for-each>
        <xsl:for-each select="./woonplaats">
            <city>
                <xsl:value-of select="./@value"/>
            </city>
        </xsl:for-each>
        <xsl:for-each select="./land">
            <country>
                <xsl:value-of select="./@value"/>
            </country>
        </xsl:for-each>
        <!-- Additionele informatie niet gemapt op het template... -->
        <!--<xsl:for-each select="./additionele_informatie">
            <unitID>
                <xsl:value-of select="./@value"/>
            </unitID>
        </xsl:for-each>-->
    </xsl:template>
    <!-- phone number - generic -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.103_20180611000000" match="telefoonnummers">
        <xsl:attribute name="use">
            <xsl:value-of select="./nummer_soort/@code"/>
        </xsl:attribute>
        <xsl:attribute name="value">
            <xsl:choose>
                <xsl:when test="./telecom_type/@code = 'FAX'">fax:</xsl:when>
                <xsl:otherwise>tel:</xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="translate(./telefoonnummer/@value, ' ', '')"/>
        </xsl:attribute>
    </xsl:template>
    <!-- email address - generic -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.104_20180611000000" match="email_adressen">
        <xsl:attribute name="use">
            <xsl:value-of select="./email_soort/@code"/>
        </xsl:attribute>
        <xsl:attribute name="value">
            <xsl:value-of select="concat('mailto:', translate(./email_adres/@value, ' ', ''))"/>
        </xsl:attribute>
    </xsl:template>

    <xd:doc>
        <xd:desc>CDA recordTarget SDTC NL BSN Contactible</xd:desc>
        <xd:param name="patient">ada patient</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000" match="patient">
        <xsl:param name="patient" select="."/>
        <xsl:for-each select="$patient">
            <recordTarget>
                <patientRole>
                    <xsl:for-each select="(patient_identificatienummer | identificatienummer)">
                        <xsl:call-template name="makeIIValue">
                            <xsl:with-param name="root" select="./@root"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- Adres -->
                    <xsl:for-each select=".//adresgegevens[not(adresgegevens)][.//(@value | @code | @nullFlavor)]">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20170602000000">
                            <xsl:with-param name="adres" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>

                    <!--Telecom gegevens-->
                    <xsl:call-template name="_CdaTelecom"/>

                    <patient>
                        <xsl:call-template name="_CdaPerson"/>
                    </patient>
                </patientRole>
            </recordTarget>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>procedure_activity</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.3.23_20171025000000" match="verrichting" mode="HandleProcedureActivity">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
            <!-- VerrichtingType -->
            <xsl:for-each select="verrichting_type">
                <xsl:call-template name="makeCode"/>
            </xsl:for-each>
        </procedure>

    </xsl:template>
    <xd:doc>
        <xd:desc>problem observation diagnose based on ada element probleem, defaults to problem type diagnosis</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3.19_20180611000000" match="probleem" mode="HandleProblemObservationDiagnose">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
            <xsl:choose>
                <xsl:when test="probleem_type[@code | @nullFlavor]">
                    <xsl:call-template name="makeCode"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- default to diagnose -->
                    <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:for-each select="probleem_naam[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="makeCDValue"/>
            </xsl:for-each>
            <!--  verificatiestatus -->
            <xsl:for-each select="verificatie_status[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="SPRT">
                    <observation classCode="OBS" moodCode="EVN">
                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                        <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <value xsi:type="CD">
                            <xsl:if test="@code">
                                <xsl:attribute name="code" select="@code"/>
                            </xsl:if>
                            <xsl:if test="@displayName">
                                <xsl:attribute name="displayName" select="@displayName"/>
                            </xsl:if>
                            <xsl:if test="@codeSystem">
                                <xsl:attribute name="codeSystem" select="@codeSystem"/>
                            </xsl:if>
                            <xsl:if test="@codeSystemName">
                                <xsl:attribute name="codeSystemName" select="@codeSystemName"/>
                            </xsl:if>
                        </value>
                    </observation>
                </entryRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Body Weight based on ada lichaamsgewicht, only zib elements are gewicht_datum_tijd and gewicht_waarde are supported at this point in time</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.28_20171025000000" match="lichaamsgewicht | body_weight" mode="HandleBodyWeight">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.28"/>
            <code code="29463-7" codeSystem="{$oidLOINC}" displayName="Body Weight"/>
            <xsl:for-each select="(gewicht_datum_tijd | weight_date_time)[@value | @nullFlavor]">
                <xsl:call-template name="makeEffectiveTime">
                    <xsl:with-param name="effectiveTime" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="(gewicht_waarde | weight_value)[@value | @nullFlavor]">
                <xsl:call-template name="makePQValue"/>
            </xsl:for-each>
            <!-- todo clothing -->
            <!-- toelichting, text is mandatory in this template so do not output anything when there is no @value in input -->
            <xsl:for-each select="(toelichting | comment)[@value]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Body Height based on ada lichaamslengte, only zib elements are lengte_datum_tijd and lengte_waarde are supported at this point in time</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.30_20171025000000" match="lichaamslengte | body_height" mode="HandleBodyHeight">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.30"/>
            <code code="8302-2" codeSystem="{$oidLOINC}" codeSystemName="{$oidMap[@oid=$oidLOINC]/@displayName}" displayName="Body height"/>
            <xsl:for-each select="(lengte_datum_tijd | height_date_time)[@value | @nullFlavor]">
                <xsl:call-template name="makeEffectiveTime">
                    <xsl:with-param name="effectiveTime" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="(lengte_waarde | height_value)[@value | @nullFlavor]">
                <xsl:call-template name="makePQValue"/>
            </xsl:for-each>
            <!-- todo position -->
            <!-- toelichting, text is mandatory in this template so do not output anything when there is no @value in input -->
            <xsl:for-each select="(toelichting | comment)[@value]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>            
        </observation>
    </xsl:template>

    <!-- part Encounter reference -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947">
        <entryRelationship typeCode="REFR">
            <encounter classCode="ENC" moodCode="EVN">
                <xsl:call-template name="makeIIid"/>
            </encounter>
        </entryRelationship>
    </xsl:template>
    <!-- part Concern reference -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050">
        <entryRelationship typeCode="REFR">
            <act classCode="ACT" moodCode="EVN">
                <xsl:call-template name="makeIIid"/>
                <code code="CONC" codeSystem="2.16.840.1.113883.5.6" displayName="Concern" codeSystemName="ActClass"/>
            </act>
        </entryRelationship>
    </xsl:template>

    <xd:doc>
        <xd:desc>CDA custodian. Context is zorgaanbieder</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.50_20181217000000" match="zorgaanbieder" mode="zorgaanbieder2CDACustodian">

        <!-- zorgaanbieder -->
        <custodian>
            <assignedCustodian>
                <!--Zorgaanbieder-->
                <representedCustodianOrganization>
                    <xsl:for-each select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)[@value | @nullFlavor]">
                        <!-- MP CDA Zorgaanbieder identificaties -->
                        <xsl:call-template name="makeIIid"/>
                    </xsl:for-each>
                    <xsl:for-each select="organisatie_naam[.//(@value | @nullFlavor)]">
                        <xsl:element name="name">
                            <xsl:choose>
                                <xsl:when test="@value">
                                    <xsl:value-of select="@value"/>
                                </xsl:when>
                                <xsl:when test="@nullFlavor">
                                    <xsl:attribute name="nullFlavor">
                                        <xsl:value-of select="@nullFlavor"/>
                                    </xsl:attribute>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:for-each>
                    <xsl:for-each select="contactgegevens/telefoonnummers[.//(@value | @nullFlavor)]">
                        <telecom>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.103_20180611000000"/>
                        </telecom>
                    </xsl:for-each>
                    <xsl:for-each select="contactgegevens/email_adressen[.//(@value | @nullFlavor)]">
                        <telecom>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.104_20180611000000"/>
                        </telecom>
                    </xsl:for-each>
                    <xsl:for-each select="adresgegevens[.//(@value | @nullFlavor)]">
                        <addr>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000"/>
                        </addr>
                    </xsl:for-each>
                </representedCustodianOrganization>
            </assignedCustodian>
        </custodian>
    </xsl:template>



    <xd:doc>
        <xd:desc>CDA author. Context can be either zorgverlener or zorgaanbieder</xd:desc>
        <xd:param name="authorTime">ada element with author time</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.51_20181218141008_za" match="zorgaanbieder" mode="zorgaanbieder2CDAAuthor">
        <xsl:param name="authorTime" as="element()?"/>

        <!-- zorgaanbieder -->
        <author>
            <time>
                <xsl:choose>
                    <xsl:when test="$authorTime">
                        <xsl:for-each select="$authorTime">
                            <xsl:call-template name="makeTSValueAttr"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
            </time>
            <assignedAuthor>
                <!--identificatie required but not applicable when author is organization  -->
                <id nullFlavor="NI"/>
                <!--Zorgaanbieder-->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.5_20180611000000"/>
            </assignedAuthor>
        </author>
    </xsl:template>

    <!-- CDA author of informant patient -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000">
        <xsl:param name="ada_patient_identificatienummer" select="//patient/(patient_identificatienummer | identificatienummer)"/>
        <xsl:for-each select="$ada_patient_identificatienummer">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="ONESELF" displayName="Self" codeSystem="{$oidHL7RoleCode}" codeSystemName="RoleCode"/>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Head Circumference based on ada head_circumference (schedelomvang)</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.55_20190708135422" match="schedelomvang | head_circumference" mode="HandleHeadCircumference">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.55"/>
            <code code="363812007" displayName="Head circumference" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="(schedelomvang_datum_tijd | head_circumference_date)[@value | @nullFlavor]">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="(schedelomvang_waarde | head_circumference_measurement)[@value | @nullFlavor]">
                <xsl:call-template name="makePQValue"/>
            </xsl:for-each>
            <xsl:for-each select="(schedelomvang_meetmethode | head_circumference_measuring_method)[@value | @code | @nullFlavor]">
                <xsl:call-template name="makeCode">
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <!-- toelichting, text is mandatory in this template so do not output anything when there is no @value in input -->
            <xsl:for-each select="(toelichting | comment)[@value]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>
        </observation>
     </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Body Temperature based on ada lichaamstemperatuur</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.56_20190916154439" match="lichaamstemperatuur | body_temperature" mode="HandleBodyTemperature">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.56"/>
            <code code="8310-5" displayName="Body temperature" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <xsl:for-each select="(temperatuur_datum_tijd | temperature_date_time)[@value | @nullFlavor]">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="(temperatuur_waarde | temperature_value)[@value | @nullFlavor]">
                <xsl:call-template name="makePQValue"/>
            </xsl:for-each>
            <xsl:for-each select="(temperatuur_type | temperature_type)[@value | @code | @nullFlavor]">
                <xsl:call-template name="makeCode">
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <!-- toelichting, text is mandatory in this template so do not output anything when there is no @value in input -->
            <xsl:for-each select="(toelichting | comment)[@value]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>



</xsl:stylesheet>
