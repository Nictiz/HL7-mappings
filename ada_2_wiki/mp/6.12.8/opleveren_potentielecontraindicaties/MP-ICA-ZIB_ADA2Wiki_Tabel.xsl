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
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:import href="../../../../tools/xsl_ada_2_wiki/adarelease_2_wikimapping.xsl"/>
    <xsl:output method="text" encoding="UTF-16"/>

    <xsl:param name="communityName">ICA612_2_MedMij112All</xsl:param>
    <xsl:param name="ada-view-shortname">allergy_intolerance</xsl:param>
    <xsl:param name="otherStandard">MP-6.12 Potentiële contraindicaties</xsl:param>
    <xsl:param name="otherStandardURL">https://www.nictiz.nl/Paginas/Informatiestandaard-medicatieveiligheid.aspx</xsl:param>
    <xsl:param name="dataset-name">MedMij dataset (beschikbaarstellen allergie/intolerantie</xsl:param>
    <xsl:param name="concept-2b-omitted" as="xs:string*">
        <!-- none -->
    </xsl:param>
    <xsl:param name="concept-zib" as="xs:string*">
        <!--        <xsl:value-of select="'patient'"/>-->
        <xsl:value-of select="'allergy_intolerance'"/>
    </xsl:param>
    <xsl:param name="mapDirection">other2zib</xsl:param>

    <xd:doc>
        <xd:desc>Determine direction and call the correct template to create a wiki table</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="concept" select="ada/applications//view[implementation/@shortName = $ada-view-shortname]/dataset/concept"/>
        <xsl:for-each select="$concept[not(@shortName = $concept-2b-omitted)]">
            <xsl:choose>
                <xsl:when test="$mapDirection = 'other2zib'">
                    <xsl:call-template name="makeTableOther2ZIB">
                        <xsl:with-param name="concept" select="."/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="makeTableZIB2Other">
                        <xsl:with-param name="concept" select="."/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
