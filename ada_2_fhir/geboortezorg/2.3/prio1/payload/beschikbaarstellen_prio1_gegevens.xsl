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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->    
    <xsl:import href="../../../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="../../../../zibs2017/payload/zib-LaboratoryTestResult-Observation-2.1.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_nl-core-patient.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_nl-core-organization.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_bc-observation.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_zib-laboratory-testresult-observation.xsl"/>
    <xsl:import href="gebz_prio1_mappings.xsl"/>
   
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xsl:param name="mask-ids"/>
    
    <xsl:param name="patient-ada" as="element()*">
        <xsl:apply-templates select="(prio1_huidig | prio1_vorig)/vrouw" mode="vrouw-ada"/>       
    </xsl:param>  
    
    <xsl:param name="zorginstelling-ada" as="element()*">
        <xsl:apply-templates select="(prio1_huidig | prio1_vorig)/zorgverlenerzorginstelling" mode="zorginstelling-ada"/>       
    </xsl:param>  
    
    <xsl:param name="pregnancyNo">
        <xsl:apply-templates select="(prio1_huidig | prio1_vorig)/zwangerschap | prio1_vorig/zwangerschap" mode="pregnancyNo"/>  
    </xsl:param>
      
    <xd:doc>
        <xd:desc>
            <xd:p>The "Richtlijn Online inzage in het H-EPD door patiënt" that underlies this mapping, suggests not to send S-O journal entries.</xd:p>
            <xd:p>This mapping is designed to handle all journal entries by default based on value 'SOEP', as they occur in the source data. To filter something, leave out letters, e.g. send in 'EP' to comply with the Richtlijn.</xd:p>
        </xd:desc>
    </xd:doc>
   
    <xsl:template name="get-patient" match="vrouw" mode="vrouw-fhir">
        <xsl:result-document href="../fhir_instance/vrouw.xml" indent="yes" method="xml" omit-xml-declaration="yes">
            <xsl:call-template name="nl-core-patient-2.1">
                <xsl:with-param name="in" select="$patient-ada"/>
            </xsl:call-template>    
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="get-organization" match="zorgverlenerzorginstelling" mode="zorginstelling-fhir">
        <xsl:result-document href="../fhir_instance/zorginstelling.xml" indent="yes" method="xml" omit-xml-declaration="yes">
            <xsl:call-template name="nl-core-organization-2.0">
                <xsl:with-param name="in" select="$zorginstelling-ada"/>
            </xsl:call-template>    
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="get-lab-observations" match="vrouw | medisch_onderzoek" mode="lab-fhir">
        <xsl:variable name="labtest-ada" as="element()*">
            <xsl:call-template name="convertToADAlabtest"/>
        </xsl:variable>
        <xsl:variable name="labtest-mo-ada" as="element()*">
            <xsl:call-template name="convertMoToADAlabtest"/>
        </xsl:variable>  
        <xsl:for-each select="$labtest-ada | $labtest-mo-ada">
            <xsl:result-document href="{concat('../fhir_instance/',name(.),'-',test_code/@code,'-zwangerschap-',$pregnancyNo,'.xml')}" indent="yes" method="xml" omit-xml-declaration="yes">
                <xsl:call-template name="zib-LaboratoryTestResult-Observation-2.1">
                    <xsl:with-param name="in" select="." as="element()*"/> 
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                </xsl:call-template>
            </xsl:result-document>
        </xsl:for-each>     
    </xsl:template>   
   
    <xsl:template name="get-pregnancyNo" match="zwangerschap" mode="pregnancyNo">
        <xsl:param name="pregnancyNo" select="graviditeit/@value"/>
        <xsl:value-of select="$pregnancyNo"/>
    </xsl:template>
    
    <xsl:template name="get-bc-observations" match="graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | tijdstip_begin_actieve_ontsluiting | hoeveelheid_bloedverlies | conditie_perineum_postpartum" mode="bc-obs-fhir">
        <xsl:result-document href="{concat('../fhir_instance/',name(.),'-zwangerschap-',$pregnancyNo,'.xml')}" indent="yes" method="xml" omit-xml-declaration="yes">
            <xsl:call-template name="bc-observation">
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="dossierId" select="concat('zwangerschapsdossier-zwangerschap-',$pregnancyNo)"/>
                <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
            </xsl:call-template>      
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="get-child-observations" match="uitkomst_per_kind" mode="child-obs-fhir">
        <xsl:variable name="childNo" select="count(preceding-sibling::*[name()=name(current())])+1"/>
        <kind value="{$childNo}"/>
        <xsl:for-each select="baring/(kindspecifieke_maternale_gegevens | kindspecifieke_uitkomstgegevens)/(tijdstip_actief_meepersen | type_partus | lichamelijk_onderzoek_kind/(apgarscore_na_5_min | geboortegewicht))">
            <element value="{name(.)}"/>
            <xsl:result-document href="{concat('../fhir_instance/',name(.),'-zwangerschap-',$pregnancyNo,'-kind-',$childNo,'.xml')}" indent="yes" method="xml" omit-xml-declaration="yes">
                <xsl:call-template name="bc-observation">
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                    <xsl:with-param name="dossierId" select="concat('zwangerschapsdossier-zwangerschap-',$pregnancyNo)"/>
                    <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
                    <xsl:with-param name="childId" select="concat('kind-',$childNo)"/>
                </xsl:call-template>      
            </xsl:result-document>        
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:apply-templates mode="vrouw-fhir"/>
        <xsl:apply-templates mode="zorginstelling-fhir"/>
        <xsl:apply-templates mode="lab-fhir"/>    
        <xsl:apply-templates mode="pregnancy-fhir"/>
        <xsl:apply-templates mode="bc-obs-fhir"/>   
        <xsl:apply-templates mode="child-obs-fhir"/> 
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>
