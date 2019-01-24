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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:include href="../hl7/2_hl7_hl7_include.xsl"/>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900004_20110128000000">
        <!-- Graviditeit -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Gravidity" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Graviditeit"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>
    <!-- Graviditeit -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900004_20161206105610">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900004"/>
            <code code="Gravidity" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Graviditeit"/>
            <!-- Item(s) :: graviditeit -->
            <xsl:call-template name="makeINTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Naam zorgverlener -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900006_20091001000000">
        <!-- Item(s) :: naam_zorgverlener-->
        <xsl:for-each select="naam_zorgverlener">
            <xsl:call-template name="makePNValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">name</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900009_20110128000000">
        <!-- Actuele a terme datum indicator -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="ActualEDD" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Actuele à terme datum"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900024_20120902000000">
        <!-- Datum einde zorgverantwoordelijkheid -->
        <high>
            <xsl:call-template name="makeTSValueAttr"/>
        </high>
    </xsl:template>
    <!-- Burgerservicenummer -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900028_20161219145253">
        <!-- Item(s) :: burgerservicenummer -->
        <xsl:for-each select="burgerservicenummer">
            <xsl:call-template name="makeII.NL.BSNValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900029_20091001000000">
        <!-- Lokale persoonsidentificatie -->
        <xsl:param name="vrouw"/>
        <id root="1.2.3.4.5">
            <xsl:attribute name="extension" select="./@value"/>
        </id>
    </xsl:template>
    <!-- Lokale persoonsidentificatie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900029_20150204151317">
        <!-- Item(s) :: lokale_persoonsidentificatie -->
        <xsl:for-each select="lokale_persoonsidentificatie">
            <xsl:call-template name="makeIIValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000">
        <xsl:param name="inputValue" select="./@value"/>
        <!-- Geboortedatum  -->
        <birthTime>
            <xsl:call-template name="makeTSValueAttr">
                <xsl:with-param name="inputValue" select="$inputValue"/>
            </xsl:call-template>
        </birthTime>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900033_20091001000000">
        <!-- Etniciteit  -->
        <ethnicGroupCode>
            <xsl:call-template name="makeCodeAttribs"/>
        </ethnicGroupCode>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900037_20120315000000">
        <conditionEvent classCode="COND" moodCode="EVN">
            <id nullFlavor="NI"/>
            <xsl:for-each select="./categorie_reden_acute_overdracht">
                <xsl:call-template name="makeCode"/>
            </xsl:for-each>
            <xsl:for-each select="./toelichting_reden">
                <text>
                    <xsl:value-of select="./@value"/>
                </text>
            </xsl:for-each>
        </conditionEvent>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900090_20091001000000">
        <!-- Pariteit  -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Parturit" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Pariteit"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900115_20120902000000">
        <!-- Datum start zorgverantwoordelijkheid -->
        <low>
            <xsl:call-template name="makeTSValueAttr"/>
        </low>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900118_20150113174631">
        <!-- Eindverantwoordelijk in periode -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Rpp" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <!-- Eindverantwoordelijk in periode -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900118_20161206113252">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900118"/>
            <code code="Rpp" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: eindverantwoordelijk_in_welke_perinatale_periodeq-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900149_20130320000000">
        <!-- Allergieen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="106190000" codeSystem="{$oidSNOMEDCT}" displayName="Allergie"/>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="originalText" select="../allergie_overig_toelichting"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900152_20110128000000">
        <!-- Soort ziekten en bijzonderheden vrouw in de algemene anamnese -->
        <inboundRelationship typeCode="COMP">
            <observation classCode="OBS" moodCode="EVN">
                <code code="VERLIND" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Soort ziekten en bijzonderheden vrouw in de algemene anamnese"/>
                <xsl:call-template name="makeCDValue">
                    <xsl:with-param name="originalText" select="../overig_toelichting"/>
                </xsl:call-template>
            </observation>
        </inboundRelationship>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900155_20110128000000">
        <!--Soort bijzonderheden obstetrische anamnese-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="OBSTANAM" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeCDValue">
                <xsl:with-param name="originalText" select="../overig_toelichting"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900156_20141107000000">
        <!-- 	Risicostatus vóór baring -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN5102" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Risicostatus vóór baring"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900158_20111206000000">
        <!-- Bloedtransfusie -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="161664006" codeSystem="{$oidSNOMEDCT}" displayName="Bloedtransfusie"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900158_20150130125418">
        <!-- Bloedtransfusie -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="116859006" codeSystem="{$oidSNOMEDCT}" displayName="Bloedtransfusie"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900159_20111206000000">
        <!-- BMI -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="39156-5" codeSystem="{$oidLOINC}" displayName="BMI"/>
            <value xsi:type="PQ">
                <xsl:attribute name="value" select="./@value"/>
                <xsl:attribute name="unit" select="'kg/m2'"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900171_20111206000000">
        <!-- Irregulaire antistoffen -->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="parent_element_name" select="'pertinentInformation3'"/>
            <xsl:with-param name="contextConduction" select="'true'"/>
            <xsl:with-param name="question" select="../irregulaire_antistoffen"/>
            <xsl:with-param name="observation" select="../welke_irregulaire_antistoffen_vrouw_aanwezig"/>
            <xsl:with-param name="observation_code" select="'312457003'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Irregulaire antistoffen'"/>
            <xsl:with-param name="observation_overig_toelichting" select="../irregulaire_antistoffen_overig_toelichting"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Prenatale screening aangekaart -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900184_20140612000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="BroachDown" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: prenatale_screening_aangekaart-->
            <xsl:for-each select="prenatale_screening_aangekaart">
                <xsl:call-template name="makeBLValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>

    <!-- Prenatale screening aangekaart -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900184_20110128000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="BroachDown" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: prenatale_screening_aangekaart prenatale_screening_aangekaart prenatale_screening_aangekaart-->
            <xsl:for-each select="prenatale_screening_aangekaart | prenatale_screening_aangekaart | prenatale_screening_aangekaart">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900186_20111206000000">
        <!-- Infectieparameter HBsAg -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="165806002" codeSystem="{$oidSNOMEDCT}" displayName="Afwijkende infectieparameters HBsAg"/>
            <value xsi:type="BL" value="false"/>
        </observation>
    </xsl:template>
    <!-- Counseling prenatale gewenst -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900187_20110128000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="CounselDesired" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: counseling_prenatale_gewenst counseling_prenatale_gewenst counseling_prenatale_gewenst counseling_prenatale_gewenst counseling_prenatale_gewenst-->
            <xsl:for-each select="counseling_prenatale_gewenst | counseling_prenatale_gewenst | counseling_prenatale_gewenst | counseling_prenatale_gewenst | counseling_prenatale_gewenst">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900197_20091001000000">
        <!-- Tijdstip begin actieve ontsluiting -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN520301" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Tijdstip begin actieve ontsluiting"/>
            <effectiveTime>
                <xsl:call-template name="makeTSValueAttr"/>
            </effectiveTime>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900197_20130320000000">
        <!-- Tijdstip begin actieve ontsluiting -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="249120008" codeSystem="{$oidSNOMEDCT}" displayName="Tijdstip begin actieve ontsluiting"/>
            <effectiveTime>
                <xsl:call-template name="makeTSValueAttr"/>
            </effectiveTime>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900198_20130320000000">
        <!-- Tijdstip breken vliezen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="289251005" codeSystem="{$oidSNOMEDCT}"/>
            <effectiveTime>
                <xsl:call-template name="makeTSValueAttr"/>
            </effectiveTime>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900198_20141104011243">
        <!-- Tijdstip breken vliezen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="289251005" codeSystem="{$oidSNOMEDCT}" displayName="Tijdstip breken vliezen"/>
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType">TS</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900199_20091001000000">
        <!-- Kleur en consistentie vruchtwater -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="38386-9" codeSystem="{$oidLOINC}" displayName="Kleur en consistentie vruchtwater"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900200_20120808000000">
        <!-- Zwangerschapsduur -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="412726003" codeSystem="{$oidSNOMEDCT}"/>
            <!-- moet in dagen in bericht -->
            <value xsi:type="PQ" unit="d">
                <xsl:attribute name="value" select="./@value"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20091001000000">
        <!--Geboorte placenta -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="AfterBirthMethod" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Geboorte placenta"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900217_20121204000000">
        <!-- Bijstimulatie toegediend? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN540201" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Bijstimulatie toegediend"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900230_20091001000000">
        <xsl:param name="inputValue" select="./@value"/>
        <!-- Maternale sterfte, als er geen goede inputValue is, nemen we aan dat de moeder leeft -->
        <deceasedInd>
            <xsl:attribute name="value">
                <xsl:choose>
                    <xsl:when test="$inputValue castable as xs:boolean">
                        <xsl:value-of select="$inputValue"/>
                    </xsl:when>
                    <xsl:when test="lower-case($inputValue) = ('ja', 'yes', 'ja', 'oui', 'si')">
                        <xsl:attribute name="value" select="true()"/>
                    </xsl:when>
                    <xsl:when test="lower-case($inputValue) = ('nee', 'no', 'nein', 'non', 'no')">
                        <xsl:attribute name="value" select="false()"/>
                    </xsl:when>
                    <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </deceasedInd>
    </xsl:template>
    <!-- Direct IPD gewenst -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900231_20140611000000">
        <xsl:for-each select="direct_ipd_gewenstq | direct_ipd_gewenstq">
            <act xmlns="urn:hl7-org:v3" classCode="CONS" moodCode="INT">
                <code code="IPDDesired" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            </act>
        </xsl:for-each>
    </xsl:template>

    <!-- Combinatietest gewenst -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900232_20140611000000">
        <xsl:for-each select="combinatietest_gewenstq | combinatietest_gewenstq">
            <act xmlns="urn:hl7-org:v3" classCode="CONS" moodCode="INT">
                <code code="CombiTestDesired" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            </act>
        </xsl:for-each>
    </xsl:template>


    <!-- SEO gewenst -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900234_20140611000000">
        <xsl:for-each select="seo_gewenstq">
            <act xmlns="urn:hl7-org:v3" classCode="CONS" moodCode="INT">
                <code code="SEODesired" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            </act>
        </xsl:for-each>
    </xsl:template>

    <!-- Direct GUO gewenst -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900235_20140611000000">
        <xsl:for-each select="direct_guo_gewenstq">
            <act xmlns="urn:hl7-org:v3" classCode="CONS" moodCode="INT">
                <code code="InstantGUODesired" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            </act>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900233_20141104005410">
        <!-- Faciliteit werkelijke plaats baring -->
        <location typeCode="ELOC">
            <healthCareFacility classCode="DSDLOC">
                <xsl:for-each select="./ziekenhuis_baring">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901018_20141107145228"/>
                </xsl:for-each>
                <!-- Item: 40003 - Werkelijke plaats baring (type locatie) -->
                <xsl:for-each select="./werkelijke_plaats_baring_type_locatie">
                    <xsl:call-template name="makeCode"/>
                </xsl:for-each>
            </healthCareFacility>
        </location>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20130320000000">
        <!-- Zwangerschapsduur op datum onderzoek -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="445872007" codeSystem="{$oidSNOMEDCT}" displayName="Zwangerschapsduur"/>
            <value xsi:type="PQ" unit="d">
                <xsl:attribute name="value" select="./@value"/>
            </value>
        </observation>
    </xsl:template>
    <!-- Zwangerschapsduur op datum onderzoek -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20161206114409">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900236"/>
            <code code="445872007" codeSystem="{$oidSNOMEDCT}" displayName="Zwangerschapsduur"/>
            <!-- Item(s) :: zwangerschapsduur zwangerschapsduur_op_datum_onderzoek-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">d</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Geslacht (medische observatie) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900255_20091001000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="46098-0" codeSystem="{$oidLOINC}" displayName="Geslacht (medische observatie)"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900259_20091001000000">
        <!-- geboortedatum (kind) -->
        <birthTime>
            <xsl:call-template name="makeTSValueAttr"/>
        </birthTime>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900261_20091001000000">
        <!-- Tijdstip actief meepersen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN530401" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Tijdstip actief meepersen"/>
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType">TS</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900261_20130320000000">
        <!-- Tijdstip actief meepersen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="249160009" codeSystem="{$oidSNOMEDCT}" displayName="Tijdstip actief meepersen"/>
            <effectiveTime>
                <xsl:call-template name="makeTSValueAttr"/>
            </effectiveTime>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20130423000000">
        <!-- 	Conditie perineum postpartum -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN5704" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Conditie perineum postpartum"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20141107181807">
        <!-- 	Conditie perineum postpartum -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="364297003" codeSystem="{$oidSNOMEDCT}" displayName="Conditie perineum postpartum"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900271_20091001000000">
        <!-- Episiotomie -->
        <procedure classCode="PROC" moodCode="EVN">
            <xsl:attribute name="negationInd" select="./episiotomieq/@value = 'false'"/>
            <id nullFlavor="NI"/>
            <code code="PRN540701" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Episiotomie"/>
            <!-- Item: 30055 - Locatie episiotomie -->
            <xsl:for-each select="./locatie_episiotomie">
                <targetSiteCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </targetSiteCode>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900275_20150213113252">
        <!-- Succes vaginale kunstverlossing -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="KuVerlSucces" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Succes vaginale kunstverlossing"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900277_20141106000000">
        <!-- Sectio caesarea -->
        <procedure classCode="PROC" moodCode="EVN">
            <id nullFlavor="NI"/>
            <code code="11466000" codeSystem="{$oidSNOMEDCT}" displayName="Sectio Caesarea"/>
            <xsl:for-each select="./beslismoment_sectio_caesarea">
                <outboundRelationship typeCode="FLFS">
                    <!-- Beslismoment sectio caesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900278_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./indicatie_sectio_caesarea">
                <outboundRelationship typeCode="RSON">
                    <!-- Indicatie sectio caesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900279_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900278_20130320000000">
        <!-- Beslismoment sectio caesarea -->
        <procedure classCode="PROC" moodCode="INT">
            <id nullFlavor="NI"/>
            <code code="SectioCae" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Sectio Caesarea"/>
            <methodCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </methodCode>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900278_20141106000000">
        <!-- Beslismoment sectio caesarea -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="SectioBeslisMoment" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Beslismoment sectio caesarea"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900279_20141106000000">
        <!-- Indicatie sectio caesarea -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="SectioCaeInd" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20091001000000">
        <!-- Apgarscore na 5 min -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="9274-2" codeSystem="{$oidLOINC}" displayName="Apgarscore na 5 min."/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900357_20121007000000">
        <!-- Partusnummer -->
        <act classCode="COND" moodCode="EVN">
            <id root="1.2.3.4.5">
                <xsl:attribute name="extension" select="./@value"/>
            </id>
            <code code="PartusNr" codeSystem="2.16.840.1.113883.2.4.4.13"/>
        </act>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900358_20110128000000">
        <!-- 	Aantal geboren kinderen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="NBorn16" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Aantal geboren kinderen"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900359_20091001000000">
        <!-- Ligging bij geboorte -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="LigGbrt" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Ligging bij geboorte"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900359_20141106000000">
        <!-- Ligging bij geboorte -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="LigGbrt" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Ligging bij geboorte"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900400_20110128000000">
        <!-- Rangnummer kind -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="BirthOrderNumber" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Rangnummer kind"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900403_20111206000000">
        <!--Placenta Compleet-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="364343000" codeSystem="{$oidSNOMEDCT}" displayName="Compleetheid placenta"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900425_20110128000000">
        <!-- Geboortegewicht -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="8339-4" codeSystem="{$oidLOINC}"/>
            <value xsi:type="PQ" unit="g">
                <xsl:attribute name="value" select="./@value"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900432_20091001000000">
        <!-- Perinatale sterfte -->
        <deceasedInd>
            <xsl:attribute name="value" select="./@value"/>
        </deceasedInd>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900432_20130320000000">
        <!-- Perinatale sterfte -->
        <deceasedInd>
            <xsl:attribute name="value" select="./@value"/>
        </deceasedInd>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900433_20091001000000">
        <!-- Fase perinatale sterfte -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN810201" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Fase perinatale sterfte"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900433_20141113163724">
        <!-- Fase perinatale sterfte -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="FasePerinataleSterfte" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Fase perinatale sterfte"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900443_20091001000000">
        <!--  Datum perinatale sterfte -->
        <deceasedTime>
            <xsl:call-template name="makeTSValueAttr"/>
        </deceasedTime>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900506_20111206000000">
        <!-- Biparital Diameter Percentile -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="X_BPD_PRCTL" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="BPD Percentiel"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900510_20111206000000">
        <!-- Head Circumference Percentile  -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="X_HC_PRCTL" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="HC Percentiel"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900513_20111206000000">
        <!--  Abdominal Circumference Percentile  -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="X_AC_PRCTL" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Abdominal circumference^Fetus Percentile"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900515_20111206000000">
        <!-- Femur Length Percentile -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="X_FL_PRCTL" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Fetal Femur diaphysis [Length]^Fetus Percentile"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900525_20121204000000">
        <!-- Soort medicatie nageboortetijdperk 2.1-->
        <substanceAdministration classCode="SBADM" moodCode="EVN">
            <consumable typeCode="CSM">
                <manufacturedProduct classCode="MANU">
                    <manufacturedProduct classCode="MMAT" determinerCode="KIND">
                        <code>
                            <xsl:call-template name="makeCodeAttribs"/>
                        </code>
                    </manufacturedProduct>
                </manufacturedProduct>
            </consumable>
        </substanceAdministration>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900525_20141107174304">
        <!-- Soort medicatie nageboortetijdperk -->
        <substanceAdministration classCode="SBADM" moodCode="EVN">
            <consumable typeCode="CSM">
                <manufacturedProduct classCode="MANU">
                    <manufacturedProduct classCode="MMAT" determinerCode="KIND">
                        <code>
                            <xsl:call-template name="makeCodeAttribs"/>
                        </code>
                    </manufacturedProduct>
                </manufacturedProduct>
            </consumable>
        </substanceAdministration>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900533_20110128000000">
        <!-- HC -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="11984-2" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="HC (Head circumference)"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900535_20110128000000">
        <!-- Abdominal Circumference -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="11979-2" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="AC (Abdominal circumference)"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900536_20110128000000">
        <!-- Femur Length -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="11963-6" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Fetal Femur diaphysis [Length] US"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900570_20110128000000">
        <!--  Body Height -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="3137-7" codeSystem="{$oidLOINC}" displayName="Body height"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900571_20110128000000">
        <!--  Body Weight  -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="3141-9" codeSystem="{$oidLOINC}" displayName="Gewicht (gemeten)"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Zorginstelling (AGB-id) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900610_20091001000000">
        <!-- Item(s) :: zorginstelling_agbid zorgaanbieder_identificatie_nummer zorgaanbieder_agbid zorgaanbieder_identificatie_nummer zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid-->
        <xsl:for-each select="zorginstelling_agbid | zorgaanbieder_identificatie_nummer[@root = '2.16.840.1.113883.2.4.6.1'] | zorgaanbieder_agbid">
            <xsl:call-template name="makeII.NL.AGBValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900612_20111206000000">
        <!-- Actuele bloeddruk -->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="75367002" codeSystem="{$oidSNOMEDCT}" displayName="Bloeddruk"/>
            <component typeCode="COMP">
                <xsl:for-each select="./actuele_bloeddruk_systolisch">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900661_20111206000000"/>
                </xsl:for-each>
            </component>
            <component typeCode="COMP">
                <xsl:for-each select="./actuele_bloeddruk_diastolisch">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900662_20111206000000"/>
                </xsl:for-each>
            </component>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900620_20120422000000">
        <act classCode="PCPR" moodCode="RQO" negationInd="false">
            <code code="OBS" codeSystem="2.16.840.1.113883.5.4" displayName="Obstetrie"/>
            <xsl:for-each select="./datum_van_overdracht">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Overdracht aan zorgverlener (type) -->
                    <xsl:for-each select="./overdracht_aan_zorginstelling_specialisme">
                        <xsl:call-template name="makeCode"/>
                    </xsl:for-each>
                    <xsl:if test="overdracht_aan_zorginstelling_id">
                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                            <!-- Overdracht aan zorginstelling (id) -->
                            <xsl:for-each select="overdracht_aan_zorginstelling_id">
                                <!-- TODO, de root moet uit het brondocument komen -->
                                <id root="2.16.840.1.113883.2.4.3.22.96.6">
                                    <xsl:attribute name="extension" select="./@value"/>
                                </id>
                            </xsl:for-each>
                        </representedOrganization>
                    </xsl:if>
                </assignedEntity>
            </performer>
            <!-- reden overdracht -->
            <xsl:for-each select="./redenen_van_overdracht_aan/reden_overdracht_aan_lijst_prn">
                <outboundRelationship typeCode="RSON">
                    <!-- Aanduiding reden van overdracht -->
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="RefOutReas" codeSystem="2.16.840.1.113883.2.4.4.13"/>
                        <xsl:call-template name="makeCEValue"/>
                    </observation>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Perinatale periode van overdracht -->
            <xsl:for-each select="./perinatale_periode_van_overdracht">
                <outboundRelationship typeCode="PERT">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="PRN210603" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
                        <xsl:call-template name="makeCEValue"/>
                    </observation>
                </outboundRelationship>
            </xsl:for-each>
        </act>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900620_20141024000000">
        <act classCode="PCPR" moodCode="RQO" negationInd="false">
            <code code="308292007" codeSystem="{$oidSNOMEDCT}" displayName="Transfer of care (procedure)"/>
            <xsl:for-each select="./datum_van_overdracht">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Overdracht aan zorgverlener (type) -->
                    <xsl:for-each select="./overdracht_aan_zorginstelling_specialisme">
                        <xsl:call-template name="makeCode"/>
                    </xsl:for-each>
                    <xsl:if test="overdracht_aan_zorginstelling_id">
                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                            <!-- Overdracht aan zorginstelling (id) -->
                            <xsl:for-each select="overdracht_aan_zorginstelling_id">
                                <id root="2.16.840.1.113883.2.4.3.22.96.6">
                                    <xsl:attribute name="extension" select="./@value"/>
                                </id>
                            </xsl:for-each>
                        </representedOrganization>
                    </xsl:if>
                </assignedEntity>
            </performer>
            <!-- reden overdracht -->
            <xsl:for-each select="./redenen_van_overdracht_aan/reden_overdracht_aan_lijst_prn">
                <outboundRelationship typeCode="RSON">
                    <!-- Aanduiding reden van overdracht -->
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="RefOutReas" codeSystem="2.16.840.1.113883.2.4.4.13"/>
                        <xsl:call-template name="makeCEValue"/>
                    </observation>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Perinatale periode van overdracht -->
            <xsl:for-each select="./perinatale_periode_van_overdracht">
                <outboundRelationship typeCode="PERT">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="PRN210603" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
                        <xsl:call-template name="makeCEValue"/>
                    </observation>
                </outboundRelationship>
            </xsl:for-each>
        </act>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900624_20130320000000">
        <procedure classCode="PROC" moodCode="EVN">
            <id nullFlavor="NI"/>
            <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
            <xsl:if test="./demografische_gegevens/*">
                <subject typeCode="SBJ">
                    <personalRelationship classCode="PRS">
                        <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                        <xsl:for-each select="./demografische_gegevens">
                            <relationshipHolder classCode="PSN" determinerCode="INSTANCE">
                                <!-- lokaal id -->
                                <xsl:for-each select="./identificaties_kind">
                                    <xsl:for-each select="./bsn_kind">
                                        <xsl:call-template name="makeIIValueBSN"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="./lokale_identificatie_kind">
                                        <xsl:call-template name="makeIIValue">
                                            <!-- TODO, goede OID invullen voor lokaal id -->
                                            <xsl:with-param name="root" select="'1.2.3.4.5'"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <xsl:for-each select="./identificatie_kind_prn_formaat">
                                        <xsl:call-template name="makeIIValue">
                                            <xsl:with-param name="root" select="'2.16.840.1.113883.2.4.3.22.6.3'"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <!-- Geboortedatum -->
                                <xsl:for-each select="./geboortedatum">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900259_20091001000000"/>
                                </xsl:for-each>
                                <!-- Overleden? -->
                                <xsl:for-each select="./perinatale_sterfte_groep/perinatale_sterfteq">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900432_20130320000000"/>
                                </xsl:for-each>
                            </relationshipHolder>
                        </xsl:for-each>
                    </personalRelationship>
                </subject>
            </xsl:if>
            <!-- Geslacht (medische observatie) -->
            <xsl:for-each select="./demografische_gegevens/geslacht_medische_observatie">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900255_20091001000000"/>
                </inboundRelationship>
            </xsl:for-each>
            <!-- Fase perinatale sterfte -->
            <xsl:for-each select="./demografische_gegevens/perinatale_sterfte_groep/fase_perinatale_sterfte">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900433_20091001000000"/>
                </inboundRelationship>
            </xsl:for-each>
            <!-- kindspecifieke maternale gegevens -->
            <xsl:for-each select="./kindspecifieke_maternale_gegevens">
                <!-- Tijdstip breken vliezen -->
                <xsl:for-each select="./tijdstip_breken_vliezen">
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900198_20130320000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="./tijdstip_actief_meepersen">
                    <!-- Tijdstip actief meepersen -->
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900261_20130320000000"/>
                    </inboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
            <!-- kindspecifieke uitkomstgegevens -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens">
                <xsl:for-each select="./type_partus">
                    <!-- Type partus -->
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20130314000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Geboortegewicht -->
                <xsl:for-each select="./geboortegewicht">
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900425_20110128000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Percentiel van het geboortegewicht -->
                <xsl:for-each select="./percentiel_van_het_geboortewicht">
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900902_20131108000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Apgarscore na 5 min. -->
                <xsl:for-each select="./apgarscore_na_5_min">
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20091001000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Congenitale afwijkingen -->
                <xsl:for-each select="./congenitale_afwijkingenq">
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900909_20130320000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Ligging bij geboorte -->
                <xsl:for-each select="./ligging_bij_geboorte">
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900359_20091001000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Overige interventies -->
                <xsl:for-each select="./overige_interventies">
                    <inboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900893_20091001000000"/>
                    </inboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900654_20120503000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="129019007" codeSystem="{$oidSNOMEDCT}" displayName="Actuele medicatie"/>
            <xsl:for-each select="./actueel_medicatiegebruikq">
                <xsl:call-template name="makeBLValue"/>
            </xsl:for-each>
            <xsl:for-each select="./soort_actuele_medicatie">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900655_20120422000000"/>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900655_20120422000000">
        <!-- Soort actuele Medicatie -->
        <inboundRelationship typeCode="COMP">
            <substanceAdministration classCode="SBADM" moodCode="EVN">
                <consumable typeCode="CSM">
                    <manufacturedProduct classCode="MANU">
                        <manufacturedProduct classCode="MMAT" determinerCode="KIND">
                            <name>
                                <xsl:value-of select="./@value"/>
                            </name>
                        </manufacturedProduct>
                    </manufacturedProduct>
                </consumable>
            </substanceAdministration>
        </inboundRelationship>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900656_20111206000000">
        <!-- Negatieve seksuele ervaringen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="NEGSE" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900657_20111206000000">
        <!-- MRSA besmetting aangetoond? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="266096002" codeSystem="{$oidSNOMEDCT}" displayName="MRSA besmetting"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900661_20111206000000">
        <!-- Actuele bloeddruk systolisch -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="271649006" codeSystem="{$oidSNOMEDCT}" displayName="Bloeddruk systolisch"/>
            <value xsi:type="PQ">
                <xsl:attribute name="value" select="./@value"/>
                <xsl:attribute name="unit" select="'mm[Hg]'"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900662_20111206000000">
        <!-- Actuele bloeddruk diastolisch -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="271650006" codeSystem="{$oidSNOMEDCT}" displayName="Bloeddruk diastolisch"/>
            <value xsi:type="PQ">
                <xsl:attribute name="value" select="./@value"/>
                <xsl:attribute name="unit" select="'mm[Hg]'"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900663_20111206000000">
        <!-- Bloedgroep -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="883-9" codeSystem="{$oidLOINC}" displayName="Bloedgroep"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900668_20120317000000">
        <!--  Zorgverlener en -instelling (kort) -->
        <author typeCode="AUT">
            <time nullFlavor="NI"/>
            <modeCode nullFlavor="NA"/>
            <signatureCode nullFlavor="NA"/>
            <xsl:if test="./zorgverlener or ./zorginstelling">
                <responsibleParty classCode="ASSIGNED">
                    <xsl:for-each select="./zorgverlener">
                        <xsl:for-each select="./telefoon_waar_zorgverlener_is_te_bereiken">
                            <telecom value="tel:+317025463726">
                                <xsl:attribute name="value" select="concat('tel:', ./@value)"/>
                            </telecom>
                        </xsl:for-each>
                        <xsl:for-each select="./naam_zorgverlener">
                            <agentPerson classCode="PSN" determinerCode="INSTANCE">
                                <name use="L">
                                    <xsl:value-of select="./@value"/>
                                </name>
                            </agentPerson>
                        </xsl:for-each>
                    </xsl:for-each>
                    <xsl:for-each select="./zorginstelling">
                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                            <!-- Verplicht in template om één van URA/AGB/LVR mee te geven-->
                            <!-- TODO: vullen met eigen / juiste ID -->
                            <id root="{$oidURAOrganizations}" extension="00023444"/>
                            <xsl:for-each select="./zorginstelling_oid">
                                <!-- TODO: juiste root aanvullen -->
                                <id root="1.2.3.4.5">
                                    <xsl:attribute name="extension" select="./@value"/>
                                </id>
                            </xsl:for-each>
                            <xsl:for-each select="./naam_zorginstelling">
                                <name>
                                    <xsl:value-of select="./@value"/>
                                </name>
                            </xsl:for-each>
                        </representedOrganization>
                    </xsl:for-each>
                </responsibleParty>
            </xsl:if>
        </author>

    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900669_20130314000000">
        <!-- Rhesus D Factor -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="978-7" codeSystem="{$oidLOINC}" displayName="Rhesus D Factor"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900683_20130314000000">
        <!-- Rhesus c Factor -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="948-0" codeSystem="{$oidLOINC}" displayName="C Ag [Presence] on Red Blood Cells"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900705_20141107000000">
        <!-- Indicatie interventie begin baring -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN520103" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900711_20120503000000">
        <actList classCode="LIST" moodCode="EVN">
            <code code="OBSTANAM" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <component typeCode="COMP">
                <observation classCode="OBS" moodCode="EVN">
                    <code code="OBSTANAM" codeSystem="2.16.840.1.113883.2.4.4.13"/>
                    <xsl:for-each select="./bijzonderheden_obstetrische_anamneseq">
                        <xsl:call-template name="makeBLValue"/>
                    </xsl:for-each>
                    <xsl:for-each select="./soort_bijzonderheden_obstetrische_anamnese">
                        <inboundRelationship typeCode="COMP">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900155_20110128000000"/>
                        </inboundRelationship>
                    </xsl:for-each>
                </observation>
            </component>
        </actList>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900715_20141107000000">
        <!-- 	Wijze waarop de baring begon -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="BeginDeliv" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeCEValue"/>
            <!-- Groepering interventies begin baring -->
            <xsl:for-each select="../interventies_begin_baring_groep">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900726_20141107000000"/>
                </outboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900716_20120422000000">
        <!--Medicatie nageboortetijdperk (2.0)-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Medic3stage" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:for-each select="./medicatie_nageboortetijdperkq">
                <xsl:call-template name="makeBLValue"/>
            </xsl:for-each>
            <xsl:for-each select="./soort_medicatie_nageboortetijdperk">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900525_20121204000000"/>
                </inboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900716_20150217112242">
        <!--Medicatie nageboortetijdperk (2.0)-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Medic3stage" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:for-each select="./medicatie_nageboortetijdperkq">
                <xsl:call-template name="makeBLValue"/>
            </xsl:for-each>
            <xsl:for-each select="./soort_medicatie_nageboortetijdperk">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900525_20141107174304"/>
                </outboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900724_20141113122151">
        <!-- Item: 70010 - Voeding kind, krijgt zowel borst- als kunstvoeding  -->
        <supply classCode="DIET" moodCode="EVN">
            <id nullFlavor="NI"/>
            <code code="230126006" codeSystem="{$oidSNOMEDCT}" displayName="Voeding kind"/>
            <xsl:for-each select="./voeding_kind_datum">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <!-- MdG: NI als geen datum -->
            <xsl:if test="not(./voeding_kind_datum)">
                <effectiveTime nullFlavor="NI"/>
            </xsl:if>
            <xsl:for-each select="./substantie_voeding_kind">
                <product typeCode="PRD">
                    <product classCode="ACCESS">
                        <playingMaterial classCode="MAT" determinerCode="KIND">
                            <!-- Item: 70030 - Substantie voeding kind -->
                            <xsl:call-template name="makeCode"/>
                        </playingMaterial>
                    </product>
                </product>
            </xsl:for-each>
        </supply>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900725_20131108000000">
        <!-- Obstetrische anamnese voorgaande zwangerschap -->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <!-- 
                             obstetrische anamnese van deze voorgaande zwangerschap
                         -->
            <code code="248983002" codeSystem="{$oidSNOMEDCT}" displayName="Obstetrische anamnese voorgaande zwangerschap"/>
            <!-- Identificatie (nummer) van deze voorgaande zwangerschap -->
            <xsl:for-each select="./identificatie_van_de_zwangerschap">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900728_20111206000000"/>
                </component>
            </xsl:for-each>
            <!-- Wijze einde zwangerschap -->
            <xsl:for-each select="./wijze_einde_zwangerschap">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20130320000000"/>
                </component>
            </xsl:for-each>
            <!-- deze voorgaande zwangerschap: zwangerschapsduur bij einde zwangerschap -->
            <xsl:for-each select="./zwangerschapsduur">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900200_20120808000000"/>
                </component>
            </xsl:for-each>
            <!-- deze voorgaande zwangerschap: Eerdere bevalling (partus) -->
            <xsl:for-each select="./eerdere_bevalling">
                <component typeCode="COMP" contextConductionInd="true">
                    <procedure classCode="PROC" moodCode="EVN">
                        <id nullFlavor="NI"/>
                        <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Bevalling"/>
                        <!-- deze voorgaande partus: Hoeveelheid bloedverlies -->
                        <xsl:for-each select="./hoeveelheid_bloedverlies">
                            <inboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20130320000000"/>
                            </inboundRelationship>
                        </xsl:for-each>
                        <!-- deze voorgaande partus: Ontsluitingsduur -->
                        <xsl:for-each select="./duur_actieve_ontsluitingsfase_ontsluitingsduur">
                            <inboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900898_20130320000000"/>
                            </inboundRelationship>
                        </xsl:for-each>
                        <!-- deze voorgaande partus: Uitdrijvingsduur -->
                        <xsl:for-each select="./duur_uitdrijving_vanaf_actief_meepersen">
                            <inboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900899_20130320000000"/>
                            </inboundRelationship>
                        </xsl:for-each>
                        <!-- deze voorgaande partus: Conditie perineum postpartum -->
                        <xsl:for-each select="./conditie_perineum_postpartum">
                            <inboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20130423000000"/>
                            </inboundRelationship>
                        </xsl:for-each>
                        <!-- uitkomst per kind voor deze voorgaande zwangerschap -->
                        <xsl:for-each select="./vorige_uitkomst_per_kind/kindspecifieke_gegevens_vorige_uitkomsten">
                            <inboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900901_20130320000000"/>
                            </inboundRelationship>
                        </xsl:for-each>
                    </procedure>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900726_20141107000000">
        <!-- Interventie begin baring -->
        <procedure classCode="PROC" moodCode="EVN">
            <!-- Interventie begin baring -->
            <id nullFlavor="NI"/>
            <code code="PRN520102" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
            <xsl:for-each select="./interventie_begin_baring">
                <methodCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </methodCode>
            </xsl:for-each>
            <xsl:for-each select="./indicatie_interventie_begin_baring">
                <outboundRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900705_20141107000000"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900727_20120503000000">
        <!-- Taalvaardigheid Nederlandse taal -->
        <languageCommunication>
            <languageCode code="nl-NL" codeSystem="2.16.840.1.113883.6.121"/>
            <proficiencyLevelCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </proficiencyLevelCode>
        </languageCommunication>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900728_20111206000000">
        <!-- Identificatie van de zwangerschap -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="X_PREGNBR" codeSystem="{$oidLOINC}" displayName="Identificatie van de zwangerschap"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900729_20130314000000">
        <!--Vrouw (acute situatie)-->
        <xsl:param name="vrouw"/>
        <xsl:param name="zwangerschap"/>
        <subject typeCode="SBJ">
            <patient classCode="PAT">
                <xsl:for-each select="$vrouw/burgerservicenummer">
                    <xsl:call-template name="makeIIValueBSN"/>
                </xsl:for-each>
                <statusCode code="active"/>
                <patientPerson classCode="PSN" determinerCode="INSTANCE">
                    <xsl:for-each select="$vrouw/naam_vrouw">
                        <name use="OR">
                            <xsl:for-each select="./voornamen">
                                <given>
                                    <xsl:value-of select="./@value"/>
                                </given>
                            </xsl:for-each>
                            <xsl:for-each select="./achternamen">
                                <family>
                                    <xsl:value-of select="./@value"/>
                                </family>
                            </xsl:for-each>
                        </name>
                    </xsl:for-each>
                    <xsl:for-each select="$vrouw/geboortedatum">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000"/>
                    </xsl:for-each>
                    <!-- MdG: NI -->
                    <xsl:if test="not($vrouw/geboortedatum)">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000"/>
                    </xsl:if>
                    <xsl:for-each select="$vrouw/taalvaardigheid_vrouw_nederlandse_taal">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900727_20120503000000"/>
                    </xsl:for-each>
                </patientPerson>
            </patient>
        </subject>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900730_20130314000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="EDD" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="A terme datum"/>
            <xsl:for-each select="./a_terme_datum">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="xsiType">TS</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="./actuele_a_terme_datumq">
                <inboundRelationship typeCode="PERT">
                    <!-- Aanduiding dat dit de actuele à terme datum is -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900009_20110128000000"/>
                </inboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900821_20110128000000">
        <!-- BPD -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="11820-8" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="BPD"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Trisomy in History (y/n) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900860_20120626000000">
        <observation classCode="OBS" moodCode="EVN">
            <id/>
            <code code="TrisomyAnam" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: trisomie_in_de_anamneseq trisomie_in_de_anamneseq trisomie_in_de_anamneseq-->
            <xsl:for-each select="trisomie_in_de_anamneseq | trisomie_in_de_anamneseq | trisomie_in_de_anamneseq">
                <xsl:call-template name="makeBLValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20130314000000">
        <!-- Type partus -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="289258004" codeSystem="{$oidSNOMEDCT}" displayName="Type partus"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20141029000000">
        <!-- Type partus -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="364336006" codeSystem="{$oidSNOMEDCT}" displayName="Type partus"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900862_20130314000000">
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="12130-1" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Study observation.general^Fetus"/>
            <!-- Datum van onderzoek = datum van bepaling zwangerschapsduur -->
            <xsl:for-each select="../datum_onderzoek">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <subject typeCode="SBJ">
                <personalRelationship classCode="PRS">
                    <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                    <relationshipHolder classCode="PSN" determinerCode="INSTANCE"/>
                </personalRelationship>
            </subject>
            <xsl:for-each select="../zwangerschapsduur_op_datum_onderzoek">
                <!-- Zwangerschapsduur op datum onderzoek -->
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20130320000000"/>
                </component>
            </xsl:for-each>
            <!-- BPD -->
            <xsl:for-each select="./bpd">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900821_20110128000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="./bpd_percentiel">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900506_20111206000000"/>
                </component>
            </xsl:for-each>
            <!-- HCs -->
            <xsl:for-each select="./hc">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900533_20110128000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="./hc_percentiel">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900510_20111206000000"/>
                </component>
            </xsl:for-each>
            <!-- AC -->
            <xsl:for-each select="./ac">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900535_20110128000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="./ac_percentiel">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900513_20111206000000"/>
                </component>
            </xsl:for-each>
            <!-- FLs -->
            <xsl:for-each select="./fl">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900536_20110128000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="./fl_percentiel">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900515_20111206000000"/>
                </component>
            </xsl:for-each>
            <!-- Echoparameters -->
            <xsl:for-each select="echoparameters_bpd_hc_ac_fl">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900910_20130320000000"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900872_20141024000000">
        <!--  Vrouw (PRN versie)  -->
        <xsl:param name="vrouw"/>
        <xsl:param name="zwangerschap"/>
        <subject typeCode="SBJ">
            <patient classCode="PAT">
                <xsl:for-each select="$vrouw/burgerservicenummer">
                    <xsl:call-template name="makeIIValueBSN">
                        <xsl:with-param name="elemName">id</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$vrouw/lokale_persoonsidentificatie">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900029_20091001000000"/>
                </xsl:for-each>
                <xsl:for-each select="$vrouw/adres/postcode">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900875_20121207000000"/>
                </xsl:for-each>
                <!-- MdG: NI wanneer geen postcode -->
                <xsl:if test="not($vrouw/adres/postcode)">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900875_20121207000000"/>
                </xsl:if>
                <patientPerson classCode="PSN" determinerCode="INSTANCE">
                    <xsl:for-each select="$vrouw/geboortedatum">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000"/>
                    </xsl:for-each>
                    <!-- MdG: NI -->
                    <xsl:if test="not($vrouw/geboortedatum)">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000"/>
                    </xsl:if>
                    <!--<xsl:for-each select="$zwangerschap/maternale_sterfteq">-->
                    <!-- Altijd aanroepen, bij geen gegeven maternale_sterfte (0..1 R) in ADA deceasedInd='false' opnemen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900230_20091001000000"/>
                    <!--</xsl:for-each>-->
                    <xsl:for-each select="$vrouw/etniciteit">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900033_20091001000000"/>
                    </xsl:for-each>
                </patientPerson>
            </patient>
        </subject>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900872_20161216000000">
        <!--  Vrouw (PRN versie)  -->
        <xsl:param name="vrouw"/>
        <xsl:param name="zwangerschap"/>
        <subject typeCode="SBJ">
            <patient classCode="PAT">
                <xsl:for-each select="$vrouw">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900028_20161219145253"/>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900029_20150204151317"/>
                </xsl:for-each>
                <xsl:for-each select="$vrouw/adres/postcode">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900875_20121207000000"/>
                </xsl:for-each>
                <!-- MdG: NI wanneer geen postcode -->
                <xsl:if test="not($vrouw/adres/postcode)">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900875_20121207000000"/>
                </xsl:if>
                <patientPerson classCode="PSN" determinerCode="INSTANCE">
                    <xsl:for-each select="$vrouw/geboortedatum">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000"/>
                    </xsl:for-each>
                    <!-- MdG: NI -->
                    <xsl:if test="not($vrouw/geboortedatum)">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000"/>
                    </xsl:if>
                    <xsl:for-each select="$zwangerschap/maternale_sterfteq">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900230_20091001000000"/>
                    </xsl:for-each>
                    <xsl:for-each select="$vrouw/etniciteit">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900033_20091001000000"/>
                    </xsl:for-each>
                </patientPerson>
            </patient>
        </subject>
    </xsl:template>
    <!-- Vrouw (Kernset versie) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900872_20161216103854">
        <xsl:param name="vrouw"/>
        <xsl:param name="zwangerschap"/>
        <subject typeCode="SBJ">
            <patient classCode="PAT">
                <xsl:for-each select="$vrouw">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900028_20161219145253"/>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900029_20150204151317"/>
                </xsl:for-each>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900875_20121207000000">
                    <xsl:with-param name="inputValue" select="$vrouw/adres/postcode/@value"/>
                </xsl:call-template>
                <patientPerson classCode="PSN" determinerCode="INSTANCE">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000">
                        <xsl:with-param name="inputValue" select="$vrouw/geboortedatum/@value"/>
                    </xsl:call-template>
                    <!-- MdG: NI -->
                    <xsl:if test="not($vrouw/geboortedatum)">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900031_20091001000000"/>
                    </xsl:if>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900230_20091001000000">
                        <xsl:with-param name="inputValue" select="$zwangerschap/maternale_sterfteq/@value"/>
                    </xsl:call-template>
                    <xsl:for-each select="$vrouw/etniciteit">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900033_20091001000000"/>
                    </xsl:for-each>
                </patientPerson>
            </patient>
        </subject>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900873_20141024000000">
        <!-- Zorgverzoek details -->
        <act classCode="PCPR" moodCode="RQO">
            <code code="OBS" codeSystem="2.16.840.1.113883.5.4"/>
            <xsl:for-each select="./overname_van_zorginstelling">
                <author typeCode="AUT">
                    <!-- Andere zorginstelling ("overname van") -->
                    <assignedEntity classCode="ASSIGNED">
                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                            <xsl:for-each select="./overname_van_zorginstelling_id">
                                <id root="2.16.840.1.113883.2.4.3.22.96.6">
                                    <xsl:attribute name="extension" select="(./@value)"/>
                                </id>
                            </xsl:for-each>
                        </representedOrganization>
                    </assignedEntity>
                </author>
            </xsl:for-each>
            <!-- reden overname -->
            <xsl:for-each select="./redenen_van_overname/reden_van_overname_lijst_prn">
                <outboundRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900943_20141024000000"/>
                </outboundRelationship>
            </xsl:for-each>
        </act>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900875_20121207000000">
        <xsl:param name="inputValue" select="@value"/>
        <!-- Adres vrouw (PRN) -->
        <addr>
            <postalCode>
                <xsl:choose>
                    <xsl:when test="string-length($inputValue) > 0">
                        <xsl:value-of select="./@value"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
            </postalCode>
        </addr>
    </xsl:template>
    <!-- WijzeEindeZwangerschap -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20130320000000">
        <!--WijzeEindeZwangerschap-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="EindeZw" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Wijze einde zwangerschap"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <!-- Wijze einde zwangerschap -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20161206094326">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900876"/>
            <code code="EindeZw" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Wijze einde zwangerschap"/>
            <!-- Item(s) :: wijze_einde_zwangerschap-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900893_20091001000000">
        <!-- Overige interventies -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Interv" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Overige interventies"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900893_20141106000000">
        <!--Overige interventies-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Interv" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Overige interventies"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900897_20130101000000">
        <actList classCode="LIST" moodCode="EVN">
            <code code="VERLIND" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <component typeCode="COMP">
                <observation classCode="OBS" moodCode="EVN">
                    <code code="VERLIND" codeSystem="2.16.840.1.113883.2.4.4.13"/>
                    <xsl:for-each select="./ziekten_en_bijzonderheden_vrouw_in_de_algemene_anamneseq">
                        <xsl:call-template name="makeBLValue"/>
                    </xsl:for-each>
                    <xsl:for-each select="./soort_ziekten_en_bijzonderheden_vrouw_in_de_algemene_anamnese">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900152_20110128000000"/>
                    </xsl:for-each>
                </observation>
            </component>
        </actList>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900898_20130320000000">
        <!-- Ontsluitingsduur -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="169821004" codeSystem="{$oidSNOMEDCT}" displayName="Ontsluitingsduur"/>
            <value xsi:type="PQ" unit="h">
                <xsl:attribute name="value" select="./@value"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900899_20130320000000">
        <!-- Uitdrijvingsduur -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="169822006" codeSystem="{$oidSNOMEDCT}" displayName="Uitdrijvingsduur"/>
            <value xsi:type="PQ" unit="min">
                <xsl:attribute name="value" select="./@value"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20130320000000">
        <!-- Hoeveelheid bloedverlies -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="364332008" codeSystem="{$oidSNOMEDCT}" displayName="Hoeveelheid bloedverlies"/>
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="unit" select="@unit"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900901_20130320000000">
        <!-- Vorige uitkomst per kind (kort) -->
        <procedure classCode="PROC" moodCode="EVN">
            <id nullFlavor="NI"/>
            <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
            <subject typeCode="SBJ">
                <personalRelationship classCode="PRS">
                    <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                    <relationshipHolder classCode="PSN" determinerCode="INSTANCE"/>
                </personalRelationship>
            </subject>
            <!-- Kindspecifieke gegevens vorige uitkomsten -->
            <!-- Type partus -->
            <xsl:for-each select="./type_partus">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20130314000000"/>
                </inboundRelationship>
            </xsl:for-each>
            <!-- Geboortegewicht -->
            <xsl:for-each select="./geboortegewicht">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900425_20110128000000"/>
                </inboundRelationship>
            </xsl:for-each>
            <!-- Percentiel van het geboortegewicht -->
            <xsl:for-each select="./percentiel_van_het_geboortegewicht">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900902_20131108000000"/>
                </inboundRelationship>
            </xsl:for-each>
            <!-- Apgarscorena5min -->
            <xsl:for-each select="./apgarscore_na_5_min">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20091001000000"/>
                </inboundRelationship>
            </xsl:for-each>
            <!-- Vaginale kunstverlossing procedure -->
            <xsl:for-each select="./vaginale_kunstverlossing">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900903_20130320000000"/>
                </inboundRelationship>
            </xsl:for-each>
            <!-- Beslismoment sectio caesarea -->
            <xsl:for-each select="./beslismoment_sectio_caesarea">
                <inboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900278_20130320000000"/>
                </inboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900902_20131108000000">
        <!--Percentiel geboortegewicht-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="301334000" codeSystem="{$oidSNOMEDCT}" displayName="Percentiel van het geboortegewicht"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900903_20130320000000">
        <!-- Vaginale kunstverlossing procedure -->
        <procedure classCode="PROC" moodCode="EVN" negationInd="false">
            <id nullFlavor="NI"/>
            <code code="KuVerl" codeSystem="2.16.840.1.113883.2.4.4.14" displayName="Vaginale kunstverlossing"/>
            <methodCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </methodCode>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900907_20130320000000">
        <!-- Aantal levende kinderen -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="AantalLevendeKinderen" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Aantal levende kinderen"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900908_20130320000000">
        <!-- Wijze waarop de baring begon (acuut)  -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="BeginDeliv" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Wijze waarop de baring begon"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900909_20130320000000">
        <!-- Congenitale afwijkingen (JN) -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="66091009" codeSystem="{$oidSNOMEDCT}" displayName="Congenital disease (disorder)"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900910_20130320000000">
        <!-- Echoparameters  -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Echoparameters" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <value xsi:type="ED" representation="B64" mediaType="application/pdf">
                <xsl:value-of select="./@value"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900917_20130320000000">
        <!--Bevalplan-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Bevalplan" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Bevalplan"/>
            <value xsi:type="ED" representation="B64" mediaType="application/pdf">
                <xsl:value-of select="./@value"/>
            </value>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20130320000000">
        <!--Intra-uteriene vruchtdood-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="59291004" codeSystem="{$oidSNOMEDCT}" displayName="Intra-uteriene vruchtdood"/>
            <xsl:if test="./intrauteriene_vruchtdoodq/@value = 'true'">
                <xsl:for-each select="waarschijnlijkheid_intrauteriene_vruchtdood">
                    <uncertaintyCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </uncertaintyCode>
                </xsl:for-each>
            </xsl:if>
            <xsl:for-each select="./intrauteriene_vruchtdoodq">
                <xsl:call-template name="makeBLValue"/>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900919_20130729000000">
        <xsl:param name="maternale_onderzoeken"/>
        <!-- Maternaal onderzoek -->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="12131-9" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Patiënt onderzoek"/>
            <!-- Hb zwangere - alleen de meest actuele, dus mag maximaal één keer voorkomen -->
            <xsl:for-each select="$maternale_onderzoeken/hb">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900920_20130729000000"/>
                </component>
            </xsl:for-each>
            <!-- Rhesus D factor foetus gevonden in bloed zwangere - maximaal één keer -->
            <xsl:for-each select="$maternale_onderzoeken/rhesus_d_factor_foetus">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900921_20130729000000"/>
                </component>
            </xsl:for-each>
            <!-- Vaginaal toucher - De beschikbare uitkomsten van uitgevoerde VTs. Kan meerdere keren voorkomen -->
            <xsl:for-each select="$maternale_onderzoeken/vaginaal_toucher">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900922_20130729000000"/>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900920_20130729000000">
        <!-- MtrnlHb  -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="59260-0" codeSystem="{$oidLOINC}" displayName="Hb"/>
            <!-- Datum van onderzoek = datum van bepaling zwangerschapsduur -->
            <xsl:for-each select="../../datum_onderzoek">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <value xsi:type="PQ" unit="mmol/L">
                <xsl:attribute name="value" select="./@value"/>
            </value>
            <xsl:for-each select="../../zwangerschapsduur_op_datum_onderzoek">
                <inboundRelationship typeCode="PERT" contextConductionInd="true">
                    <!-- Zwangerschapsduur op datum onderzoek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20130320000000"/>
                </inboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900921_20130729000000">
        <!-- MtrnlRhDFoetus -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="X_RHFETBM" codeSystem="{$oidLOINC}"/>
            <!-- Datum van onderzoek = datum van bepaling zwangerschapsduur -->
            <xsl:for-each select="../../datum_onderzoek">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <xsl:call-template name="makeCEValue"/>
            <xsl:for-each select="../../zwangerschapsduur_op_datum_onderzoek">
                <inboundRelationship typeCode="PERT" contextConductionInd="true">
                    <!-- Zwangerschapsduur op datum onderzoek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20130320000000"/>
                </inboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900922_20130729000000">
        <!-- Vaginaal toucher (procedure)  -->
        <component typeCode="COMP" contextConductionInd="true">
            <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                <id nullFlavor="NI"/>
                <code code="51597003" codeSystem="{$oidSNOMEDCT}" displayName="Manual palpation of vagina (procedure)"/>
                <!-- Datum van onderzoek = datum van bepaling zwangerschapsduur -->
                <xsl:for-each select="../../datum_onderzoek">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>
                <!-- Zwangerschapsduur op datum onderzoek -->
                <xsl:for-each select="../../zwangerschapsduur_op_datum_onderzoek">
                    <inboundRelationship typeCode="PERT" contextConductionInd="true">
                        <!-- Zwangerschapsduur op datum onderzoek -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20130320000000"/>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Portio -->
                <xsl:for-each select="./portio">
                    <inboundRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="249021005" codeSystem="{$oidSNOMEDCT}" displayName="Portio"/>
                            <xsl:call-template name="makeCEValue"/>
                        </observation>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Ontsluiting -->
                <xsl:for-each select="./ontsluiting">
                    <inboundRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="289761004" codeSystem="{$oidSNOMEDCT}" displayName="Ontsluiting"/>
                            <xsl:call-template name="makeCEValue"/>
                        </observation>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Vliezen -->
                <xsl:for-each select="./vliezen">
                    <inboundRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="112074005" codeSystem="{$oidSNOMEDCT}" displayName="Vliezen"/>
                            <xsl:call-template name="makeCEValue"/>
                        </observation>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Indaling -->
                <xsl:for-each select="./indaling_hodge">
                    <inboundRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="364611006" codeSystem="{$oidSNOMEDCT}" displayName="Indaling"/>
                            <xsl:call-template name="makeCEValue"/>
                        </observation>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Aard van het voorliggend deel -->
                <xsl:for-each select="./aard_van_het_voorliggend_deel">
                    <inboundRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="364612004" codeSystem="{$oidSNOMEDCT}" displayName="Aard van het voorliggend deel"/>
                            <xsl:call-template name="makeCEValue"/>
                        </observation>
                    </inboundRelationship>
                </xsl:for-each>
                <!-- Stand -->
                <xsl:for-each select="./stand">
                    <inboundRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="163520002" codeSystem="{$oidSNOMEDCT}" displayName="Stand"/>
                            <xsl:call-template name="makeCEValue"/>
                        </observation>
                    </inboundRelationship>
                </xsl:for-each>
            </procedure>
        </component>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20141118000000">
        <!--A terme datum (definitive)-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="EDDDef" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType" select="'TS'"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Reden Verzending Counseling Bericht -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900934_20140414000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="RedenVerzending" codeSystem="2.16.840.1.113883.2.4.4.13.53"/>
            <!-- Item(s) :: reden_verzending reden_verzending-->
            <xsl:for-each select="reden_verzending | reden_verzending">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900936_20140415000000">
        <!-- Diabetes mellitus -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="73211009" codeSystem="{$oidSNOMEDCT}" displayName="Diabetes mellitus"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900938_20141022000000">
        <!--Conclusie risicostatus na intake-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="RiskStat" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <!-- Conclusie risicostatus na intake -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900938_20161206113444">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900938"/>
            <code code="RiskStat" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: conclusie_risicostatus_na_intake-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900939_20141022000000">
        <!--Rookgedrag-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Rookgedrag" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Rookgedrag"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900943_20141024000000">
        <!-- Indicatie (PRN) -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="RefInReas" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900944_20141024000000">
        <!-- autoimmuun_aandoening -->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./autoimmuun_aandoeningq"/>
            <xsl:with-param name="observation" select="./autoimmuun_aandoening"/>
            <xsl:with-param name="observation_code" select="'85828009'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Auto-immuun aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900945_20141024000000">
        <!--Cardiovasculaire aandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./cardiovasculaire_aandoeningq"/>
            <xsl:with-param name="observation" select="./cardiovasculaire_aandoening"/>
            <xsl:with-param name="observation_code" select="'49601007'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Cardiovasculaire aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900946_20141024000000">
        <!--Urogenitale aandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./urogenitale_aandoeningq"/>
            <xsl:with-param name="observation" select="./urogenitale_aandoening"/>
            <xsl:with-param name="observation_code" select="'42030000'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Urogenitale aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900947_20141024000000">
        <!--Schildklier aandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./schildklier_aandoeningq"/>
            <xsl:with-param name="observation" select="./schildklier_aandoening"/>
            <xsl:with-param name="observation_code" select="'14304000'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Schildklier aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900948_20141024000000">
        <!--Oncologische aandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./oncologische_aandoeningq"/>
            <xsl:with-param name="observation" select="./oncologische_aandoening"/>
            <xsl:with-param name="observation_code" select="'363346000'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Oncologische aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900949_20141024000000">
        <!--Neurologische aandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./neurologische_aandoeningq"/>
            <xsl:with-param name="observation" select="./neurologische_aandoening"/>
            <xsl:with-param name="observation_code" select="'118940003'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Neurologische aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20141024000000">
        <!--Infectieziekte-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./infectieziekteq"/>
            <xsl:with-param name="observation" select="./infectieziekte"/>
            <xsl:with-param name="observation_code" select="'40733004'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Infectieziekte'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900951_20141024000000">
        <!--MDL aandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./mdl_aandoeningq"/>
            <xsl:with-param name="observation" select="./mdl_aandoening"/>
            <xsl:with-param name="observation_code" select="'53619000'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'MDL aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900952_20141024000000">
        <!--Anemie-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./anemieq"/>
            <xsl:with-param name="observation" select="./anemie"/>
            <xsl:with-param name="observation_code" select="'271737000'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Anemie'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900953_20141024000000">
        <!--Longaandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./longaandoeningq"/>
            <xsl:with-param name="observation" select="./longaandoening"/>
            <xsl:with-param name="observation_code" select="'50043002'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Longaandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20141024000000">
        <!-- Gynaecologische aandoening -->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./gynaecologische_aandoeningq"/>
            <xsl:with-param name="observation" select="./gynaecologische_aandoening"/>
            <xsl:with-param name="observation_code" select="'310789003'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Gynaecologische aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Gynaecologische aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900954"/>
            <code code="310789003" codeSystem="{$oidSNOMEDCT}" displayName="Gynaecologische aandoening"/>
            <!-- Item(s) :: gynaecologische_aandoening-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900955_20141024000000">
        <!--Orthopedische afwijking-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./orthopedische_afwijkingq"/>
            <xsl:with-param name="observation" select="./orthopedische_afwijking"/>
            <xsl:with-param name="observation_code" select="'928000'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Orthopedische afwijking'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900956_20141024000000">
        <!--Type operatie-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./operatieq"/>
            <xsl:with-param name="observation" select="./type_operatie"/>
            <xsl:with-param name="observation_code" select="'387713003'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Operatie'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900957_20141024000000">
        <!--Type stollingsprobleem-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./stollingsprobleemq"/>
            <xsl:with-param name="observation" select="./type_stollingsprobleem"/>
            <xsl:with-param name="observation_code" select="'64779008'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Stollingsprobleem'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900958_20141027000000">
        <!--Onder behandeling (geweest)?-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="OnderBehandeling" displayName="Onder behandeling (geweest)?" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900959_20141027000000">
        <!--Algemene anamnese PRN-->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <!-- Item: 80904 - Algemene anamnese -->
            <code code="312850006" codeSystem="{$oidSNOMEDCT}" displayName="History of - disorder"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900944_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900945_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900946_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900948_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900947_20141024000000"/>
            <xsl:for-each select="./diabetes_mellitusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900936_20140415000000"/>
                </component>
            </xsl:for-each>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900949_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900951_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900952_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900953_20141024000000"/>
            <xsl:for-each select="./partiele_molaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20141106000000"/>
                </component>
            </xsl:for-each>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900955_20141024000000"/>
            <xsl:for-each select="./bloedtransfusieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900158_20150130125418"/>
                </component>
            </xsl:for-each>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901024_20141119000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900956_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900957_20141024000000"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901026_20150210150105"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900960_20141027000000"/>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900960_20141027000000">
        <!--Overige aandoening-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./overige_aandoeningq"/>
            <xsl:with-param name="observation_code" select="'OverigeAandoeningenAnamnese'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.2.4.4.13'"/>
            <xsl:with-param name="observation_displayName" select="'Overige aandoening'"/>
            <xsl:with-param name="observation_text" select="./overige_aandoening"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900963_20141027000000">
        <!--Anamnese PRN-->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="417662000" codeSystem="{$oidSNOMEDCT}" displayName="Past history of clinical finding"/>
            <!--            <xsl:for-each select="./onder_behandeling_geweestq">-->
            <!-- Als onder behandeling geweest? = Nee, dan alleen dat aangeven en geen anamnese opnemen -->
            <xsl:if test="./onder_behandeling_geweestq[@value = 'false']">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900958_20141027000000"/>
                </component>
                <!--</xsl:for-each>-->
            </xsl:if>
            <!-- Bij een algemene anamnese met gegevens erin, 'Onder behandeling geweest?' op ja zetten, anders komt er een HL7 fout op de anamnese,
            en de anamnese opnemen -->
            <xsl:if test="algemene_anamnese/*[@value] or algemene_anamnese/*[@code]">
                <component typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="OnderBehandeling" displayName="Onder behandeling (geweest)?" codeSystem="PerinatologyObservations"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
                <xsl:for-each select="./algemene_anamnese">
                    <component typeCode="COMP">
                        <!-- algemene_anamnese -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900959_20141027000000"/>
                    </component>
                </xsl:for-each>
            </xsl:if>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900964_20141027000000">
        <!-- Type vrouwelijke genitale verminking -->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="parent_element_name" select="'pertinentInformation3'"/>
            <xsl:with-param name="question" select="./vrouwelijke_genitale_verminkingq"/>
            <xsl:with-param name="observation" select="./type_vrouwelijke_genitale_verminking"/>
            <xsl:with-param name="observation_code" select="'95041000119101'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Vrouwelijke genitale verminking'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900966_20141028000000">
        <!--Obstetrische anamnese voorgaande zwangerschap Kernsetbericht PRN-->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="248983002" codeSystem="{$oidSNOMEDCT}" displayName="Obstetrische anamnese voorgaande zwangerschap"/>
            <!-- Wijze einde zwangerschap -->
            <xsl:for-each select="./wijze_einde_zwangerschap">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20130320000000"/>
                </component>
            </xsl:for-each>
            <!-- Definitieve à terme datum -->
            <xsl:for-each select="./definitieve_a_terme_datum">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20141118000000"/>
                </component>
            </xsl:for-each>
            <!-- Diagnose voorgaande zwangerschap -->
            <xsl:for-each select="./diagnose">
                <component typeCode="COMP" contextConductionInd="true">
                    <organizer classCode="CONTAINER" moodCode="EVN">
                        <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20141024000000"/>
                        <!-- Bloedverlies? -->
                        <xsl:for-each select="./bloedverliesq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20141028000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- Cervixinsufficiëntie? -->
                        <xsl:for-each select="./cervixinsufficientieq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20141028000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- Infectie -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900975_20141028000000"/>
                        <!-- Hyperemesis gravidarum?  -->
                        <xsl:for-each select="./hyperemesis_gravidarumq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20141028000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- Hypertensieve aandoening -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20141028000000"/>
                        <!-- Zwangerschapscholestase? -->
                        <xsl:for-each select="./zwangerschapscholestaseq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20141028000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- Diabetes gravidarum met insuline? -->
                        <xsl:for-each select="./diabetes_gravidarum_met_insulineq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20141028000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- afwijkende_groei_foetus -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20141028000000">
                            <xsl:with-param name="contextConduction" select="'true'"/>
                        </xsl:call-template>
                        <!-- Dreigende partus immaturus? -->
                        <xsl:for-each select="./dreigende_partus_immaturusq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20141028000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- Dreigende partus prematurus? -->
                        <xsl:for-each select="./dreigende_partus_prematurusq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20141028000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- Abruptio placentae?  -->
                        <xsl:for-each select="./abruptio_placentaeq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20141028000000"/>
                            </component>
                        </xsl:for-each>
                    </organizer>
                </component>
            </xsl:for-each>

            <!-- Irregulaire antistoffen? -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900993_20141104000000"/>

            <!-- deze voorgaande zwangerschap: Eerdere bevalling (partus) -->
            <xsl:for-each select="./eerdere_bevalling">
                <component typeCode="COMP" contextConductionInd="true">
                    <procedure classCode="PROC" moodCode="EVN">
                        <id nullFlavor="NI"/>
                        <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Delivery procedure (procedure)"/>
                        <xsl:for-each select="./placenta/geboorte_placenta">
                            <outboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20091001000000"/>
                            </outboundRelationship>
                        </xsl:for-each>
                        <!-- deze voorgaande partus: Hoeveelheid bloedverlies -->
                        <xsl:for-each select="./hoeveelheid_bloedverlies">
                            <outboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20130320000000"/>
                            </outboundRelationship>
                        </xsl:for-each>
                        <!-- uitkomst per kind voor deze voorgaande zwangerschap -->
                        <xsl:for-each select="./vorige_uitkomst_per_kind">
                            <outboundRelationship typeCode="COMP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900980_20141029000000"/>
                            </outboundRelationship>
                        </xsl:for-each>
                    </procedure>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20141028000000">
        <!-- Bloedverlies? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="131148009" codeSystem="{$oidSNOMEDCT}" displayName="Bloedverlies"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Bloedverlies? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900967"/>
            <code code="131148009" codeSystem="{$oidSNOMEDCT}" displayName="Bloedverlies"/>
            <!-- Item(s) :: bloedverliesq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20141028000000">
        <!-- Cervixinsufficiëntie -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="17382005" codeSystem="{$oidSNOMEDCT}" displayName="Cervixinsufficiëntie"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Cervixinsufficiëntie? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900968"/>
            <code code="17382005" codeSystem="{$oidSNOMEDCT}" displayName="Cervixinsufficiëntie"/>
            <!-- Item(s) ::  cervixinsufficientieq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20141028000000">
        <!-- Hyperemesis gravidarum -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="14094001" codeSystem="{$oidSNOMEDCT}" displayName="Hyperemesis gravidarum"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Hyperemesis gravidarum? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900969"/>
            <code code="14094001" codeSystem="{$oidSNOMEDCT}" displayName="Hyperemesis gravidarum"/>
            <!-- Item(s) :: hyperemesis_gravidarumq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20141028000000">
        <!-- Zwangerschapscholestase -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="235888006" codeSystem="{$oidSNOMEDCT}" displayName="Zwangerschapscholestase"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Zwangerschapscholestase? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900971"/>
            <code code="235888006" codeSystem="{$oidSNOMEDCT}" displayName="Zwangerschapscholestase"/>
            <!-- Item(s) :: zwangerschapscholestaseq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20141028000000">
        <!-- Dreigende partus immaturus -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PartusImmaturusDreig" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Dreigende partus immaturus"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Dreigende partus immaturus? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900972"/>
            <code code="PartusImmaturusDreig" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Dreigende partus immaturus"/>
            <!-- Item(s) :: dreigende_partus_immaturusq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20141028000000">
        <!-- Dreigende partus prematurus -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PartusPrematurusDreig" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Dreigende partus prematurus"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Dreigende partus prematurus? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900973"/>
            <code code="PartusPrematurusDreig" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Dreigende partus prematurus"/>
            <!-- Item(s) :: dreigende_partus_prematurusq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20141028000000">
        <!-- Abruptio placentae -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="415105001" codeSystem="{$oidSNOMEDCT}" displayName="Abruptio placentae"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Abruptio placentae? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900974"/>
            <code code="415105001" codeSystem="{$oidSNOMEDCT}" displayName="Abruptio placentae"/>
            <!-- Item(s) :: abruptio_placentaeq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900975_20141028000000">
        <!-- Infectie -->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./infectieq"/>
            <xsl:with-param name="observation" select="./infectie"/>
            <xsl:with-param name="observation_code" select="'40733004'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Infectie'"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Infectie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900975_20161202144326">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900975"/>
            <code code="40733004" codeSystem="{$oidSNOMEDCT}"/>
            <!-- Item(s) :: infectie -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20141028000000">
        <xsl:param name="contextConduction" select="'false'"/>
        <!-- Afwijkende groei foetus -->
        <xsl:call-template name="question_observation">
            <!-- gaat over het kind dus geen context conduction -->
            <xsl:with-param name="contextConduction" select="$contextConduction"/>
            <xsl:with-param name="question" select="./afwijkende_groei_foetusq"/>
            <xsl:with-param name="observation" select="./afwijkende_groei_foetus"/>
            <xsl:with-param name="observation_code" select="'276604007'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Afwijkende groei foetus'"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Afwijkende groei foetus -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900976"/>
            <code code="276604007" codeSystem="{$oidSNOMEDCT}" displayName="Afwijkende groei foetus"/>
            <!-- Item(s) :: afwijkende_groei_foetus -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20141028000000">
        <!-- Hypertensieve aandoening -->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./hypertensieve_aandoeningq"/>
            <xsl:with-param name="observation" select="./hypertensieve_aandoening"/>
            <xsl:with-param name="observation_code" select="'38341003'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Hypertensieve aandoening'"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Hypertensieve aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202144622">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900977"/>
            <code code="38341003" codeSystem="{$oidSNOMEDCT}"/>
            <!-- Item(s) :: hypertensieve_aandoening -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Hypertensieve aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900977"/>
            <code code="38341003" codeSystem="{$oidSNOMEDCT}" displayName="Hypertensieve aandoening"/>
            <!-- Item(s) :: hypertensieve_aandoening -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20141028000000">
        <!-- Diabetes gravidarum met insuline -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="46894009" codeSystem="{$oidSNOMEDCT}" displayName="Diabetes gravidarum met insuline"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Diabetes gravidarum met insuline? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900978"/>
            <code code="46894009" codeSystem="{$oidSNOMEDCT}" displayName="Diabetes gravidarum met insuline"/>
            <!-- Item(s) :: diabetes_gravidarum_met_insulineq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900980_20141029000000">
        <!--Vorige uitkomst per kind Kernset PRN-->
        <procedure classCode="PROC" moodCode="EVN">
            <id nullFlavor="NI"/>
            <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
            <xsl:for-each select="./vorige_baring/demografische_gegevens/geboortedatum">
                <subject typeCode="SBJ">
                    <personalRelationship classCode="PRS">
                        <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                        <relationshipHolder classCode="PSN" determinerCode="INSTANCE">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900259_20091001000000"/>
                        </relationshipHolder>
                    </personalRelationship>
                </subject>
            </xsl:for-each>
            <!-- Kindspecifieke gegevens vorige uitkomsten -->
            <!-- Type partus -->
            <xsl:for-each select="./vorige_baring/kindspecifieke_gegevens_vorige_uitkomsten">
                <xsl:for-each select="./type_partus">
                    <outboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20141029000000"/>
                    </outboundRelationship>
                </xsl:for-each>
                <!-- Percentiel van het geboortegewicht -->
                <xsl:for-each select="./percentiel_van_het_geboortegewicht">
                    <outboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900902_20131108000000"/>
                    </outboundRelationship>
                </xsl:for-each>
                <!-- Apgarscorena5min -->
                <xsl:for-each select="./apgarscore_na_5_min">
                    <outboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20091001000000"/>
                    </outboundRelationship>
                </xsl:for-each>
                <!-- Congenitale afwijkingen -->
                <xsl:for-each select="./congenitale_afwijkingenq">
                    <outboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901015_20141029000000"/>
                    </outboundRelationship>
                </xsl:for-each>
                <!-- Chromosomale afwijkingen -->
                <xsl:for-each select=".//chromosomale_afwijkingenq">
                    <outboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900981_20141029000000"/>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900981_20141029000000">
        <!--Chromosomale afwijkingen (ja nee)-->
        <observation classCode="OBS" moodCode="EVN" displayName="Chromosomale afwijking">
            <xsl:call-template name="makeNegationAttr"/>
            <code code="74345006" codeSystem="{$oidSNOMEDCT}"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900983_20141029155150">
        <!-- Postnatale fase -->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="133906008" codeSystem="{$oidSNOMEDCT}" displayName="Postpartum care (regime/therapy)"/>
            <!-- Diagnose postpartum -->
            <!-- Pathologie vrouw -->
            <xsl:for-each select="./diagnose_postpartum">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900984_20141028000000"/>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900984_20141028000000">
        <!-- Pathologie vrouw -->
        <xsl:choose>
            <xsl:when test="./pathologie_vrouwq/@value = 'true' and not(./pathologie_vrouw)">
                <component typeCode="COMP" contextConductionInd="true">
                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                        <code code="362973001" codeSystem="2.16.840.1.113883.6.96" displayName="Diagnose postpartum"/>
                        <value xsi:type="CE" nullFlavor="NI"/>
                    </observation>
                </component>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="question_observation">
                    <xsl:with-param name="parent_element_name" select="'component'"/>
                    <xsl:with-param name="question" select="./pathologie_vrouwq"/>
                    <xsl:with-param name="observation" select="./pathologie_vrouw"/>
                    <xsl:with-param name="observation_code" select="'362973001'"/>
                    <xsl:with-param name="observation_effectiveTime" select="./datum"/>
                    <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
                    <xsl:with-param name="observation_displayName" select="'Diagnose postpartum'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900985_20141103113239">
        <!-- Maternaal onderzoek PRN -->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="12131-9" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Study observation.general^Patient"/>
            <xsl:for-each select="./maternale_onderzoeksgegevens/urine_bloed_en_aanvullende_onderzoeken/psie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Laboratorium uitslagen - PSIE -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900986_20141103132547"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900986_20141103132547">
        <!-- Laboratorium uitslagen - PSIE -->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="PSIE" displayName="Prenatale Screening Infectieziekten en Erytrocytenimmunisatie" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Irregulaire antistoffen? - Welke irregulaire antistoffen -->
            <xsl:call-template name="question_observation">
                <xsl:with-param name="parent_element_name" select="'component'"/>
                <xsl:with-param name="question" select="./irregulaire_antistoffenq"/>
                <xsl:with-param name="observation" select="./welke_irregulaire_antistoffen_vrouw_aanwezig"/>
                <xsl:with-param name="observation_code" select="'312457003'"/>
                <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
                <xsl:with-param name="observation_displayName" select="'Irregulaire antistoffen'"/>
            </xsl:call-template>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900987_20141103214710">
        <!--Uitkomst per kind (subject) PRN Kernset-->
        <subject typeCode="SBJ">
            <personalRelationship classCode="PRS">
                <!-- Item: 40007 - Kind (als persoon) -->
                <code code="CHILD" codeSystem="2.16.840.1.113883.5.111" displayName="Kind"/>
                <relationshipHolder classCode="PSN" determinerCode="INSTANCE">
                    <!-- Item: 40011 - Identificatie kind (BSN) -->
                    <xsl:for-each select="./identificaties_kind/bsn_kind">
                        <xsl:call-template name="makeIIValueBSN">
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- Item: 40050 - Geboortedatum -->
                    <xsl:for-each select="./geboortedatum">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900259_20091001000000"/>
                    </xsl:for-each>
                    <!-- Item: 40280 - Perinatale sterfte -->
                    <xsl:for-each select="./perinatale_sterfte_groep/perinatale_sterfteq">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900432_20091001000000"/>
                    </xsl:for-each>
                    <xsl:for-each select="./perinatale_sterfte_groep/datumtijd_vaststelling_perinatale_sterfte">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900443_20091001000000"/>
                    </xsl:for-each>
                </relationshipHolder>
            </personalRelationship>
        </subject>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900988_20141103235309">
        <!--Bevalling PRN Kernset-->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Delivery procedure"/>
            <!-- Item: 20500 - Partusnummer -->
            <xsl:for-each select="./partusnummer">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900357_20121007000000"/>
                </component>
            </xsl:for-each>
            <!-- Diagnose bevalling -->
            <xsl:for-each select="./diagnose_bevalling">
                <component typeCode="COMP" contextConductionInd="true">
                    <organizer classCode="CONTAINER" moodCode="EVN">
                        <id nullFlavor="NI"/>
                        <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
                        <!-- PPROM? -->
                        <xsl:for-each select="./ppromq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901007_20141107000000"/>
                            </component>
                        </xsl:for-each>
                        <!-- PROM? -->
                        <xsl:for-each select="./promq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901008_20141107000000"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="./koortsq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901009_20141107000000"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="./niet_vorderende_ontsluitingq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901010_20141107000000"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="./niet_vorderende_uitdrijvingq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901011_20141107000000"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="./verdenking_foetale_noodq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901012_20141107000000"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="./vastzittende_placentaq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901013_20141107000000"/>
                            </component>
                        </xsl:for-each>
                    </organizer>
                </component>
            </xsl:for-each>
            <!-- Aantal geboren kinderen -->
            <xsl:for-each select="./aantal_geboren_kinderen">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900358_20110128000000"/>
                </component>
            </xsl:for-each>
            <!-- Item: 20530 - Risicostatus vóór baring -->
            <xsl:for-each select="./risicostatus_voor_baring">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900156_20141107000000"/>
                </component>
            </xsl:for-each>
            <!-- Wijze waarop de baring begon -->
            <xsl:for-each select="./wijze_waarop_de_baring_begon">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900715_20141107000000"/>
                </component>
            </xsl:for-each>
            <!-- Item: 20590 - Tijdstip begin actieve ontsluiting -->
            <xsl:for-each select="./tijdstip_begin_actieve_ontsluiting">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900197_20091001000000"/>
                </component>
            </xsl:for-each>
            <!-- Bijstimulatie toegediend? -->
            <xsl:for-each select="./bijstimulatie_toegediendq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900217_20121204000000"/>
                </component>
            </xsl:for-each>
            <!-- Medicatie nageboortetijdperk -->
            <xsl:for-each select="./medicatie_nageboortetijdperk_groep">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900716_20150217112242"/>
                </component>
            </xsl:for-each>
            <!-- Geboorte placenta -->
            <xsl:for-each select="./placenta/geboorte_placenta">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20091001000000"/>
                </component>
            </xsl:for-each>
            <!-- Hoeveelheid bloedverlies -->
            <xsl:for-each select="./hoeveelheid_bloedverlies">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20130320000000"/>
                </component>
            </xsl:for-each>
            <!-- Conditie perineum postpartum -->
            <xsl:for-each select="./conditie_perineum_postpartum">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20141107181807"/>
                </component>
            </xsl:for-each>
            <!--       Uitkomst, per Kind      -->
            <xsl:for-each select="../uitkomst_per_kind/baring">
                <component typeCode="COMP" contextConductionInd="false">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900989_20141104000139"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900989_20141104000139">
        <!--Baring PRN Kernset-->
        <procedure classCode="PROC" moodCode="EVN">
            <!-- Item: 40002 - Baring -->
            <id nullFlavor="NI"/>
            <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
            <!-- demografische_gegevens -->
            <xsl:for-each select="./demografische_gegevens">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900987_20141103214710"/>
            </xsl:for-each>
            <!-- Item: 40170 - Rol supervisor -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/supervisor_groep/rol_supervisor">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900990_20141104003617"/>
            </xsl:for-each>
            <!-- Item: 40150 - Rol aanpakker kind -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/aanpakker_kind_groep/rol_aanpakker_kind">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900991_20141104004426"/>
            </xsl:for-each>
            <!-- Item: 40002 - Baring (werkelijke plaats) -->
            <xsl:if test="./werkelijke_plaats_baring_type_locatie or ./ziekenhuis_baring/ziekenhuisnummer_lvrid">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900233_20141104005410"/>
            </xsl:if>
            <!-- Item: 40041 - Geslacht (medische observatie) -->
            <xsl:for-each select="./demografische_gegevens/geslacht_medische_observatie">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900255_20091001000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Item: 40025 - Rangnummer kind -->
            <xsl:for-each select="./demografische_gegevens/rangnummer_kind">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900400_20110128000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!--     Kindspecifieke maternale gegevens -->
            <!-- Tijdstip breken vliezen -->
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/tijdstip_breken_vliezen">
                <outboundRelationship typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900198_20141104011243"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Kleur vruchtwater  -->
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/kleur_en_consistentie_vruchtwater">
                <outboundRelationship typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900199_20091001000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Tijdstip actief meepersen -->
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/tijdstip_actief_meepersen">
                <outboundRelationship typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900261_20091001000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Episiotomie -->
            <xsl:if test="./kindspecifieke_maternale_gegevens/episiotomieq or ./kindspecifieke_maternale_gegevens/locatie_episiotomie">
                <xsl:for-each select="./kindspecifieke_maternale_gegevens">
                    <outboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900271_20091001000000"/>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:if>
            <!-- Ruggeprik gewenst, niet gekregen? -->
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/ruggeprik_gewenst_niet_gekregenq">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900992_20141104013354"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Item 82091 - Pijnbestrijding -->
            <xsl:if test="./kindspecifieke_maternale_gegevens/pijnbestrijdingq or ./kindspecifieke_maternale_gegevens/pijnbestrijding">
                <xsl:for-each select="./kindspecifieke_maternale_gegevens">
                    <outboundRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900995_20141104155625"/>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:if>
            <!-- Sedatie? -->
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/sedatieq">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900996_20141104174343"/>
                </outboundRelationship>
            </xsl:for-each>
            <!--      Kindspecifieke gegevens    -->
            <!-- Type partus -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/type_partus">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20141029000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Apgarscore na 5 min. -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/apgarscore_na_5_min">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20091001000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Item: 40140 - Ligging bij geboorte -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/ligging_bij_geboorte">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900359_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Vaginale kunstverlossing -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/vaginale_kunstverlossing_groep">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900999_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Sectio ceasarea -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/sectio_caesarea_group">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900277_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- overige interventies -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/overige_interventies">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900893_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Item: 40060 - Geboortegewicht -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/lichamelijk_onderzoek_kind/geboortegewicht">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900425_20110128000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- MdG: null bij geen data -->
            <xsl:if test="not(./kindspecifieke_uitkomstgegevens/lichamelijk_onderzoek_kind/geboortegewicht)">
                <outboundRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="8339-4" codeSystem="2.16.840.1.113883.6.1"/>
                        <value xsi:type="PQ" nullFlavor="NI"/>
                    </observation>
                </outboundRelationship>
            </xsl:if>
            <!-- Item: 40080 - Congenitale afwijkingen -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901017_20141107134642"/>
            <!-- Item: 40080 - Chromosomale afwijkingen -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901016_20141107134958"/>
            <!-- Problematiek kind -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901019_20141107151406"/>
            <!-- kinderarts betrokken, alleen boolean antwoord -->
            <xsl:if test="not(./kindspecifieke_uitkomstgegevens/betrokkenheid_kinderarts)">
                <xsl:for-each select="./kindspecifieke_uitkomstgegevens/kinderarts_betrokkenq">
                    <outboundRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <xsl:call-template name="makeNegationAttr"/>
                            <code code="KinderartsBetrokken" codeSystem="2.16.840.1.113883.2.4.4.13"/>
                        </observation>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:if>
            <!--  Betrokkenheid kinderarts -->
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/betrokkenheid_kinderarts">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901020_20141107153157"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Kindspecifieke kraamzorggegevens -->
            <xsl:variable name="var_rangnummer_kind" select="./ancestor-or-self::*/rangnummer_kind/@value"/>
            <xsl:for-each select="../../postnatale_fase/(kindspecifieke_kraamzorggegevens | kindspecifieke_gegevens)[rangnummer_kind/@value = $var_rangnummer_kind or not(rangnummer_kind)]/voeding_kind_groep">
                <xsl:comment>Item: 70010 - Voeding kind</xsl:comment>
                <outboundRelationship typeCode="COMP" contextConductionInd="true">
                    <!-- Item: 70010 - Voeding kind -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900724_20141113122151"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Item: 40290 -Fase perinatale sterfte -->
            <xsl:for-each select="./demografische_gegevens/perinatale_sterfte_groep/fase_perinatale_sterfte">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900433_20141113163724"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900990_20141104003617">
        <!-- Rol supervisor -->
        <responsibleParty typeCode="RESP">
            <assignedEntity classCode="ASSIGNED">
                <xsl:call-template name="makeCode"/>
            </assignedEntity>
        </responsibleParty>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900991_20141104004426">
        <!-- Rol aanpakker kind PRN Kernset -->
        <performer typeCode="PRF">
            <responsibleParty classCode="ASSIGNED">
                <xsl:call-template name="makeCode"/>
                <agentPerson nullFlavor="NI"/>
            </responsibleParty>
        </performer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900992_20141104013354">
        <!-- Ruggeprik gewenst, niet gekregen? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="RuggeprikGewNGekr" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Ruggeprik gewenst, niet gekregen"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900993_20141104000000">
        <!--Irregulaire antistoffen ja/nee-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./irregulaire_antistoffenq"/>
            <xsl:with-param name="observation" select="./irregulaire_antistoffen"/>
            <xsl:with-param name="observation_code" select="'312457003'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Irregulaire antistoffen'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900995_20141104155625">
        <!-- Pijnbestrijding -->
        <procedure classCode="PROC" moodCode="EVN">
            <xsl:attribute name="negationInd" select="./pijnbestrijdingq/@value = 'false'"/>
            <id nullFlavor="NI"/>
            <code code="278414003" codeSystem="{$oidSNOMEDCT}" displayName="Pijnbestrijding"/>
            <xsl:for-each select="./pijnbestrijding/methode/methode">
                <methodCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </methodCode>
            </xsl:for-each>
            <xsl:for-each select="./pijnbestrijding/periode">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901022_20141113000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:if test="./pijnbestrijding/methode/overig_middel/middel or ./pijnbestrijding/methode/overig_middel/toediening">
                <xsl:for-each select="./pijnbestrijding/methode/overig_middel">
                    <outboundRelationship typeCode="COMP">
                        <procedure classCode="PROC" moodCode="EVN">
                            <id nullFlavor="NI"/>
                            <!-- Item 82095 - Middel -->
                            <code code="PijnbestrOverig" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Overig middel"/>
                            <xsl:for-each select="./middel">
                                <methodCode>
                                    <xsl:call-template name="makeCodeAttribs"/>
                                </methodCode>
                            </xsl:for-each>
                            <xsl:for-each select="./toediening">
                                <outboundRelationship typeCode="COMP">
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <id nullFlavor="NI"/>
                                        <!-- Item 82095 - Toediening -->
                                        <code code="416118004" codeSystem="{$oidSNOMEDCT}" displayName="Toediening"/>
                                        <methodCode>
                                            <xsl:call-template name="makeCodeAttribs"/>
                                        </methodCode>
                                    </procedure>
                                </outboundRelationship>
                            </xsl:for-each>
                        </procedure>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:if>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900996_20141104174343">
        <!-- Sedatie -->
        <procedure classCode="PROC" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr"/>
            <id nullFlavor="NI"/>
            <code code="72641008" codeSystem="{$oidSNOMEDCT}" displayName="Sedatie"/>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900998_20141106000000">
        <!--Voorgenomen plaats baring tijdens zwangerschap (type locatie)-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PRN4209" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Voorgenomen plaats baring tijdens zwangerschap"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900999_20141106000000">
        <!-- Vaginale kunstverlossing -->
        <procedure classCode="PROC" moodCode="EVN" negationInd="false">
            <id nullFlavor="NI"/>
            <code code="3311000146109" codeSystem="{$oidSNOMEDCT}" displayName="Vaginale kunstverlossing"/>
            <xsl:for-each select="./vaginale_kunstverlossing">
                <methodCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </methodCode>
            </xsl:for-each>
            <xsl:for-each select="./succes_vaginale_kunstverlossingq">
                <outboundRelationship typeCode="OUTC">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900275_20150213113252"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901000_20141106000000">
        <!--Voornemens-->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <code code="Voornemen" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Voornemen"/>
            <!-- Voorgenomen plaats baring tijdens zwangerschap  -->
            <xsl:for-each select="./voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900998_20141106000000"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901001_20141106000000">
        <!--Alcoholgebruik-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="228309001" codeSystem="{$oidSNOMEDCT}" displayName="Alcoholgebruik"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901002_20141106000000">
        <!--Drugsgebruik?-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="Drugsgebruik" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901003_20141106000000">
        <!--Prenatale controle-->
        <procedure classCode="PROC" moodCode="EVN">
            <id nullFlavor="NI"/>
            <code code="18114009" codeSystem="{$oidSNOMEDCT}" displayName="Prenatale controle"/>
            <xsl:for-each select="./datum_controle">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <!-- Zwangerschapsduur -->
            <xsl:for-each select="./zwangerschapsduur">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20130320000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!--  Leven voelen -->
            <xsl:for-each select="./leven_voelen">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901023_20141113000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Rookgedrag -->
            <xsl:for-each select="./rookgedrag">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900939_20141022000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Alcoholgebruik -->
            <xsl:for-each select="./alcoholgebruik">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901001_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Drugsgebruik -->
            <xsl:for-each select="./drugsgebruikq">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901002_20141106000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <!-- Gewicht (gemeten) -->
            <xsl:for-each select="./gewicht_gemeten">
                <outboundRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900571_20110128000000"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- Prenatale controle -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901003_20161206110335">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901003"/>
            <id nullFlavor="NI"/>
            <code code="18114009" codeSystem="{$oidSNOMEDCT}" displayName="Prenatale controle"/>
            <!-- Item(s) :: datum_controle-->
            <xsl:for-each select="datum_controle">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <xsl:for-each select="./zwangerschapsduur">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Zwangerschapsduur op datum onderzoek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20161206114409"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./leven_voelen">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Leven voelen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901023_20161206114616"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./rookgedrag">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Rookgedrag -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900939_20161206114703"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./alcoholgebruik">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Alcoholgebruik -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901001_20161206114803"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./drugsgebruikq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Drugsgebruik? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901002_20161206114851"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./gewicht_gemeten">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Body Weight -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900571_20161206115006"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901004_20141106000000">
        <!-- Diagnose deze zwangerschap -->
        <organizer classCode="CONTAINER" moodCode="EVN">
            <id nullFlavor="NI"/>
            <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
            <xsl:for-each select="./datum">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <!-- Zwangerschapsduur -->
            <xsl:for-each select="./zwangerschapsduur">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20130320000000"/>
                </component>
            </xsl:for-each>
            <!-- Gynaecologische aandoening -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20141024000000"/>
            <!-- Bloedverlies? -->
            <xsl:for-each select="./bloedverliesq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20141028000000"/>
                </component>
            </xsl:for-each>
            <!-- Partiële mola -->
            <xsl:for-each select="./partiele_molaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20141106000000"/>
                </component>
            </xsl:for-each>
            <!-- Cervixinsufficiëntie -->
            <xsl:for-each select="./cervixinsufficientieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20141028000000"/>
                </component>
            </xsl:for-each>
            <!-- Infectie -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900975_20141028000000"/>
            <!-- Hyperemesis gravidarum?  -->
            <xsl:for-each select="./hyperemesis_gravidarumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20141028000000"/>
                </component>
            </xsl:for-each>
            <!-- Hypertensieve aandoening -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20141028000000"/>
            <!-- Zwangerschapscholestase? -->
            <xsl:for-each select="./zwangerschapscholestaseq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20141028000000"/>
                </component>
            </xsl:for-each>
            <!-- Diabetes gravidarum met insuline? -->
            <xsl:for-each select="./diabetes_gravidarum_met_insulineq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20141028000000"/>
                </component>
            </xsl:for-each>
            <!-- afwijkende_groei_foetus -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20141028000000"/>
            <!-- Dreigende partus immaturus? -->
            <xsl:for-each select="./dreigende_partus_immaturusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20141028000000"/>
                </component>
            </xsl:for-each>
            <!-- Dreigende partus prematurus? -->
            <xsl:for-each select="./dreigende_partus_prematurusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20141028000000"/>
                </component>
            </xsl:for-each>
            <!-- Abruptio placentae?  -->
            <xsl:for-each select="./abruptio_placentaeq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20141028000000"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20141106000000">
        <!-- Partiële mola? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="MolaPartieelIntacteZw" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Partiële mola"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <!-- Partiële mola? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20161202142628">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901005"/>
            <code code="MolaPartieelIntacteZw" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Partiële mola"/>
            <!-- Item(s) :: partiele_molaq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901006_20141106000000">
        <!--  Intra-uteriene behandeling -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="265631002" codeSystem="{$oidSNOMEDCT}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <!-- Intra-uteriene behandeling -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901006_20161206110631">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901006"/>
            <code code="265631002" codeSystem="{$oidSNOMEDCT}" displayName="Intra-uteriene behandeling"/>
            <!-- Item(s) :: intrauteriene_behandeling -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Intra-uteriene behandeling -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901007_20141107000000">
        <!--PPROM?-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="312974005" codeSystem="{$oidSNOMEDCT}" displayName="PPROM"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901008_20141107000000">
        <!-- PROM? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="44223004" codeSystem="{$oidSNOMEDCT}" displayName="PROM"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901009_20141107000000">
        <!-- 	Koorts? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="386661006" codeSystem="{$oidSNOMEDCT}" displayName="Koorts"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901010_20141107000000">
        <!-- Niet vorderende ontsluiting? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="237320005" codeSystem="{$oidSNOMEDCT}" displayName="Niet vorderende ontsluiting"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901011_20141107000000">
        <!-- Niet vorderende uitdrijving? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="249166003" codeSystem="{$oidSNOMEDCT}" displayName="Niet vorderende uitdrijving"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901012_20141107000000">
        <!-- Verdenking foetale nood? -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="609415007:246090004=12867002" codeSystem="{$oidSNOMEDCT}" displayName="Verdenking foetale nood"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901013_20141107000000">
        <!-- Vastzittende placenta?-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="109894007" codeSystem="{$oidSNOMEDCT}" displayName="Vastzittende placenta"/>
            <xsl:call-template name="makeBLValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901015_20141029000000">
        <!--Congenitale afwijkingen (ja nee)-->
        <observation classCode="OBS" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr"/>
            <!-- TEDOEN nullFlavor is ook mogelijk: nog bijbouwen -->
            <code code="443341004" codeSystem="{$oidSNOMEDCT}" displayName="Congenitale afwijking"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901016_20141107134958">
        <!--Chromosomale afwijkingen NoUnc-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="parent_element_name" select="'outboundRelationship'"/>
            <xsl:with-param name="question" select="./kindspecifieke_uitkomstgegevens/congenitale_afwijkingen_groep/chromosomale_afwijkingenq"/>
            <xsl:with-param name="observation" select="./kindspecifieke_uitkomstgegevens/congenitale_afwijkingen_groep/specificatie_chromosomale_afwijking_groep/specificatie_chromosomale_afwijking"/>
            <xsl:with-param name="observation_code" select="'74345006'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Chromosomale afwijking'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901017_20141107134642">
        <!--Congenitale afwijkingen NoUnc-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="parent_element_name" select="'outboundRelationship'"/>
            <xsl:with-param name="question" select="./kindspecifieke_uitkomstgegevens/congenitale_afwijkingenq"/>
            <xsl:with-param name="observation" select="./kindspecifieke_uitkomstgegevens/congenitale_afwijkingen_groep/specificatie_congenitale_afwijking_groep/specificatie_congenitale_afwijking"/>
            <xsl:with-param name="observation_code" select="'443341004'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Congenitale afwijking'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901018_20141107145228">
        <!-- Zorginstelling (LVR-ID) -->
        <!-- Item(s) :: ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid-->
        <xsl:for-each select="ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer[@root = '2.16.840.1.113883.2.4.3.22.96.6'] | zorginstelling_lvrid">
            <id root="2.16.840.1.113883.2.4.3.22.96.6">
                <xsl:attribute name="extension" select="./@value"/>
            </id>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901019_20141107151406">
        <!-- MdG: null bij geen data -->
        <xsl:if test="not(./kindspecifieke_uitkomstgegevens/problematiek_kindq) and not(./kindspecifieke_uitkomstgegevens/problematiek_kind)">
            <outboundRelationship typeCode="COMP">
                <observation classCode="OBS" moodCode="EVN" nullFlavor="NI">
                    <code code="ProblematiekKind" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Problematiek kind"/>
                </observation>
            </outboundRelationship>
        </xsl:if>
        <!-- MdG: bij wel problemen is vraag 'ja' -->
        <xsl:variable name="kindprobq" select="
                if (not(./kindspecifieke_uitkomstgegevens/problematiek_kindq) and ./kindspecifieke_uitkomstgegevens/problematiek_kind) then
                    'true'
                else
                    ./kindspecifieke_uitkomstgegevens/problematiek_kindq"/>
        <!--Problematiek kind-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="parent_element_name" select="'outboundRelationship'"/>
            <xsl:with-param name="question" select="$kindprobq"/>
            <xsl:with-param name="observation" select="./kindspecifieke_uitkomstgegevens/problematiek_kind"/>
            <xsl:with-param name="observation_code" select="'ProblematiekKind'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.2.4.4.13'"/>
            <xsl:with-param name="observation_displayName" select="'Problematiek kind'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901020_20141107153157">
        <!--Betrokkenheid kinderarts-->
        <observation classCode="OBS" moodCode="EVN" negationInd="false">
            <code code="KinderartsBetrokken" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Type betrokkenheid kinderarts -->
            <xsl:for-each select="./type_betrokkenheid">
                <xsl:call-template name="makeCEValue"/>
            </xsl:for-each>
            <xsl:if test="./datum_betrokkenheid or ./zorginstelling_lvrid">
                <performer typeCode="SPRF">
                    <!-- Item: 40260 - Datum betrokkenheid kinderarts -->
                    <xsl:for-each select="./datum_betrokkenheid">
                        <time value="20140828">
                            <xsl:call-template name="makeTSValueAttr"/>
                        </time>
                    </xsl:for-each>
                    <assignedEntity classCode="ASSIGNED">
                        <!-- Zorgverlenertype van betrokken andere zorgverlener, altijd kinderarts -->
                        <code code="01.019" codeSystem="2.16.840.1.113883.2.4.15.111" displayName="Kinderarts"/>
                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                            <xsl:choose>
                                <xsl:when test="./zorginstelling_lvrid">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901018_20141107145228"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <id nullFlavor="NI"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </representedOrganization>
                    </assignedEntity>
                </performer>
            </xsl:if>
            <xsl:for-each select="./reden_betrokkenheid">
                <outboundRelationship typeCode="RSON">
                    <!-- Reden betrokkenheid kinderarts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901021_20141107160838"/>
                </outboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901021_20141107160838">
        <!-- Reden betrokkenheid kinderarts -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PediatrischeVerwijsindicatie" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901022_20141113000000">
        <!--  Pijnbestrijding periode -->
        <observation classCode="OBS" moodCode="EVN">
            <code code="PijnbestrPeriode" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Pijnbestrijding periode"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901023_20141113000000">
        <!--Leven voelen-->
        <observation classCode="OBS" moodCode="EVN">
            <code code="364618000" codeSystem="{$oidSNOMEDCT}" displayName="Leven voelen"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901024_20141119000000">
        <!--Transfusiereactie-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./transfusiereactieq"/>
            <xsl:with-param name="observation" select="./transfusiereactie"/>
            <xsl:with-param name="observation_code" select="'82545002'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Transfusiereactie'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901026_20150210150105">
        <!--PsychiatriePRN-->
        <xsl:call-template name="question_observation">
            <xsl:with-param name="question" select="./psychiatrieq"/>
            <xsl:with-param name="observation" select="./psychiatrie"/>
            <xsl:with-param name="observation_code" select="'74732009'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Psychiatrie'"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Assigned Person [peri] -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901040_20160208170641">
        <code xmlns="urn:hl7-org:v3"/>
        <telecom xmlns="urn:hl7-org:v3"/>
        <assignedPrincipalChoiceList xmlns="urn:hl7-org:v3">
            <assignedPerson>
                <name/>
            </assignedPerson>
        </assignedPrincipalChoiceList>
        <Organization xmlns="urn:hl7-org:v3">
            <xsl:choose>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="{$oidURAOrganizations}"/>
                </xsl:when>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="2.16.528.1.1007" extension="4"/>
                </xsl:when>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="2.16.840.1.113883.2.4.3.11.25"/>
                </xsl:when>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="2.16.840.1.113883.2.4.3.11" extension="7"/>
                </xsl:when>
            </xsl:choose>
            <id/>
            <code/>
            <telecom/>
            <name/>
            <addr>
                <city/>
            </addr>
        </Organization>
        <templateId xmlns="urn:hl7-org:v3"/>
    </xsl:template>

    <!-- ControlAct AuthorOrPerformer [peri] -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901041_20160208172125">
        <authorOrPerformer xmlns="urn:hl7-org:v3" typeCode="">
            <participant>
                <xsl:choose>
                    <xsl:when test="'TODO-X'">
                        <AssignedDevice>
                            <!-- Template :: Assigned Device [peri] -->
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901043_20160209092350"/>
                        </AssignedDevice>
                    </xsl:when>
                    <xsl:when test="'TODO-X'">
                        <AssignedPerson>
                            <!-- Template :: Assigned Person [peri] -->
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901040_20160208170641"/>
                        </AssignedPerson>
                    </xsl:when>
                </xsl:choose>
            </participant>
        </authorOrPerformer>
    </xsl:template>

    <!-- ControlAct Overseer Person (MCAI / MFMI) [peri] -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901042_20160209084428">
        <overseer xmlns="urn:hl7-org:v3" typeCode="RESP">
            <AssignedPerson>
                <!-- Template :: Assigned Person [peri] -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901040_20160208170641"/>
            </AssignedPerson>
        </overseer>
    </xsl:template>

    <!-- Assigned Device [peri] -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901043_20160209092350">
        <Organization xmlns="urn:hl7-org:v3">
            <xsl:choose>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="{$oidURAOrganizations}"/>
                </xsl:when>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="{$oidSBVZOrganization}" extension="4"/>
                </xsl:when>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="2.16.840.1.113883.2.4.3.11.25"/>
                </xsl:when>
                <xsl:when test="'TODO-X-Include in choice'">
                    <id root="2.16.840.1.113883.2.4.3.11" extension="7"/>
                </xsl:when>
            </xsl:choose>
            <id/>
            <code/>
            <telecom/>
            <name/>
            <addr>
                <city/>
            </addr>
        </Organization>
        <templateId xmlns="urn:hl7-org:v3"/>
    </xsl:template>

    <!-- Generic ControlActProcess Checks [peri] -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901044_20160209094603"/>

    <!-- assignedEntity -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901045_20161201143523">
        <xsl:for-each select="zorginstelling">
            <assignedEntity xmlns="urn:hl7-org:v3" classCode="ASSIGNED">
                <!-- Item(s) :: specialisme specialisme-->
                <xsl:for-each select="specialisme">
                    <xsl:call-template name="makeCEValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">code</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901047_20161202101906"/>
                </representedOrganization>
            </assignedEntity>
        </xsl:for-each>
    </xsl:template>

    <!-- Verwijsdetails 2.3.2 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901046_20161201151537">
        <act xmlns="urn:hl7-org:v3" classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901046"/>
            <code code="3457005" codeSystem="{$oidSNOMEDCT}" displayName="Verwijsdetails"/>
            <!-- Item(s) :: datum_verwijzing-->
            <xsl:for-each select="datum_verwijzing">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="verwijzing_naar">
                <performer typeCode="PRF">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901045_20161201143523"/>
                </performer>
            </xsl:for-each>
            <xsl:for-each select="verwijzing_van">
                <author typeCode="AUT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901045_20161201143523"/>
                </author>
            </xsl:for-each>
            <xsl:for-each select="redenen_van_verwijzing">
                <xsl:for-each select="van_1e_naar_2e_lijn">
                    <xsl:for-each select="./algemene_anamnese | ./obstetrische_anamnese | ./zwangerschap | ./einde_zwangerschap | ./bevalling | ./postnatale_fase | ./overig | van_2e_naar_3e_lijn | van_2e_naar_1e_lijn | van_3e_naar_2e_lijn">
                        <outboundRelationship typeCode="RSON">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901050_20161202140202"/>
                        </outboundRelationship>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="perinatale_periode">
                <outboundRelationship typeCode="PERT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900895_20161203165258"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="verwijzing_naar/type_verwijzing">
                <outboundRelationship typeCode="GEN" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901059_20161203164103"/>
                </outboundRelationship>
            </xsl:for-each>
        </act>
    </xsl:template>
    <!-- Zorginstelling Identificatie (Perined) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901047_20161202101906">
        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901018_20141107145228"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900022_20161202102921"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900021_20091001000000"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900610_20091001000000"/>
    </xsl:template>
    <!-- Zorginstelling (URA) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900021_20091001000000">
        <!-- Item(s) :: zorginstelling_ura zorgaanbieder_identificatie_nummer zorgaanbieder_ura zorgaanbieder_identificatie_nummer zorginstelling_ura zorgaanbieder_ura zorginstelling_ura zorgaanbieder_ura-->
        <xsl:for-each select="zorginstelling_ura | zorgaanbieder_identificatie_nummer[@root = '2.16.528.1.1007.3.3'] | zorgaanbieder_ura">
            <xsl:call-template name="makeII.NL.URAValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <!-- Reden Verwijzing (Algemene anamnese) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901048_20161202111820">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901048"/>
            <code code="312850006" codeSystem="{$oidSNOMEDCT}" displayName="Algemene anamnese"/>
            <xsl:for-each select="autoimmuun_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Auto-immuun aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900944_20161202113937"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cardiovasculaire_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Cardiovasculaire aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900945_20161202114347"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="urogenitale_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Urogenitale aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900946_20161202114612"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="oncologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Oncologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900948_20161202114951"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="schildklier_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Schildklier aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900947_20161202115136"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diabetes_mellitusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diabetes Mellitus (y/n) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900936_20161202132728"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="neurologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Neurologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900949_20161202115419"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="infectieziekte">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Infectieziekte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="mdl_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: MDL aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900951_20161202115814"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="anemie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Anemie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900952_20161202115941"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="longaandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Longaandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900953_20161202120109"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="gynaecologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Gynaecologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="orthopedische_afwijking">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Orthopedische afwijking -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900955_20161202123811"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bloedtransfusieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bloedtransfusie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900158_20161202132925"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="transfusiereactieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Transfusiereactie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901024_20161202133114"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="type_operatie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Type operatie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900956_20161202124735"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="type_stollingsprobleem">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Type stollingsprobleem -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900957_20161202124918"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="psychiatrieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PsychiatriePRN -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901026_20161202133709"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="overige_aandoeningq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Overige aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900960_20161202134046"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>

    <!-- Reden verwijzing (obstetrische anamnese) 2.3.2-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901049_20161202135842">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <code code="248983002" codeSystem="{$oidSNOMEDCT}" displayName="Obstetrische anamnese"/>
            <xsl:for-each select="gynaecologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Gynaecologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bloedverliesq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bloedverlies? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="partiele_molaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Partiële mola? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20161202142628"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cervixinsufficientieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Cervixinsufficiëntie? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                </component>
            </xsl:for-each>
            <!-- TO DO fix voor issue 1044, daar is nu verkeerde template gekoppeld -->
            <!--            <xsl:for-each select="infectie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-\- Template :: Infectieziekte -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613"/>
                </component>
            </xsl:for-each>-->
            <xsl:for-each select="hyperemesis_gravidarumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hyperemesis gravidarum? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hypertensieve_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hypertensieve aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="zwangerschapscholestaseq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Zwangerschapscholestase? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diabetes_gravidarum_met_insulineq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diabetes gravidarum met insuline? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwijkende_groei_foetus">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Afwijkende groei foetus -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_immaturusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus immaturus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_prematurusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus prematurus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="abruptio_placentaeq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Abruptio placentae? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="fluxus_postpartumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Fluxus Postpartum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901054_20161202165703"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Reden Verwijzing 2.3.2 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901050_20161202140202">
        <xsl:if test="name(.) = 'algemene_anamnese'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901048_20161202111820"/>
        </xsl:if>
        <xsl:if test="name(.) = 'obstetrische_anamnese'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901049_20161202135842"/>
        </xsl:if>
        <xsl:if test="name(.) = 'zwangerschap'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901051_20161202153846"/>
        </xsl:if>
        <xsl:if test="name(.) = 'einde_zwangerschap'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901055_20161202170207"/>
        </xsl:if>
        <xsl:if test="name(.) = 'bevalling'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901056_20161202173313"/>
        </xsl:if>
        <xsl:if test="name(.) = 'postnatale_fase'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900983_20161202180940"/>
        </xsl:if>
        <xsl:if test="name(.) = 'overig'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901058_20161202183205"/>
        </xsl:if>
        <xsl:if test="name(.) = 'van_2e_naar_3e_lijn'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901060_20161203172345"/>
        </xsl:if>
        <xsl:if test="name(.) = 'van_2e_naar_1e_lijn'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901061_20161205165345"/>
        </xsl:if>
        <xsl:if test="name(.) = 'van_3e_naar_2e_lijn'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901062_20161205165345"/>
        </xsl:if>

    </xsl:template>

    <!-- Reden verwijzing (deze zwangerschap) 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901051_20161202153846">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <code code="364320009" codeSystem="{$oidSNOMEDCT}" displayName="Zwangerschap"/>
            <xsl:for-each select="gynaecologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Gynaecologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bloedverliesq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bloedverlies? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="partiele_mola">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Partiële mola? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20161202142628"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cervixinsufficientie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Cervixinsufficiëntie? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="infectieziekte">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Infectieziekte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hyperemesis_gravidarumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hyperemesis gravidarum? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hypertensieve_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hypertensieve aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="zwangerschapscholestaseq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Zwangerschapscholestase? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diabetes_gravidarum_met_insulineq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diabetes gravidarum met insuline? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwijkende_groei_foetus">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Afwijkende groei foetus -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_immaturusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus immaturus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_prematurusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus prematurus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="abruptio_placentaeq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Abruptio placentae? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="navelstrengprolapsq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Navelstrengprolaps -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901052_20161202154625"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="liggingsafwijking">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Liggingsafwijking -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901053_20161202154917"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="intrauteriene_vruchtdood/vermoeden_intrauteriene_vruchtdoodq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Intra-uteriene vruchtdood -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20161202160924"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Navelstrengprolaps -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901052_20161202154625">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901052"/>
            <code code="270500004" codeSystem="{$oidSNOMEDCT}" displayName="Navelstrengprolaps"/>
            <!-- Item(s) :: navelstrengprolapsq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Liggingsafwijking -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901053_20161202154917">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901053"/>
            <code code="80002007" codeSystem="{$oidSNOMEDCT}" displayName="Liggingsafwijking"/>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="xsiType">CE</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Fluxus Postpartum -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901054_20161202165703">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901054"/>
            <code code="47821001" codeSystem="{$oidSNOMEDCT}" displayName="Fluxus Postpartum"/>
            <!-- Item(s) :: fluxus_postpartumq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Einde zwangerschap (verwijsreden) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901055_20161202170207">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901055"/>
            <code code="EindeZw" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Einde zwangerschap"/>
            <!-- Item(s) :: einde_zwangerschap-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="xsiType" select="'CE'"/>
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Reden verwijzing (bevalling) 2.3.2 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901099_20180223113239">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901099"/>
            <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Bevalling"/>
            <xsl:for-each select="ppromq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PPROM? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901007_20161202173503"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="promq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PROM? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901008_20161202173654"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="koortsq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Koorts? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901009_20161202173856"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="niet_vorderende_ontsluitingq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Niet vorderende ontsluiting? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901010_20161202174017"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="niet_vorderende_uitdrijvingq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Niet vorderende uitdrijving? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901011_20161202174122"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="verdenking_foetale_noodq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Verdenking foetale nood? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901012_20161202174235"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="intrauteriene_vruchtdood/vermoeden_intrauteriene_vruchtdoodq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Intra-uteriene vruchtdood -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20161202160924"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="vastzittende_placentaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Vastzittende placenta -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901013_20161202174410"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="conditie_perineum_postpartum">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Conditie Perineum Postpartum (verwijsreden) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901104_20180228111743"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="fluxus_postpartumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Fluxus Postpartum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901054_20161202165703"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>

    <!-- Reden verwijzing (bevalling) 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901056_20161202173313">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <!-- TODO id... ! -->
            <!--<id root="" extension=""/>
                -->
            <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Bevalling"/>
            <xsl:for-each select="ppromq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PPROM? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901007_20161202173503"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="promq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PROM? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901008_20161202173654"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="koortsq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Koorts? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901009_20161202173856"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="niet_vorderende_ontsluitingq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Niet vorderende ontsluiting? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901010_20161202174017"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="niet_vorderende_uitdrijvingq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Niet vorderende uitdrijving? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901011_20161202174122"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="verdenking_foetale_noodq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Verdenking foetale nood? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901012_20161202174235"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="intrauteriene_vruchtdood/vermoeden_intrauteriene_vruchtdoodq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Intra-uteriene vruchtdood -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20161202160924"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="vastzittende_placentaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Vastzittende placenta -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901013_20161202174410"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="conditie_perineum_postpartum">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Conditie Perineum Postpartum (verwijsreden) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901057_20161202180528"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="fluxus_postpartumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Fluxus Postpartum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901054_20161202165703"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>

    <!-- Conditie Perineum Postpartum (verwijsreden) 2.3.2 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901057_20161202180528">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901057"/>
            <code code="364297003" codeSystem="{$oidSNOMEDCT}" displayName="Conditie Perineum Postpartum"/>
            <!-- Item(s) :: conditie_perineum_postpartum-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Bevalling Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901101_20180226150516">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901101"/>
            <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Bevalling"/>
            <xsl:for-each select="partusnummer">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Partusnummer -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900357_20161206125654"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diagnose_bevalling">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diagnose bevalling Kernsetbericht PRN -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901014_20161206125851"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="aantal_geboren_kinderen">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Aantal geboren kinderen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900358_20161206130005"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="risicostatus_voor_baring">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Risicostatus vóór baring -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900156_20161206130057"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="interventies_begin_baring[interventie_begin_baring]">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Interventie begin baring -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900726_20161215133633"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="wijze_waarop_de_baring_begon">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Wijze waarop de baring begon -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901103_20180227180051"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="tijdstip_begin_actieve_ontsluiting">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Tijdstip begin actieve ontsluiting -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900197_20161206130607"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="medicatie_nageboortetijdperk_groep[medicatie_nageboortetijdperkq]">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Medicatie nageboortetijdperk -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900716_20161206130815"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="placenta/geboorte_placenta">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Geboorte placenta -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20161206101905"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hoeveelheid_bloedverlies">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hoeveelheid bloedverlies 2 -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20161206102207"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="conditie_perineum_postpartum">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Conditie perineum postpartum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20161206131005"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="../uitkomst_per_kind/baring">
                <component typeCode="COMP" contextConductionInd="false">
                    <!-- Template :: Baring Kernset -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901102_20180226151440"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>

    <!-- Baring Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901102_20180226151440">
        <!-- Bij 2.3 is dit niet getest! -->
        <xsl:variable name="var_rangnummer_kind" select="./ancestor-or-self::*/rangnummer_kind/@value"/>
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901102"/>
            <id nullFlavor="NI"/>
            <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
            <xsl:for-each select="./demografische_gegevens">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900987_20141103214710"/>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/supervisor_groep/rol_supervisor">
                <responsibleParty typeCode="RESP">
                    <assignedEntity classCode="ASSIGNED">
                        <!-- Item(s) :: rol_supervisor rol_supervisor-->
                        <xsl:call-template name="makeCEValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">code</xsl:with-param>
                        </xsl:call-template>
                    </assignedEntity>
                </responsibleParty>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/aanpakker_kind_groep/rol_aanpakker_kind">
                <performer typeCode="PRF">
                    <responsibleParty classCode="ASSIGNED">
                        <!-- Item(s) :: rol_aanpakker_kind -->
                        <xsl:call-template name="makeCEValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">code</xsl:with-param>
                        </xsl:call-template>
                        <agentPerson nullFlavor="NI"/>
                    </responsibleParty>
                </performer>
            </xsl:for-each>
            <xsl:if test="ziekenhuis_baring | werkelijke_plaats_baring_type_locatie">
                <location typeCode="ELOC">
                    <healthCareFacility classCode="DSDLOC">
                        <!-- Item(s) :: ziekenhuisnummer_lvrid -->
                        <xsl:for-each select="./ziekenhuis_baring/ziekenhuisnummer_lvrid">
                            <xsl:call-template name="makeIIValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">id</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- Item(s) :: werkelijke_plaats_baring_type_locatie werkelijke_plaats_baring_type_locatie-->
                        <xsl:for-each select="./werkelijke_plaats_baring_type_locatie">
                            <xsl:call-template name="makeCEValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">code</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </healthCareFacility>
                </location>
            </xsl:if>
            <xsl:for-each select="./demografische_gegevens/geslacht_medische_observatie">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Geslacht (medische observatie) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900255_20161206133653"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./demografische_gegevens/rangnummer_kind">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Rangnummer kind -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900400_20161206133754"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/bijstimulatie_toegediendq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Bijstimulatie toegediend -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900217_20161206130714"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/tijdstip_breken_vliezen">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Tijdstip breken vliezen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900198_20161206133840"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/kleur_en_consistentie_vruchtwater">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Kleur vruchtwater -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900199_20161206133935"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/tijdstip_actief_meepersen">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Tijdstip actief meepersen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900261_20161206133947"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/episiotomieq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Episiotomie (incl. indicatie) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901063_20161206000000"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/ruggeprik_gewenst_niet_gekregenq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Ruggeprik gewenst, niet gekregen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900992_20161206134140"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/pijnbestrijdingq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: PijnbestrijdingPRNKernset -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900995_20161206134416"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_maternale_gegevens/sedatieq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Sedatie Ja/Nee -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900996_20161206134556"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/type_partus">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Type partus -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901107_20180228162810"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/lichamelijk_onderzoek_kind/apgarscore_na_5_min">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Apgarscore na 5 min. -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20161206103247"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/ligging_bij_geboorte">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Ligging bij geboorte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900359_20161206134724"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/vaginale_kunstverlossing_groep[vaginale_kunstverlossing]">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Vaginale kunstverlossing PRN Kernset -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900999_20161206134830"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/sectio_caesarea_group">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Section caesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901106_20180228150344"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/overige_interventies">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Overige interventies -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900893_20161206135049"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/lichamelijk_onderzoek_kind/geboortegewicht">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Geboortegewicht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900425_20161206135217"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/congenitale_afwijkingenq">
                <xsl:variable name="cong_afw_question" select="."/>
                <xsl:for-each select="../congenitale_afwijkingen_groep/specificatie_congenitale_afwijking_groep/specificatie_congenitale_afwijking">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Congenitale afwijkingen NoUnc -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901017_20161206135251">
                            <xsl:with-param name="cong_afw_question" select="$cong_afw_question"/>
                            <xsl:with-param name="cong_afw_observation" select="."/>
                        </xsl:call-template>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/congenitale_afwijkingen_groep/chromosomale_afwijkingenq">
                <xsl:variable name="chr_afw_question" select="."/>
                <xsl:for-each select="../specificatie_chromosomale_afwijking_groep/specificatie_chromosomale_afwijking">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Chromosomale afwijkingen NoUnc -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901016_20161206135419">
                            <xsl:with-param name="chr_afw_question" select="$chr_afw_question"/>
                            <xsl:with-param name="chr_afw_observation" select="."/>
                        </xsl:call-template>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/problematiek_kindq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Problematiek kind -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901019_20161206135430"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="./kindspecifieke_uitkomstgegevens/kinderarts_betrokkenq">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Betrokkenheid kinderarts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901020_20161206135638"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="//postnatale_fase/kindspecifieke_gegevens[rangnummer_kind/@value = $var_rangnummer_kind or not(rangnummer_kind)]/voeding_kind_groep[voeding_kind_datum | substantie_voeding_kind]">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Voeding kind -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900724_20161206135654"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="demografische_gegevens/perinatale_sterfte_groep/fase_perinatale_sterfte">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Fase perinatale sterfte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900433_20161206135827"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>

    <!-- Wijze waarop de baring begon -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901103_20180227180051">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901103"/>
            <code code="BeginDeliv" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Wijze waarop de baring begon"/>
            <!-- Item(s) :: wijze_waarop_de_baring_begon -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Conditie Perineum Postpartum (verwijsreden) 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901104_20180228111743">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901104"/>
            <code code="364297003" codeSystem="{$oidSNOMEDCT}" displayName="Conditie Perineum Postpartum"/>
            <!-- Item(s) :: conditie_perineum_postpartum-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <!-- Overige verwijsreden -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901058_20161202183205">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901058"/>
            <code code="9999" codeSystem="2.16.840.1.113883.2.4.3.22.1.2.1" displayName="Overige verwijsreden"/>
            <xsl:call-template name="makeText"/>
        </observation>
    </xsl:template>

    <!-- Consult of overname -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901059_20161203164103">
        <act xmlns="urn:hl7-org:v3" classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901059"/>
            <!-- Item(s) :: type_verwijzing-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">code</xsl:with-param>
            </xsl:call-template>
        </act>
    </xsl:template>

    <!-- Reden verwijzing (2e naar 3e lijn) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901060_20161203172345">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901060"/>
            <code code="2" codeSystem="2.16.840.1.113883.2.4.4.13.10" displayName="Reden verwijzing (2e naar 3e lijn)"/>
            <xsl:call-template name="makeText"/>
        </observation>
    </xsl:template>

    <!-- Reden verwijzing (2e naar 1e lijn) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901061_20161205165345">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901061"/>
            <code code="3" codeSystem="2.16.840.1.113883.2.4.4.13.10" displayName="Reden verwijzing (2e naar 1e lijn)"/>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="xsiType">CE</xsl:with-param>
                <!-- TEDOEN originalText nullFlavor OTH -->
                <xsl:with-param name="originalText"/>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <!-- Reden verwijzing (3e naar 2e lijn) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901062_20161205165345">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901062"/>
            <code code="4" codeSystem="2.16.840.1.113883.2.4.4.13.10" displayName="Reden verwijzing (3e naar 2e lijn)"/>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="xsiType">CE</xsl:with-param>
                <!-- TEDOEN originalText nullFlavor OTH -->
                <xsl:with-param name="originalText"/>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <!-- Episiotomie (incl. indicatie) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901063_20161206000000">
        <procedure classCode="PROC" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr"/>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901063"/>
            <id nullFlavor="NI"/>
            <code code="PRN540701" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Episiotomie"/>
            <!-- Item(s) :: locatie_episiotomie -->
            <xsl:for-each select="../locatie_episiotomie">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="../indicatie_episiotomie">
                <outboundRelationship typeCode="RSON">
                    <!-- Template :: Indicatie episiotomie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901064_20161206000000"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- Indicatie episiotomie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901064_20161206000000">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901064"/>
            <code code="61" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Indicatie episiotomie"/>
            <!-- Item(s) :: indicatie_episiotomie-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <!-- Zorginstelling Identificatie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901070_20161216000000"/>

    <!-- Zorginstelling Identificatie Counseling -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901072_20161216000000"/>

    <!-- Zorgverlener als performer -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901073_20161216114337">
        <performer xmlns="urn:hl7-org:v3" typeCode="PRF">
            <xsl:for-each select="zorgverlener">
                <assignedEntity classCode="ASSIGNED">
                    <xsl:if test="'TODO-X-Include in choice'">
                        <!-- Item(s) :: zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer-->
                        <xsl:for-each select="zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer">
                            <xsl:call-template name="makeII.NL.UZIValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">id</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="'TODO-X-Include in choice'">
                        <!-- Item(s) :: zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid-->
                        <xsl:for-each select="zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid">
                            <xsl:call-template name="makeII.NL.AGBValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">id</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="'TODO-X-Include in choice'">
                        <!-- Item(s) :: zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id-->
                        <xsl:for-each select="zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id">
                            <xsl:call-template name="makeIIValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">id</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:for-each select="naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener">
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <!-- Template :: Naam zorgverlener -->
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900006_20091001000000"/>
                        </assignedPerson>
                    </xsl:for-each>
                </assignedEntity>
            </xsl:for-each>
        </performer>
    </xsl:template>

    <!-- ControlAct Peri Combinatietest -->
    <!--    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901076_20161216143227">
        <xsl:attribute name="moodCode">EVN</xsl:attribute>
        <effectiveTime xmlns="urn:hl7-org:v3"/>
        <subject xmlns="urn:hl7-org:v3" typeCode="SUBJ" contextConductionInd="false">
            <registrationProcess classCode="REG" moodCode="">
                <code code="900000" codeSystem="2.16.840.1.113883.2.4.15.4"/>
                <statusCode code="active"/>
                <effectiveTime>
                    <low/>
                </effectiveTime>
                <subject2>
                    <xsl:for-each select="algemene_anamnese | prenatale_controle | counseling_prenatale_screening_en_prenatale_diagnostiek | zwangerschap">
                        <CareProvisionEvent classCode="PCPR" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.2.4.6.10.90.85"/>
                            <statusCode code="active"/>
                            <xsl:for-each select="vrouw">
                                <subject typeCode="SBJ">
                                    <patient classCode="PAT">
                                        <!-\- Item(s) :: burgerservicenummer burgerservicenummer burgerservicenummer burgerservicenummer burgerservicenummer-\->
                                        <xsl:for-each select="burgerservicenummer | burgerservicenummer | burgerservicenummer | burgerservicenummer | burgerservicenummer">
                                            <xsl:call-template name="makeII.NL.BSNValue">
                                                <xsl:with-param name="xsiType" select="''"/>
                                                <xsl:with-param name="elemName">id</xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <xsl:for-each select="adres | adres | adres | adres | adres">
                                            <addr use="">
                                                <!-\- Item(s) :: postcode-\->
                                                <xsl:for-each select="postcode">
                                                    <xsl:call-template name="makeSTValue">
                                                        <xsl:with-param name="xsiType" select="''"/>
                                                        <xsl:with-param name="elemName">postalCode</xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                            </addr>
                                        </xsl:for-each>
                                        <patientPerson classCode="PSN" determinerCode="INSTANCE">
                                            <!-\- Item(s) :: voornamen achternaam naamgegevens voorvoegsel achternaam voornamen naamgegevens achternaam-\->
                                            <xsl:for-each select="voornamen | voorvoegsel | achternaam | voornamen | achternaam">
                                                <xsl:call-template name="makePNValue">
                                                    <xsl:with-param name="xsiType" select="''"/>
                                                    <xsl:with-param name="elemName">name</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                            <!-\- Item(s) :: geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum-\->
                                            <xsl:for-each select="geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum">
                                                <xsl:call-template name="makeTSValue">
                                                    <xsl:with-param name="xsiType" select="''"/>
                                                    <xsl:with-param name="elemName">birthTime</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                            <!-\- Item(s) :: etniciteit etniciteit etniciteit etniciteit etniciteit etniciteit-\->
                                            <xsl:for-each select="etniciteit | etniciteit | etniciteit | etniciteit | etniciteit | etniciteit">
                                                <xsl:call-template name="makeCEValue">
                                                    <xsl:with-param name="xsiType" select="''"/>
                                                    <xsl:with-param name="elemName">ethnicGroupCode</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                        </patientPerson>
                                    </patient>
                                </subject>
                            </xsl:for-each>
                            <xsl:for-each select="zorgverlenerzorginstelling">
                                <performer typeCode="PPRF">
                                    <xsl:for-each select="zorgverlener">
                                        <responsibleParty classCode="ASSIGNED">
                                            <xsl:if test="'TODO-X-Include in choice'">
                                                <!-\- Item(s) :: zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer-\->
                                                <xsl:for-each select="zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer">
                                                    <xsl:call-template name="makeII.NL.UZIValue">
                                                        <xsl:with-param name="xsiType" select="''"/>
                                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <xsl:if test="'TODO-X-Include in choice'">
                                                <!-\- Item(s) :: zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid-\->
                                                <xsl:for-each select="zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid">
                                                    <xsl:call-template name="makeII.NL.AGBValue">
                                                        <xsl:with-param name="xsiType" select="''"/>
                                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <xsl:if test="'TODO-X-Include in choice'">
                                                <!-\- Item(s) :: zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id-\->
                                                <xsl:for-each select="zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id">
                                                    <xsl:call-template name="makeIIValue">
                                                        <xsl:with-param name="xsiType" select="''"/>
                                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <xsl:for-each select="naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener">
                                                <agentPerson>
                                                    <!-\- Template :: Naam zorgverlener -\->
                                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900006_20091001000000"/>
                                                </agentPerson>
                                            </xsl:for-each>
                                            <xsl:for-each select="zorginstelling">
                                                <representedOrganization>
                                                    <id/>
                                                    <!-\- Item(s) :: zorgaanbieder_identificatie_nummer zorginstelling_oid-\->
                                                    <xsl:for-each select="zorgaanbieder_identificatie_nummer | zorginstelling_oid">
                                                        <xsl:call-template name="makeIIValue">
                                                            <xsl:with-param name="xsiType" select="''"/>
                                                            <xsl:with-param name="elemName">id</xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:for-each>
                                                    <xsl:if test="'TODO-X-Include in choice'">
                                                        <!-\- Item(s) :: zorginstelling_agbid zorgaanbieder_identificatie_nummer zorgaanbieder_agbid zorgaanbieder_identificatie_nummer zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid-\->
                                                        <xsl:for-each select="zorginstelling_agbid | zorgaanbieder_identificatie_nummer | zorgaanbieder_agbid | zorgaanbieder_identificatie_nummer | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorgaanbieder_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorgaanbieder_agbid">
                                                            <xsl:call-template name="makeII.NL.AGBValue">
                                                                <xsl:with-param name="xsiType" select="''"/>
                                                                <xsl:with-param name="elemName">id</xsl:with-param>
                                                            </xsl:call-template>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                    <xsl:if test="'TODO-X-Include in choice'">
                                                        <!-\- Item(s) :: zorginstelling_ura zorgaanbieder_identificatie_nummer zorgaanbieder_ura zorgaanbieder_identificatie_nummer zorginstelling_ura zorgaanbieder_ura zorginstelling_ura zorgaanbieder_ura-\->
                                                        <xsl:for-each select="zorginstelling_ura | zorgaanbieder_identificatie_nummer | zorgaanbieder_ura | zorgaanbieder_identificatie_nummer | zorginstelling_ura | zorgaanbieder_ura | zorginstelling_ura | zorgaanbieder_ura">
                                                            <xsl:call-template name="makeII.NL.URAValue">
                                                                <xsl:with-param name="xsiType" select="''"/>
                                                                <xsl:with-param name="elemName">id</xsl:with-param>
                                                            </xsl:call-template>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                    <xsl:if test="'TODO-X-Include in choice'">
                                                        <!-\- Item(s) :: ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid-\->
                                                        <xsl:for-each select="ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid">
                                                            <xsl:call-template name="makeIIValue">
                                                                <xsl:with-param name="xsiType" select="''"/>
                                                                <xsl:with-param name="elemName">id</xsl:with-param>
                                                            </xsl:call-template>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                    <!-\- Item(s) :: naam_zorgaanbieder naam_zorgaanbieder naam_zorgaanbieder naam_zorginstelling naam_zorginstelling naam_zorginstelling-\->
                                                    <xsl:for-each select="naam_zorgaanbieder | naam_zorgaanbieder | naam_zorgaanbieder | naam_zorginstelling | naam_zorginstelling | naam_zorginstelling">
                                                        <xsl:call-template name="makeONValue">
                                                            <xsl:with-param name="xsiType" select="''"/>
                                                            <xsl:with-param name="elemName">name</xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:for-each>
                                                </representedOrganization>
                                            </xsl:for-each>
                                        </responsibleParty>
                                    </xsl:for-each>
                                </performer>
                            </xsl:for-each>
                            <xsl:for-each select="anamnese | anamnese">
                                <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                    <!-\- Template :: Anamnese Combinatietest -\->
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901079_20161216000000"/>
                                </pertinentInformation3>
                            </xsl:for-each>
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <!-\- Template :: Body Height -\->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900570_20161205183214"/>
                            </pertinentInformation3>
                            <xsl:for-each select="obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap">
                                <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                    <!-\- Template :: Obstetrische anamnese Combinatietest -\->
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901081_20161216000000"/>
                                </pertinentInformation3>
                            </xsl:for-each>
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <!-\- Template :: Graviditeit -\->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900004_20161206105610"/>
                            </pertinentInformation3>
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <!-\- Template :: A terme datum (definitive) -\->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20161206110006"/>
                            </pertinentInformation3>
                            <xsl:for-each select="soort_subfertiliteitsbehandeling_groep">
                                <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                    <!-\- Template :: Subfertiliteitsbehandeling combinatietest -\->
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901083_20161216163019"/>
                                </pertinentInformation3>
                            </xsl:for-each>
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <!-\- Template :: Trisomy in History (y/n) -\->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900860_20120626000000"/>
                            </pertinentInformation3>
                            <xsl:for-each select="prenatale_controle">
                                <pertinentInformation3 contextConductionInd="true">
                                    <!-\- Template :: Prenatale controle Combinatietest -\->
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901088_20161219000000"/>
                                </pertinentInformation3>
                            </xsl:for-each>
                        </CareProvisionEvent>
                    </xsl:for-each>
                </subject2>
            </registrationProcess>
        </subject>
    </xsl:template>
