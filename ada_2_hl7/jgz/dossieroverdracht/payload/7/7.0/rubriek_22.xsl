<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>
    
    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        name="template_2.16.840.1.113883.2.4.6.10.100.11022">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11022"/>
            <code code="R022" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R022'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="huidhaarnagels_onderzocht">
                <component><!-- Template :: obs Huid/haar/nagels onderzocht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40161"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_huidhaarnagels">
                <component><!-- Template :: obs Bijzonderheden huid/haar/nagels -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40163"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="toelichting_bijzonderheden_huidhaarnagels">
                <component><!-- Template :: obs Toelichting huidaandoening -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40164"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        name="template_2.16.840.1.113883.2.4.6.10.100.40161">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40161"/>
            <code code="161" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '161'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: huidhaarnagels_onderzocht-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        name="template_2.16.840.1.113883.2.4.6.10.100.40163">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40163"/>
            <code code="163" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '163'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_huidhaarnagels-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        name="template_2.16.840.1.113883.2.4.6.10.100.40164">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40164"/>
            <code code="164" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '164'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: toelichting_huidaandoening-->
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
