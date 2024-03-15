<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11040">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11040"/>
            <code code="R040" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R040'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="gehooronderzoek_uitgevoerd">
                <component>
                    <!-- Template :: obs Gehooronderzoek uitgevoerd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40438"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_gehooronderzoek">
                <component>
                    <!-- Template :: obs Bijzonderheden gehooronderzoek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40863"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="screeningsinstrument_ngs">
                <component>
                    <!-- Template :: obs Screeningsinstrument NGS -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41331"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_1e_ngs_rechts">
                <component>
                    <!-- Template :: obs Uitslag 1e NGS rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40439"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_1e_ngs_links">
                <component>
                    <!-- Template :: obs Uitslag 1e NGS links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40441"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_2e_ngs_rechts">
                <component>
                    <!-- Template :: obs Uitslag 2e NGS rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40442"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_2e_ngs_links">
                <component>
                    <!-- Template :: obs Uitslag 2e NGS links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40444"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_3e_ngs_rechts">
                <component>
                    <!-- Template :: obs Uitslag 3e NGS rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40445"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_3e_ngs_links">
                <component>
                    <!-- Template :: obs Uitslag 3e NGS links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40447"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="gescreend_in_nicu">
                <component>
                    <!-- Template :: obs Gescreend in NICU -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41413"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diagnose_audiologisch_centrum_gehoor_rechts">
                <component>
                    <!-- Template :: obs Diagnose Audiologisch Centrum gehoor rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41434"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diagnose_audiologisch_centrum_gehoor_links">
                <component>
                    <!-- Template :: obs Diagnose Audiologisch Centrum gehoor links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41433"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="advies_audiologisch_centrum_aan_ouders">
                <component>
                    <!-- Template :: obs Interventie Audiologisch Centrum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41435"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="toelichting_advies_audiologisch_centrum_aan_ouders">
                <component>
                    <!-- Template :: obs Toelichting interventie Audiologisch Centrum -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41436"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_aangeboden">
                <component>
                    <!-- Template :: obs Testtoon aangeboden -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40864"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_500_rechts">
                <component>
                    <!-- Template :: obs Testtoon 500 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41203"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_500_links">
                <component>
                    <!-- Template :: obs Testtoon 500 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41204"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_1000_rechts">
                <component>
                    <!-- Template :: obs Testtoon 1000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41205"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_1000_links">
                <component>
                    <!-- Template :: obs Testtoon 1000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41206"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_2000_rechts">
                <component>
                    <!-- Template :: obs Testtoon 2000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41207"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_2000_links">
                <component>
                    <!-- Template :: obs Testtoon 2000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41208"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_3000_rechts">
                <component>
                    <!-- Template :: obs Testtoon 3000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41209"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_3000_links">
                <component>
                    <!-- Template :: obs Testtoon 3000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41210"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_4000_rechts">
                <component>
                    <!-- Template :: obs Testtoon 4000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41211"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_4000_links">
                <component>
                    <!-- Template :: obs Testtoon 4000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41212"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_6000_rechts">
                <component>
                    <!-- Template :: obs Testtoon 6000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41213"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="testtoon_6000_links">
                <component>
                    <!-- Template :: obs Testtoon 6000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41214"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_gehoorscreening">
                <component>
                    <!-- Template :: obs Uitslag gehoorscreening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40865"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_500_rechts">
                <component>
                    <!-- Template :: obs Drempel 500 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41216"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_500_links">
                <component>
                    <!-- Template :: obs Drempel 500 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41218"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_1000_rechts">
                <component>
                    <!-- Template :: obs Drempel 1000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41220"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_1000_links">
                <component>
                    <!-- Template :: obs Drempel 1000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41222"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_2000_rechts">
                <component>
                    <!-- Template :: obs Drempel 2000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41224"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_2000_links">
                <component>
                    <!-- Template :: obs Drempel 2000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41226"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_3000_rechts">
                <component>
                    <!-- Template :: obs Drempel 3000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41228"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_3000_links">
                <component>
                    <!-- Template :: obs Drempel 3000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41230"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_4000_rechts">
                <component>
                    <!-- Template :: obs Drempel 4000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41232"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_4000_links">
                <component>
                    <!-- Template :: obs Drempel 4000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41234"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_6000_rechts">
                <component>
                    <!-- Template :: obs Drempel 6000 rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41236"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="drempel_6000_links">
                <component>
                    <!-- Template :: obs Drempel 6000 links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41238"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="uitslag_drempelonderzoek">
                <component>
                    <!-- Template :: obs Uitslag drempelonderzoek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41239"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40438">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40438"/>
            <code code="438" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '438'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: gehooronderzoek_uitgevoerd-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40439">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40439"/>
            <code code="439" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '439'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_1e_ngs_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40441">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40441"/>
            <code code="441" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '441'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_1e_ngs_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40442">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40442"/>
            <code code="442" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '442'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_2e_ngs_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40444">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40444"/>
            <code code="444" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '444'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_2e_ngs_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40445">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40445"/>
            <code code="445" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '445'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_3e_ngs_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40447">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40447"/>
            <code code="447" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '447'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_3e_ngs_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40863">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40863"/>
            <code code="863" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '863'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_gehooronderzoek-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40864">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40864"/>
            <code code="864" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '864'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_aangeboden-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40865">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40865"/>
            <code code="865" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '865'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_gehoorscreening-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41203">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41203"/>
            <code code="1203" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1203'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_500_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41204">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41204"/>
            <code code="1204" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1204'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_500_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41205">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41205"/>
            <code code="1205" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1205'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_1000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41206">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41206"/>
            <code code="1206" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1206'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_1000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41207">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41207"/>
            <code code="1207" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1207'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_2000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41208">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41208"/>
            <code code="1208" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1208'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_2000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41209">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41209"/>
            <code code="1209" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1209'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_3000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41210">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41210"/>
            <code code="1210" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1210'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_3000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41211">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41211"/>
            <code code="1211" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1211'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_4000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41212">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41212"/>
            <code code="1212" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1212'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_4000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41213">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41213"/>
            <code code="1213" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1213'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_6000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41214">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41214"/>
            <code code="1214" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1214'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: testtoon_6000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41216">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41216"/>
            <code code="1216" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1216'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_500_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41218">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41218"/>
            <code code="1218" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1218'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_500_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41220">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41220"/>
            <code code="1220" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1220'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_1000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41222">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41222"/>
            <code code="1222" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1222'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_1000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41224">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41224"/>
            <code code="1224" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1224'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_2000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41226">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41226"/>
            <code code="1226" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1226'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_2000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41228">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41228"/>
            <code code="1228" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1228'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_3000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41230">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41230"/>
            <code code="1230" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1230'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_3000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41232">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41232"/>
            <code code="1232" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1232'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_4000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41234">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41234"/>
            <code code="1234" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1234'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_4000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41236">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41236"/>
            <code code="1236" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1236'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_6000_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41238">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41238"/>
            <code code="1238" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1238'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: drempel_6000_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41239">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41239"/>
            <code code="1239" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1239'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: uitslag_drempelonderzoek-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41331">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41331"/>
            <code code="1331" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1331'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: screeningsinstrument_ngs-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41413">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41413"/>
            <code code="1413" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1413'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: gescreend_in_nicu-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41433">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41433"/>
            <code code="1433" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1433'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: diagnose_audiologisch_centrum_gehoor_links-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41434">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41434"/>
            <code code="1434" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1434'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: diagnose_audiologisch_centrum_gehoor_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41435">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41435"/>
            <code code="1435" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1435'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: interventie_audiologisch_centrum-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41436">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41436"/>
            <code code="1436" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1436'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: toelichting_interventie_audiologisch_centrum-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

</xsl:stylesheet>
