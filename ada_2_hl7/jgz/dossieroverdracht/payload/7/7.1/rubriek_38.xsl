<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:import href="../7.0/rubriek_38.xsl"/>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11038">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11038"/>
            <code code="R038" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R038'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="oogonderzoek_uitgevoerd">
                <component>
                    <!-- Template :: obs Oogonderzoek uitgevoerd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41379"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="brillenzen_dragend">
                <component>
                    <!-- Template :: obs Bril/lenzen dragend -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40831"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apkkaart_uitslag_rechts">
                <component>
                    <!-- Template :: obs APK-kaart uitslag rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40692"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apkkaart_uitslag_links">
                <component>
                    <!-- Template :: obs APK-kaart uitslag links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40832"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apktovkaart_5_meter_uitslag_rechts">
                <component>
                    <!-- Template :: obs APK-TOV-kaart 5 meter uitslag rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41418"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apktovkaart_5_meter_uitslag_links">
                <component>
                    <!-- Template :: obs APK-TOV-kaart 5 meter uitslag links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41419"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apktovkaart_4_meter_uitslag_rechts">
                <component>
                    <!-- Template :: obs APK-TOV-kaart 4 meter uitslag rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41420"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apktovkaart_4_meter_uitslag_links">
                <component>
                    <!-- Template :: obs APK-TOV-kaart 4 meter uitslag links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41421"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apktovkaart_3_meter_uitslag_rechts">
                <component>
                    <!-- Template :: obs APK-TOV-kaart 3 meter uitslag rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40833"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="apktovkaart_3_meter_uitslag_links">
                <component>
                    <!-- Template :: obs APK-TOV-kaart 3 meter uitslag links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40834"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g117_visus">
                <component>
                    <groupCluster>
                        <code code="G117" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G117'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="soort_visuskaart">
                            <component>
                                <!-- Template :: obs Soort visuskaart -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41590"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="uitslag_visus_rechts">
                            <component>
                                <!-- Template :: obs Uitslag visus rechts -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41591"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="uitslag_visus_links">
                            <component>
                                <!-- Template :: obs Uitslag visus links -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41592"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="lhkaart_uitslag_rechts">
                <component>
                    <!-- Template :: obs LH-kaart uitslag rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40835"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="lhkaart_uitslag_links">
                <component>
                    <!-- Template :: obs LH-kaart uitslag links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40836"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="landoltckaart_uitslag_rechts">
                <component>
                    <!-- Template :: obs Landolt-C-kaart uitslag rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40837"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="landoltckaart_uitslag_links">
                <component>
                    <!-- Template :: obs Landolt-C-kaart uitslag links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40838"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="conclusie_visusbepaling">
                <component>
                    <!-- Template :: obs Conclusie visusbepaling -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40408"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="conclusie_visus_3_jaar">
                <component>
                    <!-- Template :: obs Conclusie visus 3 jaar  -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41618"/>
                </component>
            </xsl:for-each>
            
            <xsl:for-each select="bijzonderheden_visusbepaling">
                <component>
                    <!-- Template :: obs Bijzonderheden visusbepaling -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40839"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cornea_lichtreflex_rechts">
                <component>
                    <!-- Template :: obs Cornea lichtreflex rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40390"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="cornea_lichtreflex_links">
                <component>
                    <!-- Template :: obs Cornea lichtreflex links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40391"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="rode_fundusreflex_rechts">
                <component>
                    <!-- Template :: obs Rode fundusreflex rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40840"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="rode_fundusreflex_links">
                <component>
                    <!-- Template :: obs Rode fundusreflex links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40841"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afdektest_geen_instel_beweging_rechts">
                <component>
                    <!-- Template :: obs Afdektest: geen instel beweging rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40392"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afdektest_geen_instel_beweging_links">
                <component>
                    <!-- Template :: obs Afdektest: geen instel beweging links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40393"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="volgbeweging_binoculair_rechts">
                <component>
                    <!-- Template :: obs Volgbeweging binoculair rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40396"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="volgbeweging_binoculair_links">
                <component>
                    <!-- Template :: obs Volgbeweging binoculair links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40397"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="volgbeweging_monoculair_rechts">
                <component>
                    <!-- Template :: obs Volgbeweging monoculair rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40398"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="volgbeweging_monoculair_links">
                <component>
                    <!-- Template :: obs Volgbeweging monoculair links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40399"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_inspectie_oog">
                <component>
                    <!-- Template :: obs Bijzonderheden inspectie oog -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40851"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41618">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41618"/>
            <code code="1618" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1618'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: cornea_lichtreflex_rechts-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

</xsl:stylesheet>
