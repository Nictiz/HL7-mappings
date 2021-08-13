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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xsl xs xd"
    version="2.0">
    
    <xsl:import href="../../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="../../zibs2017/payload/zib-LaboratoryTestResult-Observation-2.1.xsl"/>
    <!--<xsl:import href="../../../2_fhir_geboortezorg_include.xsl"/>-->
    <!--<xsl:import href="prio1_huidige_zwangerschap_vrouw_2_fhir_patient2.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc>Converts ada maternale gegevens to ada labtest</xd:desc>
    </xd:doc>
                            
    <xsl:template name="convertToADAlabtest" mode="doConvertToADAlabtest" match="(bloedgroep_vrouw | rhesus_d_factor_vrouw | rhesus_c_factor | hb | laboratorium_test_bloedgroep | laboratorium_test_rhesus_d | laboratorium_test_rhesus_c | laboratorium_test_hb | laboratorium_test_torch)[not(@datatype='reference')]">
            <xsl:variable name="code" select="@code | test_uitslag/@code"/>  
            <xsl:variable name="codeSystem" select="@codeSystem  | test_uitslag/@codeSystem"/> 
            <xsl:variable name="display" select="@displayName |  test_uitslag/@displayName"/>
            <xsl:variable name="datum" select="ancestor::node()/datum_onderzoek/@value | ancestor::medisch_onderzoek/verrichting_onderzoek/verrichting_start_datum/@value"/>
            <xsl:variable name="elementName" select="name(.)"/>
            <laboratory_test>
                <xsl:choose>
                    <xsl:when test="$elementName=('bloedgroep_vrouw','laboratorium_test_bloedgroep')"> 
                        <test_code code="883-9" codeSystem="2.16.840.1.113883.6.1" displayName="ABO group [Type] in Blood"/>
                    </xsl:when>
                    <xsl:when test="$elementName=('rhesus_d_factor_vrouw','laboratorium_test_rhesus_d')">
                        <test_code code="1305-2" codeSystem="2.16.840.1.113883.6.1" displayName="D Ag [Presence] in Blood"/>
                    </xsl:when>
                    <xsl:when test="$elementName=('rhesus_c_factor','laboratorium_test_rhesus_c')">
                        <test_code code="1159-3" codeSystem="2.16.840.1.113883.6.1" displayName="little c Ag [Presence] on Red Blood Cells"/>
                    </xsl:when>
                    <xsl:when test="$elementName='hb'">
                        <test_code code="718-7" codeSystem="2.16.840.1.113883.6.1" displayName="Hemoglobin (Bld) [Mass/Vol]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- todo: testen of bovenstaande regels eruit kunnen, onderstaand zou altijd moeten werken (wellicht niet voor 2.3)-->
                        <test_code code="{test_code/@code}" codeSystem="{test_code/@codeSystem}" displayName="{test_code/@displayName}"/>    
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$datum!=''">
                    <!-- TODO omzetten naar aanroepen format datetime-->
                    <xsl:variable name="x" select="substring-after($datum,'T-')"/>
                    <xsl:variable name="pattern" select="substring($x,string-length($x),1)"/>
                    <xsl:variable name="n" select="substring-before($x,$pattern)"/>
                    <test_date_time value="{current-date()-xs:dayTimeDuration(concat('P',$n,$pattern))}"/>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="$elementName=('hb','laboratorium_test_hb','laboratorium_test_torch')">
                        <test_result value="{@value | test_uitslag/@value}" unit="{@unit | test_uitslag/@unit}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <test_result code="{$code}" codeSystem="{$codeSystem}" displayName="{$display}"/>
                    </xsl:otherwise>
                </xsl:choose>              
                <test_result_status value="3" code="final" codeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" displayName="Final"/>      
            </laboratory_test>     
     </xsl:template>
               
</xsl:stylesheet>