-->
    <!-- Vrouw combinatietest -->
    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901077_20161216150713">
        <xsl:for-each select="vrouw">
            <subject xmlns="urn:hl7-org:v3" typeCode="SBJ">
                <patient classCode="PAT">
                    <!-\- Item(s) :: burgerservicenummer burgerservicenummer burgerservicenummer burgerservicenummer burgerservicenummer-\->
                    <xsl:for-each select="burgerservicenummer | burgerservicenummer | burgerservicenummer | burgerservicenummer | burgerservicenummer">
                        <xsl:call-template name="makeII.NL.BSNValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="adres | adres | adres | adres | adres">
                        <addr use="">
                            <!-\- Item(s) :: postcode-\->
                            <xsl:for-each select="postcode">
                                <xsl:call-template name="makeSTValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">postalCode</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </addr>
                    </xsl:for-each>
                    <patientPerson classCode="PSN" determinerCode="INSTANCE">
                        <!-\- Item(s) :: voornamen achternaam naamgegevens voorvoegsel achternaam voornamen naamgegevens achternaam-\->
                        <xsl:for-each select="voornamen | voorvoegsel | achternaam | voornamen | achternaam">
                            <xsl:call-template name="makePNValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">name</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-\- Item(s) :: geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum-\->
                        <xsl:for-each select="geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">birthTime</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-\- Item(s) :: etniciteit etniciteit etniciteit etniciteit etniciteit etniciteit-\->
                        <xsl:for-each select="etniciteit | etniciteit | etniciteit | etniciteit | etniciteit | etniciteit">
                            <xsl:call-template name="makeCEValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">ethnicGroupCode</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </patientPerson>
                </patient>
            </subject>
        </xsl:for-each>
    </xsl:template>
