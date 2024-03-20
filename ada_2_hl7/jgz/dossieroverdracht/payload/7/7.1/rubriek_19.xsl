<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"  version="2.0">
    
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:import href="../7.0/rubriek_19.xsl"/>
    
    <!-- Rubriek 19 Terugkerende anamnese -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11019">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11019"/>
            <code code="R019" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R019'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="anamnese">
                <component>
                    <!-- Template :: obs Anamnese -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40748"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="ervaren_gezondheid">
                <component>
                    <!-- Template :: obs Ervaren gezondheid -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40514"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="voeding_en_eetgedrag">
                <component>
                    <!-- Template :: obs voeding en eetgedrag -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40323"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="melkvoeding_op_dit_moment">
                <component>
                    <!-- Template :: obs Melkvoeding op dit moment -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40496"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="vitamine_k">
                <component>
                    <!-- Template :: obs Vitamine K -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41337"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="vitamine_d">
                <component>
                    <!-- Template :: obs Vitamine D -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41338"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="toelichting_vitamine">
                <component>
                    <!-- Template :: obs Toelichting vitamine -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41339"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_slapenwaken">
                <component>
                    <!-- Template :: obs Bijzonderheden slapen/waken -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40322"/>
                </component>
            </xsl:for-each>
            
            <xsl:for-each select="bijzonderheden_huilen">
                <component>
                    <!-- Template :: obs Bijzonderheden huilen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41611"/>
                </component>
            </xsl:for-each>
            
            <xsl:for-each select="bijzonderheden_mondgedrag">
                <component>
                    <!-- Template :: obs Bijzonderheden mondgedrag -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40179"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="poetsen_gebit">
                <component>
                    <!-- Template :: obs Poetsen gebit -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40188"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="tandartsbezoek">
                <component>
                    <!-- Template :: obs Tandartsbezoek -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40190"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="passief_roken_in_huis">
                <component>
                    <!-- Template :: obs Passief roken in huis -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40510"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_lichaamsbeweging">
                <component>
                    <!-- Template :: obs Bijzonderheden lichaamsbeweging -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40330"/>
                </component>
            </xsl:for-each>
            
            <xsl:for-each select="leefstijl">
                <component>
                    <!-- Template :: obs Leefstijl-->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41612"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_vrijetijdsbesteding">
                <component>
                    <!-- Template :: obs Bijzonderheden vrijetijdsbesteding -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40752"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="zwemdiploma">
                <component>
                    <!-- Template :: obs Zwemdiploma -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40753"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="zwemles">
                <component>
                    <!-- Template :: obs Zwemles -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41499"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="schoolzwemmen">
                <component>
                    <!-- Template :: obs Schoolzwemmen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41500"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="groep_g087_opname_ziekenhuis">
                <component>
                    <groupCluster>
                        <code code="G087" codeSystem="2.16.840.1.113883.2.4.4.40.393">
                            <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'G087'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']/@displayName"/>
                        </code>
                        <xsl:for-each select="reden_opname_ziekenhuis">
                            <component>
                                <!-- Template :: obs Reden opname ziekenhuis -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40150"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="datum_opname_ziekenhuis">
                            <component>
                                <!-- Template :: obs Datum opname ziekenhuis -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41412"/>
                            </component>
                        </xsl:for-each>
                        <xsl:for-each select="duur_opname_ziekenhuis">
                            <component>
                                <!-- Template :: obs Duur opname ziekenhuis -->
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40149"/>
                            </component>
                        </xsl:for-each>
                    </groupCluster>
                </component>
            </xsl:for-each>
            <xsl:for-each select="ontvangen_paramedische_zorg">
                <component>
                    <!-- Template :: obs Consult huisarts/specialist/derden -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40754"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="kinderziekten">
                <component>
                    <!-- Template :: obs (Kinder-)ziekten -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40152"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="operaties">
                <component>
                    <!-- Template :: obs Operaties -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40153"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="ongevallen">
                <component>
                    <!-- Template :: obs Ongevallen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40154"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="medicijn_gebruik">
                <component>
                    <!-- Template :: obs Medicijn gebruik -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40155"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="medicijngebruik_tijdens_zwangerschap">
                <component>
                    <!-- Template :: obs medicijngebruik_tijdens_zwangerschap -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41588"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="ingrijpende_gebeurtenissen">
                <component>
                    <!-- Template :: obs Ingrijpende gebeurtenissen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40755"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="a_terme_datum">
                <component>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41578"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="kinkhoest_doorgemaakt_na_zwangerschapsduur_12w6d">
                <component>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41580"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="kinkhoestvaccinatie_gekregen_na_zwangerschapsduur_12w6d">
                <component>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41582"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="stollingsstoornis">
                <component>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41585"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="chronisch_drager_hepatitisb">
                <component>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41586"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>
 
    <!-- obs bijzonderheden huilen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41611">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41611"/>
            <code code="1611" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1611'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden huilen-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <!-- obs leefstijl -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41612">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41612"/>
            <code code="1612" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1612'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: leefstijl-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
 
 
    <!-- obs voeding_en_eetgedrag -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40323">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40323"/>
            <code code="323" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: voeding_en_eetgedrag-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
</xsl:stylesheet>