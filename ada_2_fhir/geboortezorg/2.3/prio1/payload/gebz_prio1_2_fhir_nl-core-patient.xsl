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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="gebz_prio1_mappings.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc>Converts ada vrouw to ada patient</xd:desc>
    </xd:doc>
              
    <xsl:variable name='vrouwId' select="'van-der-wouden'"/> <!-- todo: moet in ada voorbeeld komen en daaruit uitlezen -->
                      
    <xsl:template name="convert-vrouw-ada" mode="vrouw-ada" match="vrouw" as="element()*">
        <xsl:variable name="theIdentifier" select="burgerservicenummer/@value"/>   
        <patient>
            <identificatienummer value="{$theIdentifier}"/>
            <naamgegevens>
                <geslachtsnaam value="van der Wouden"/> <!-- todo: moet in ada voorbeeld komen en daaruit uitlezen -->
            </naamgegevens>
        </patient>
    </xsl:template>
       
    <xsl:template name="convert-kind-ada" mode="kind-ada" match="uitkomst_per_kind" as="element()*">
        <xsl:param name="theIdentifier" select="string(count(preceding-sibling::*[name()=name(current())])+1)"/>   
        <xsl:variable name="birthDate" select="baring/demografische_gegevens/geboortedatum/@value"/>
        <patient>
            <xsl:if test="$theIdentifier!=''">
                <patient_identification_number value="{$theIdentifier}"/>
            </xsl:if>
            <xsl:if test="$birthDate!=''">
                <geboortedatum value="{current-date()-xs:dayTimeDuration(concat('P',substring-after($birthDate,'-')))}"/>
            </xsl:if>
        </patient>
    </xsl:template>
  
    <xsl:template name="patients" as="element()*">
        <xsl:param name="in" select="."/>
        <xsl:for-each-group select="//$in[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            string-join(for $att in nf:ada-pat-id(identificatienummer)/@value
            return
            $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-patient xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="current-group()[1]/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value, ' '))"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPatientResource-2.1">
                        <xsl:with-param name="in" select="$in"/>
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates> 
                </unieke-patient>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>  
  
    <xsl:template match="/">
        <xsl:variable name="x" select="'test'"/>
        <xsl:apply-templates mode="vrouw-fhir"/>
    </xsl:template>
       
</xsl:stylesheet>
