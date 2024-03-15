<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11045">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11045"/>
            <code code="R045" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R045'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="_1_houdt_rekening_met_gevoelens_van_anderen">
                <component>
                    <!-- Template :: obs 1. Houdt rekening met gevoelens van anderen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41078"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_2_is_rusteloos">
                <component>
                    <!-- Template :: obs 2. Is rusteloos -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41079"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_3_klaagt_vaak_over_hoofdpijn">
                <component>
                    <!-- Template :: obs 3. Klaagt vaak over hoofdpijn -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41080"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_4_deelt_makkelijk_met_andere_jeugdigen">
                <component>
                    <!-- Template :: obs 4. Deelt makkelijk met andere jeugdigen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41081"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_5_heeft_vaak_driftbuien_of_woedeuitbarstingen">
                <component>
                    <!-- Template :: obs 5. Heeft vaak driftbuien of woede-uitbarstingen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41082"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_6_is_nogal_op_zichzelf">
                <component>
                    <!-- Template :: obs 6. Is nogal op zichzelf -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41083"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_7_is_doorgaans_gehoorzaam">
                <component>
                    <!-- Template :: obs 7. Is doorgaans gehoorzaam -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41084"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_8_heeft_veel_zorgen">
                <component>
                    <!-- Template :: obs 8. Heeft veel zorgen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41085"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_9_is_behulpzaam_als_iemand_zich_heeft_bezeerd">
                <component>
                    <!-- Template :: obs 9. Is behulpzaam als iemand zich heeft bezeerd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41086"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_10_is_constant_aan_het_wiebelen_of_wriemelen">
                <component>
                    <!-- Template :: obs 10. Is constant aan het wiebelen of wriemelen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41087"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_11_heeft_minstens_een_goede_vriend_of_vriendin">
                <component>
                    <!-- Template :: obs 11. Heeft minstens één goede vriend of vriendin -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41088"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_12_vecht_vaak_met_andere_jeugdigen_of_pest_ze">
                <component>
                    <!-- Template :: obs 12. Vecht vaak met andere jeugdigen of pest ze -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41089"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_13_is_vaak_ongelukkig">
                <component>
                    <!-- Template :: obs 13. Is vaak ongelukkig -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41090"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_14_wordt_over_het_algemeen_aardig_gevonden_door_andere_jeugdigen">
                <component>
                    <!-- Template :: obs 14. Wordt over het algemeen aardig gevonden door andere jeugdigen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41091"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_15_is_gemakkelijk_afgeleid">
                <component>
                    <!-- Template :: obs 15. Is gemakkelijk afgeleid -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41092"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_16_is_zenuwachtig_of_zich_vastklampend_in_nieuwe_situaties">
                <component>
                    <!-- Template :: obs 16. Is zenuwachtig of zich vastklampend in nieuwe situaties -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41093"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_17_is_aardig_tegen_jongere_kinderen">
                <component>
                    <!-- Template :: obs 17. Is aardig tegen jongere kinderen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41094"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_18_liegt_of_bedriegt_vaak">
                <component>
                    <!-- Template :: obs 18. Liegt of bedriegt vaak -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41095"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_19_wordt_getreiterd_of_gepest_door_andere_jeugdigen">
                <component>
                    <!-- Template :: obs 19. Wordt getreiterd of gepest door andere jeugdigen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41096"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_20_biedt_vaak_vrijwillig_hulp_aan_anderen">
                <component>
                    <!-- Template :: obs 20. Biedt vaak vrijwillig hulp aan anderen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41097"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_21_denkt_na_voor_iets_te_doen">
                <component>
                    <!-- Template :: obs 21. Denkt na voor iets te doen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41098"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_22_pikt_dingen_thuis">
                <component>
                    <!-- Template :: obs 22. Pikt dingen thuis -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41099"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_23_kan_beter_opschieten_met_volwassenen_dan_met_andere_jeugdigen">
                <component>
                    <!-- Template :: obs 23. Kan beter opschieten met volwassenen dan met andere jeugdigen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41100"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_24_is_voor_heel_veel_bang">
                <component>
                    <!-- Template :: obs 24. Is voor heel veel bang -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41101"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="_25_maakt_opdrachten_af">
                <component>
                    <!-- Template :: obs 25. Maakt opdrachten af -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41102"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="heeft_u_opmerkingenq">
                <component>
                    <!-- Template :: obs Heeft u opmerkingen? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41103"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="denkt_u_over_het_geheel_genomen_dat_uw_kind_moeilijkheden_heeft_op_een_of_meer_van_de_volgende_gebieden_emoties_concentratie_gedrag_of_vermogen_om_met_andere_mensen_op_te_schietenq">
                <component>
                    <!-- Template :: obs Denkt u over het geheel genomen dat uw kind moeilijkheden heeft op één of meer van de volgende gebieden: emoties, concentratie, gedrag of vermogen om met andere mensen op te schieten? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41104"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="hoe_lang_bestaan_deze_moeilijkhedenq">
                <component>
                    <!-- Template :: obs Hoe lang bestaan deze moeilijkheden? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41105"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="maken_de_moeilijkheden_uw_kind_overstuur_of_van_slagq">
                <component>
                    <!-- Template :: obs Maken de moeilijkheden uw kind overstuur of van slag? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41106"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="belemmering_thuis">
                <component>
                    <!-- Template :: obs Belemmering thuis -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41107"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="belemmering_vriendschappen">
                <component>
                    <!-- Template :: obs Belemmering vriendschappen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41108"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="belemmering_leren_in_de_klas">
                <component>
                    <!-- Template :: obs Belemmering leren in de klas -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41109"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="belemmering_activiteiten_in_de_vrije_tijd">
                <component>
                    <!-- Template :: obs Belemmering activiteiten in de vrije tijd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41110"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="belasten_de_moeilijkheden_u_of_het_gezin_als_geheelq">
                <component>
                    <!-- Template :: obs Belasten de moeilijkheden u of het gezin als geheel? -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41111"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="score_emotionele_problemen">
                <component>
                    <!-- Template :: obs Score emotionele problemen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41112"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="score_gedragsproblemen">
                <component>
                    <!-- Template :: obs Score gedragsproblemen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41113"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="score_problemen_leeftijdsgenoten">
                <component>
                    <!-- Template :: obs Score problemen leeftijdsgenoten -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41114"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="score_hyperactiviteit">
                <component>
                    <!-- Template :: obs Score hyperactiviteit -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41115"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="score_prosociaal_gedrag">
                <component>
                    <!-- Template :: obs Score pro-sociaal gedrag -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41117"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="sdq_impactscore">
                <component>
                    <!-- Template :: obs SDQ impactscore -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41447"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="sdq_totaal_score">
                <component>
                    <!-- Template :: obs SDQ totaal score -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41116"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41078">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41078"/>
            <code code="1078" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1078'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _1_houdt_rekening_met_gevoelens_van_anderen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41079">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41079"/>
            <code code="1079" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1079'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _2_is_rusteloos-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41080">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41080"/>
            <code code="1080" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1080'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _3_klaagt_vaak_over_hoofdpijn-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41081">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41081"/>
            <code code="1081" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1081'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _4_deelt_makkelijk_met_andere_kinderen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41082">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41082"/>
            <code code="1082" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1082'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _5_heeft_vaak_driftbuien_of_woedeuitbarstingen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41083">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41083"/>
            <code code="1083" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1083'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _6_is_nogal_op_zichzelf-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41084">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41084"/>
            <code code="1084" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _7_is_doorgaans_gehoorzaam-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41085">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41085"/>
            <code code="1085" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1085'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _8_heeft_veel_zorgen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41086">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41086"/>
            <code code="1086" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1086'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _9_is_behulpzaam_als_iemand_zich_heeft_bezeerd-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41087">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41087"/>
            <code code="1087" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1087'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _10_is_constant_aan_het_wiebelen_of_wriemelen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41088">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41088"/>
            <code code="1088" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1088'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _11_heeft_minstens_een_goede_vriend_of_vriendin-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41089">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41089"/>
            <code code="1089" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1089'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _12_vecht_vaak_met_andere_kinderen_of_pest_ze-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41090">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41090"/>
            <code code="1090" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1090'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _13_is_vaak_ongelukkig-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41091">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41091"/>
            <code code="1091" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1091'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _14_wordt_over_het_algemeen_aardig_gevonden_door_andere_kinderen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41092">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41092"/>
            <code code="1092" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1092'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _15_is_gemakkelijk_afgeleid-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41093">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41093"/>
            <code code="1093" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1093'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _16_is_zenuwachtig_of_zich_vastklampend_in_nieuwe_situaties-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41094">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41094"/>
            <code code="1094" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1094'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _17_is_aardig_tegen_jongere_kinderen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41095">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41095"/>
            <code code="1095" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1095'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _18_liegt_of_bedriegt_vaak-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41096">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41096"/>
            <code code="1096" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1096'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _19_wordt_getreiterd_of_gepest_door_andere_kinderen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41097">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41097"/>
            <code code="1097" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1097'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _20_biedt_vaak_vrijwillig_hulp_aan_anderen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41098">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41098"/>
            <code code="1098" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1098'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _21_denkt_na_voor_iets_te_doen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41099">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41099"/>
            <code code="1099" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1099'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _22_pikt_dingen_thuis-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41100">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41100"/>
            <code code="1100" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _23_kan_beter_opschieten_met_volwassenen_dan_met_andere_kinderen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41101">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41101"/>
            <code code="1101" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1101'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _24_is_voor_heel_veel_bang-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41102">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41102"/>
            <code code="1102" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1102'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: _25_maakt_opdrachten_af-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41103">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41103"/>
            <code code="1103" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1103'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: heeft_u_opmerkingenq-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41104">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41104"/>
            <code code="1104" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1104'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: denkt_u_over_het_geheel_genomen_dat_uw_kind_moeilijkheden_heeft_op_een_of_meer_van_de_volgende_gebieden_emoties_concentratie_gedrag_of_vermogen_om_niet_andere_mensen_op_te_schietenq-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41105">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41105"/>
            <code code="1105" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: hoe_lang_bestaan_deze_moeilijkhedenq-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41106">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41106"/>
            <code code="1106" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: maken_de_moeilijkheden_uw_kind_overstuur_of_van_slagq-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41107">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41107"/>
            <code code="1107" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: belemmering_thuis-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41108">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41108"/>
            <code code="1108" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1108'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: belemmering_vriendschappen-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41109">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41109"/>
            <code code="1109" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1109'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: belemmering_leren_in_de_klas-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41110">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41110"/>
            <code code="1110" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1110'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: belemmering_activiteiten_in_de_vrije_tijd-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41111">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41111"/>
            <code code="1111" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1111'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: belasten_de_moeilijkheden_u_of_het_gezin_als_geheelq-->
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41112">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41112"/>
            <code code="1112" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1112'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: score_emotionele_problemen-->
            <xsl:call-template name="makeINTValue">
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41113">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41113"/>
            <code code="1113" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1113'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: score_gedragsproblemen-->
            <xsl:call-template name="makeINTValue">
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41114">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41114"/>
            <code code="1114" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1114'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: score_problemen_leeftijdsgenoten-->
            <xsl:call-template name="makeINTValue">
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41115">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41115"/>
            <code code="1115" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1115'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: score_hyperactiviteit-->
            <xsl:call-template name="makeINTValue">
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41116">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41116"/>
            <code code="1116" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1116'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: sdq_totaal_score-->
            <xsl:call-template name="makeINTValue">
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41117">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41117"/>
            <code code="1117" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1117'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: score_prosociaal_gedrag-->
            <xsl:call-template name="makeINTValue">
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

    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.41447">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.41447"/>
            <code code="1447" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '1447'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: sdq_impactscore-->
            <xsl:call-template name="makeINTValue">
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
