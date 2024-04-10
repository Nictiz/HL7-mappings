<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:import href="../7.0/rubriek_27.xsl"/>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11027">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11027"/>
            <code code="R027" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R027'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="bijzonderheden_groei">
                <component>
                    <!-- Template :: obs Bijzonderheden groei -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40234"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="lengte">
                <component>
                    <!-- Template :: obs Lengte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40235"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="conclusie_jgzprofessional_lengtegroei">
                <component>
                    <!-- Template :: obs Conclusie JGZ-professional lengtegroei -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41614"/>
                </component>
            </xsl:for-each>
            
            <xsl:for-each select="welk_groeidiagram_wordt_gebruikt">
                <component>
                    <!-- Template :: obs welk groeidiagram wordt gebruikt -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41616"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="gewicht">
                <component>
                    <!-- Template :: obs Gewicht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40245"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="indruk_jgz_professional_gewichtlengte">
                <component>
                    <!-- Template :: obs Indruk JGZ professional gewicht/lengte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40247"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="middelomtrek_in_millimeters">
                <component>
                    <!-- Template :: obs Middelomtrek in millimeters -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41485"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hoofdomtrek">
                <component>
                    <!-- Template :: obs Hoofdomtrek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40252"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>
    
    <!-- obs Conclusie JGZ-professional lengtegroei -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41614">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41614"/>
            <code code="1614" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1614'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: Conclusie JGZ-professional lengtegroei-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs welk groeidiagram wordt gebruikt  -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41616">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41616"/>
            <code code="1616" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1616'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: welk groeidiagram wordt gebruikt-->
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

</xsl:stylesheet>
