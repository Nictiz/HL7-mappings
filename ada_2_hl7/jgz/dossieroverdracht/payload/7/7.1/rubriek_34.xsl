<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:import href="../7.0/rubriek_34.xsl"/>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11034">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11034"/>
            <code code="R034" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R034'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="verhouding_draaglastdraagkracht_onderzocht">
                <component>
                    <!-- Template :: obs Verhouding draaglast-draagkracht onderzocht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40339"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="balans_draaglastdraagkracht">
                <component>
                    <!-- Template :: obs balans draaglastdraagkracht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40348"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_verhouding_draaglastdraagkracht">
                <component>
                    <!-- Template :: obs Bijzonderheden verhouding draaglast-draagkracht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40349"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>
    
    <!-- obs balans draaglastdraagkracht -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40348">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40348"/>
            <code code="348" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '348'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: balans draaglastdraagkracht-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

</xsl:stylesheet>
