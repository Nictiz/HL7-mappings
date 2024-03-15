<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"  version="2.0">

    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>
    
    <!-- Rubriek 13 Bedreigingen uit de directe omgeving -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11013">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11013"/>
            <code code="R013" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R013'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="bedreiging_sociaal_milieu">
                <component>
                    <!-- Template :: obs Bedreiging sociaal milieu -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40481"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bedreiging_fysiek_milieu">
                <component>
                    <!-- Template :: obs Bedreiging fysiek milieu -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40827_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="er_zijn_blijvende_zorgen_dat_de_opvoed_enof_opgroeisituatie_van_de_jeugdige_een_bedreiging_voor_de_veiligheid_van_de_jeugdige_kunnen_vormen">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41569_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="de_blijvende_zorgen_zijn_gedeeld_met_de_jeugdigeoudersverzorgers">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41570_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="reden_om_blijvende_zorgen_niet_te_delen">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41571_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwegingsvraag_1_is_er_een_vermoeden_van_dreiging_van_huiselijk_geweld_enof_kindermishandelingq">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41572_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwegingsvraag_2_is_er_sprake_van_acute_onveiligheid_enof_structurele_onveiligheidq">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41573_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwegingsvraag_3_ben_ik_als_jgzprofessional_in_staat_effectieve_hulp_te_bieden_of_te_organiserenq">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41574_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwegingsvraag_4_aanvaarden_de_betrokkenen_de_hulpq_ben_ik_in_staat_de_hulp_te_bieden_of_te_organiserenq">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41575_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afwegingsvraag_5_leidt_de_hulp_binnen_de_gewenste_termijn_tot_duurzame_veiligheid_enof_het_welzijn_van_alle_betrokkenenq">
                <component>
                    <!-- Template :: obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41576_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="risicoinventarisatie_vgv">
                <component>
                    <!-- Template :: obs Risico-inventarisatie VGV -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40739_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="risicoinschatting_vgv_op_dit_moment">
                <component>
                    <!-- Template :: obs Risico-inschatting VGV op dit moment -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41414_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="verklaring_tegen_vgv_meegegeven">
                <component>
                    <!-- Template :: obs Verklaring tegen VGV meegegeven -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41415_20200527000000"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_vgv">
                <component>
                    <!-- Template :: obs Bijzonderheden VGV -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41416_20200527000000"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>
    
    <!-- obs Bedreiging sociaal milieu -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40481">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40481"/>
            <code code="481" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '481'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bedreiging_sociaal_milieu-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Bedreiging fysiek milieu -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40827_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40827"/>
            <code code="827" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '827'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bedreiging_fysiek_milieu-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41569_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41569"/>
            <code code="1569" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1569'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs De (blijvende) zorgen zijn gedeeld met de jeugdige/ouder(s)/verzorger(s) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41570_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41570"/>
            <code code="1570" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1570'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Reden om (blijvende) zorgen niet te delen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41571_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41571"/>
            <code code="1571" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1571'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Afwegingsvraag 1: Is er een vermoeden van (dreiging van) huiselijk geweld en/of kindermishandeling? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41572_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41572"/>
            <code code="1572" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1572'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Afwegingsvraag 2: Is er sprake van acute onveiligheid en/of structurele onveiligheid? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41573_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41573"/>
            <code code="1573" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1573'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Afwegingsvraag 3: Ben ik, als JGZ-professional, in staat effectieve hulp te bieden of te organiseren? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41574_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41574"/>
            <code code="1574" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1574'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Afwegingsvraag 4: Aanvaarden de betrokkenen de hulp? Ben ik in staat de hulp te bieden of te organiseren? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41575_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41575"/>
            <code code="1575" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1575'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Afwegingsvraag 5: Leidt de hulp binnen de gewenste termijn tot duurzame veiligheid en/of het welzijn van alle betrokkenen? -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41576_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41576"/>
            <code code="1576" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1576'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Risico-inventarisatie VGV -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40739_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40739"/>
            <code code="739" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '739'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: risicoinventarisatie_vgv-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Risico-inschatting VGV op dit moment -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41414_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41414"/>
            <code code="1414" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1414'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: risicoinschatting_vgv_op_dit_moment-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Verklaring tegen VGV meegegeven -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41415_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41415"/>
            <code code="1415" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1415'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: verklaring_tegen_vgv_meegegeven-->
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs Bijzonderheden VGV -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41416_20200527000000">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41416"/>
            <code code="1416" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1416'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_vgv-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
</xsl:stylesheet>
