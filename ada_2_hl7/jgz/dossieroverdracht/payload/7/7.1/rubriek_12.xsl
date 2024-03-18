<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"  version="2.0">
    
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>
    
    <xsl:import href="../7.0/rubriek_12.xsl"/>
    
    <!-- Rubriek 12 Erfelijke belasting en ouderkenmerken -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11012">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11012"/>
            <code code="R012" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R012'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="erfelijke_belasting_en_ouderkenmerken_nagevraagd">
                <component>
                    <!-- Template :: obs Erfelijke belasting en ouderkenmerken nagevraagd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40079"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g019_erfelijke_factoren_in_de_familie">
                <component>
                    <groupCluster>
                        <code code="G019" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G019'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="erfelijk_bepaalde_ziekte_in_de_familie">
                            <component>
                                <!-- Template :: obs Erfelijke bepaalde ziekte in de familie -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40080"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="toelichting_erfelijke_factoren_in_de_familie">
                            <component>
                                <!-- Template :: obs Toelichting erfelijke factor(en) in de familie -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41608"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g020_kenmerken_ouderverzorger">
                <component>
                    <groupCluster>
                        <code code="G020" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G020'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="kenmerken_ouderverzorger">
                            <component>
                                <!-- Template :: obs Kenmerken ouder/verzorger -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40070"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="lengte_biologische_moeder">
                <component>
                    <!-- Template :: obs Lengte biologische moeder -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40238"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="lengte_biologische_vader">
                <component>
                    <!-- Template :: obs Lengte biologische vader -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40240"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_lengte_ouders">
                <component>
                    <!-- Template :: obs Bijzonderheden lengte ouders -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40808"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>
    
    <!-- obs Toelichting erfelijke factor(en) in de familie -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41608">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41608"/>
            <code code="1608" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1608'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: toelichting_erfelijke_factoren_in_de_familie-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

</xsl:stylesheet>
