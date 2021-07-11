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
    <xsl:import href="../../zib2017bbr/2_hl7_zib2017bbr_include.xsl"/>
    <xsl:import href="../../zib2017bbr/payload/_ada2hl7_zib2017.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>

    <xd:doc>
        <xd:desc>Template for zorgaanbieder in representedOrganiztion</xd:desc>
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

</xsl:stylesheet>
