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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
 <!--   <xsl:import href="../../zib2017bbr/2_hl7_zib2017bbr_include.xsl"/>
    <xsl:import href="../../zib2017bbr/payload/_ada2hl7_zib2017.xsl"/>
-->    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>

    <xd:doc>
        <xd:desc>Template for zorgaanbieder in representedOrganization</xd:desc>
        <xd:param name="in">The input ada element for zorgaanbieder, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000" match="zorgaanbieder" mode="handleZorgaanbiederReprOrg">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">
            <representedOrganization>
                <xsl:for-each select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)">
                    <!-- MP CDA Zorgaanbieder identificaties -->
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <xsl:for-each select="organisatie_naam[.//(@value | @nullFlavor)]">
                    <xsl:element name="name">
                        <xsl:choose>
                            <xsl:when test="@value">
                                <xsl:value-of select="@value"/>
                            </xsl:when>
                            <xsl:when test="@nullFlavor">
                                <xsl:attribute name="nullFlavor">
                                    <xsl:value-of select="@nullFlavor"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:for-each>

                <!--Telecom gegevens-->
                <xsl:for-each select=".//contactgegevens[not(contactgegevens)][.//(@value | @code | @nullFlavor)]">
                    <xsl:call-template name="_CdaTelecom"/>
                </xsl:for-each>

                <xsl:for-each select=".//adresgegevens[not(adresgegevens)][.//(@value | @code | @nullFlavor)]">
                    <addr>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000"/>
                    </addr>
                </xsl:for-each>


                <xsl:for-each select="organisatie_type">
                    <standardIndustryClassCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </standardIndustryClassCode>
                </xsl:for-each>
                <xsl:for-each select="afdeling_specialisme">
                    <asOrganizationPartOf>
                        <xsl:call-template name="makeCode"/>
                    </asOrganizationPartOf>
                </xsl:for-each>
            </representedOrganization>
        </xsl:for-each>

    </xsl:template>
    
    <xd:doc>
        <xd:desc>Organizer custodian template for zorgaanbieder in participant Level 3. If there is any ward data (afdeling) then ParticipantRole and PlayingEntity are the ward/afdeling scoped by the organization, otherwise the organisation is ParticipantRole and PlayingEntity</xd:desc>
        <xd:param name="in">The input ada element for zorgaanbieder, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9032_20141113000000" match="zorgaanbieder" mode="handleZorgaanbiederCDADossierhouder">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="isAfdeling" select="exists(afdeling_specialisme | organisatie_locatie)" as="xs:boolean"/>
            <xsl:variable name="organisatieId" select="zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer" as="element()*"/>
            <xsl:variable name="organisatieNaam" select="organisatie_naam[@value | @nullFlavor]" as="element()*"/>
            <participant typeCode="CST">
                <participantRole classCode="ASSIGNED">
                    <xsl:choose>
                        <xsl:when test="$isAfdeling">
                            <xsl:choose>
                                <xsl:when test="organisatie_locatie/locatie_nummer">
                                    <xsl:for-each select="organisatie_locatie/locatie_nummer">
                                        <xsl:call-template name="makeIIid"/>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <id nullFlavor="NI"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                            <xsl:for-each select="afdeling_specialisme">
                                <code>
                                    <xsl:call-template name="makeCodeAttribs"/>
                                </code>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="$organisatieId">
                                <xsl:call-template name="makeIIid"/>
                            </xsl:for-each>
                            
                            <xsl:for-each select="organisatie_type">
                                <code>
                                    <xsl:call-template name="makeCodeAttribs"/>
                                </code>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:for-each select=".//adresgegevens[not(adresgegevens)][.//(@value | @code | @nullFlavor)]">
                        <addr>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000"/>
                        </addr>
                    </xsl:for-each>
                    
                    <xsl:for-each select=".//contactgegevens[not(contactgegevens)][.//(@value | @code | @nullFlavor)]">
                        <xsl:call-template name="_CdaTelecom"/>
                    </xsl:for-each>
                    
                    <xsl:choose>
                        <xsl:when test="$isAfdeling">
                            <xsl:if test="organisatie_locatie/locatie_naam">
                                <playingEntity classCode="ORG" determinerCode="INSTANCE">
                                    <xsl:for-each select="organisatie_locatie/locatie_naam">
                                        <xsl:call-template name="makeONValue">
                                            <xsl:with-param name="xsiType"/>
                                            <xsl:with-param name="elemName">name</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </playingEntity>
                            </xsl:if>
                            <xsl:if test="$organisatieNaam">
                                <scopingEntity classCode="ORG" determinerCode="INSTANCE">
                                    <xsl:for-each select="$organisatieId">
                                        <xsl:call-template name="makeIIid"/>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="organisatie_type">
                                        <code>
                                            <xsl:call-template name="makeCodeAttribs"/>
                                        </code>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="$organisatieNaam">
                                        <xsl:call-template name="makeONValue">
                                            <xsl:with-param name="xsiType"/>
                                            <xsl:with-param name="elemName">desc</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </scopingEntity>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="$organisatieNaam">
                                <playingEntity classCode="ORG" determinerCode="INSTANCE">
                                    <xsl:for-each select="$organisatieNaam">
                                        <xsl:call-template name="makeONValue">
                                            <xsl:with-param name="xsiType"/>
                                            <xsl:with-param name="elemName">name</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </playingEntity>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </participantRole>
            </participant>
        </xsl:for-each>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Organizer performer template from IHE XDLAB for zorgaanbieder in participant Level 3. If there is any ward data (afdeling) then ParticipantRole and PlayingEntity are the ward/afdeling scoped by the organization, otherwise the organisation is ParticipantRole and PlayingEntity</xd:desc>
        <xd:param name="in">The input ada element for zorgaanbieder, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_1.3.6.1.4.1.19376.1.3.3.1.7_20080808000000" match="zorgaanbieder" mode="handleZorgaanbiederCDAPerformer">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="isAfdeling" select="exists(afdeling_specialisme | organisatie_locatie)" as="xs:boolean"/>
            <xsl:variable name="organisatieId" select="zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer" as="element()*"/>
            <xsl:variable name="organisatieNaam" select="organisatie_naam[@value | @nullFlavor]" as="element()*"/>
            <assignedEntity classCode="ASSIGNED">
                <xsl:choose>
                    <xsl:when test="$isAfdeling">
                        <xsl:choose>
                            <xsl:when test="organisatie_locatie/locatie_nummer">
                                <xsl:for-each select="organisatie_locatie/locatie_nummer">
                                    <xsl:call-template name="makeIIid"/>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <id nullFlavor="NI"/>
                            </xsl:otherwise>
                        </xsl:choose>

                        <xsl:for-each select="afdeling_specialisme">
                            <code>
                                <xsl:call-template name="makeCodeAttribs"/>
                            </code>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="$organisatieId">
                            <xsl:call-template name="makeIIid"/>
                        </xsl:for-each>

                        <xsl:for-each select="organisatie_type">
                            <code>
                                <xsl:call-template name="makeCodeAttribs"/>
                            </code>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:for-each select=".//adresgegevens[not(adresgegevens)][.//(@value | @code | @nullFlavor)]">
                    <addr>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000"/>
                    </addr>
                </xsl:for-each>
                <xsl:if test="empty(.//adresgegevens[not(adresgegevens)][.//(@value | @code | @nullFlavor)])">
                    <addr nullFlavor="UNK"/>
                </xsl:if>
                <xsl:for-each select=".//contactgegevens[not(contactgegevens)][.//(@value | @code | @nullFlavor)]">
                    <xsl:call-template name="_CdaTelecom"/>
                </xsl:for-each>
                <xsl:if test="empty(.//contactgegevens[not(contactgegevens)][.//(@value | @code | @nullFlavor)])">
                    <telecom nullFlavor="UNK"/>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="$isAfdeling">
                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                            <xsl:choose>
                                <xsl:when test="organisatie_locatie/locatie_naam">
                                    <xsl:for-each select="organisatie_locatie/locatie_naam">
                                        <xsl:call-template name="makeONValue">
                                            <xsl:with-param name="xsiType"/>
                                            <xsl:with-param name="elemName">name</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <name nullFlavor="UNK"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                            <xsl:if test="$organisatieNaam">
                                <asOrganizationPartOf>
                                    <xsl:for-each select="$organisatieId">
                                        <xsl:call-template name="makeIIid"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="organisatie_type">
                                        <code>
                                            <xsl:call-template name="makeCodeAttribs"/>
                                        </code>
                                    </xsl:for-each>
                                    <xsl:for-each select="$organisatieNaam">
                                        <wholeOrganization>
                                            <xsl:call-template name="makeONValue">
                                                <xsl:with-param name="xsiType"/>
                                                <xsl:with-param name="elemName">name</xsl:with-param>
                                            </xsl:call-template>
                                            <telecom nullFlavor="UNK"/>
                                            <addr nullFlavor="UNK"/>
                                        </wholeOrganization>
                                    </xsl:for-each>
                                </asOrganizationPartOf>
                            </xsl:if>
                        </representedOrganization>
                    </xsl:when>
                    <xsl:when test="$organisatieNaam">
                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                            <xsl:for-each select="$organisatieNaam">
                                <xsl:call-template name="makeONValue">
                                    <xsl:with-param name="xsiType"/>
                                    <xsl:with-param name="elemName">name</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <telecom nullFlavor="UNK"/>
                            <addr nullFlavor="UNK"/>
                        </representedOrganization>
                    </xsl:when>
                </xsl:choose>
            </assignedEntity>
        </xsl:for-each>
        
    </xsl:template>

</xsl:stylesheet>
