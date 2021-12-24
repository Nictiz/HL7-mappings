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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:f="http://hl7.org/fhir" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:util="urn:hl7:utilities" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>
  
    <xd:doc>
        <xd:desc>Bouwstenen are directly after the last medicamenteuze_behandeling</xd:desc>
    </xd:doc>
    <xsl:template match="medicamenteuze_behandeling[not(following-sibling::medicamenteuze_behandeling)]" mode="deduplicateBouwstenenStep1">

        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="deduplicateBouwstenenStep1"/>
        </xsl:copy>
        <bouwstenen>
            <!-- contactpersoon -->
            <xsl:variable name="concactpersonen" select="../medicamenteuze_behandeling//contactpersoon"/>
            <xsl:variable name="uniekePersonen" as="element()*">
                <xsl:for-each-group select="$concactpersonen" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-persoon xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-persoon>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekePersonen">
                <contactpersoon id="{contactpersoon/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="contactpersoon/*" mode="deduplicateBouwstenenStep1"/>
                </contactpersoon>
            </xsl:for-each>

            <!-- farmaceutisch_product -->
            <xsl:variable name="farmaceutischeProducten" select="../medicamenteuze_behandeling//farmaceutisch_product"/>
            <xsl:variable name="uniekeProducten" as="element()*">
                <xsl:for-each-group select="$farmaceutischeProducten" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-product xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-product>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekeProducten">
                <farmaceutisch_product id="{farmaceutisch_product/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="farmaceutisch_product/*" mode="deduplicateBouwstenenStep1"/>
                </farmaceutisch_product>
            </xsl:for-each>

            <!-- zorgverlener -->
            <xsl:variable name="zorgverleners" select="../medicamenteuze_behandeling//zorgverlener[not(zorgverlener)]"/>
            <xsl:variable name="uniekezorgverleners" as="element()*">
                <xsl:for-each-group select="$zorgverleners" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-zorgverlener xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-zorgverlener>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekezorgverleners">
                <zorgverlener id="{zorgverlener/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="zorgverlener/*" mode="deduplicateBouwstenenStep1"/>
                </zorgverlener>
            </xsl:for-each>

            <!-- zorgaanbieder -->
            <xsl:variable name="zorgaanbieders" select="../medicamenteuze_behandeling//zorgaanbieder"/>
            <xsl:variable name="uniekeZorgaanbieders" as="element()*">
                <xsl:for-each-group select="$zorgaanbieders" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-zorgaanbieder xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-zorgaanbieder>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekeZorgaanbieders">
                <zorgaanbieder id="{zorgaanbieder/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="zorgaanbieder/*" mode="deduplicateBouwstenenStep1"/>
                </zorgaanbieder>
            </xsl:for-each>

            <!-- copy existing bouwstenen as well, should only be lichaamsgewicht / lichaamslengte -->
            <xsl:apply-templates select="../bouwstenen/*" mode="deduplicateBouwstenenStep1"/>
        </bouwstenen>

    </xsl:template>

    <xd:doc>
        <xd:desc>Default copy template for deduplication the bouwstenen stuff (step 1) in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="deduplicateBouwstenenStep1">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="deduplicateBouwstenenStep1"/>
        </xsl:copy>
    </xsl:template>    
    
     <xd:doc>
        <xd:desc>zorgverlener has a bouwstenen reference to zorgaanbieder, some special handling here in deduplication step 2</xd:desc>
    </xd:doc>
    <xsl:template match="bouwstenen/zorgverlener" mode="deduplicateBouwstenenStep2">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="deduplicateBouwstenenStep2"/>
            <xsl:apply-templates select="*[not(self::zorgaanbieder)]" mode="deduplicateBouwstenenStep2"/>
            <xsl:for-each select="zorgaanbieder">
                <xsl:copy>
                    <!-- double nested in the dataset, unfortunately -->
                    <zorgaanbieder>
                        <xsl:attribute name="value">
                            <xsl:value-of select="ancestor::data/*/bouwstenen/*[key/text() = nf:getGroupingKeyDefaulthl72ada(current())]/@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="datatype">reference</xsl:attribute>
                    </zorgaanbieder>
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> get rid of the now (in step 2) obsolete temporary deduplication key, don't want it in the end result ada xml </xd:desc>
    </xd:doc>
    <xsl:template match="bouwstenen/*/key" mode="deduplicateBouwstenenStep2"/>
    
    <xd:doc>
        <xd:desc>Find the correct reference in the deduplication mode in step 2 </xd:desc>
    </xd:doc>
    <xsl:template match="medicamenteuze_behandeling//farmaceutisch_product | medicamenteuze_behandeling//contactpersoon | medicamenteuze_behandeling//zorgaanbieder | medicamenteuze_behandeling//zorgverlener[not(zorgverlener)]" mode="deduplicateBouwstenenStep2">
        <xsl:copy>
            <xsl:apply-templates select="@conceptId" mode="deduplicateBouwstenenStep2"/>
            <xsl:attribute name="value">
                <xsl:value-of select="ancestor::data/*/bouwstenen/*[key/text() = nf:getGroupingKeyDefaulthl72ada(current())]/@id"/>
            </xsl:attribute>
            <xsl:attribute name="datatype">reference</xsl:attribute>
        </xsl:copy>
    </xsl:template>    

    <xd:doc>
        <xd:desc>Default copy template for deduplication the bouwstenen stuff (step 2) in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="deduplicateBouwstenenStep2">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="deduplicateBouwstenenStep2"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make a reference to the bouwstenen</xd:desc>
    </xd:doc>
    <xsl:template match="toediener/mantelzorger/contactpersoon | voorschrijver/zorgverlener | auteur/zorgverlener | auteur_is_zorgverlener/zorgverlener | toediener/zorgverlener/zorgverlener | farmaceutisch_product | beoogd_verstrekker/zorgaanbieder | verstrekker/zorgaanbieder | auteur_is_zorgaanbieder[not(ancestor::documentgegevens)]/zorgaanbieder" mode="handleBouwstenen">
        <xsl:copy>
            <xsl:attribute name="datatype">reference</xsl:attribute>
            <xsl:attribute name="value" select="@id"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Bouwstenen are directly after the last medicamenteuze_behandeling</xd:desc>
    </xd:doc>
    <xsl:template match="medicamenteuze_behandeling[not(following-sibling::medicamenteuze_behandeling)]" mode="handleBouwstenen">
        
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="handleBouwstenen"/>
        </xsl:copy>
        <bouwstenen>
            <xsl:apply-templates select="../medicamenteuze_behandeling//contactpersoon" mode="addBouwstenen"/>
            <xsl:apply-templates select="../medicamenteuze_behandeling//farmaceutisch_product" mode="addBouwstenen"/>
            <!-- zorgverlener has a bouwstenen reference to zorgaanbieder, some special handling here -->
            <xsl:for-each select="../medicamenteuze_behandeling//zorgverlener[not(zorgverlener)]">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="addBouwstenen"/>
                    <xsl:apply-templates select="*[not(self::zorgaanbieder | self::zorgverlener_rol)]" mode="addBouwstenen"/>
                    <xsl:for-each select="zorgaanbieder">
                        <xsl:copy>
                            <!-- double nested in the dataset, unfortunately -->
                            <zorgaanbieder>
                                <xsl:attribute name="datatype">reference</xsl:attribute>
                                <xsl:attribute name="value" select="@id"/>
                            </zorgaanbieder>
                        </xsl:copy>
                    </xsl:for-each>
                    <xsl:apply-templates select="zorgverlener_rol" mode="addBouwstenen"/>
                </xsl:copy>
            </xsl:for-each>
            <xsl:for-each select="../medicamenteuze_behandeling//zorgaanbieder">
                <xsl:copy>
                    <xsl:apply-templates select="node() | @*" mode="addBouwstenen"/>
                </xsl:copy>
            </xsl:for-each>
            <!-- copy existing bouwstenen as well, should only be lichaamsgewicht / lichaamslengte -->
            <xsl:apply-templates select="../bouwstenen/*" mode="addBouwstenen"/>
        </bouwstenen>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Do not output telecom_type when nullFlavor in handleBouwstenen, it is officially not in  ada dataset anyway</xd:desc>
    </xd:doc>
    <xsl:template match="telecom_type[@codeSystem = $oidHL7NullFlavor]" mode="handleBouwstenen"/>
    
    <xd:doc>
        <xd:desc>Do not output documentgegevens/auteur/auteur_is_zorgaanbieder/zorgaanbieder/@id in handleBouwstenen, unlike other zorgaanbieders, this is not a reference in the ada dataset</xd:desc>
    </xd:doc>
    <xsl:template match="documentgegevens/auteur/auteur_is_zorgaanbieder/zorgaanbieder/@id" mode="handleBouwstenen"/>
    
    <xd:doc>
        <xd:desc>Do not output bouwstenen (again) in handleBouwstenen, bouwstenen are completely handled in the template that handles medicamenteuze_behandeling</xd:desc>
    </xd:doc>
    <xsl:template match="bouwstenen" mode="handleBouwstenen"/>
    
    <xd:doc>
        <xd:desc>Default copy template for adding the bouwstenen stuff in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="handleBouwstenen">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="handleBouwstenen"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Make a reference to the bouwstenen</xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener/zorgaanbieder" mode="addBouwstenen">
        <xsl:copy>
            <xsl:attribute name="datatype">reference</xsl:attribute>
            <xsl:attribute name="value" select="@id"/>
        </xsl:copy>
    </xsl:template>    
    
    <xd:doc>
        <xd:desc>Default copy template for adding the bouwstenen stuff in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="addBouwstenen">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="addBouwstenen"/>
        </xsl:copy>
    </xsl:template>
  
</xsl:stylesheet>
