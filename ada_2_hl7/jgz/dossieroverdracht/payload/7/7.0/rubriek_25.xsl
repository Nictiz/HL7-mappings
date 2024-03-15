<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.11025">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11025"/>
            <code code="R025" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R025'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="bewegingsapparaat_onderzocht">
                <component>
                    <!-- Template :: obs Bewegingsapparaat onderzocht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40212"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g024_wervelkolom">
                <component>
                    <groupCluster>
                        <code code="G024" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="bijzonderheden_wervelkolom">
                            <component>
                                <!-- Template :: obs Bijzonderheden wervelkolom -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40217"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hoogteverschil_gibbus_bij_scoliose">
                <component>
                    <!-- Template :: obs Hoogteverschil gibbus bij scoliose -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40800"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="scoliose_hoekmeting">
                <component>
                    <!-- Template :: obs Scoliose hoekmeting -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40218"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g026_heupen">
                <component>
                    <groupCluster>
                        <code code="G026" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="bijzonderheden_heupen">
                            <component>
                                <!-- Template :: obs Bijzonderheden heupen -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40219"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="toelichting_bijzonderheden_heupen">
                <component>
                    <!-- Template :: obs Toelichting bijzonderheden heupen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41446"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_bovenste_extremiteiten">
                <component>
                    <!-- Template :: obs Bijzonderheden bovenste extremiteiten -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40802"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_hand_rechts">
                <component>
                    <!-- Template :: obs Bijzonderheden hand rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41426"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_hand_links">
                <component>
                    <!-- Template :: obs Bijzonderheden hand links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41425"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g028_onderste_extremiteiten">
                <component>
                    <groupCluster>
                        <code code="G028" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="bijzonderheden_onderste_extremiteiten">
                            <component>
                                <!-- Template :: obs Bijzonderheden onderste extremiteiten -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40221"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="beenlengteverschil">
                <component>
                    <!-- Template :: obs Beenlengteverschil -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40804"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_voet_rechts">
                <component>
                    <!-- Template :: obs Bijzonderheden voet rechts -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40223"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_voet_links">
                <component>
                    <!-- Template :: obs Bijzonderheden voet links -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40805"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40212">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40212"/>
            <code code="212" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '212'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bewegingsapparaat_onderzocht-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40217">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40217"/>
            <code code="217" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '217'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_wervelkolom-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!-- Item(s) :: lichaamskant_bijzonderheden_wervelkolom-->
            <xsl:for-each select="../lichaamskant_bijzonderheden_wervelkolom">
                <xsl:call-template name="makeCVValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40218">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40218"/>
            <code code="218" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '218'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: scoliose_hoekmeting-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!-- Item(s) :: lichaamskant_scoliose_hoekmeting-->
            <xsl:for-each select="../lichaamskant_scoliose_hoekmeting">
                <xsl:call-template name="makeCVValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029_20200527 000000"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40219">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40219"/>
            <code code="219" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '219'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_heupen-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!-- Item(s) :: lichaamskant_bijzonderheden_heupen-->
            <xsl:for-each select="../lichaamskant_bijzonderheden_heupen">
                <xsl:call-template name="makeCVValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40221">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40221"/>
            <code code="221" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '221'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_onderste_extremiteiten-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!-- Item(s) :: lichaamskant_bijzonderheden_onderste_extremiteiten-->
            <xsl:for-each select="../lichaamskant_bijzonderheden_onderste_extremiteiten">
                <xsl:call-template name="makeCVValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40223">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40223"/>
            <code code="223" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '223'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_voet_rechts-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40800">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40800"/>
            <code code="800" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '800'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: hoogteverschil_gibbus_bij_scoliose-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">mm</xsl:with-param>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40802">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40802"/>
            <code code="802" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '802'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_bovenste_extremiteiten-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40804">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40804"/>
            <code code="804" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '804'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: beenlengteverschil-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">mm</xsl:with-param>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.40805">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40805"/>
            <code code="805" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '805'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_voet_links-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41425">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41425"/>
            <code code="1425" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1425'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_hand_links-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41426">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41426"/>
            <code code="1426" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1426'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_hand_rechts-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41446">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41446"/>
            <code code="1446" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1446'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: toelichting_bijzonderheden_heupen-->
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
