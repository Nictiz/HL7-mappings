<?xml version="1.0" encoding="UTF-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"  version="2.0">
    <import href="../../../../../hl7/2_hl7_hl7_include.xsl"/>

    <xsl:variable name="ExportWithQualificationPlaceholder" select="false()"/>
    <xsl:variable name="DOB" select="(.//geboortedatum[@id = 'DOB']/@value)[1]"/>

    <!-- Rubriek 18 Activiteit -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11018">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11018"/>
            <code code="R018" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Activiteit"/>
            <xsl:for-each select="vorm_activiteit">
                <component>
                    <!-- obs_Vorm activiteit -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41577"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="status_activiteit">
                <component>
                    <!-- obs_Status activiteit -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41605"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>
    
    <!-- obs Vorm activiteit -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41577">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41577"/>
            <code code="1577" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1577'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028_20200527000000"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029_20200527000000"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>
    
    <!-- obs Status activiteit -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41605">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41605"/>
            <code code="1605" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1605'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
            <!--<xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component1>
                    <!-\- Template :: Activities component1 NonBDSData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10028_20200527000000"/>
                </component1>
            </xsl:for-each>
            <xsl:for-each select="r051_nietgespecificeerde_gegevens | groep_g083_niet_gespecificeerde_gegevens">
                <component2>
                    <!-\- Template :: Activities component2 MetaData -\->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.10029_20200527000000"/>
                </component2>
            </xsl:for-each>-->
        </observation>
    </xsl:template>
    
</stylesheet>
