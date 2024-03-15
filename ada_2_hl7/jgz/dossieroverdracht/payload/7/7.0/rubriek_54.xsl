<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.11054">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11054"/>
            <code code="R054" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R054'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <!--Screeningsinstrument psychosociale problematiek: 1341 0..1 (W0640, KL_AN, Screeningsinstrument PP)-->
            <!--Datum afname SPP: 1342 0..1 (W0025, TS, Datum)-->
            <!--SPP ingevuld door: 1343 0..1 (W0641, KL_AN, SPP ingevuld door)-->
            <!--Plaats van afname SPP: 1344 0..1 (W0611, KL_AN, Wijze van afname)-->
            <!--Bijzonderheden SPP: 1345 0..1 (W0020, AN, Alfanumeriek 200)-->
            <xsl:if test="screeningsinstrument_psychosociale_problematiek | datum_afname_spp | spp_ingevuld_door | plaats_van_afname_spp | bijzonderheden_spp">
                <component>
                    <!-- Template :: obs Bijzonderheden SPP -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41345"/>
                </component>
            </xsl:if>
            <!--Conclusie SPP: 1346 0..1 (W0082, AN, Alfanumeriek 4000)-->
            <xsl:for-each select="conclusie_spp">
                <component>
                    <!-- Template :: obs Conclusie SPP -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41346"/>
                </component>
            </xsl:for-each>
            <!--Overall risicoinschatting SPARK: 1495 0..1 (W0669, KL_AN, SPARK-risicoinschatting)-->
            <xsl:for-each select="overall_risicoinschatting_spark">
                <component>
                    <!-- Template :: obs Overall risicoinschatting SPARK -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41495"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41345">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41345"/>
            <code code="1345" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1345'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_afname_spp-->
            <xsl:for-each select="datum_afname_spp">
                <xsl:call-template name="makeTSValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <!-- Item(s) :: bijzonderheden_spp-->
            <xsl:choose>
                <xsl:when test="bijzonderheden_spp">
                    <xsl:for-each select="bijzonderheden_spp">
                        <xsl:call-template name="makeSTValue">
                            <xsl:with-param name="elemName">value</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <value xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="ST" nullFlavor="NI"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- Item(s) :: screeningsinstrument_psychosociale_problematiek-->
            <xsl:for-each select="screeningsinstrument_psychosociale_problematiek">
                <xsl:call-template name="makeCVValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">methodCode</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <performer typeCode="PRF">
                <assignedEntity classCode="ASSIGNED">
                    <!-- Item(s) :: spp_ingevuld_door-->
                    <xsl:for-each select="spp_ingevuld_door">
                        <xsl:call-template name="makeCVValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">code</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </assignedEntity>
            </performer>
            <location typeCode="LOC">
                <serviceDeliveryLocation>
                    <!-- Item(s) :: plaats_van_afname_spp-->
                    <xsl:for-each select="plaats_van_afname_spp">
                        <xsl:call-template name="makeCVValue">
                            <xsl:with-param name="xsiType" select="''"/>
                            <xsl:with-param name="elemName">code</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </serviceDeliveryLocation>
            </location>
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41346">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41346"/>
            <code code="1346" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1346'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: conclusie_spp-->
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

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="template_2.16.840.1.113883.2.4.6.10.100.41495">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41495"/>
            <code code="1495" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1495'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: overall_risicoinschatting_spark-->
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

</xsl:stylesheet>
