<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11027">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11027"/>
            <code code="R027" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R027'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="bijzonderheden_groei">
                <component><!-- Template :: obs Bijzonderheden groei -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40234"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="lengte">
                <component><!-- Template :: obs Lengte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40235"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="gewicht">
                <component><!-- Template :: obs Gewicht -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40245"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="indruk_jgz_professional_gewichtlengte">
                <component><!-- Template :: obs Indruk JGZ professional gewicht/lengte -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40247"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="middelomtrek_in_millimeters">
                <component><!-- Template :: obs Middelomtrek in millimeters -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41485"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hoofdomtrek">
                <component><!-- Template :: obs Hoofdomtrek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40252"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40234">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40234"/>
            <code code="234" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '234'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_groei-->
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
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40235">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40235"/>
            <code code="235" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '235'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: lengte-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">mm</xsl:with-param>
            </xsl:call-template>
            <!-- Item(s) :: methode_lengtemeting-->
            <xsl:for-each select="../methode_lengtemeting">
                <xsl:call-template name="makeCVValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
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
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40245">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40245"/>
            <code code="245" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '245'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: gewicht-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">g</xsl:with-param>
            </xsl:call-template>
            <!-- Item(s) :: methode_gewichtsmeting-->
            <xsl:for-each select="../methode_gewichtsmeting">
                <xsl:call-template name="makeCVValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
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
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40247">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40247"/>
            <code code="247" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '247'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: indruk_jgz_professional_gewichtlengte-->
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
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40252">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40252"/>
            <code code="252" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '252'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: hoofdomtrek-->
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
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41485">
        <observation xmlns="urn:hl7-org:v3"
            classCode="OBS"
            moodCode="EVN"
            negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41485"/>
            <code code="1485" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1485'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: middelomtrek_in_millimeters-->
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
    
</xsl:stylesheet>
