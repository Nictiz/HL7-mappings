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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:local="urn:fhir:stu3:functions" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping for ADA MP9-transaction</xd:p>
            <xd:p>Do some preprocessing in ada files, because Touchstone cannot interpret duration use properly</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2020-05-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc>Start conversion. Let's update the periodofuse duration to an end date for a particular MA</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="." mode="preprocess4TS"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Start conversion. Let's update the periodofuse duration to an end date for a particular MA</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak[gebruiksperiode/@value]/identificatie[@value = 'MBH_907_QA5_MA-JNK']" mode="preprocess4TS">
        <!-- let's add the gebruiksperiode_eind in this dirty hack -->
        <gebruiksperiode_eind value="{'T-44D{23:59:59}'}" conceptId="2.16.840.1.113883.2.4.3.11.999.77.11.1.9580.2" datatype="datetime"/>
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="preprocess4TS"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Start conversion. Let's update the periodofuse duration to an end date for a particular MA</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak[identificatie/@value = 'MBH_907_QA5_MA-JNK']/gebruiksperiode" mode="preprocess4TS">
        <!-- do not copy -->
    </xsl:template>

    <xd:doc>
        <xd:desc>Default copy template</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="preprocess4TS">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="preprocess4TS"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
