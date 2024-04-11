<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:import href="../7.0/rubriek_52.xsl"/>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11052">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11052"/>
            <code code="R052" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R052'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="groep_g074_signaal_verwijsindex">
                <component>
                    <groupCluster>
                        <code code="G074" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="datum_aanmelding_verwijsindex">
                            <component>
                                <!-- Template :: obs Afmelding Verwijsindex -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41195"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="datum_afmelding_verwijsindex">
                            <component>
                                <!-- Template :: obs Afmelding Verwijsindex -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41196"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="bijzonderheden_signaal_verwijsindex">
                            <component>
                                <!-- Template :: obs Bijzonderheden melding Verwijsindex -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41408"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g075_melding_veilig_thuis">
                <component>
                    <groupCluster>
                        <code code="G075" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="datum_melding_veilig_thuis">
                            <component>
                                <!-- Template :: obs Melding Veilig Thuis -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41326"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="bijzonderheden_melding_veilig_thuis">
                            <component>
                                <!-- Template :: obs Bijzonderheden melding Veilig Thuis -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41380"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41195">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41195"/>
            <code code="1195" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1195'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_aanmelding_verwijsindex-->
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
            </xsl:call-template>
            <value value="true"/>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Item(s) :: aanmelder_uzi_verwijsindex-->
                    <xsl:for-each select="../aanmelder_uzi_verwijsindex">
                        <xsl:call-template name="makeII.NL.UZIValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_big_verwijsindex">
                        <xsl:call-template name="makeII.NL.BIGValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_agb_verwijsindex">
                        <xsl:call-template name="makeII.NL.AGBValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </assignedEntity>
            </performer>
        </observation>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41196">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41196"/>
            <code code="1196" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1196'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_afmelding_verwijsindex-->
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
            </xsl:call-template>
            <value value="true"/>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Item(s) :: aanmelder_uzi_verwijsindex-->
                    <xsl:for-each select="../aanmelder_uzi_verwijsindex">
                        <xsl:call-template name="makeII.NL.UZIValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_big_verwijsindex">
                        <xsl:call-template name="makeII.NL.BIGValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_agb_verwijsindex">
                        <xsl:call-template name="makeII.NL.AGBValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </assignedEntity>
            </performer>
        </observation>
    </xsl:template>

</xsl:stylesheet>