-->
    <!-- Zorgverlener en instelling combinatietest -->
    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901078_20161216000000">
        <xsl:for-each select="zorgverlenerzorginstelling">
            <performer xmlns="urn:hl7-org:v3" typeCode="PPRF">
                <xsl:for-each select="zorgverlener">
                    <responsibleParty classCode="ASSIGNED">
                        <xsl:if test="'TODO-X-Include in choice'">
                            <!-\- Item(s) :: zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer-\->
                            <xsl:for-each select="zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer">
                                <xsl:call-template name="makeII.NL.UZIValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">id</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="'TODO-X-Include in choice'">
                            <!-\- Item(s) :: zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid-\->
                            <xsl:for-each select="zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid">
                                <xsl:call-template name="makeII.NL.AGBValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">id</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="'TODO-X-Include in choice'">
                            <!-\- Item(s) :: zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id-\->
                            <xsl:for-each select="zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id">
                                <xsl:call-template name="makeIIValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">id</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:for-each select="naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener">
                            <agentPerson>
                                <!-\- Template :: Naam zorgverlener -\->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900006_20091001000000"/>
                            </agentPerson>
                        </xsl:for-each>
                        <xsl:for-each select="zorginstelling">
                            <representedOrganization>
                                <id/>
                                <!-\- Item(s) :: zorgaanbieder_identificatie_nummer zorginstelling_oid-\->
                                <xsl:for-each select="zorgaanbieder_identificatie_nummer | zorginstelling_oid">
                                    <xsl:call-template name="makeIIValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:if test="'TODO-X-Include in choice'">
                                    <!-\- Item(s) :: zorginstelling_agbid zorgaanbieder_identificatie_nummer zorgaanbieder_agbid zorgaanbieder_identificatie_nummer zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid-\->
                                    <xsl:for-each select="zorginstelling_agbid | zorgaanbieder_identificatie_nummer | zorgaanbieder_agbid | zorgaanbieder_identificatie_nummer | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorgaanbieder_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorgaanbieder_agbid">
                                        <xsl:call-template name="makeII.NL.AGBValue">
                                            <xsl:with-param name="xsiType" select="''"/>
                                            <xsl:with-param name="elemName">id</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="'TODO-X-Include in choice'">
                                    <!-\- Item(s) :: zorginstelling_ura zorgaanbieder_identificatie_nummer zorgaanbieder_ura zorgaanbieder_identificatie_nummer zorginstelling_ura zorgaanbieder_ura zorginstelling_ura zorgaanbieder_ura-\->
                                    <xsl:for-each select="zorginstelling_ura | zorgaanbieder_identificatie_nummer | zorgaanbieder_ura | zorgaanbieder_identificatie_nummer | zorginstelling_ura | zorgaanbieder_ura | zorginstelling_ura | zorgaanbieder_ura">
                                        <xsl:call-template name="makeII.NL.URAValue">
                                            <xsl:with-param name="xsiType" select="''"/>
                                            <xsl:with-param name="elemName">id</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="'TODO-X-Include in choice'">
                                    <!-\- Item(s) :: ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid-\->
                                    <xsl:for-each select="ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid">
                                        <xsl:call-template name="makeIIValue">
                                            <xsl:with-param name="xsiType" select="''"/>
                                            <xsl:with-param name="elemName">id</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:if>
                                <!-\- Item(s) :: naam_zorgaanbieder naam_zorgaanbieder naam_zorgaanbieder naam_zorginstelling naam_zorginstelling naam_zorginstelling-\->
                                <xsl:for-each select="naam_zorgaanbieder | naam_zorgaanbieder | naam_zorgaanbieder | naam_zorginstelling | naam_zorginstelling | naam_zorginstelling">
                                    <xsl:call-template name="makeONValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">name</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </representedOrganization>
                        </xsl:for-each>
                    </responsibleParty>
                </xsl:for-each>
            </performer>
        </xsl:for-each>
    </xsl:template>
