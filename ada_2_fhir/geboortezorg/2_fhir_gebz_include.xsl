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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="../zibs2017/payload/zib-LaboratoryTestResult-Observation-2.1.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_nl-core-patient.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_nl-core-organization.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_zib-pregnancy.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-maternalrecord.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-observation.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_zib-laboratory-testresult-observation.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-procedure.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_2_fhir_bc-composition.xsl"/>
    <xsl:import href="2.3/bouwstenen/gebz_mappings.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- dateT may be given for relative dates, only applicable for test instances -->
    <xsl:param name="dateT" as="xs:date?"/>
   
    <!-- ada instances -->
    <xsl:param name="patient-ada" as="element()*">
        <xsl:apply-templates select="(prio1_huidig | prio1_vorig)/vrouw" mode="vrouw-ada"/>       
    </xsl:param>  
    
    <xsl:variable name="kind-ada" as="element()*">
        <xsl:for-each select="(prio1_huidig | prio1_vorig)/uitkomst_per_kind">
            <xsl:call-template name="convert-kind-ada"/>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:param name="zorginstelling-ada" as="element()*">
        <xsl:apply-templates select="(prio1_huidig | prio1_vorig)/zorgverlenerzorginstelling" mode="zorginstelling-ada"/>       
    </xsl:param>  
    
    <!-- unique patients -->
    <xsl:variable name="patients" as="element()*">
        <!-- Patiënten -->
        <xsl:for-each-group select="$patient-ada" group-by="
            string-join(for $att in nf:ada-pat-id(identificatienummer | patient_identificatie_nummer | patient_identification_number)/(@root, @value)
            return
            $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                    <unieke-patient xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="current-group()[1]/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                    </reference-display>
                        <xsl:apply-templates select="current-group()[1]" mode="doPatientEntry-2.1">
                            <xsl:with-param name="uuid" select="$uuid"/>
                        </xsl:apply-templates>
                    </unieke-patient>
             </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
       
    <!-- pregnancyNo -->
    <xsl:variable name="pregnancyNo">
        <xsl:for-each select="(prio1_huidig | prio1_vorig)/zwangerschap | prio1_vorig/zwangerschap">
            <xsl:value-of select="graviditeit/@value"/>
        </xsl:for-each>  
    </xsl:variable>
 
    <!-- vrouw -->
    <xsl:template name="vrouw" as="element(f:Patient)*" match="vrouw" mode="doVrouwToFhir">
        <xsl:call-template name="nl-core-patient-2.1">
            <xsl:with-param name="in" select="$patient-ada"/>
<!--            <xsl:with-param name="logicalId" select="$vrouwId"/>-->
        </xsl:call-template>        
    </xsl:template>
              
    <!-- zorginstelling -->
    <xsl:template name="zorginstelling" as="element(f:Organization)*" match="zorgverlenerzorginstelling" mode="doZorginstellingToFhir">
            <xsl:call-template name="nl-core-organization-2.0">
                <xsl:with-param name="in" select="$zorginstelling-ada"/>
                <xsl:with-param name="logicalId" select="replace(zorginstelling/naam_zorginstelling/@value,' ','-')"/>
            </xsl:call-template>    
    </xsl:template>
    
    <!-- zwangerschapsdossier -->
    <xsl:template name="zwangerschapsdossier" as="element(f:EpisodeOfCare)*" match="zwangerschap" mode="doZwangerschapsDossierToFhir">
        <xsl:call-template name="bc-maternal-record">
            <xsl:with-param name="logicalId" select="concat('dossier-',$vrouwId,'-zwangerschap-',$pregnancyNo)"/>
            <xsl:with-param name="adaPatient" select="$patient-ada"/>
            <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
        </xsl:call-template>        
    </xsl:template>  
    
    <!-- zwangerschap -->
    <xsl:template name="zwangerschap" as="element(f:Condition)*" match="zwangerschap" mode="doZwangerschapToFhir">
        <xsl:call-template name="zib-pregnancy">
            <xsl:with-param name="logicalId" select="concat('zwangerschap-',$pregnancyNo)"/>
            <xsl:with-param name="adaPatient" select="$patient-ada"/>
            <xsl:with-param name="dossierId" select="concat('zwangerschapsdossier-zwangerschap-',$pregnancyNo)"/>
            <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
        </xsl:call-template>        
    </xsl:template>  
    
    <!-- maternale onderzoekgegevens -->
    <xsl:template name="maternale-onderzoeksgegevens" as="element()" match="bloedgroep_vrouw | rhesus_d_factor_vrouw | rhesus_c_factor| hb" mode="doMaternaleOnderzoeksgegevensToFhir">
        <xsl:variable name="labtest-ada" as="element()*">
            <xsl:call-template name="convertToADAlabtest"/>
        </xsl:variable>
        <!--<xsl:variable name="labtest-mo-ada" as="element()*">
            <xsl:call-template name="convertMoToADAlabtest"/>
        </xsl:variable> -->
        <xsl:variable name="elementName" select="name(.)"/>
        <xsl:for-each select="$labtest-ada">
                <xsl:call-template name="zib-LaboratoryTestResult-Observation-2.1">
                    <xsl:with-param name="in" select="." as="element()*"/> 
                    <xsl:with-param name="logicalId" select="concat($elementName,'-zwangerschap-',$pregnancyNo)"/>
                    <xsl:with-param name="adaPatient" select="$patient-ada"/>
                </xsl:call-template>
        </xsl:for-each>     
    </xsl:template>   
    
    <!-- zwangerschaps- en bevallingsgegevens -->
    <xsl:template name="zwangerschaps-en-bevallingsgegevens" match="graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | tijdstip_begin_actieve_ontsluiting | hoeveelheid_bloedverlies | conditie_perineum_postpartum" mode="doZwangerschapEnBevallingGegevensToFhir" as="element(f:Observation)*">
        <xsl:call-template name="bc-observation">
            <xsl:with-param name="logicalId" select="concat(name(.),'-zwangerschap-',$pregnancyNo)"/>
            <xsl:with-param name="adaPatient" select="$patient-ada"/>
            <xsl:with-param name="dossierId" select="concat('zwangerschapsdossier-zwangerschap-',$pregnancyNo)"/>
            <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
        </xsl:call-template>      
    </xsl:template>
    
    <!-- kindspecifieke uitkomstgegevens -->
    <xsl:template name="kind-gegevens" as="element(f:Observation)*" match="uitkomst_per_kind" mode="doKindGegevensToFhir">
        <xsl:variable name="childNo" select="string(count(preceding-sibling::*[name()=name(current())])+1)"/>
        <xsl:for-each select="baring | baring/(kindspecifieke_maternale_gegevens | kindspecifieke_uitkomstgegevens)/(tijdstip_actief_meepersen | type_partus | lichamelijk_onderzoek_kind/(apgarscore_na_5_min | geboortegewicht))">
            <xsl:call-template name="bc-observation">
               <xsl:with-param name="logicalId" select="concat(name(.),'-zwangerschap-',$pregnancyNo,'-kind-',$childNo)"/>
               <xsl:with-param name="adaPatient" select="$patient-ada"/>
               <xsl:with-param name="dossierId" select="concat('zwangerschapsdossier-zwangerschap-',$pregnancyNo)"/>
               <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
               <xsl:with-param name="childId" select="concat('zwangerschap-',$pregnancyNo,'-kind-',$childNo)"/>
             </xsl:call-template>             
        </xsl:for-each>   
    </xsl:template>
    
    <!-- bevalling -->
    <xsl:template name="bevalling" as="element(f:Procedure)*" match="bevalling" mode="doDeliveryToFhir">
        <xsl:call-template name="bc-procedure">
            <xsl:with-param name="logicalId" select="concat(name(.),'-zwangerschap-',$pregnancyNo)"/>
            <xsl:with-param name="adaPatient" select="$patient-ada"/>
            <xsl:with-param name="dossierId" select="concat('zwangerschapsdossier-zwangerschap-',$pregnancyNo)"/>
            <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
        </xsl:call-template>             
    </xsl:template>
    
    <!-- obstetrische verrichtingen -->
    <xsl:template name="verrichtingen" as="element(f:Procedure)*" match="uitkomst_per_kind" mode="doObstetricProceduresToFhir">
        <xsl:variable name="childNo" select="string(count(preceding-sibling::*[name()=name(current())])+1)"/>
        <xsl:for-each select="baring/kindspecifieke_uitkomstgegevens/vaginale_kunstverlossing_groep/vaginale_kunstverlossing">
            <xsl:call-template name="bc-procedure">
                <xsl:with-param name="logicalId" select="concat(name(.),'-zwangerschap-',$pregnancyNo,'-kind-',$childNo)"/>
                <xsl:with-param name="adaPatient" select="$patient-ada"/>
                <xsl:with-param name="dossierId" select="concat('zwangerschapsdossier-zwangerschap-',$pregnancyNo)"/>
                <xsl:with-param name="pregnancyId" select="concat('zwangerschap-',$pregnancyNo)"/>
                <xsl:with-param name="childId" select="concat('zwangerschap-',$pregnancyNo,'-kind-',$childNo)"/>
            </xsl:call-template>    
        </xsl:for-each>
    </xsl:template>
    
    <!-- Kind -->
    <xsl:template name="kind" as="element(f:Patient)*" match="uitkomst_per_kind" mode="doKindToFhir"> 
        <xsl:variable name="childNo" select="string(count(preceding-sibling::*[name()=name(current())])+1)"/>      
        <xsl:call-template name="nl-core-patient-2.1">
            <xsl:with-param name="in" select="$kind-ada"/>
            <xsl:with-param name="logicalId" select="concat('zwangerschap-',$pregnancyNo,'-kind-',$childNo)"/>
        </xsl:call-template>    
    </xsl:template>   

    <xsl:template name="composition" as="element(f:Composition)*" match="/" mode="doCreateComposition">
        <xsl:param name="logicalId"/>
        <xsl:param name="entries"/>
        <xsl:call-template name="bc-composition">
            <xsl:with-param name="logicalId"><xsl:value-of select="$logicalId"/></xsl:with-param>
            <xsl:with-param name="entries"><xsl:copy-of select="$entries"></xsl:copy-of></xsl:with-param>
        </xsl:call-template>        
    </xsl:template>

</xsl:stylesheet>
