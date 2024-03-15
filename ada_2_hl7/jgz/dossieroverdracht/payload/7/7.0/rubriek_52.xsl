<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.11052">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11052"/>
            <code code="R052" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R052'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="groep_g074_melding_verwijsindex_risicojongeren">
                <component>
                    <groupCluster>
                        <code code="G074" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="datum_aanmelding_verwijsindex_risicojongeren">
                            <component>
                                <!-- Template :: obs Afmelding Verwijsindex risicojongeren -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41195"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="datum_afmelding_verwijsindex_risicojongeren">
                            <component>
                                <!-- Template :: obs Afmelding Verwijsindex risicojongeren -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41196"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="bijzonderheden_melding_verwijsindex_risicojongeren">
                            <component>
                                <!-- Template :: obs Bijzonderheden melding Verwijsindex risicojongeren -->
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
            <xsl:for-each select="groep_g084_consultatie_veilig_thuis">
                <component>
                    <groupCluster>
                        <code code="G084" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="datum_consultatie_veilig_thuis">
                            <component>
                                <!-- Template :: obs Consultatie Veilig Thuis -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41327"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="bijzonderheden_consultatie_veilig_thuis">
                            <component>
                                <!-- Template :: obs Bijzonderheden consultatie Veilig Thuis -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41328"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41195">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41195"/>
            <code code="1195" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1195'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_aanmelding_verwijsindex_risicojongeren-->
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
            </xsl:call-template>
            <value value="true"/>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Item(s) :: aanmelder_uzi_verwijsindex_risicojongeren-->
                    <xsl:for-each select="../aanmelder_uzi_verwijsindex_risicojongeren">
                        <xsl:call-template name="makeII.NL.UZIValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_big_verwijsindex_risicojongeren">
                        <xsl:call-template name="makeII.NL.BIGValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_agb_verwijsindex_risicojongeren">
                        <xsl:call-template name="makeII.NL.AGBValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </assignedEntity>
            </performer>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41196">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41196"/>
            <code code="1196" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1196'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_afmelding_verwijsindex_risicojongeren-->
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
            </xsl:call-template>
            <value value="true"/>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Item(s) :: aanmelder_uzi_verwijsindex_risicojongeren-->
                    <xsl:for-each select="../aanmelder_uzi_verwijsindex_risicojongeren">
                        <xsl:call-template name="makeII.NL.UZIValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_big_verwijsindex_risicojongeren">
                        <xsl:call-template name="makeII.NL.BIGValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_agb_verwijsindex_risicojongeren">
                        <xsl:call-template name="makeII.NL.AGBValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </assignedEntity>
            </performer>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41326">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41326"/>
            <code code="1326" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1326'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_melding_veilig_thuis-->
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Item(s) :: aanmelder_uzi_veilig_thuis-->
                    <xsl:for-each select="../aanmelder_uzi_veilig_thuis">
                        <xsl:call-template name="makeII.NL.UZIValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_big_veilig_thuis">
                        <xsl:call-template name="makeII.NL.BIGValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../aanmelder_agb_veilig_thuis">
                        <xsl:call-template name="makeII.NL.AGBValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </assignedEntity>
            </performer>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41327">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41327"/>
            <code code="1327" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1327'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_consultatie_veilig_thuis-->
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Item(s) :: aanmelder_uzi_veilig_thuis-->
                    <xsl:for-each select="../uitvoerende_uzi_consultatie_veilig_thuis">
                        <xsl:call-template name="makeII.NL.UZIValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../uitvoerende_big_consultatie_veilig_thuis">
                        <xsl:call-template name="makeII.NL.BIGValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="../uitvoerende_agb_consultatie_veilig_thuis">
                        <xsl:call-template name="makeII.NL.AGBValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </assignedEntity>
            </performer>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41328">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41328"/>
            <code code="1328" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1328'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_consultatie_veilig_thuis-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41380">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41380"/>
            <code code="1380" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1380'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_melding_veilig_thuis-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41408">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41408"/>
            <code code="1408" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1408'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_melding_verwijsindex_risicojongeren-->
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