-->
    <!-- Anamnese Combinatietest -->
    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901079_20161216000000">
        <xsl:for-each select="anamnese | anamnese">
            <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900963"/>
                <code code="417662000" codeSystem="{$oidSNOMEDCT}" displayName="Anamnese"/>
                <component typeCode="COMP">
                    <xsl:for-each select="algemene_anamnese">
                        <organizer classCode="CONTAINER" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.2.4.6.10.90.900959"/>
                            <code code="312850006" codeSystem="{$oidSNOMEDCT}" displayName="Algemene anamnese"/>
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-\- Template :: Diabetes Mellitus (y/n) -\->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900936_20161202132728"/>
                            </component>
                        </organizer>
                    </xsl:for-each>
                </component>
            </organizer>
        </xsl:for-each>
    </xsl:template>
-->
    <!-- Algemene anamnese Combinatietest -->
    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901080_20161216000000">
        <xsl:for-each select="algemene_anamnese">
            <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900959"/>
                <code code="312850006" codeSystem="{$oidSNOMEDCT}" displayName="Algemene anamnese"/>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-\- Template :: Diabetes Mellitus (y/n) -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900936_20161202132728"/>
                </component>
            </organizer>
        </xsl:for-each>
    </xsl:template>
-->
    <!-- Obstetrische anamnese Combinatietest -->
    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901081_20161216000000">
        <xsl:for-each select="obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap">
            <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900966"/>
                <code code="248983002" codeSystem="{$oidSNOMEDCT}" displayName="Obstetrische anamnese"/>
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:for-each select="eerdere_bevalling">
                        <procedure classCode="PROC" moodCode="EVN">
                            <id root="" extension=""/>
                            <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Eerdere bevalling"/>
                            <xsl:for-each select="vorige_uitkomst_per_kind | vorige_baring | kindspecifieke_gegevens_vorige_uitkomsten">
                                <outboundRelationship typeCode="COMP">
                                    <!-\- Template :: Vorige uitkomst per kind Combinatietest -\->
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901082_20161216000000"/>
                                </outboundRelationship>
                            </xsl:for-each>
                        </procedure>
                    </xsl:for-each>
                </component>
            </organizer>
        </xsl:for-each>
    </xsl:template>
