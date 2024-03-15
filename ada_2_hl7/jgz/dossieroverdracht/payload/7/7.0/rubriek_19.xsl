<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"  version="2.0">

    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

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
            <xsl:for-each select="bijzonderheden_voedingeetgedrag">
                <component>
                    <!-- Template :: obs Bijzonderheden voeding/eetgedrag -->
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
 
    <!-- obs Anamnese -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40748">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40748"/>
            <code code="748" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '748'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: anamnese-->
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
    
    <!-- obs Ervaren gezondheid -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40514">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40514"/>
            <code code="514" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '514'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: ervaren_gezondheid-->
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
    
    <!-- obs Bijzonderheden voeding/eetgedrag -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40323">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40323"/>
            <code code="323" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_voedingeetgedrag-->
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
    
    <!-- obs Melkvoeding op dit moment -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40496">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40496"/>
            <code code="496" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '496'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: melkvoeding_op_dit_moment-->
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
    
    <!-- obs Vitamine K -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41337">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41337"/>
            <code code="1337" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1337'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: vitamine_k-->
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
    
    <!-- obs Vitamine D -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41338">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41338"/>
            <code code="1338" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1338'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: vitamine_d-->
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
    
    <!-- obs Toelichting vitamine -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41339">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41339"/>
            <code code="1339" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1339'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: toelichting_vitamine-->
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
    
    <!-- obs Bijzonderheden slapen/waken -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40322">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40322"/>
            <code code="322" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_slapenwaken-->
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
    
    <!-- obs Bijzonderheden mondgedrag -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40179">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40179"/>
            <code code="179" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '179'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_mondgedrag-->
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
    
    <!-- obs Poetsen gebit -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40188">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40188"/>
            <code code="188" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '188'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: poetsen_gebit-->
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
    
    <!-- obs Tandartsbezoek -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40190">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40190"/>
            <code code="190" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '190'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: tandartsbezoek-->
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
    
    <!-- obs Bijzonderheden lichaamsbeweging -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40330">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40330"/>
            <code code="330" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '330'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_lichaamsbeweging-->
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
    
    <!-- obs Passief roken in huis -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40510">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40510"/>
            <code code="510" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '510'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: passief_roken_in_huis-->
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
    
    <!-- obs Bijzonderheden vrijetijdsbesteding -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40752">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40752"/>
            <code code="752" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '752'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: bijzonderheden_vrijetijdsbesteding-->
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
    
    <!-- obs Zwemdiploma -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40753">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40753"/>
            <code code="753" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '753'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: zwemdiploma-->
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
    
    <!-- obs Zwemles -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41499">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41499"/>
            <code code="1499" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1499'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: zwemles-->
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
    
    <!-- obs Schoolzwemmen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41500">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41500"/>
            <code code="1500" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1500'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: schoolzwemmen-->
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

    <!-- obs Datum opname ziekenhuis -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41412">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41412"/>
            <code code="1412" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1412'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: datum_opname_ziekenhuis-->
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType">TS</xsl:with-param>
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
    
    <!-- obs Reden opname ziekenhuis -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40150">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40150"/>
            <code code="150" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '150'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: reden_opname_ziekenhuis-->
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
    
    <!-- obs Duur opname ziekenhuis -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40149">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40149"/>
            <code code="149" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '149'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: duur_opname_ziekenhuis-->
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="unit">d</xsl:with-param>
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
    
    <!-- obs Consult huisarts/specialist/derden -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40754">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40754"/>
            <code code="754" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '754'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: consult_huisartsspecialistderden-->
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
    
    <!-- obs (Kinder-)ziekten -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40152">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40152"/>
            <code code="152" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '152'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: kinderziekten-->
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
    
    <!-- obs Operaties -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40153">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40153"/>
            <code code="153" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '153'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: operaties-->
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
    
    <!-- obs Ongevallen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40154">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40154"/>
            <code code="154" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '154'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: ongevallen-->
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
    
    <!-- obs Medicijn gebruik -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40155">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40155"/>
            <code code="155" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '155'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: medicijn_gebruik-->
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
    
    <!--obs_Medicijngebruik_tijdens_zwangerschap-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41588">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41588"/>
            <code code="1588" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1588'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="xsiType">CV</xsl:with-param>
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
    
    <!-- obs Ingrijpende gebeurtenissen -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40755">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40755"/>
            <code code="755" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '755'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: ingrijpende_gebeurtenissen-->
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
    
    <!-- obs_A_terme_datum-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41578">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41578"/>
            <code code="1578" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1578'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="xsiType">TS</xsl:with-param>
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
    
    <!--obs_Kinkhoest doorgemaakt na zwangerschapsduur 12w6d-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41580">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41580"/>
            <code code="1580" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1580'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="xsiType">BL</xsl:with-param>
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
    
    <!--obs_Kinkhoestvaccinatie gekregen na zwangerschapsduur 12w6d-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41582">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41582"/>
            <code code="1582" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1582'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="xsiType">BL</xsl:with-param>
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
    
    <!--obs_Stollingsstoornis-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41585">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41585"/>
            <code code="1585" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1585'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="xsiType">BL</xsl:with-param>
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
    
    <!--obs_Chronisch drager Hepatitis-B-->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41586">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41586"/>
            <code code="1586" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1586'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="xsiType">BL</xsl:with-param>
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