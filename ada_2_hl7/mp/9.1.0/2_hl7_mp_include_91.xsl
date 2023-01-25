<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../2_hl7_mp_include.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Mapping xslt for creating HL7 for Medicatieproces 9.1.x. To be imported or included from another xslt. Only templates for 9.1.x which are not shared by other versions.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>


    <xd:doc>
        <xd:desc>Mapping of medicatieafspraak concept in ADA ('eigen of ongedefinieerde MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9275</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9275_20191121115247" match="medicatieafspraak | medication_agreement">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9275"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.1</xd:desc>
        <xd:param name="in">Input ada element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9276"/>
            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20191121170300"/>

            <xsl:for-each select="afgesproken_geneesmiddel/product[.//(@value | @code)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            <xsl:for-each select="voorschrijver/zorgverlener[.//(@value | @code)]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                        <xsl:with-param name="authorTime" select="../../(afspraak_datum_tijd | afspraakdatum)"/>
                    </xsl:call-template>
                </author>
            </xsl:for-each>
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9278_20191121124933">
                <xsl:with-param name="ma" select="."/>
            </xsl:call-template>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>

            <!-- relaties ketenzorg -->
            <xsl:for-each select="(relaties_ketenzorg | relatie_naar_contactmoment_of_episode)/identificatie_contactmoment[@value]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
            </xsl:for-each>
            <xsl:for-each select="(relaties_ketenzorg | relatie_naar_contactmoment_of_episode)/identificatie_episode[@value]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>
    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.Medicatieafspraak concept in ADA ('andermans MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9277</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9277_20191121123918">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9277"/>
                <!-- inhoud medicatieafspraak -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
     

      <xd:doc>
        <xd:desc> Medicatiegebruik inhoud - vanaf MP 9.1.0</xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551" match="medicatie_gebruik" mode="HandleMGBContents910">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9279"/>
            <xsl:variable name="isInGebruik" select="gebruik_indicator/@value" as="xs:boolean"/>

            <!-- identificatie -->
            <xsl:for-each select="identificatie[.//(@value | @code)]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>

            <code code="6" displayName="Medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>

            <!-- text -->
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:choose>
                <xsl:when test="$generateInstructionText">
                    <text mediaType="text/plain">
                        <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                        <text mediaType="text/plain">
                            <xsl:value-of select="@value"/>
                        </text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <!-- effectiveTime -->
            <xsl:if test="(gebruiksperiode | gebruiksperiode_start | gebruiksperiode_eind)[.//(@value | @nullFlavor)]">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>

            <!-- routeCode -->
            <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
                <xsl:call-template name="makeCDValue">
                    <xsl:with-param name="elemName">routeCode</xsl:with-param>
                    <xsl:with-param name="xsiType" select="''"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- consumable -->
            <xsl:for-each select="gebruiks_product/product[.//(@value | @code)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9263_20181211154012">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>

            <!-- author-->
            <xsl:for-each select="./auteur[.//(@value | @code)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9247_20181205102329">
                    <xsl:with-param name="ada-auteur" select="."/>
                    <xsl:with-param name="authorTime" select="../(registratiedatum | registratie_datum_tijd)"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- Informant van het medicatiegebruik: zorgverlener -->
            <xsl:for-each select="informant/informant_is_zorgverlener/zorgverlener[.//(@value | @code)]">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
                    </assignedEntity>
                </informant>
            </xsl:for-each>

            <!-- Informant van het medicatiegebruik: patiënt -->
            <xsl:if test="informant/informant_is_patient/@value = 'true'">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000"/>
                    </assignedEntity>
                </informant>
            </xsl:if>

            <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
            <xsl:for-each select="informant/persoon[.//(@value | @code)]">
                <informant>
                    <relatedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9103_20160624141250"/>
                    </relatedEntity>
                </informant>
            </xsl:for-each>

            <!-- Gebruik indicator -->
            <xsl:for-each select="gebruik_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Volgens afspraak indicator -->
            <xsl:for-each select="volgens_afspraak_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9317_20200120141110"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Stoptype -->
            <xsl:for-each select="stoptype[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9313_20200116154100"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Aanvullende Instructie. -->
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Reden gebruik -->
            <xsl:for-each select="reden_gebruik[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Reden wijzigen/stoppen gebruik -->
            <xsl:for-each select="reden_wijzigen_of_stoppen_gebruik[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9271_20181218112127"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../../volgnummer[.//(@value | @code | @nullFlavor)]">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="not(../../volgnummer[.//(@value | @code | @nullFlavor)])">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select="./dosering">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9309_20191125164900"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar (voorschrift met) voorschrijver -->
            <xsl:for-each select="voorschrijver/zorgverlener[.//(@value | @code)]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
            <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -->
            <xsl:for-each select="gerelateerde_afspraak/identificatie_medicatieafspraak[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="gerelateerde_afspraak/identificatie_toedieningsafspraak[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar verstrekking -->
            <xsl:for-each select="gerelateerde_verstrekking[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                        <xsl:with-param name="identificatieElement" select="identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar medicamenteuze behandeling -->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> andermans Medicatiegebruik - vanaf MP 9.1.0 </xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9287_20191121150123">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <!-- Feitelijk medicatiegebruik -->
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9287"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>Toedieningsafspraak vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada Toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9299_20191125140232" match="toedieningsafspraak" mode="HandleTA910">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9299"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>



    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9.1.0 </xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9281_20191121142645" match="medicatie_gebruik | medicatiegebruik" mode="HandleMGB910">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9281"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Toedieningsafspraak inhoud vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada input element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358" match="toedieningsafspraak" mode="HandleTAContents910">
        <xsl:param name="in"/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9300"/>
            <xsl:for-each select="identificatie[@value | @root]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:choose>
                <xsl:when test="$generateInstructionText">
                    <text mediaType="text/plain">
                        <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                        <text mediaType="text/plain">
                            <xsl:value-of select="@value"/>
                        </text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="geannuleerd_indicator/@value = 'true'">
                <statusCode code="nullified"/>
            </xsl:if>

            <!-- Gebruiksperiode -->
            <xsl:if test="(gebruiksperiode | gebruiksperiode_start | gebruiksperiode_eind)[.//(@value | @code | @nullFlavor)]">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>

            <!-- toedieningsweg -->
            <xsl:for-each select="gebruiksinstructie/toedieningsweg[@code]">
                <routeCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </routeCode>
            </xsl:for-each>

            <!-- geneesmiddel_bij_toedieningsafspraak -->
            <xsl:for-each select="geneesmiddel_bij_toedieningsafspraak/product[.//(@value | @code | @nullFlavor)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>

            <!-- Verstrekker -->
            <xsl:for-each select="verstrekker/zorgaanbieder[not(zorgaanbieder)][.//(@value | @code | @nullFlavor)]">
                <xsl:variable name="TheAfspraakdatum" select="ancestor::*/(afspraak_datum_tijd | afspraakdatum)[@value | @nullFlavor]"/>
                <author>
                    <time>
                        <xsl:choose>
                            <xsl:when test="$TheAfspraakdatum[not(@nullFlavor)]">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2HL7Date">
                                        <xsl:with-param name="dateTime" select="$TheAfspraakdatum/@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$TheAfspraakdatum[@nullFlavor]">
                                <xsl:attribute name="nullFlavor" select="$TheAfspraakdatum/@nullFalvor"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </time>
                    <assignedAuthor>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                    </assignedAuthor>
                </author>
            </xsl:for-each>

            <!-- stoptype -->
            <xsl:for-each select="stoptype[@code]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9313_20200116154100"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- reden_afspraak -->
            <xsl:for-each select="reden_afspraak[@value]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9315_20200120125612"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- aanvullende_instructie -->
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- aanvullende informatie -->
            <xsl:for-each select="aanvullende_informatie">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="toelichting">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie/dosering">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../volgnummer">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="./@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="empty(../volgnummer)">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select=".">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9309_20191125164900"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!-- relatie naar MA -->
            <xsl:for-each select="relatie_naar_medicatieafspraak[identificatie[@value | @nullFlavor]]">
                <!-- kunnen er 0 of meer zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> 'andermans' Toedieningsafspraak vanaf 9.1.0</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9303_20191125142708">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9303"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create an MP CDA administration schedule based on ada toedieningsschema from MP 9.1.x</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9310_2019128172830" match="toedieningsschema" mode="HandleCDAAdministrationSchedule910">
        <!-- MP CDA Toedienschema -->
        <xsl:if test="(../../../herhaalperiode_cyclisch_schema[.//(@value | @code)]) and (../toedieningsduur[.//(@value | @code)])">
            <error>Herhaalperiode cyclisch schema in combinatie met toedienduur wordt niet ondersteund.</error>
        </xsl:if>
        <xsl:choose>
            <!-- Cyclisch schema -->
            <xsl:when test="../../../herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                <effectiveTime operator="A" xsi:type="SXPR_TS">
                    <xsl:for-each select="frequentie[.//(@value | @code)]">
                        <!-- De frequentie van inname binnen het cyclisch schema. -->
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947"/>
                        </comp>
                    </xsl:for-each>
                    <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                        <comp xsi:type="hl7nl:PIVL_TS">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                <xsl:with-param name="operator">
                                    <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                    <xsl:choose>
                                        <xsl:when test="not(./preceding-sibling::toedientijd)">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'I'"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:with-param>
                                <xsl:with-param name="isFlexible" select="'true'"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                    <!-- cyclisch schema -->
                    <comp>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
                    </comp>
                </effectiveTime>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <!-- Eenvoudig doseerschema met alleen één frequentie. -->
                    <xsl:when test="./frequentie/tijdseenheid[.//(@value | @code)] and not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./frequentie[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met alleen één interval. -->
                    <xsl:when test="not(./frequentie/tijdseenheid[.//(@value | @code)]) and ./interval[.//(@value | @code)] and not(./toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./interval[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met één toedientijd. -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and count(./toedientijd[.//(@value | @code)]) = 1 and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                    <xsl:with-param name="operator" select="'A'"/>
                                    <xsl:with-param name="isFlexible" select="'true'"/>
                                </xsl:call-template>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- doseerschema met toedieningsduur én frequentie en zonder toedientijd -->
                    <xsl:when test="./frequentie/tijdseenheid[.//(@value | @code)] and not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and ../toedieningsduur[.//(@value | @code)] and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                        </effectiveTime>
                    </xsl:when>

                    <!-- doseerschema met toedieningsduur én toedientijd(en) -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and ./toedientijd[.//(@value | @code)] and ../toedieningsduur[.//(@value | @code)] and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime>
                            <xsl:choose>
                                <!-- a separate comp for each toedientijd -->
                                <xsl:when test="count(./toedientijd[@value]) gt 1">
                                    <xsl:attribute name="xsi:type">SXPR_TS</xsl:attribute>
                                    <xsl:for-each select="./toedientijd[@value]">

                                        <comp>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
                                                <xsl:with-param name="in" select="parent::toedieningsschema"/>
                                                <xsl:with-param name="operator">
                                                    <xsl:choose>
                                                        <xsl:when test="position() gt 1">I</xsl:when>
                                                        <xsl:otherwise>A</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:with-param>
                                                <xsl:with-param name="inToedientijd" select="."/>
                                            </xsl:call-template>
                                        </comp>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </effectiveTime>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met meer dan één toedientijd. -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and count(./toedientijd[.//(@value | @code)]) > 1 and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime operator="A" xsi:type="SXPR_TS">
                            <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                                <comp xsi:type="hl7nl:PIVL_TS">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                        <xsl:with-param name="operator">
                                            <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                            <xsl:choose>
                                                <xsl:when test="not(./preceding-sibling::toedientijd)">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="'I'"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:with-param>
                                        <xsl:with-param name="isFlexible" select="'true'"/>
                                    </xsl:call-template>
                                </comp>
                            </xsl:for-each>
                        </effectiveTime>
                    </xsl:when>

                    <!-- Eenmalig gebruik. Of een aantal keer zonder verdere aanduiding wanneer -->
                    <xsl:when test="./frequentie/aantal[.//(@value | @code)] and not(./frequentie/tijdseenheid[.//(@value | @code)]) and not(./interval[.//(@value | @code)])">
                        <xsl:for-each select="./frequentie[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20191202152153"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Doseerschema per week op één weekdag. Met evt een toedientijd -->
                    <xsl:when test="count(./weekdag[.//(@value | @code)]) = 1 and count(./toedientijd[.//(@value | @code)]) &lt;= 1 and not(./frequentie[tijdseenheid/@value != 'week'])">
                        <xsl:variable name="aantalPerWeek">
                            <xsl:value-of select="./frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                        </xsl:variable>
                        <xsl:for-each select="./weekdag[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                    <xsl:with-param name="operator" select="'A'"/>
                                    <xsl:with-param name="toedientijd" select="../toedientijd"/>
                                    <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                    <xsl:with-param name="weekdagCode" select="./@code"/>
                                </xsl:call-template>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Complexer doseerschema met weekdag(en) eventueel gecombineerd met 0 of meer frequenties en vaste tijd(en) -->
                    <xsl:when test="count(./weekdag[.//(@value | @code)]) > 1 or (./weekdag[.//(@value | @code)] and count(./frequentie[tijdseenheid/@value != 'week']) >= 1) or (./weekdag[.//(@value | @code)] and count(./toedientijd[.//(@value | @code)]) > 1)">
                        <xsl:variable name="aantalPerWeek">
                            <!-- Zou onzin moeten zijn om meerdere keren per week te combineren met weekdagen -->
                            <xsl:value-of select="./frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                        </xsl:variable>
                        <effectiveTime xsi:type="SXPR_TS" operator="A">
                            <xsl:for-each select="./frequentie[tijdseenheid/@value != 'week']">
                                <comp>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                                </comp>
                            </xsl:for-each>
                            <xsl:choose>
                                <!-- Weekdag(en) zonder toedientijd -->
                                <xsl:when test="not(./toedientijd[.//(@value | @code)])">
                                    <xsl:for-each select="./weekdag[.//(@value | @code)]">
                                        <xsl:variable name="effectiveTimeOperator">
                                            <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                            <xsl:choose>
                                                <xsl:when test="not(./preceding-sibling::weekdag)">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="'I'"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <comp>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                                <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                                                <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                                <xsl:with-param name="weekdagCode" select="./@code"/>
                                            </xsl:call-template>
                                        </comp>
                                    </xsl:for-each>
                                </xsl:when>
                                <!-- Minstens 1 toedientijd en minstens 1 weekdag: voeg alle combinaties toe -->
                                <xsl:otherwise>
                                    <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                                        <xsl:variable name="curToedientijd" select="."/>
                                        <!-- Voor de overzichtelijkheid van het resultaat zou het handiger zijn om eerst over weekdagen,
                                   en daarbinnen over toedientijden te itereren, omdat de <comp>'s dan chronologisch staan.
                                   Maar omdat het aangeroepen template de weekdag als context verwacht, is 
                              -->
                                        <xsl:for-each select="../weekdag[.//(@value | @code)]">
                                            <xsl:variable name="curWeekdag" select="."/>
                                            <xsl:variable name="effectiveTimeOperator">
                                                <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                                <xsl:choose>
                                                    <xsl:when test="not($curWeekdag/preceding-sibling::weekdag) and not($curToedientijd/preceding-sibling::toedientijd)">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="'I'"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <comp>
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                                    <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                                                    <xsl:with-param name="toedientijd" select="$curToedientijd"/>
                                                    <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                                    <xsl:with-param name="weekdagCode" select="./@code"/>
                                                </xsl:call-template>
                                            </comp>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </effectiveTime>
                    </xsl:when>

                    <!-- Combinatie dagdeel en weekdag wordt (nog) niet ondersteund. -->

                    <!-- dagdeel> -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and count(./dagdeel[.//(@value | @code)]) = 1">
                        <xsl:choose>
                            <xsl:when test="./dagdeel/@code = '2546009'">
                                <!--  's nachts -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9159_20160728135022">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid[.//(@value | @code)]"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                            <xsl:when test="./dagdeel/@code = '73775008'">
                                <!--  's morgens -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9156_20160728135021">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                            <xsl:when test="./dagdeel/@code = '255213009'">
                                <!--  's middags -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9157_20160728135022">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                            <xsl:when test="./dagdeel/@code = '3157002'">
                                <!--  's avonds -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9158_20160728135022">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