-->
    <!-- Vorige uitkomst per kind Combinatietest -->
    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901082_20161216000000">
        <xsl:for-each select="vorige_uitkomst_per_kind | vorige_baring | kindspecifieke_gegevens_vorige_uitkomsten">
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900980"/>
                <id root="" extension=""/>
                <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
                <subject typeCode="SBJ">
                    <personalRelationship classCode="PRS">
                        <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                        <relationshipHolder classCode="PSN" determinerCode="INSTANCE"/>
                    </personalRelationship>
                </subject>
                <xsl:for-each select="congenitale_afwijkingenq | congenitale_afwijkingen_groep">
                    <outboundRelationship typeCode="COMP">
                        <!-\- Template :: Congenitale afwijkingen (ja nee) -\->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901015_20161206103349"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="chromosomale_afwijkingenq | specificatie_chromosomale_afwijking_groep">
                    <outboundRelationship typeCode="COMP">
                        <!-\- Template :: Chromosomale afwijkingen NoUnc -\->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901016_20161206135419"/>
                    </outboundRelationship>
                </xsl:for-each>
            </procedure>
        </xsl:for-each>
    </xsl:template>
-->
    <!-- Subfertiliteitsbehandeling combinatietest -->
    <!--  <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901083_20161216163019">
        <xsl:for-each select="soort_subfertiliteitsbehandeling_groep">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.901083"/>
                <code code="PRN3206" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
                <!-\- Item(s) :: subfertiliteitsbehandelingq-\->
                <xsl:for-each select="subfertiliteitsbehandelingq">
                    <xsl:call-template name="makeBLValue">
                        <xsl:with-param name="elemName">value</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="ovulatieinductie_toegepastq">
                    <outboundRelationship typeCode="PERT">
                        <!-\- Template :: Ovulatie-inductie toegepast -\->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900174_20161219130804"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="PERT">
                    <!-\- Template :: Geassisteerde conceptie -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900175_20161219131156"/>
                </outboundRelationship>
                <xsl:for-each select="eiceldonatie_toegepastq | eicelextractie">
                    <outboundRelationship typeCode="PERT">
                        <!-\- Template :: Eiceldonatie toegepast -\->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900180_20161219121153"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="PERT">
                    <!-\- Template :: Eicelextractiedatum -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901085_20161219000000"/>
                </outboundRelationship>
                <outboundRelationship typeCode="PERT">
                    <!-\- Template :: Cryo Embryo -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901086_20161219000000"/>
                </outboundRelationship>
                <outboundRelationship typeCode="PERT">
                    <!-\- Template :: EmbryoTransfer -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901087_20161219000000"/>
                </outboundRelationship>
            </observation>
        </xsl:for-each>
    </xsl:template>
