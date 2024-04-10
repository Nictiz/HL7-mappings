<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">

    <xsl:param name="W0639_HL7_W0646_HL7_W0647_HL7" select="'default'"/>
    
    <xsl:import href="../7.0/rubriek_21.xsl"/>
    
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.11021">
        <rubricCluster xmlns="urn:hl7-org:v3" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.11021"/>
            <code code="R021" codeSystem="2.16.840.1.113883.2.4.4.40.391">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = 'R021'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']/@displayName"/>
            </code>
            <xsl:for-each select="lichamelijk_functioneren_nagevraagd">
                <component>
                    <!-- Template :: obs Lichamelijk functioneren nagevraagd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40321"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="zindelijkheid">
                <component>
                    <!-- Template :: obs Zindelijkheid -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40324"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_ontlastenplassenzindelijkheid">
                <component>
                    <!-- Template :: obs Bijzonderheden ontlasten/plassen/zindelijkheid -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40325"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="seksueel_actief">
                <component>
                    <!-- Template :: obs Seksueel actief -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40770"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="anticonceptie">
                <component>
                    <!-- Template :: obs Anticonceptie -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40771"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="adaptatiepersoonlijkheidsociaal_gedrag_nagevraagd">
                <component>
                    <!-- Template :: obs Adaptatie/persoonlijkheid/sociaal gedrag nagevraagd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40772"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_hechting">
                <component>
                    <!-- Template :: obs Bijzonderheden hechting -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40773"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="relatie_met_ouderverzorger">
                <component>
                    <!-- Template :: obs relatie met ouder/verzorger -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40774"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_gedragtemperament">
                <component>
                    <!-- Template :: obs Bijzonderheden gedrag/temperament -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40328"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_karakterpersoonlijkheid">
                <component>
                    <!-- Template :: obs Bijzonderheden karakter/persoonlijkheid -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40775"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_zelfbeeld">
                <component>
                    <!-- Template :: obs Bijzonderheden zelfbeeld -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40776"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_stemmingangsten">
                <component>
                    <!-- Template :: obs Bijzonderheden stemming/angsten -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40777"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_ontdekkingsdrang">
                <component>
                    <!-- Template :: obs Bijzonderheden ontdekkingsdrang -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40778"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_zelfstandigheid">
                <component>
                    <!-- Template :: obs Bijzonderheden zelfstandigheid -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40779"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_begrijpen">
                <component>
                    <!-- Template :: obs Bijzonderheden begrijpen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40780"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_wilsontwikkeling">
                <component>
                    <!-- Template :: obs Bijzonderheden wilsontwikkeling -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40781"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_omgaan_met_broerzusleeftijdgenoten">
                <component>
                    <!-- Template :: obs Bijzonderheden omgaan met broer/zus/leeftijdgenoten -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41422"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_contact_met_volwassenen">
                <component>
                    <!-- Template :: obs Bijzonderheden contact met volwassenen -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40782"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_omgaan_met_nieuwe_situaties">
                <component>
                    <!-- Template :: obs Bijzonderheden omgaan met nieuwe situaties -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40783"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_gewelddelinquent_gedrag">
                <component>
                    <!-- Template :: obs Bijzonderheden geweld/delinquent gedrag -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40784"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_verslavingsrisico">
                <component>
                    <!-- Template :: obs Bijzonderheden verslavingsrisico -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40785"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="toelichting_verslavingsrisico">
                <component>
                    <!-- Template :: obs Toelichting verslavingsrisico -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40786"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="functioneren_op_school_nagevraagd">
                <component>
                    <!-- Template :: obs Functioneren op school nagevraagd -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40787"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_functioneren_in_de_klas">
                <component>
                    <!-- Template :: obs Bijzonderheden functioneren in de klas -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40790"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="bijzonderheden_indruk_school">
                <component>
                    <!-- Template :: obs Bijzonderheden indruk school -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.40791"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="schoolverzuim">
                <component>
                    <!-- Template :: obs Bijzonderheden schoolverzuim -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41601"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="toelichting_schoolverzuim">
                <component>
                    <!-- Template :: obs Bijzonderheden schoolverzuim -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41602"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="advies_met_betrekking_tot_deelname_aan_lesprogramma">
                <component>
                    <!-- Template :: obs Bijzonderheden schoolverzuim -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41603"/>
                </component>
            </xsl:for-each>
            <xsl:for-each select="toelichting_advies_met_betrekking_tot_deelname_lesprogramma">
                <component>
                    <!-- Template :: obs Bijzonderheden schoolverzuim -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.100.41604"/>
                </component>
            </xsl:for-each>
        </rubricCluster>
    </xsl:template>

    <!-- relatie met ouder/verzorger -->
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.100.40774">
        <observation xmlns="urn:hl7-org:v3" classCode="OBS" moodCode="EVN" negationInd="false">
            <templateId root="2.16.840.1.113883.2.4.6.10.100.40774"/>
            <code code="774" codeSystem="2.16.840.1.113883.2.4.4.40.267">
                <xsl:copy-of select="$W0639_HL7_W0646_HL7_W0647_HL7/conceptList/concept[@code = '774'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']/@displayName"/>
            </code>
            <!-- Item(s) :: relatie met ouder/verzorger-->
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

</xsl:stylesheet>