-->
    <!-- Leeftijd eiceldonatrice -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901084_20161219120806">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901084"/>
            <code code="LftdEiDon" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: leeftijd_eiceldonatrice-->
            <xsl:for-each select="leeftijd_eiceldonatrice">
                <xsl:call-template name="makeINTValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>

    <!-- Eicelextractiedatum -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901085_20161219000000">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901085"/>
            <id nullFlavor="NI"/>
            <code code="177037000" codeSystem="{$oidSNOMEDCT}"/>
            <!-- Item(s) :: eicelextractiedatum-->
            <xsl:for-each select="eicelextractiedatum">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </procedure>
    </xsl:template>

    <!-- Cryo Embryo -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901086_20161219000000">
        <procedure classCode="PROC" moodCode="EVN" negationInd="{cryo_embryoq/(@code, @value)[1]}">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901086"/>
            <id nullFlavor="NI"/>
            <code code="236894009" codeSystem="{$oidSNOMEDCT}"/>
        </procedure>
    </xsl:template>

    <!-- EmbryoTransfer -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901087_20161219000000">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901087"/>
            <id nullFlavor="NI"/>
            <code code="75456002" codeSystem="{$oidSNOMEDCT}"/>
            <!-- Item(s) :: embryotransferdatum-->
            <xsl:for-each select="embryotransferdatum">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </procedure>
    </xsl:template>

    <!-- Prenatale controle Combinatietest -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901088_20161219000000">
        <xsl:for-each select="prenatale_controle">
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.901003"/>
                <id root="" extension=""/>
                <code code="18114009" codeSystem="{$oidSNOMEDCT}" displayName="Prenatale controle"/>
                <!-- Item(s) :: datum_controle-->
                <xsl:for-each select="datum_controle">
                    <xsl:call-template name="makeTS.DATE.MINValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Rookgedrag -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900939_20161206114703"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Body Weight -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900571_20161206115006"/>
                </outboundRelationship>
            </procedure>
        </xsl:for-each>
    </xsl:template>

    <!-- Indicatie secundaire Sectio Caesarea -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901090_20161220000000">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901090"/>
            <code code="SectioCaeInd" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Indicatie sectio"/>
            <!-- Item(s) :: indicatie_secundaire_sectio-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <!-- Zorginstelling (OID) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900022_20161202102921">
        <!-- Item(s) :: zorgaanbieder_identificatie_nummer zorginstelling_oid-->
        <xsl:for-each select="zorgaanbieder_identificatie_nummer[not(@root = '2.16.840.1.113883.2.4.6.1' or @root = '2.16.840.1.113883.2.4.3.22.96.6' or @root = '2.16.528.1.1007.3.3')] | zorginstelling_oid">
            <xsl:call-template name="makeIIValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <!-- Pariteit -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900090_20161206105825">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900090"/>
            <code code="Parturit" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Pariteit"/>
            <!-- Item(s) :: pariteit_voor_deze_zwangerschap-->
            <xsl:call-template name="makeINTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Risicostatus vóór baring -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900156_20161206130057">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900156"/>
            <code code="PRN5102" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Risicostatus vóór baring"/>
            <!-- Item(s) :: risicostatus_voor_baring-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Bloedtransfusie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900158_20161202132925">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900158"/>
            <code code="116859006" codeSystem="{$oidSNOMEDCT}" displayName="Bloedtransfusie"/>
            <!-- Item(s) ::  bloedtransfusieq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Irregulaire antistoffen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900171_20161215113718">
        <observation classCode="OBS" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr"/>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900171"/>
            <code code="312457003" codeSystem="{$oidSNOMEDCT}" displayName="Irregulaire antistoffen"/>
            <!-- Item(s) :: welke_irregulaire_antistoffen_vrouw_aanwezig-->
            <xsl:for-each select="welke_irregulaire_antistoffen_vrouw_aanwezig">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Subfertiliteitsbehandeling -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900172_20161219113303">
        <xsl:for-each select="soort_subfertiliteitsbehandeling_groep">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900172"/>
                <code code="PRN3206" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
                <!-- Item(s) :: subfertiliteitsbehandelingq-->
                <xsl:for-each select="subfertiliteitsbehandelingq">
                    <xsl:call-template name="makeBLValue">
                        <xsl:with-param name="elemName">value</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="ovulatieinductie_toegepastq">
                    <outboundRelationship typeCode="PERT">
                        <!-- Template :: Ovulatie-inductie toegepast -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900174_20161219130804"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="PERT">
                    <!-- Template :: Geassisteerde conceptie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900175_20161219131156"/>
                </outboundRelationship>
                <xsl:for-each select="eiceldonatie_toegepastq | eicelextractie">
                    <outboundRelationship typeCode="PERT">
                        <!-- Template :: Eiceldonatie toegepast -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900180_20161219121153"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="PERT">
                    <!-- Template :: Eicelextractiedatum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901085_20161219000000"/>
                </outboundRelationship>
                <outboundRelationship typeCode="PERT">
                    <!-- Template :: Cryo Embryo -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901086_20161219000000"/>
                </outboundRelationship>
                <outboundRelationship typeCode="PERT">
                    <!-- Template :: EmbryoTransfer -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901087_20161219000000"/>
                </outboundRelationship>
            </observation>
        </xsl:for-each>
    </xsl:template>
    <!-- Subfertiliteitsbehandeling -->
    <!-- Subfertiliteitsbehandeling -->
    <!-- Ovulatie-inductie toegepast -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900174_20161219130804">
        <xsl:for-each select="ovulatieinductie_toegepastq">
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900174"/>
                <id nullFlavor="NI"/>
                <code code="61285001" codeSystem="{$oidSNOMEDCT}"/>
            </procedure>
        </xsl:for-each>
    </xsl:template>
    <!-- Ovulatie-inductie toegepast -->
    <!-- Geassisteerde conceptie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900175_20161219131156">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900175"/>
            <id nullFlavor="NI"/>
            <code code="63487001" codeSystem="{$oidSNOMEDCT}"/>
            <!-- Item(s) :: geassisteerde_conceptie geassisteerde_conceptie geassisteerde_conceptie geassisteerde_conceptie geassisteerde_conceptie-->
            <xsl:for-each select="geassisteerde_conceptie | geassisteerde_conceptie | geassisteerde_conceptie | geassisteerde_conceptie | geassisteerde_conceptie">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- Geassisteerde conceptie -->
    <!-- Eiceldonatie toegepast -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900180_20161219121153">
        <xsl:for-each select="eiceldonatie_toegepastq | eicelextractie">
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900180"/>
                <id nullFlavor="NI"/>
                <code code="176843009" codeSystem="{$oidSNOMEDCT}"/>
                <outboundRelationship typeCode="PERT">
                    <!-- Template :: Geboortedatum eiceldonatrice -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900931_20161219121501"/>
                </outboundRelationship>
                <outboundRelationship typeCode="PERT">
                    <!-- Template :: Leeftijd eiceldonatrice -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901084_20161219120806"/>
                </outboundRelationship>
            </procedure>
        </xsl:for-each>
    </xsl:template>
    <!-- Eiceldonatie toegepast -->
    <!-- Eiceldonatie toegepast -->
    <!-- Hb -->
    <!-- Geboortedatum eiceldonatrice -->
    <!-- Prenatale screening aangekaart -->
    <!-- Prenatale screening aangekaart -->
    <!-- Infectieparameter HBsAg -->
    <!-- Counseling prenatale gewenst -->
    <!-- Amniotomie -->
    <!-- Fase amniotomie -->
    <!-- Gewicht vóór de zwangerschap -->
    <!-- Tijdstip begin actieve ontsluiting -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900197_20161206130607">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900197"/>
            <code code="249120008" codeSystem="{$oidSNOMEDCT}" displayName="Tijdstip begin actieve ontsluiting"/>
            <!-- Item(s) :: tijdstip_begin_actieve_ontsluiting tijdstip_begin_actieve_ontsluiting-->
            <xsl:call-template name="makeTS.DATE.MINValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Tijdstip begin actieve ontsluiting -->
    <!-- Tijdstip begin actieve ontsluiting -->
    <!-- Tijdstip breken vliezen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900198_20161206133840">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900198"/>
            <code code="289251005" codeSystem="{$oidSNOMEDCT}" displayName="Tijdstip breken vliezen"/>
            <!-- Item(s) :: tijdstip_breken_vliezen-->
            <xsl:call-template name="makeTS.DATE.MINValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Kleur vruchtwater -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900199_20161206133935">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900199"/>
            <code code="38386-9" codeSystem="{$oidLOINC}" displayName="Kleur en consistentie vruchtwater"/>
            <!-- Item(s) :: kleur_en_consistentie_vruchtwater-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Geboorte placenta -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20161206101905">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900214"/>
            <code code="AfterBirthMethod" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Geboorte placenta"/>
            <!-- Item(s) :: geboorte_placenta geboorte_placenta-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Bijstimulatie toegediend -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900217_20161206130714">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900217"/>
            <code code="PRN540201" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Bijstimulatie toegediend"/>
            <!-- Item(s) :: bijstimulatie_toegediendq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Geslacht (medische observatie) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900255_20161206133653">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900255"/>
            <code code="46098-0" codeSystem="{$oidLOINC}" displayName="Geslacht"/>
            <!-- Item(s) :: geslacht_medische_observatie-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Tijdstip actief meepersen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900261_20161206133947">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900261"/>
            <code code="PRN530401" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Tijdstip actief meepersen"/>
            <!-- Item(s) :: tijdstip_actief_meepersen-->
            <xsl:call-template name="makeTS.DATE.MINValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="xsiType">TS</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Conditie perineum postpartum -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20161206131005">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900262"/>
            <code code="364297003" codeSystem="{$oidSNOMEDCT}" displayName="Conditie perineum postpartum"/>
            <!-- Item(s) :: conditie_perineum_postpartum-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Episiotomie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900271_20161206134116">
        <xsl:for-each select="episiotomieq">
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900271"/>
                <id/>
                <code code="PRN540701" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
                <!-- Item(s) :: locatie_episiotomie locatie_episiotomie locatie_episiotomie locatie_episiotomie locatie_episiotomie locatie_episiotomie-->
                <xsl:for-each select="locatie_episiotomie | locatie_episiotomie | locatie_episiotomie | locatie_episiotomie | locatie_episiotomie | locatie_episiotomie">
                    <xsl:call-template name="makeCEValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </procedure>
        </xsl:for-each>
    </xsl:template>
    <!-- Episiotomie -->
    <!-- Locatie episiotomie -->
    <!-- Pijnbestrijding -->
    <!-- Vaginale kunstverlossing -->
    <!-- Succes vaginale kunstverlossing -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900275_20161215134619">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900275"/>
            <code code="KuVerlSucces" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Succes vaginale kunstverlossing"/>
            <!-- Item(s) :: succes_vaginale_kunstverlossingq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Succes vaginale kunstverlossing -->
    <!-- Succes vaginale kunstverlossing -->
    <!-- Indicatie vaginale kunstverlossing -->
    <!-- Section caesarea -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900277_20161206134841">
        <xsl:for-each select="sectio_caesarea_group">
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900277"/>
                <code code="11466000" codeSystem="{$oidSNOMEDCT}" displayName="Sectio Caesarea"/>
                <outboundRelationship typeCode="FLFS">
                    <!-- Template :: Beslismoment sectio caesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900278_20161215134825"/>
                </outboundRelationship>
                <outboundRelationship typeCode="RSON">
                    <!-- Template :: Indicatiesectiocaesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900279_20161215134925"/>
                </outboundRelationship>
                <outboundRelationship typeCode="RSON">
                    <!-- Template :: Indicatie secundaire Sectio Caesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901090_20161220000000"/>
                </outboundRelationship>
            </procedure>
        </xsl:for-each>
    </xsl:template>
    <!-- Section caesarea -->
    <!-- Section caesarea -->
    <!-- Beslismoment sectio caesarea -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900278_20161215134825">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900278"/>
            <code code="SectioBeslisMoment" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Beslismoment sectio caesarea"/>
            <!-- Item(s) :: beslismoment_sectio_caesarea beslismoment_sectio_caesarea-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Indicatiesectiocaesarea -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900279_20161215134925">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900279"/>
            <code code="SectioCaeInd" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Indicatie sectio caesarea"/>
            <!-- Item(s) :: indicatie_primaire_sectio-->
            <xsl:for-each select="indicatie_sectio_caesarea | indicatie_primaire_sectio">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Apgarscore na 5 min. -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20161206103247">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900294"/>
            <code code="9274-2" codeSystem="{$oidLOINC}" displayName="Apgarscore na 5 min."/>
            <!-- Item(s) :: apgarscore_na_5_min -->
            <xsl:call-template name="makeINTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Partusnummer -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900357_20161206125654">
        <act xmlns="urn:hl7-org:v3" classCode="COND" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900357"/>
            <!-- Item(s) :: zorgverlening partusnummer-->
            <xsl:call-template name="makeIIValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
            <code code="PartusNr" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Partusnummer"/>
        </act>
    </xsl:template>
    <!-- Aantal geboren kinderen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900358_20161206130005">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900358"/>
            <code code="NBorn16" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Aantal geboren kinderen"/>
            <!-- Item(s) :: aantal_geboren_kinderen-->
            <xsl:call-template name="makeINTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Ligging bij geboorte -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900359_20161206134724">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900359"/>
            <code code="LigGbrt" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
            <!-- Item(s) :: ligging_bij_geboorte-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Rangnummer kind -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900400_20161206133754">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900400"/>
            <code code="BirthOrderNumber" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Rangnummer kind"/>
            <!-- Item(s) :: rangnummer_kind-->
            <xsl:call-template name="makeINTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Geboortegewicht -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900425_20161206135217">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900425"/>
            <code code="8339-4" codeSystem="{$oidLOINC}" displayName="Geboortegewicht"/>
            <!-- Item(s) :: geboortegewicht -->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">g</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Fase perinatale sterfte -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900433_20161206135827">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900433"/>
            <code code="FasePerinataleSterfte" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Fase perinatale sterfte"/>
            <!-- Item(s) :: fase_perinatale_sterfte fase_perinatale_sterfte-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Body Height -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900570_20161205183214">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900570"/>
            <code code="3137-7" codeSystem="{$oidLOINC}"/>
            <!-- Item(s) :: lengte_gemeten-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">cm</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Body Weight -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900571_20161206115006">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900571"/>
            <code code="3141-9" codeSystem="{$oidLOINC}" displayName="Gewicht"/>
            <!-- Item(s) :: gewicht_gemeten-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">kg</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Body Weight -->
    <!-- Waarschijnlijkheid `sonomarker -->
    <!-- Overname -->
    <!-- Gewenste plaats baring vóór start baring -->
    <!-- Uitkomst per kind -->
    <!-- Voorgenomen plaats baring (tijdens zwangerschap) -->
    <!-- Voorgenomen plaats baring (tijdens zwangerschap) -->
    <!-- Labaanvraag -->
    <!-- Vrouw -->
    <!-- Zorgverlener en instelling -->
    <!-- Zorginstellingtype -->
    <!-- Zorginstelling (AGB-id) -->
    <!-- Actuele bloeddruk -->
    <!-- Vrouw (counseling) -->
    <!-- Overdracht -->
    <!-- Overdracht -->
    <!-- Consult -->
    <!-- Aanduiding hoofd- / nevenreden van overdracht aan -->
    <!-- Reden van overdracht aan (LVR en PRN) -->
    <!-- Uitkomst per kind (kort) -->
    <!-- Uitkomst per kind (kort) -->
    <!-- Uitkomst per kind (kort) -->
    <!-- Voeding kind -->
    <!-- Actuele medicatie -->
    <!-- Soort actuele Medicatie -->
    <!-- Negatieve seksuele ervaringen -->
    <!-- MRSA besmetting aangetoond? -->
    <!-- Actuele bloeddruk systolisch -->
    <!-- Actuele bloeddruk diastolisch -->
    <!-- Bloedgroep -->
    <!-- Zorgverlener en -instelling (kort) -->
    <!-- Rhesus D Factor -->
    <!-- Rhesus D Factor -->
    <!-- Acute Overdracht gewenste uitvoerder -->
    <!-- Rhesus c Factor -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900683_20160721130438">
        <observation classCode="OBS" moodCode="EVN">
            <code code="1159-3" codeSystem="{$oidLOINC}" displayName="Rhesus c Factor" codeSystemName=""/>
            <effectiveTime/>
            <!-- Item(s) :: rhesus_c_factor rhesus_c_factor rhesus_c_factor rhesus_c_factor-->
            <xsl:for-each select="rhesus_c_factor | rhesus_c_factor | rhesus_c_factor | rhesus_c_factor">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Rhesus c Factor -->
    <!-- Rhesus C Factor -->
    <!-- Zorgverlener (UZI-nummer) -->
    <!-- Zorgverlener (AGB-ID) -->
    <!-- Zorgverlener (LVR1-ID) -->
    <!-- Indicatie interventie begin baring -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900705_20161215162545">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900705"/>
            <code code="PRN520103" codeSystem="2.16.840.1.113883.2.4.3.22.1.1"/>
            <!-- Item(s) :: indicatie_interventie_begin_baring indicatie_interventie_begin_baring indicatie_interventie_begin_baring indicatie_interventie_begin_baring-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Indicatie interventie begin baring -->
    <!-- Indicatie interventie begin baring -->
    <!-- Datum betrokkenheid andere zorgverlener -->
    <!-- Labonderzoek Navelstrengbloed -->
    <!-- Reden van consult aan (LVR en PRN) -->
    <!-- Vrouw (2.0 versie) -->
    <!-- Ziekten en bijzonderheden vrouw in de algemene anamnese (2.0) -->
    <!-- Bijzonderheden obstetrische anamnese (2.0) -->
    <!-- A terme datum (2.0) -->
    <!-- A terme datum (2.0) -->
    <!-- A terme datum (2.0) -->
    <!-- Subfertiliteitsbehandeling (2.0) -->
    <!-- Proteïnurie (2.0) -->
    <!-- Wijze waarop de baring begon -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900715_20161206130300">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900715"/>
            <code code="BeginDeliv" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: wijze_waarop_de_baring_begon wijze_waarop_de_baring_begon-->
            <xsl:for-each select="wijze_waarop_de_baring_begon | wijze_waarop_de_baring_begon">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="interventies_begin_baring_groep | interventies_begin_baring">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Interventie begin baring -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900726_20161215133633"/>
                </outboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Medicatie nageboortetijdperk -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900716_20161206130815">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900716"/>
            <code code="Medic3stage" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Medicatie nageboortetijdperk"/>
            <!-- Item(s) :: medicatie_nageboortetijdperkq-->
            <xsl:for-each select="medicatie_nageboortetijdperkq">
                <xsl:call-template name="makeBLValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="soort_medicatie_nageboortetijdperk">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Soort medicatie nageboortetijdperk -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900525_20141107174304"/>
                </outboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Voeding kind -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900724_20161206135654">
        <supply xmlns="urn:hl7-org:v3" classCode="DIET" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900724"/>
            <id nullFlavor="NI"/>
            <code code="230126006" codeSystem="{$oidSNOMEDCT}"/>
            <xsl:for-each select="voeding_kind_datum">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="substantie_voeding_kind">
                <product typeCode="PRD">
                    <product classCode="ACCESS">
                        <playingMaterial classCode="MAT" determinerCode="KIND">
                            <!-- Item(s) :: substantie_voeding_kind substantie_voeding_kind-->
                            <xsl:call-template name="makeCEValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">code</xsl:with-param>
                            </xsl:call-template>
                        </playingMaterial>
                    </product>
                </product>
            </xsl:for-each>
        </supply>
    </xsl:template>
    <!-- Interventie begin baring -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900726_20161215133633">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900726"/>
            <id nullFlavor="NI"/>
            <code code="PRN520102" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Interventie begin baring"/>
            <xsl:for-each select="interventie_begin_baring">
                <!-- Item(s) :: interventie_begin_baring -->
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="indicatie_interventie_begin_baring">
                <outboundRelationship typeCode="RSON">
                    <!-- Template :: Indicatie interventie begin baring -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900705_20161215162545"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- Type partus -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20161206134639">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900861"/>
            <code code="364336006" codeSystem="{$oidSNOMEDCT}"/>
            <!-- Item(s) :: type_partus type_partus-->
            <xsl:for-each select="type_partus">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Type partus 2.3.2 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20161206102913">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900861"/>
            <code code="364336006" codeSystem="{$oidSNOMEDCT}"/>
            <!-- Item(s) :: type_partus -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Overige interventies -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900893_20161206135049">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900893"/>
            <code code="Interv" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Overige interventies"/>
            <!-- Item(s) :: overige_interventies-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Overige interventies -->
    <!-- Overige interventies -->
    <!-- Uitkomst per kind (subject) PRN  -->
    <!-- Perinatale periode van verwijzing -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900895_20161203165258">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900895"/>
            <code code="PRN210603" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Perinatale periode van verwijzing"/>
            <!-- Item(s) :: perinatale_periode-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Perinatale periode van overdracht -->
    <!-- Perinatale periode van consult -->
    <!-- Ziekten en bijzonderheden vrouw in de algemene anamnese (2.1) -->
    <!-- Ontsluitingsduur -->
    <!-- Uitdrijvingsduur -->
    <!-- Hoeveelheid bloedverlies 2 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20161206102207">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900900"/>
            <code code="364332008" codeSystem="{$oidSNOMEDCT}" displayName="Hoeveelheid bloedverlies"/>
            <!-- Item(s) ::  hoeveelheid_bloedverlies hoeveelheid_bloedverlies_tot_acute_overdracht-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">ml</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Hoeveelheid bloedverlies 2 -->
    <!-- Vorige uitkomst per kind (kort) -->
    <!-- Percentiel geboortegewicht -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900902_20161206103023">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900902"/>
            <code code="301334000" codeSystem="{$oidSNOMEDCT}" displayName="Percentiel geboortegewicht"/>
            <!-- Item(s) :: percentiel_van_het_geboortegewicht-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Intra-uteriene vruchtdood -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20161202160924">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900918"/>
            <code code="59291004" codeSystem="{$oidSNOMEDCT}" displayName="Intra-uteriene vruchtdood"/>
            <uncertaintyCode code="U" codeSystem="2.16.840.1.113883.5.1053"/>
            <!-- Item(s) :: vermoeden_intrauteriene_vruchtdoodq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Vrouw screening -->
    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900923_20161219104507">
        <xsl:for-each select="vrouw">
            <subject xmlns="urn:hl7-org:v3" typeCode="SBJ">
                <patient classCode="PAT">
                    <!-\- Item(s) :: burgerservicenummer burgerservicenummer burgerservicenummer burgerservicenummer burgerservicenummer-\->
                    <xsl:for-each select="burgerservicenummer | burgerservicenummer | burgerservicenummer | burgerservicenummer | burgerservicenummer">
                        <xsl:call-template name="makeII.NL.BSNValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="adres | adres | adres | adres | adres">
                        <addr use="">
                            <!-\- Item(s) :: postcode-\->
                            <xsl:for-each select="postcode">
                                <xsl:call-template name="makeSTValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">postalCode</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </addr>
                    </xsl:for-each>
                    <patientPerson classCode="PSN" determinerCode="INSTANCE">
                        <!-\- Item(s) :: voornamen achternaam naamgegevens voorvoegsel achternaam voornamen naamgegevens achternaam-\->
                        <xsl:for-each select="voornamen | voorvoegsel | achternaam | voornamen | achternaam">
                            <xsl:call-template name="makePNValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">name</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-\- Item(s) :: geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum-\->
                        <xsl:for-each select="geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">birthTime</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-\- Item(s) :: etniciteit etniciteit etniciteit etniciteit etniciteit etniciteit-\->
                        <xsl:for-each select="etniciteit | etniciteit | etniciteit | etniciteit | etniciteit | etniciteit">
                            <xsl:call-template name="makeCEValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">ethnicGroupCode</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </patientPerson>
                </patient>
            </subject>
        </xsl:for-each>
    </xsl:template>
  -->
    <!-- Zorgverlener en instelling (zonder type) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900926_20161216151433">
        <xsl:for-each select="zorgverlenerzorginstelling">
            <performer xmlns="urn:hl7-org:v3" typeCode="PPRF">
                <xsl:for-each select="zorgverlener">
                    <responsibleParty classCode="ASSIGNED">
                        <xsl:if test="'TODO-X-Include in choice'">
                            <!-- Item(s) :: zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer-->
                            <xsl:for-each select="zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer">
                                <xsl:call-template name="makeII.NL.UZIValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">id</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="'TODO-X-Include in choice'">
                            <!-- Item(s) :: zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid-->
                            <xsl:for-each select="zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid">
                                <xsl:call-template name="makeII.NL.AGBValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">id</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="'TODO-X-Include in choice'">
                            <!-- Item(s) :: zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id-->
                            <xsl:for-each select="zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id">
                                <xsl:call-template name="makeIIValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">id</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:for-each select="naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener">
                            <agentPerson>
                                <!-- Template :: Naam zorgverlener -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900006_20091001000000"/>
                            </agentPerson>
                        </xsl:for-each>
                        <xsl:for-each select="zorginstelling">
                            <representedOrganization>
                                <id/>
                                <xsl:if test="'TODO-X-Include in choice'">
                                    <!-- Item(s) :: zorginstelling_agbid zorgaanbieder_identificatie_nummer zorgaanbieder_agbid zorgaanbieder_identificatie_nummer zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorginstelling_agbid zorgaanbieder_agbid-->
                                    <xsl:for-each select="zorginstelling_agbid | zorgaanbieder_identificatie_nummer | zorgaanbieder_agbid | zorgaanbieder_identificatie_nummer | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorgaanbieder_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorginstelling_agbid | zorgaanbieder_agbid">
                                        <xsl:call-template name="makeII.NL.AGBValue">
                                            <xsl:with-param name="xsiType" select="''"/>
                                            <xsl:with-param name="elemName">id</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="'TODO-X-Include in choice'">
                                    <!-- Item(s) :: zorginstelling_ura zorgaanbieder_identificatie_nummer zorgaanbieder_ura zorgaanbieder_identificatie_nummer zorginstelling_ura zorgaanbieder_ura zorginstelling_ura zorgaanbieder_ura-->
                                    <xsl:for-each select="zorginstelling_ura | zorgaanbieder_identificatie_nummer | zorgaanbieder_ura | zorgaanbieder_identificatie_nummer | zorginstelling_ura | zorgaanbieder_ura | zorginstelling_ura | zorgaanbieder_ura">
                                        <xsl:call-template name="makeII.NL.URAValue">
                                            <xsl:with-param name="xsiType" select="''"/>
                                            <xsl:with-param name="elemName">id</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="'TODO-X-Include in choice'">
                                    <!-- Item(s) :: ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid-->
                                    <xsl:for-each select="ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid">
                                        <xsl:call-template name="makeIIValue">
                                            <xsl:with-param name="xsiType" select="''"/>
                                            <xsl:with-param name="elemName">id</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:if>
                                <!-- Item(s) :: naam_zorgaanbieder naam_zorgaanbieder naam_zorgaanbieder naam_zorginstelling naam_zorginstelling naam_zorginstelling-->
                                <xsl:for-each select="naam_zorgaanbieder | naam_zorgaanbieder | naam_zorgaanbieder | naam_zorginstelling | naam_zorginstelling | naam_zorginstelling">
                                    <xsl:call-template name="makeONValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">name</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </representedOrganization>
                        </xsl:for-each>
                    </responsibleParty>
                </xsl:for-each>
            </performer>
        </xsl:for-each>
    </xsl:template>
    <!-- A terme datum (definitive) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20161206110006">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900928"/>
            <code code="EDDDef" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="A terme datum (definitive)"/>
            <!-- Item(s) :: definitieve_a_terme_datum-->
            <xsl:call-template name="makeTS.DATE.MINValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Geboortedatum eiceldonatrice -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900931_20161219121501">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900931"/>
            <code code="GebDatEiDon" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: geboortedatum_eiceldonatrice-->
            <xsl:for-each select="geboortedatum_eiceldonatrice">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                    <xsl:with-param name="xsiType">TS</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Geboortedatum eiceldonatrice observed -->
    <!-- Counseling prenatale screening combinatietest -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900932_20161216115420">
        <xsl:for-each select="counseling_combinatietest">
            <encounter xmlns="urn:hl7-org:v3" classCode="ENC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900932"/>
                <id nullFlavor="NI"/>
                <code code="1" codeSystem="2.16.840.1.113883.2.4.4.13.31" displayName="combinatietest"/>
                <!-- Item(s) :: datum_counseling datum_counseling datum_counseling datum_counseling datum_counseling datum_counseling datum_counseling-->
                <xsl:for-each select="datum_counseling | datum_counseling | datum_counseling | datum_counseling | datum_counseling | datum_counseling | datum_counseling">
                    <xsl:call-template name="makeTSValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <performer typeCode="PRF">
                    <xsl:for-each select="zorgverlener">
                        <assignedEntity classCode="ASSIGNED">
                            <xsl:if test="'TODO-X-Include in choice'">
                                <!-- Item(s) :: zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer-->
                                <xsl:for-each select="zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer">
                                    <xsl:call-template name="makeII.NL.UZIValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="'TODO-X-Include in choice'">
                                <!-- Item(s) :: zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid-->
                                <xsl:for-each select="zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid">
                                    <xsl:call-template name="makeII.NL.AGBValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="'TODO-X-Include in choice'">
                                <!-- Item(s) :: zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id-->
                                <xsl:for-each select="zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id">
                                    <xsl:call-template name="makeIIValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:for-each select="naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener">
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!-- Template :: Naam zorgverlener -->
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900006_20091001000000"/>
                                </assignedPerson>
                            </xsl:for-each>
                        </assignedEntity>
                    </xsl:for-each>
                </performer>
                <xsl:for-each select="direct_ipd_gewenstq | direct_ipd_gewenstq">
                    <outboundRelationship typeCode="PERT">
                        <!-- Template :: Direct IPD gewenst -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900231_20140611000000"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="combinatietest_gewenstq | combinatietest_gewenstq">
                    <outboundRelationship typeCode="PERT">
                        <!-- Template :: Combinatietest gewenst -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900232_20140611000000"/>
                    </outboundRelationship>
                </xsl:for-each>
            </encounter>
        </xsl:for-each>
    </xsl:template>
    <!-- Counseling prenatale screening combinatietest -->
    <!-- Counseling prenatale screening combinatietest -->
    <!-- Counseling prenatale screening SEO -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900933_20161216115807">
        <xsl:for-each select="counseling_seo | counseling_seo">
            <encounter xmlns="urn:hl7-org:v3" classCode="ENC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900933"/>
                <id nullFlavor="NI"/>
                <code code="2" codeSystem="2.16.840.1.113883.2.4.4.13.31" displayName="SEO"/>
                <!-- Item(s) :: datum_counseling datum_counseling datum_counseling datum_counseling datum_counseling datum_counseling datum_counseling-->
                <xsl:for-each select="datum_counseling | datum_counseling | datum_counseling | datum_counseling | datum_counseling | datum_counseling | datum_counseling">
                    <xsl:call-template name="makeTSValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <performer typeCode="PRF">
                    <xsl:for-each select="zorgverlener">
                        <assignedEntity classCode="ASSIGNED">
                            <xsl:if test="'TODO-X-Include in choice'">
                                <!-- Item(s) :: zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer zorgverlener_uzinummer-->
                                <xsl:for-each select="zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer | zorgverlener_uzinummer">
                                    <xsl:call-template name="makeII.NL.UZIValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="'TODO-X-Include in choice'">
                                <!-- Item(s) :: zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid zorgverlener_agbid-->
                                <xsl:for-each select="zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid | zorgverlener_agbid">
                                    <xsl:call-template name="makeII.NL.AGBValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="'TODO-X-Include in choice'">
                                <!-- Item(s) :: zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id zorgverlener_lvr1id-->
                                <xsl:for-each select="zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id | zorgverlener_lvr1id">
                                    <xsl:call-template name="makeIIValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:for-each select="naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener | naam_zorgverlener">
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!-- Template :: Naam zorgverlener -->
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900006_20091001000000"/>
                                </assignedPerson>
                            </xsl:for-each>
                        </assignedEntity>
                    </xsl:for-each>
                </performer>
                <xsl:for-each select="direct_guo_gewenstq | direct_guo_gewenstq | direct_guo_gewenstq | direct_guo_gewenstq | direct_guo_gewenstq">
                    <outboundRelationship typeCode="PERT">
                        <!-- Template :: Direct GUO gewenst -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900235_20140611000000"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="seo_gewenstq | seo_gewenstq">
                    <outboundRelationship typeCode="PERT">
                        <!-- Template :: SEO gewenst -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900234_20140611000000"/>
                    </outboundRelationship>
                </xsl:for-each>
            </encounter>
        </xsl:for-each>
    </xsl:template>
    <!-- Diabetes Mellitus (y/n) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900936_20161202132728">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900936"/>
            <code code="73211009" codeSystem="{$oidSNOMEDCT}" displayName="Diabetes Mellitus (y/n)"/>
            <!-- Item(s) :: diabetes_mellitusq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Rookgedrag -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900939_20161206114703">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900939"/>
            <code code="Rookgedrag" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Rookgedrag"/>
            <!-- Item(s) :: rookgedrag-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Auto-immuun aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900944_20161202113937">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900944"/>
            <code code="85828009" codeSystem="{$oidSNOMEDCT}" displayName="Auto-immuun aandoening"/>
            <!-- Item(s) :: autoimmuun_aandoening -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Cardiovasculaire aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900945_20161202114347">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900945"/>
            <code code="49601007" codeSystem="{$oidSNOMEDCT}" displayName="Cardiovasculaire aandoening"/>
            <!-- Item(s) :: cardiovasculaire_aandoening -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Urogenitale aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900946_20161202114612">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900946"/>
            <code code="42030000" codeSystem="{$oidSNOMEDCT}" displayName="Urogenitale aandoening"/>
            <!-- Item(s) :: urogenitale_aandoening-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Schildklier aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900947_20161202115136">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900947"/>
            <code code="14304000" codeSystem="{$oidSNOMEDCT}" displayName="Schildklier aandoening"/>
            <!-- Item(s) :: schildklier_aandoening-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Oncologische aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900948_20161202114951">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900948"/>
            <code code="363346000" codeSystem="{$oidSNOMEDCT}" displayName="Oncologische aandoening"/>
            <!-- Item(s) :: oncologische_aandoening-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Neurologische aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900949_20161202115419">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900949"/>
            <code code="118940003" codeSystem="{$oidSNOMEDCT}" displayName="Neurologische aandoening"/>
            <!-- Item(s) :: neurologische_aandoening-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Infectieziekte -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900950"/>
            <code code="40733004" codeSystem="{$oidSNOMEDCT}" displayName="Infectieziekte"/>
            <!-- Item(s) :: infectieziekte -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Infectieziekte -->
    <!-- MDL aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900951_20161202115814">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900951"/>
            <code code="53619000" codeSystem="{$oidSNOMEDCT}" displayName="MDL aandoening"/>
            <!-- Item(s) ::  mdl_aandoening-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Anemie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900952_20161202115941">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900952"/>
            <code code="271737000" codeSystem="{$oidSNOMEDCT}" displayName="Anemie"/>
            <!-- Item(s) :: anemie-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Longaandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900953_20161202120109">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900953"/>
            <code code="50043002" codeSystem="{$oidSNOMEDCT}" displayName="Longaandoening"/>
            <!-- Item(s) ::  longaandoening-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Longaandoening -->

    <!-- Orthopedische afwijking -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900955_20161202123811">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900955"/>
            <code code="928000" codeSystem="{$oidSNOMEDCT}" displayName="Orthopedische afwijking"/>
            <!-- Item(s) ::  orthopedische_afwijking-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Type operatie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900956_20161202124735">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900956"/>
            <code code="387713003" codeSystem="{$oidSNOMEDCT}" displayName="Type operatie"/>
            <!-- Item(s) :: type_operatie -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Type stollingsprobleem -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900957_20161202124918">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900957"/>
            <code code="64779008" codeSystem="{$oidSNOMEDCT}" displayName="Type stollingsprobleem"/>
            <!-- Item(s) :: type_stollingsprobleem -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Onder behandeling (geweest)? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900958_20161215115649">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900958"/>
            <code code="OnderBehandeling" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Onder behandeling (geweest)?"/>
            <!-- Item(s) :: onder_behandeling_geweestq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Algemene anamnese Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900959_20161205180704">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900959"/>
            <code code="312850006" codeSystem="{$oidSNOMEDCT}" displayName="Algemene anamnese"/>
            <xsl:for-each select="autoimmuun_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Auto-immuun aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900944_20161202113937"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cardiovasculaire_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Cardiovasculaire aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900945_20161202114347"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="urogenitale_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Urogenitale aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900946_20161202114612"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="oncologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Oncologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900948_20161202114951"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="schildklier_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Schildklier aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900947_20161202115136"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diabetes_mellitusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diabetes Mellitus (y/n) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900936_20161202132728"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="neurologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Neurologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900949_20161202115419"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="infectieziekte">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Infectieziekte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="mdl_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: MDL aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900951_20161202115814"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="anemie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Anemie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900952_20161202115941"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="longaandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Longaandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900953_20161202120109"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="gynaecologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Gynaecologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="orthopedische_afwijking">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Orthopedische afwijking -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900955_20161202123811"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bloedtransfusieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bloedtransfusie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900158_20161202132925"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="transfusiereactieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Transfusiereactie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901024_20161202133114"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="type_operatie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Type operatie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900956_20161202124735"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="type_stollingsprobleem">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Type stollingsprobleem -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900957_20161202124918"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="psychiatrieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PsychiatriePRN -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901026_20161202133709"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="overige_aandoeningq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Overige aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900960_20161202134046"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Overige aandoening -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900960_20161202134046">
        <xsl:call-template name="observationQ">
            <xsl:with-param name="observation_templateId" select="'2.16.840.1.113883.2.4.6.10.90.900960'"/>
            <xsl:with-param name="observation_code" select="'OverigeAandoeningenAnamnese'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.2.4.4.13'"/>
            <xsl:with-param name="observation_displayName" select="'Overige aandoeningen algemene anamnese'"/>
            <xsl:with-param name="observation_text" select="../overige_aandoening"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Anamnese Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900963_20161205180216">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900963"/>
            <code code="417662000" codeSystem="{$oidSNOMEDCT}" displayName="Anamnese"/>
            <xsl:for-each select="onder_behandeling_geweestq">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900958_20161215115649"/>
                </component>
            </xsl:for-each>
            <component typeCode="COMP">
                <xsl:for-each select="algemene_anamnese">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900959_20161205180704"/>
                </xsl:for-each>
            </component>
        </organizer>
    </xsl:template>
    <!-- Anamnese PRN -->
    <!-- Type vrouwelijke genitale verminking -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900964_20161205183736">
        <xsl:call-template name="question_observation">
            <xsl:with-param name="parent_element_name">pertinentInformation3</xsl:with-param>
            <xsl:with-param name="question" select="./vrouwelijke_genitale_verminkingq"/>
            <xsl:with-param name="observation" select="./type_vrouwelijke_genitale_verminking"/>
            <xsl:with-param name="templateId">2.16.840.1.113883.2.4.6.10.90.900964</xsl:with-param>
            <xsl:with-param name="observation_code">95041000119101</xsl:with-param>
            <xsl:with-param name="observation_codeSystem">2.16.840.1.113883.6.96</xsl:with-param>
            <xsl:with-param name="observation_displayName">Vrouwelijke genitale verminking</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <!-- Obstetrische anamnese Kernset 2.3.2 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900966_20161205184122">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900966"/>
            <code code="248983002" codeSystem="{$oidSNOMEDCT}" displayName="Obstetrische anamnese"/>
            <xsl:for-each select="wijze_einde_zwangerschap">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Wijze einde zwangerschap -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20161206094326"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="definitieve_a_terme_datum">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: A terme datum (definitive) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20161206110006"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diagnose">
                <component typeCode="COMP" contextConductionInd="true">
                    <organizer classCode="CONTAINER" moodCode="EVN">
                        <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Diagnose"/>
                        <xsl:for-each select="gynaecologische_aandoening">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Gynaecologische aandoening -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="bloedverliesq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Bloedverlies? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="cervixinsufficientieq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Cervixinsufficiëntie? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="infectie">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Infectie -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="hyperemesis_gravidarumq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Hyperemesis gravidarum? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="hypertensieve_aandoening">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Hypertensieve aandoening -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="zwangerschapscholestaseq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Zwangerschapscholestase? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="diabetes_gravidarum_met_insulineq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Diabetes gravidarum met insuline? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="afwijkende_groei_foetus">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Afwijkende groei foetus -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="dreigende_partus_immaturusq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Dreigende partus immaturus? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="dreigende_partus_prematurusq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Dreigende partus prematurus? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="abruptio_placentaeq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Abruptio placentae? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                            </component>
                        </xsl:for-each>
                    </organizer>
                </component>
            </xsl:for-each>
            <xsl:for-each select=".[irregulaire_antistoffenq]">
                <!-- Template :: Irregulaire antistoffen ja/nee -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900993_20161206101240">
                    <xsl:with-param name="parentElementName">component</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="eerdere_bevalling">
                <component typeCode="COMP" contextConductionInd="true">
                    <procedure classCode="PROC" moodCode="EVN">
                        <id nullFlavor="NI"/>
                        <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Bevalling"/>
                        <xsl:for-each select="placenta/geboorte_placenta">
                            <outboundRelationship typeCode="COMP">
                                <!-- Template :: Geboorte placenta -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20161206101905"/>
                            </outboundRelationship>
                        </xsl:for-each>
                        <xsl:for-each select="hoeveelheid_bloedverlies">
                            <outboundRelationship typeCode="COMP">
                                <!-- Template :: Hoeveelheid bloedverlies 2 -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20161206102207"/>
                            </outboundRelationship>
                        </xsl:for-each>
                        <xsl:for-each select="vorige_uitkomst_per_kind/vorige_baring">
                            <outboundRelationship typeCode="COMP">
                                <!-- Template :: Vorige uitkomst per kind Kernset PRN -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900980_20161206102606"/>
                            </outboundRelationship>
                        </xsl:for-each>
                    </procedure>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Intra-uteriene vruchtdood en methode -->
    <!-- TODO -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901091_20180220155029">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901091"/>
            <code code="59291004" codeSystem="{$oidSNOMEDCT}" displayName="Intrauteriene vruchtdood"/>
            <uncertaintyCode code="U" codeSystem="2.16.840.1.113883.5.1053"/>
            <!-- Item(s) :: vermoeden_intrauteriene_vruchtdoodq-->
            <xsl:for-each select="./vermoeden_intrauteriene_vruchtdoodq">
                <xsl:call-template name="makeBLValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="./vermoeden_iuvd_op_basis_van">
                <outboundRelationship typeCode="PERT">
                    <procedure classCode="PROC" moodCode="EVN">
                        <id nullFlavor="NI"/>
                        <xsl:call-template name="makeCEValue">
                            <xsl:with-param name="elemName">code</xsl:with-param>
                        </xsl:call-template>
                    </procedure>
                </outboundRelationship>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Diagnose deze zwangerschap Kernset 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901092_20180220162421">
        <organizer classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901092"/>
            <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
            <xsl:for-each select="./datum">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
            <!-- Zwangerschapsduur -->
            <xsl:for-each select="./zwangerschapsduur">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20161206114409"/>
                </component>
            </xsl:for-each>
            <!-- Gynaecologische aandoening -->
            <xsl:for-each select="gynaecologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
            </xsl:for-each>
            <!-- Bloedverlies? -->
            <xsl:for-each select="./bloedverliesq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                </component>
            </xsl:for-each>
            <!-- Partiële mola -->
            <xsl:for-each select="./partiele_molaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20161202142628"/>
                </component>
            </xsl:for-each>
            <!-- Cervixinsufficiëntie -->
            <xsl:for-each select="./cervixinsufficientieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                </component>
            </xsl:for-each>
            <!-- Infectie -->
            <xsl:for-each select="./infectie">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900975_20161202144326"/>
                </component>
            </xsl:for-each>
            <!-- Hyperemesis gravidarum?  -->
            <xsl:for-each select="./hyperemesis_gravidarumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                </component>
            </xsl:for-each>
            <!-- Hypertensieve aandoening -->
            <xsl:for-each select="hypertensieve_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                </component>
            </xsl:for-each>
            <!-- Zwangerschapscholestase? -->
            <xsl:for-each select="./zwangerschapscholestaseq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                </component>
            </xsl:for-each>
            <!-- Diabetes gravidarum met insuline? -->
            <xsl:for-each select="./diabetes_gravidarum_met_insulineq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                </component>
            </xsl:for-each>
            <!-- afwijkende_groei_foetus -->
            <xsl:for-each select="afwijkende_groei_foetus">
                <component typeCode="COMP" contextConductionInd="false">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                </component>
            </xsl:for-each>
            <!-- Dreigende partus immaturus? -->
            <xsl:for-each select="./dreigende_partus_immaturusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                </component>
            </xsl:for-each>
            <!-- Dreigende partus prematurus? -->
            <xsl:for-each select="./dreigende_partus_prematurusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                </component>
            </xsl:for-each>
            <!-- Abruptio placentae?  -->
            <xsl:for-each select="./abruptio_placentaeq">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="navelstrengprolapsq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Navelstrengprolaps -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901052_20161202154625"/>
                </component>
            </xsl:for-each>
            <!-- TODO Liggingsafwijking -->
            <xsl:for-each select="liggingsafwijking">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Liggingsafwijking -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901053_20161202154917"/>
                </component>
            </xsl:for-each>
            <!-- Intra-uteriene vruchtdood en methode -->
            <xsl:for-each select="intrauteriene_vruchtdood[vermoeden_intrauteriene_vruchtdoodq]">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Intra-uteriene vruchtdood en methode -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901091_20180220155029"/>
                </component>
            </xsl:for-each>

        </organizer>
    </xsl:template>
    <!-- Obstetrische anamnese Kernset 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901095_20180221112313">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901095"/>
            <code code="248983002" codeSystem="{$oidSNOMEDCT}" displayName="Obstetrische anamnese"/>
            <xsl:for-each select="wijze_einde_zwangerschap">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Wijze einde zwangerschap -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20161206094326"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="definitieve_a_terme_datum">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: A terme datum (definitive) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20161206110006"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diagnose">
                <component typeCode="COMP" contextConductionInd="true">
                    <organizer classCode="CONTAINER" moodCode="EVN">
                        <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Diagnose"/>
                        <xsl:for-each select="gynaecologische_aandoening">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Gynaecologische aandoening -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="bloedverliesq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Bloedverlies? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="cervixinsufficientieq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Cervixinsufficiëntie? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="infectie">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Infectie -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900975_20161202144326"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="hyperemesis_gravidarumq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Hyperemesis gravidarum? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="hypertensieve_aandoening">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Hypertensieve aandoening -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="zwangerschapscholestaseq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Zwangerschapscholestase? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="diabetes_gravidarum_met_insulineq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Diabetes gravidarum met insuline? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="afwijkende_groei_foetus">
                            <component typeCode="COMP" contextConductionInd="false">
                                <!-- Template :: Afwijkende groei foetus -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="dreigende_partus_immaturusq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Dreigende partus immaturus? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="dreigende_partus_prematurusq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Dreigende partus prematurus? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="abruptio_placentaeq">
                            <component typeCode="COMP" contextConductionInd="true">
                                <!-- Template :: Abruptio placentae? -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                            </component>
                        </xsl:for-each>
                    </organizer>
                </component>
            </xsl:for-each>
            <xsl:for-each select=".[irregulaire_antistoffenq]">
                <!-- Template :: Irregulaire antistoffen ja/nee -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900993_20161206101240">
                    <xsl:with-param name="parentElementName">component</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="eerdere_bevalling">
                <component typeCode="COMP" contextConductionInd="true">
                    <procedure classCode="PROC" moodCode="EVN">
                        <id nullFlavor="NI"/>
                        <code code="236973005" codeSystem="{$oidSNOMEDCT}" displayName="Bevalling"/>
                        <xsl:for-each select="placenta/geboorte_placenta">
                            <outboundRelationship typeCode="COMP">
                                <!-- Template :: Geboorte placenta -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20161206101905"/>
                            </outboundRelationship>
                        </xsl:for-each>
                        <xsl:for-each select="hoeveelheid_bloedverlies">
                            <outboundRelationship typeCode="COMP">
                                <!-- Template :: Hoeveelheid bloedverlies 2 -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20161206102207"/>
                            </outboundRelationship>
                        </xsl:for-each>
                        <xsl:for-each select="vorige_uitkomst_per_kind/vorige_baring">
                            <outboundRelationship typeCode="COMP">
                                <!-- Template :: Vorige uitkomst per kind Kernset PRN -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901108_20180228174957"/>
                            </outboundRelationship>
                        </xsl:for-each>
                    </procedure>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>

    <!-- Bloedverlies? -->


    <!-- Vorige uitkomst per kind Kernset PRN 2.3.2  -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900980_20161206102606">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900980"/>
            <id nullFlavor="NI"/>
            <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Baring"/>
            <xsl:for-each select="demografische_gegevens">
                <subject typeCode="SBJ">
                    <personalRelationship classCode="PRS">
                        <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                        <relationshipHolder classCode="PSN" determinerCode="INSTANCE">
                            <!-- Item(s) :: geboortedatum -->
                            <xsl:for-each select="geboortedatum">
                                <xsl:call-template name="makeTS.DATE.MINValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">birthTime</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </relationshipHolder>
                    </personalRelationship>
                </subject>
            </xsl:for-each>
            <xsl:for-each select="kindspecifieke_gegevens_vorige_uitkomsten">
                <xsl:for-each select="type_partus">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Type partus -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20161206102913"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="percentiel_van_het_geboortegewicht">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Percentiel geboortegewicht -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900902_20161206103023"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="apgarscore_na_5_min">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Apgarscore na 5 min. -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20161206103247"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="congenitale_afwijkingenq | congenitale_afwijkingen_groep">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Congenitale afwijkingen (ja nee) -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901015_20161206103349"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="chromosomale_afwijkingenq">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Chromosomale afwijkingen (ja nee) -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900981_20161206103540"/>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- Type partus 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901107_20180228162810">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901107"/>
            <code code="364336006" codeSystem="{$oidSNOMEDCT}" displayName="Type partus"/>
            <!-- Item(s) :: type_partus -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Vorige uitkomst per kind Kernset PRN 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901108_20180228174957">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901108"/>
            <id nullFlavor="NI"/>
            <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Baring"/>
            <xsl:for-each select="demografische_gegevens">
                <subject typeCode="SBJ">
                    <personalRelationship classCode="PRS">
                        <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                        <relationshipHolder classCode="PSN" determinerCode="INSTANCE">
                            <!-- Item(s) :: geboortedatum -->
                            <xsl:for-each select="geboortedatum">
                                <xsl:call-template name="makeTS.DATE.MINValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">birthTime</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </relationshipHolder>
                    </personalRelationship>
                </subject>
            </xsl:for-each>
            <xsl:for-each select="kindspecifieke_gegevens_vorige_uitkomsten">
                <xsl:for-each select="type_partus">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Type partus -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901107_20180228162810"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="percentiel_van_het_geboortegewicht">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Percentiel geboortegewicht -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900902_20161206103023"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="apgarscore_na_5_min">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Apgarscore na 5 min. -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20161206103247"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="congenitale_afwijkingenq">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Congenitale afwijkingen (ja nee) -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901015_20161206103349"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select=".//chromosomale_afwijkingenq">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Chromosomale afwijkingen (ja nee) -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900981_20161206103540"/>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- Chromosomale afwijkingen (ja nee) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900981_20161206103540">
        <observation classCode="OBS" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr"/>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900981"/>
            <code code="74345006" codeSystem="{$oidSNOMEDCT}" displayName="Chromosomale afwijking"/>
        </observation>
    </xsl:template>
    <!-- Chromosomale afwijkingen (ja nee) -->
    <!-- Postnatale fase -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900983_20161202180940">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900983"/>
            <code code="133906008" codeSystem="{$oidSNOMEDCT}" displayName="Postnatale fase"/>
            <!-- item diagnoseinterventie_postpartum of postnatale_fase (van reden verwijzing) -->
            <xsl:for-each select="diagnoseinterventie_postpartum[pathologie_vrouw]">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Pathologie vrouw -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900984_20161202194808"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Pathologie vrouw -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900984_20161202194808">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900984"/>
            <code code="362973001" codeSystem="{$oidSNOMEDCT}" displayName="Pathologie vrouw"/>
            <!-- Item(s) :: datum-->
            <xsl:for-each select="datum">
                <xsl:call-template name="makeTS.DATE.MINValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <!-- Item(s) :: pathologie_vrouw w-->
            <xsl:for-each select="pathologie_vrouw">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Maternaal onderzoek PRN -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900985_20161206111047">
        <xsl:for-each select="maternale_onderzoeksgegevens">
            <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900985"/>
                <code code="12131-9" codeSystem="{$oidLOINC}" displayName="Medisch onderzoek"/>
                <xsl:for-each select="urine_bloed_en_aanvullende_onderzoeken/psie">
                    <component typeCode="COMP" contextConductionInd="true">
                        <!-- Template :: PsiePRN -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900986_20161215113108"/>
                    </component>
                </xsl:for-each>
            </organizer>
        </xsl:for-each>
    </xsl:template>
    <!-- PsiePRN -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900986_20161215113108">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900986"/>
            <code code="PSIE" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="PSIE"/>
            <xsl:for-each select="irregulaire_antistoffenq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Irregulaire antistoffen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900171_20161215113718"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- PsiePRN -->
    <!-- Uitkomst per kind (subject) PRN Kernset -->
    <!-- Bevalling Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900988_20161206110801">
        <xsl:for-each select="bevalling">
            <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900988"/>
                <code code="236973005" codeSystem="{$oidSNOMEDCT}"/>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Partusnummer -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900357_20161206125654"/>
                </component>
                <xsl:for-each select="diagnose_bevalling">
                    <component typeCode="COMP" contextConductionInd="true">
                        <!-- Template :: Diagnose bevalling Kernsetbericht PRN -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901014_20161206125851"/>
                    </component>
                </xsl:for-each>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Aantal geboren kinderen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900358_20161206130005"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Risicostatus vóór baring -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900156_20161206130057"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Wijze waarop de baring begon -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900715_20161206130300"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Tijdstip begin actieve ontsluiting -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900197_20161206130607"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bijstimulatie toegediend -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900217_20161206130714"/>
                </component>
                <xsl:for-each select="medicatie_nageboortetijdperk_groep">
                    <component typeCode="COMP" contextConductionInd="true">
                        <!-- Template :: Medicatie nageboortetijdperk -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900716_20161206130815"/>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="placenta">
                    <component typeCode="COMP" contextConductionInd="true">
                        <!-- Template :: Geboorte placenta -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20161206101905"/>
                    </component>
                </xsl:for-each>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hoeveelheid bloedverlies 2 -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20161206102207"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Conditie perineum postpartum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20161206131005"/>
                </component>
                <xsl:for-each select="baring | demografische_gegevens | perinatale_sterfte_groep | kindspecifieke_maternale_gegevens | kindspecifieke_uitkomstgegevens | lichamelijk_onderzoek_kind | uitkomst_per_kind">
                    <component typeCode="COMP" contextConductionInd="false">
                        <!-- Template :: Baring Kernset -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900989_20161206131038"/>
                    </component>
                </xsl:for-each>
            </organizer>
        </xsl:for-each>
    </xsl:template>
    <!-- Baring Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900989_20161206131038">
        <xsl:for-each select="baring | demografische_gegevens | perinatale_sterfte_groep | kindspecifieke_maternale_gegevens | kindspecifieke_uitkomstgegevens | lichamelijk_onderzoek_kind">
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.900989"/>
                <id nullFlavor="NI"/>
                <code code="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3"/>
                <subject typeCode="SBJ">
                    <personalRelationship classCode="PRS">
                        <code code="CHILD" codeSystem="2.16.840.1.113883.5.111"/>
                        <xsl:for-each select="identificaties_kind | identificaties_kind">
                            <relationshipHolder classCode="PSN" determinerCode="INSTANCE">
                                <!-- Item(s) :: bsn_kind bsn_kind-->
                                <xsl:for-each select="bsn_kind | bsn_kind">
                                    <xsl:call-template name="makeII.NL.BSNValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">id</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- Item(s) :: geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum geboortedatum-->
                                <xsl:for-each select="geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum | geboortedatum">
                                    <xsl:call-template name="makeTS.DATE.MINValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">birthTime</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- Item(s) :: perinatale_sterfteq perinatale_sterfteq perinatale_sterfteq perinatale_sterfteq perinatale_sterfteq perinatale_sterfteq perinatale_sterfteq perinatale_sterfteq-->
                                <xsl:for-each select="perinatale_sterfteq | perinatale_sterfteq | perinatale_sterfteq | perinatale_sterfteq | perinatale_sterfteq | perinatale_sterfteq | perinatale_sterfteq | perinatale_sterfteq">
                                    <xsl:call-template name="makeBLValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">deceasedInd</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- Item(s) :: datum_perinatale_sterfte datum_perinatale_sterfte datum_perinatale_sterfte datum_perinatale_sterfte datumtijd_vaststelling_perinatale_sterfte datumtijd_vaststelling_perinatale_sterfte-->
                                <xsl:for-each select="datum_perinatale_sterfte | datum_perinatale_sterfte | datum_perinatale_sterfte | datum_perinatale_sterfte | datumtijd_vaststelling_perinatale_sterfte | datumtijd_vaststelling_perinatale_sterfte">
                                    <xsl:call-template name="makeTS.DATE.MINValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">deceasedTime</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </relationshipHolder>
                        </xsl:for-each>
                    </personalRelationship>
                </subject>
                <xsl:for-each select="supervisor_groep | supervisor_groep">
                    <responsibleParty typeCode="RESP">
                        <assignedEntity classCode="ASSIGNED">
                            <!-- Item(s) :: rol_supervisor rol_supervisor-->
                            <xsl:for-each select="rol_supervisor | rol_supervisor">
                                <xsl:call-template name="makeCEValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">code</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </assignedEntity>
                    </responsibleParty>
                </xsl:for-each>
                <xsl:for-each select="aanpakker_kind_groep | aanpakker_kind_groep">
                    <performer typeCode="PRF">
                        <responsibleParty classCode="ASSIGNED">
                            <!-- Item(s) :: rol_aanpakker_kind rol_aanpakker_kind-->
                            <xsl:for-each select="rol_aanpakker_kind | rol_aanpakker_kind">
                                <xsl:call-template name="makeCEValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">code</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <agentPerson nullFlavor="NI"/>
                        </responsibleParty>
                    </performer>
                </xsl:for-each>
                <location typeCode="ELOC">
                    <xsl:for-each select="ziekenhuis_baring | ziekenhuis_baring">
                        <healthCareFacility classCode="DSDLOC">
                            <!-- Item(s) :: ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer ziekenhuisnummer_lvrid zorgaanbieder_identificatie_nummer zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid zorginstelling_lvrid-->
                            <xsl:for-each select="ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | ziekenhuisnummer_lvrid | zorgaanbieder_identificatie_nummer | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid | zorginstelling_lvrid">
                                <xsl:call-template name="makeIIValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">id</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <!-- Item(s) :: werkelijke_plaats_baring_type_locatie werkelijke_plaats_baring_type_locatie-->
                            <xsl:for-each select="werkelijke_plaats_baring_type_locatie | werkelijke_plaats_baring_type_locatie">
                                <xsl:call-template name="makeCEValue">
                                    <xsl:with-param name="xsiType" select="''"/>
                                    <xsl:with-param name="elemName">code</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </healthCareFacility>
                    </xsl:for-each>
                </location>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Geslacht (medische observatie) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900255_20161206133653"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Rangnummer kind -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900400_20161206133754"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Tijdstip breken vliezen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900198_20161206133840"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Kleur vruchtwater -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900199_20161206133935"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Tijdstip actief meepersen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900261_20161206133947"/>
                </outboundRelationship>
                <xsl:for-each select="episiotomieq">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Episiotomie (incl. indicatie) -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901063_20161206000000"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Ruggeprik gewenst, niet gekregen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900992_20161206134140"/>
                </outboundRelationship>
                <xsl:for-each select="pijnbestrijdingq | pijnbestrijding | methode">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: PijnbestrijdingPRNKernset -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900995_20161206134416"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="sedatieq">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Sedatie Ja/Nee -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900996_20161206134556"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Type partus -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900861_20161206134639"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Apgarscore na 5 min. -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900294_20161206103247"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Ligging bij geboorte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900359_20161206134724"/>
                </outboundRelationship>
                <xsl:for-each select="vaginale_kunstverlossing_groep">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Vaginale kunstverlossing PRN Kernset -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900999_20161206134830"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="sectio_caesarea_group">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Section caesarea -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900277_20161206134841"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Overige interventies -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900893_20161206135049"/>
                </outboundRelationship>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Geboortegewicht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900425_20161206135217"/>
                </outboundRelationship>
                <xsl:for-each select="congenitale_afwijkingenq | specificatie_congenitale_afwijking_groep | congenitale_afwijkingen_groep">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Congenitale afwijkingen NoUnc -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901017_20161206135251"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="chromosomale_afwijkingenq | specificatie_chromosomale_afwijking_groep | specificatie_chromosomale_afwijking_groep">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Chromosomale afwijkingen NoUnc -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901016_20161206135419"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="problematiek_kindq">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Problematiek kind -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901019_20161206135430"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="kinderarts_betrokkenq | betrokkenheid_kinderarts">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Betrokkenheid kinderarts -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901020_20161206135638"/>
                    </outboundRelationship>
                </xsl:for-each>
                <xsl:for-each select="kindspecifieke_gegevens | voeding_kind_groep">
                    <outboundRelationship typeCode="COMP">
                        <!-- Template :: Voeding kind -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900724_20161206135654"/>
                    </outboundRelationship>
                </xsl:for-each>
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Fase perinatale sterfte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900433_20161206135827"/>
                </outboundRelationship>
            </procedure>
        </xsl:for-each>
    </xsl:template>
    <!-- Baring PRN Kernset -->
    <!-- Rol supervisor -->
    <!-- Rol aanpakker kind PRN Kernset -->
    <!-- Ruggeprik gewenst, niet gekregen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900992_20161206134140">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900992"/>
            <code code="RuggeprikGewNGekr" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Ruggeprik gewenst, niet gekregen"/>
            <!-- Item(s) :: ruggeprik_gewenst_niet_gekregenq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Irregulaire antistoffen ja/nee -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900993_20161206101240">
        <xsl:param name="parentElementName">pertinentInformation3</xsl:param>
        <xsl:call-template name="question_observation">
            <xsl:with-param name="parent_element_name" select="$parentElementName"/>
            <xsl:with-param name="question" select="./irregulaire_antistoffenq"/>
            <xsl:with-param name="observation" select="./irregulaire_antistoffen"/>
            <xsl:with-param name="templateId">2.16.840.1.113883.2.4.6.10.90.900993</xsl:with-param>
            <xsl:with-param name="observation_code" select="'312457003'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Irregulaire antistoffen'"/>
        </xsl:call-template>
    </xsl:template>
    <!-- PijnbestrijdingPRNKernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900995_20161206134416">
        <procedure classCode="PROC" moodCode="EVN">
            <!-- Item(s) :: pijnbestrijdingq -->
            <xsl:call-template name="makeNegationAttr">
                <xsl:with-param name="inputValue" select="./@value"/>
            </xsl:call-template>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900995"/>
            <id nullFlavor="NI"/>
            <code code="278414003" codeSystem="{$oidSNOMEDCT}" displayName="Pijnbestrijding"/>
            <!-- Item(s) :: methode-->
            <xsl:for-each select="../pijnbestrijding/methode/methode">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="../pijnbestrijding/periode">
                <outboundRelationship typeCode="COMP">
                    <!-- Template :: Pijnbestrijding periode -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901022_20161206145212"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="../pijnbestrijding/methode/overig_middel">
                <outboundRelationship typeCode="COMP">
                    <procedure classCode="PROC" moodCode="EVN">
                        <id nullFlavor="NI"/>
                        <code code="PijnbestrOverig" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Pijnbestrijding met overig middel"/>
                        <!-- Item(s) :: middel-->
                        <xsl:for-each select="./middel">
                            <xsl:call-template name="makeCEValue">
                                <xsl:with-param name="xsiType" select="''"/>
                                <xsl:with-param name="elemName">methodCode</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="./toediening">
                            <outboundRelationship typeCode="COMP">
                                <procedure classCode="PROC" moodCode="EVN">
                                    <id nullFlavor="NI"/>
                                    <code code="416118004" codeSystem="{$oidSNOMEDCT}" displayName="Toediening"/>
                                    <!-- Item(s) :: toediening-->
                                    <xsl:call-template name="makeCEValue">
                                        <xsl:with-param name="xsiType" select="''"/>
                                        <xsl:with-param name="elemName">methodCode</xsl:with-param>
                                    </xsl:call-template>
                                </procedure>
                            </outboundRelationship>
                        </xsl:for-each>
                    </procedure>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- PijnbestrijdingPRNKernset -->
    <!-- Sedatie Ja/Nee -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900996_20161206134556">
        <procedure classCode="PROC" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr">
                <xsl:with-param name="inputValue" select="@value"/>
            </xsl:call-template>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900996"/>
            <id nullFlavor="NI"/>
            <code code="72641008" codeSystem="{$oidSNOMEDCT}" displayName="Sedatie"/>
        </procedure>
    </xsl:template>
    <!-- Sedatie Ja/Nee -->
    <!-- Herleidbare gegevens in onderzoeksdatabank? -->
    <!-- Voorgenomen plaats baring tijdens zwangerschap (type locatie) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900998_20161215133052">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900998"/>
            <code code="PRN4209" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" displayName="Voorgenomen plaats baring"/>
            <!-- Item(s) :: voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Vaginale kunstverlossing PRN Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900999_20161206134830">
        <procedure classCode="PROC" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900999"/>
            <id nullFlavor="NI"/>
            <code code="3311000146109" codeSystem="{$oidSNOMEDCT}" displayName="Vaginale kunstverlossing"/>
            <!-- Item(s) :: vaginale_kunstverlossing-->
            <xsl:for-each select="vaginale_kunstverlossing">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="succes_vaginale_kunstverlossingq">
                <outboundRelationship typeCode="OUTC">
                    <!-- Template :: Succes vaginale kunstverlossing -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900275_20161215134619"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>
    <!-- Voornemens -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901000_20161206110206">
        <organizer classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901000"/>
            <code code="Voornemen" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Voornemen"/>
            <xsl:for-each select="voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Voorgenomen plaats baring tijdens zwangerschap (type locatie) -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900998_20161215133052"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Voornemens -->
    <!-- Alcoholgebruik -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901001_20161206114803">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901001"/>
            <code code="228309001" codeSystem="{$oidSNOMEDCT}" displayName="Alcoholgebruik"/>
            <!-- Item(s) :: alcoholgebruik-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Alcoholgebruik -->
    <!-- Drugsgebruik? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901002_20161206114851">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901002"/>
            <code code="Drugsgebruik" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Drugsgebruik"/>
            <!-- Item(s) :: drugsgebruikq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Drugsgebruik? -->
    <!-- Prenatale controle -->
    <!-- Diagnose deze zwangerschap Kernset -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901004_20161206110451">
        <xsl:for-each select="diagnose | diagnose">
            <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.901004"/>
                <id root="" extension=""/>
                <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="TODO"/>
                <!-- Item(s) :: datum datum-->
                <xsl:for-each select="datum | datum">
                    <xsl:call-template name="makeTS.DATE.MINValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Zwangerschapsduur op datum onderzoek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900236_20161206114409"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Gynaecologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bloedverlies? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Partiële mola? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20161202142628"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Cervixinsufficiëntie? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Infectieziekte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hyperemesis gravidarum? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hypertensieve aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Zwangerschapscholestase? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diabetes gravidarum met insuline? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                </component>
                <component typeCode="COMP" contextConductionInd="false">
                    <!-- Template :: Afwijkende groei foetus -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus immaturus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus prematurus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Abruptio placentae? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                </component>
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Navelstrengprolaps -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901052_20161202154625"/>
                </component>
                <xsl:for-each select="liggingsafwijking">
                    <component typeCode="COMP" contextConductionInd="true">
                        <!-- Template :: Liggingsafwijking -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901053_20161202154917"/>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="intrauteriene_vruchtdood">
                    <component typeCode="COMP" contextConductionInd="true">
                        <!-- Template :: Intra-uteriene vruchtdood -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20161202160924"/>
                    </component>
                </xsl:for-each>
            </organizer>
        </xsl:for-each>
    </xsl:template>
    <!-- Diagnose deze zwangerschap Kernsetbericht PRN -->

    <!-- PPROM? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901007_20161202173503">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901007"/>
            <code code="312974005" codeSystem="{$oidSNOMEDCT}" displayName="PPROM"/>
            <!-- Item(s) :: ppromq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- PROM? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901008_20161202173654">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901008"/>
            <code code="44223004" codeSystem="{$oidSNOMEDCT}" displayName="PROM"/>
            <!-- Item(s) :: promq promq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Koorts? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901009_20161202173856">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901009"/>
            <code code="386661006" codeSystem="{$oidSNOMEDCT}" displayName="Koorts"/>
            <!-- Item(s) :: koortsq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Koorts? -->
    <!-- Niet vorderende ontsluiting? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901010_20161202174017">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901010"/>
            <code code="237320005" codeSystem="{$oidSNOMEDCT}" displayName="Niet vorderende ontsluiting"/>
            <!-- Item(s) :: niet_vorderende_ontsluitingq niet_vorderende_ontsluitingq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Niet vorderende uitdrijving? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901011_20161202174122">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901011"/>
            <code code="249166003" codeSystem="{$oidSNOMEDCT}" displayName="Niet vorderende uitdrijving"/>
            <!-- Item(s) :: niet_vorderende_uitdrijvingq niet_vorderende_uitdrijvingq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Verdenking foetale nood? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901012_20161202174235">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901012"/>
            <code code="609415007:246090004=12867002" codeSystem="{$oidSNOMEDCT}" displayName="Verdenking foetale nood"/>
            <!-- Item(s) :: verdenking_foetale_noodq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Verdenking foetale nood? -->
    <!-- Vastzittende placenta -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901013_20161202174410">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901013"/>
            <code code="109894007" codeSystem="{$oidSNOMEDCT}" displayName="Vastzittende placenta"/>
            <!-- Item(s) :: vastzittende_placentaq vastzittende_placentaq-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Diagnose bevalling Kernsetbericht PRN -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901014_20161206125851">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901014"/>
            <id nullFlavor="NI"/>
            <code code="439401001" codeSystem="{$oidSNOMEDCT}" displayName="Diagnose"/>
            <xsl:for-each select="./ppromq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PPROM? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901007_20161202173503"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="./promq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: PROM? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901008_20161202173654"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="koortsq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Koorts? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901009_20161202173856"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="./niet_vorderende_ontsluitingq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Niet vorderende ontsluiting? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901010_20161202174017"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="niet_vorderende_uitdrijvingq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Niet vorderende uitdrijving? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901011_20161202174122"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="verdenking_foetale_noodq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Verdenking foetale nood? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901012_20161202174235"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="intrauteriene_vruchtdood[vermoeden_intrauteriene_vruchtdoodq]">
                <component typeCode="COMP" contextConductionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901091_20180220155029"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="vastzittende_placentaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Vastzittende placenta -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901013_20161202174410"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="fluxus_postpartum">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Fluxus Postpartum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901054_20161202165703"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Diagnose bevalling Kernsetbericht PRN -->
    <!-- Congenitale afwijkingen (ja nee) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901015_20161206103349">
        <observation classCode="OBS" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr"/>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901015"/>
            <code code="443341004" codeSystem="{$oidSNOMEDCT}" displayName="Congenitale afwijking"/>
        </observation>
    </xsl:template>
    <!-- Chromosomale afwijkingen NoUnc -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901016_20161206135419">
        <xsl:param name="chr_afw_question"/>
        <xsl:param name="chr_afw_observation"/>
        <observation classCode="OBS" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr">
                <xsl:with-param name="inputValue" select="$chr_afw_question/@value"/>
            </xsl:call-template>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901016"/>
            <code code="74345006" codeSystem="{$oidSNOMEDCT}" displayName="Chromosomale afwijking"/>
            <!-- Item(s) :: specificatie_chromosomale_afwijking-->
            <xsl:for-each select="$chr_afw_observation">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Congenitale afwijkingen NoUnc -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901017_20161206135251">
        <xsl:param name="cong_afw_question"/>
        <xsl:param name="cong_afw_observation"/>
        <observation classCode="OBS" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr">
                <xsl:with-param name="inputValue" select="$cong_afw_question/@value"/>
            </xsl:call-template>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901017"/>
            <code code="443341004" codeSystem="{$oidSNOMEDCT}" displayName="Congenitale afwijking"/>
            <!-- Item(s) :: specificatie_congenitale_afwijking-->
            <xsl:for-each select="$cong_afw_observation">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Problematiek kind -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901019_20161206135430">
        <observation classCode="OBS" moodCode="EVN">
            <xsl:call-template name="makeNegationAttr"/>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901019"/>
            <code code="ProblematiekKind" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Problematiek kind"/>
            <!-- Item(s) :: problematiek_kind-->
            <xsl:for-each select="../problematiek_kind">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </observation>
    </xsl:template>
    <!-- Problematiek kind -->
    <!-- Betrokkenheid kinderarts -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901020_20161206135638">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901020"/>
            <code code="KinderartsBetrokken" codeSystem="2.16.840.1.113883.2.4.4.13"/>
            <!-- Item(s) :: type_betrokkenheid-->
            <xsl:for-each select="../betrokkenheid_kinderarts/type_betrokkenheid">
                <xsl:call-template name="makeCEValue">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <performer typeCode="SPRF">
                <!-- Item(s) :: datum_betrokkenheid-->
                <xsl:for-each select="../betrokkenheid_kinderarts/datum_betrokkenheid">
                    <xsl:call-template name="makeTSValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">time</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <assignedEntity classCode="ASSIGNED">
                    <code code="01.019" codeSystem="2.16.840.1.113883.2.4.15.111" displayName="Kinderarts"/>
                    <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                        <!-- Item(s) :: zorginstelling_lvrid -->
                        <xsl:for-each select="../betrokkenheid_kinderarts[zorginstelling_lvrid]">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901018_20141107145228"/>
                        </xsl:for-each>
                    </representedOrganization>
                </assignedEntity>
            </performer>
        </observation>
    </xsl:template>
    <!-- Betrokkenheid kinderarts Reden -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901021_20161215161133">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901021"/>
            <code code="PediatrischeVerwijsindicatie" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Reden betrokkenheid kinderarts"/>
            <!-- Item(s) :: reden_betrokkenheid -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Pijnbestrijding periode -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901022_20161206145212">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901022"/>
            <code code="PijnbestrPeriode" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Pijnbestrijding periode"/>
            <!-- Item(s) :: periode-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Leven voelen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901023_20161206114616">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901023"/>
            <code code="364618000" codeSystem="{$oidSNOMEDCT}" displayName="Leven voelen"/>
            <!-- Item(s) :: leven_voelen-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Transfusiereactie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901024_20161202133114">
        <observation classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901024"/>
            <code code="82545002" codeSystem="{$oidSNOMEDCT}" displayName="Transfusiereactie"/>
            <!-- Item(s) :: transfusiereactieq -->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- PsychiatriePRN -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901026_20161202133709">
        <xsl:call-template name="observationQ">
            <xsl:with-param name="observation_templateId" select="'2.16.840.1.113883.2.4.6.10.90.901026'"/>
            <xsl:with-param name="observation_code" select="'74732009'"/>
            <xsl:with-param name="observation_codeSystem" select="'2.16.840.1.113883.6.96'"/>
            <xsl:with-param name="observation_displayName" select="'Psychiatrie'"/>
        </xsl:call-template>
    </xsl:template>
    <!-- Reden verwijzing (obstetrische anamnese) 2.3.3-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901096_20180221152713">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901096"/>
            <code code="248983002" codeSystem="{$oidSNOMEDCT}" displayName="Obstetrische anamnese"/>
            <xsl:for-each select="gynaecologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Gynaecologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bloedverliesq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bloedverlies? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="partiele_molaq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Partiële mola? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20161202142628"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cervixinsufficientieq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Cervixinsufficiëntie? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="infectie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Infectieziekte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900975_20161202144326"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hyperemesis_gravidarumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hyperemesis gravidarum? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hypertensieve_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hypertensieve aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="zwangerschapscholestaseq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Zwangerschapscholestase? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diabetes_gravidarum_met_insulineq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diabetes gravidarum met insuline? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwijkende_groei_foetus">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Afwijkende groei foetus -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_immaturusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus immaturus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_prematurusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus prematurus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="abruptio_placentaeq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Abruptio placentae? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="fluxus_postpartumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Fluxus Postpartum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901054_20161202165703"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Reden Verwijzing 2.3.3 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901097_20180221154011">
        <xsl:if test="name(.) = 'algemene_anamnese'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901048_20161202111820"/>
        </xsl:if>
        <xsl:if test="name(.) = 'obstetrische_anamnese'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901096_20180221152713"/>
        </xsl:if>
        <xsl:if test="name(.) = 'zwangerschap'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901100_20180223140936"/>
        </xsl:if>
        <xsl:if test="name(.) = 'einde_zwangerschap'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901055_20161202170207"/>
        </xsl:if>
        <xsl:if test="name(.) = 'bevalling'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901099_20180223113239"/>
        </xsl:if>
        <xsl:if test="name(.) = 'postnatale_fase'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900983_20161202180940"/>
        </xsl:if>
        <xsl:if test="name(.) = 'overig'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901058_20161202183205"/>
        </xsl:if>
        <xsl:if test="name(.) = 'van_2e_naar_3e_lijn'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901060_20161203172345"/>
        </xsl:if>
        <xsl:if test="name(.) = 'van_2e_naar_1e_lijn'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901061_20161205165345"/>
        </xsl:if>
        <xsl:if test="name(.) = 'van_3e_naar_2e_lijn'">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901062_20161205165345"/>
        </xsl:if>
    </xsl:template>
    <!-- Verwijsdetails 2.3.3-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901098_20180221154619">
        <act xmlns="urn:hl7-org:v3" classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901098"/>
            <code code="3457005" codeSystem="{$oidSNOMEDCT}" displayName="Verwijsdetails"/>
            <!-- Item(s) :: datum_verwijzing-->
            <xsl:for-each select="datum_verwijzing">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="verwijzing_naar">
                <performer typeCode="PRF">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901045_20161201143523"/>
                </performer>
            </xsl:for-each>
            <xsl:for-each select="verwijzing_van">
                <author typeCode="AUT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901045_20161201143523"/>
                </author>
            </xsl:for-each>
            <xsl:for-each select="redenen_van_verwijzing">
                <xsl:for-each select="van_1e_naar_2e_lijn">
                    <xsl:for-each select="./algemene_anamnese | ./obstetrische_anamnese | ./zwangerschap | ./einde_zwangerschap | ./bevalling | ./postnatale_fase | ./overig">
                        <outboundRelationship typeCode="RSON">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901097_20180221154011"/>
                        </outboundRelationship>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="van_2e_naar_3e_lijn | van_2e_naar_1e_lijn | van_3e_naar_2e_lijn">
                    <outboundRelationship typeCode="RSON">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901097_20180221154011"/>
                    </outboundRelationship>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="perinatale_periode">
                <outboundRelationship typeCode="PERT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900895_20161203165258"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="verwijzing_naar/type_verwijzing">
                <outboundRelationship typeCode="GEN" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901059_20161203164103"/>
                </outboundRelationship>
            </xsl:for-each>
        </act>
    </xsl:template>
    <!-- Reden verwijzing (deze zwangerschap) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901100_20180223140936">
        <organizer xmlns="urn:hl7-org:v3" classCode="CONTAINER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901100"/>
            <code code="364320009" codeSystem="{$oidSNOMEDCT}" displayName="Zwangerschap"/>
            <xsl:for-each select="gynaecologische_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Gynaecologische aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900954_20161202125822"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bloedverliesq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Bloedverlies? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900967_20161202142446"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="partiele_mola">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Partiële mola? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901005_20161202142628"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cervixinsufficientie">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Cervixinsufficiëntie? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900968_20161202144215"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="infectieziekte">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Infectieziekte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900950_20161202115613"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hyperemesis_gravidarumq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hyperemesis gravidarum? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900969_20161202144436"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hypertensieve_aandoening">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Hypertensieve aandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900977_20161202145706"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="zwangerschapscholestaseq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Zwangerschapscholestase? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900971_20161202144715"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diabetes_gravidarum_met_insulineq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Diabetes gravidarum met insuline? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900978_20161202144812"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwijkende_groei_foetus">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Afwijkende groei foetus -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900976_20161202144857"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_immaturusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus immaturus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900972_20161202144955"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="dreigende_partus_prematurusq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Dreigende partus prematurus? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900973_20161202145105"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="abruptio_placentaeq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Abruptio placentae? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900974_20161202145207"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="navelstrengprolapsq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Navelstrengprolaps -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901052_20161202154625"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="liggingsafwijking">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Liggingsafwijking -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901053_20161202154917"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="intrauteriene_vruchtdood/vermoeden_intrauteriene_vruchtdoodq">
                <component typeCode="COMP" contextConductionInd="true">
                    <!-- Template :: Intra-uteriene vruchtdood -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20161202160924"/>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    <!-- Indicatie primaire sectio -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901105_20180228121453">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901105"/>
            <code code="SectioCaeInd" codeSystem="2.16.840.1.113883.2.4.3.22.1.1" displayName="Indicatie sectio"/>
            <!-- Item(s) :: indicatie_primaire_sectio-->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <!-- Section caesarea -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901106_20180228150344">
        <procedure classCode="PROC" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901106"/>
            <id nullFlavor="NI"/>
            <code code="11466000" codeSystem="{$oidSNOMEDCT}" displayName="Sectio caesarea"/>
            <xsl:for-each select="./beslismoment_sectio_caesarea">
                <outboundRelationship typeCode="FLFS">
                    <!-- Template :: Beslismoment sectio caesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900278_20161215134825"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="indicatie_primaire_sectio">
                <outboundRelationship typeCode="RSON">
                    <!-- Template :: Indicatie primaire sectio -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901105_20180228121453"/>
                </outboundRelationship>
            </xsl:for-each>
            <xsl:for-each select="indicatie_secundaire_sectio">
                <outboundRelationship typeCode="RSON">
                    <!-- Template :: Indicatie secundaire Sectio Caesarea -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901090_20161220000000"/>
                </outboundRelationship>
            </xsl:for-each>
        </procedure>
    </xsl:template>

    <!-- Assigned Person [peri] -->
    <xsl:template name="observation">
        <xsl:param name="observation_effectiveTime" select="'default'"/>
        <xsl:param name="observation_templateId" select="''"/>
        <xsl:param name="observation_code"/>
        <xsl:param name="observation_codeSystem"/>
        <xsl:param name="observation_displayName"/>
        <xsl:param name="observation_overig_toelichting"/>
        <xsl:param name="observation_text"/>

        <observation classCode="OBS" moodCode="EVN" negationInd="false">
            <xsl:if test="string-length($observation_templateId) > 0">
                <templateId>
                    <xsl:attribute name="root" select="$observation_templateId"/>
                </templateId>
            </xsl:if>
            <code>
                <xsl:attribute name="code" select="$observation_code"/>
                <xsl:attribute name="codeSystem" select="$observation_codeSystem"/>
                <xsl:attribute name="displayName" select="$observation_displayName"/>
            </code>
            <xsl:if test="$observation_text[1] instance of element()">
                <xsl:for-each select="$observation_text">
                    <xsl:call-template name="makeText"/>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="$observation_effectiveTime[1] instance of element()">
                <xsl:for-each select="$observation_effectiveTime">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>
            </xsl:if>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="originalText" select="$observation_overig_toelichting"/>
            </xsl:call-template>
        </observation>
    </xsl:template>
    <xsl:template name="observationQ">
        <xsl:param name="observation_templateId" select="''"/>
        <xsl:param name="observation_effectiveTime" select="'default'"/>
        <xsl:param name="observation_code"/>
        <xsl:param name="observation_codeSystem"/>
        <xsl:param name="observation_displayName"/>
        <xsl:param name="observation_text"/>
        <observation classCode="OBS" moodCode="EVN">
            <xsl:choose>
                <xsl:when test="@value = 'true' or @value = 'false'">
                    <xsl:call-template name="makeNegationAttr"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor" select="@value"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="string-length($observation_templateId) > 0">
                <templateId>
                    <xsl:attribute name="root" select="$observation_templateId"/>
                </templateId>
            </xsl:if>
            <code>
                <xsl:attribute name="code" select="$observation_code"/>
                <xsl:attribute name="codeSystem" select="$observation_codeSystem"/>
                <xsl:attribute name="displayName" select="$observation_displayName"/>
            </code>
            <xsl:if test="$observation_text[1] instance of element()">
                <xsl:for-each select="$observation_text">
                    <xsl:call-template name="makeText"/>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="$observation_effectiveTime[1] instance of element()">
                <xsl:for-each select="$observation_effectiveTime">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>
            </xsl:if>
        </observation>
    </xsl:template>
    <xsl:template name="question_observation">
        <xsl:param name="parent_element_name" select="'component'"/>
        <xsl:param name="contextConduction" select="'true'"/>
        <xsl:param name="question"/>
        <xsl:param name="templateId" select="''"/>
        <xsl:param name="observation_effectiveTime"/>
        <xsl:param name="observation"/>
        <xsl:param name="observation_code"/>
        <xsl:param name="observation_codeSystem"/>
        <xsl:param name="observation_displayName"/>
        <xsl:param name="observation_overig_toelichting"/>
        <xsl:param name="observation_text"/>

        <xsl:if test="$question[1] instance of element() and (($observation[1] instance of element() and not($observation)) or not($observation[1] instance of element()))">
            <!-- question gevuld met een element, en observation is null of een lege string (bij niet toekennen van de param) -->
            <xsl:for-each select="$question">
                <xsl:choose>
                    <xsl:when test="$parent_element_name = 'pertinentInformation3'">
                        <pertinentInformation3 typeCode="PERT">
                            <!-- de default voor contextConduction = 'true' alleen op false zetten als 'false' is meegegeven -->
                            <xsl:attribute name="contextConductionInd" select="not($contextConduction = 'false')"/>
                            <xsl:call-template name="observationQ">
                                <xsl:with-param name="observation_templateId" select="$templateId"/>
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </pertinentInformation3>
                    </xsl:when>
                    <xsl:when test="$parent_element_name = 'outboundRelationship'">
                        <outboundRelationship typeCode="COMP">
                            <xsl:call-template name="observationQ">
                                <xsl:with-param name="observation_templateId" select="$templateId"/>
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </outboundRelationship>
                    </xsl:when>
                    <xsl:when test="$parent_element_name = 'component'">
                        <component typeCode="COMP">
                            <!-- de default voor contextConduction = 'true' alleen op false zetten als 'false' is meegegeven -->
                            <xsl:attribute name="contextConductionInd" select="not($contextConduction = 'false')"/>
                            <xsl:call-template name="observationQ">
                                <xsl:with-param name="observation_templateId" select="$templateId"/>
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </component>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- let's assume a component -->
                        <component typeCode="COMP">
                            <!-- de default voor contextConduction = 'true' alleen op false zetten als 'false' is meegegeven -->
                            <xsl:attribute name="contextConductionInd" select="not($contextConduction = 'false')"/>
                            <xsl:call-template name="observationQ">
                                <xsl:with-param name="observation_templateId" select="$templateId"/>
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </component>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>

        <xsl:if test="$observation[1] instance of element()">
            <xsl:for-each select="$observation">
                <xsl:choose>
                    <xsl:when test="$parent_element_name = 'pertinentInformation3'">
                        <pertinentInformation3 typeCode="PERT">
                            <!-- de default voor contextConduction = 'true' alleen op false zetten als 'false' is meegegeven -->
                            <xsl:attribute name="contextConductionInd" select="not($contextConduction = 'false')"/>
                            <xsl:call-template name="observation">
                                <xsl:with-param name="observation_templateId" select="$templateId"/>
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_overig_toelichting" select="$observation_overig_toelichting"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </pertinentInformation3>
                    </xsl:when>
                    <xsl:when test="$parent_element_name = 'outboundRelationship'">
                        <outboundRelationship typeCode="COMP">
                            <xsl:call-template name="observation">
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_overig_toelichting" select="$observation_overig_toelichting"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </outboundRelationship>
                    </xsl:when>
                    <xsl:when test="$parent_element_name = 'component'">
                        <component typeCode="COMP">
                            <!-- de default voor contextConduction = 'true' alleen op false zetten als 'false' is meegegeven -->
                            <xsl:attribute name="contextConductionInd" select="not($contextConduction = 'false')"/>
                            <xsl:call-template name="observation">
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_overig_toelichting" select="$observation_overig_toelichting"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </component>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- let's assume a component -->
                        <component typeCode="COMP">
                            <!-- de default voor contextConduction = 'true' alleen op false zetten als 'false' is meegegeven -->
                            <xsl:attribute name="contextConductionInd" select="not($contextConduction = 'false')"/>
                            <xsl:call-template name="observation">
                                <xsl:with-param name="observation_effectiveTime" select="$observation_effectiveTime"/>
                                <xsl:with-param name="observation_code" select="$observation_code"/>
                                <xsl:with-param name="observation_codeSystem" select="$observation_codeSystem"/>
                                <xsl:with-param name="observation_displayName" select="$observation_displayName"/>
                                <xsl:with-param name="observation_overig_toelichting" select="$observation_overig_toelichting"/>
                                <xsl:with-param name="observation_text" select="$observation_text"/>
                            </xsl:call-template>
                        </component>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
