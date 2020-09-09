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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="dataset-doc" select="document('../dataset2-3.xml')"/>
    <xsl:key name="dataset-concept-lookup" match="//concept" use="@id"/>
    <xsl:variable name="fhirmapping" select="document('../fhirmapping.xml')"/>
    <xsl:key name="fhirmapping-lookup" match="dataset/record" use="ID"/>

    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg concepts to profiles.</xd:desc>
    </xd:doc>
    <xsl:template name="bc-profile" mode="doProfileMapping" match="bevalling | baring | graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie | voorgenomen_voeding" as="element()">
        <xsl:variable name="concept" select="key('dataset-concept-lookup', @conceptId, $dataset-doc)"/>   
        <xsl:variable name="conceptID" select="$concept/@iddisplay"/>
        <xsl:variable name="profile" select="$fhirmapping/dataset/record[ID=$conceptID]/profile"/>     
            <xsl:choose>
                <xsl:when test="$profile!='nl-core-observation'">       
                    <profile value="{concat('http://nictiz.nl/fhir/StructureDefinition/',$profile)}"/>
                </xsl:when>
                <xsl:otherwise>
                    <profile value="{concat('http://fhir.nl/fhir/StructureDefinition/',$profile)}"/>
                </xsl:otherwise>            
            </xsl:choose>
        <!--</xsl:for-each>-->
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg categories for Conditions.</xd:desc>
    </xd:doc>
    <xsl:template name="bc-category" mode="doCategoryMapping" match="/" as="element()">
        <xsl:variable name="concept" select="key('dataset-concept-lookup', @conceptId, $dataset-doc)"/>   
        <xsl:variable name="conceptID" select="$concept/@iddisplay"/>
        <xsl:variable name="profile" select="$fhirmapping/dataset/record[ID=$conceptID]/profile"/>   
            <xsl:choose>
                <xsl:when test="$profile!='bc-DisorderOfPregnancy'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="173300003"/>
                            <display value="Disorder of pregnancy (disorder)"/>
                        </coding>
                    </category>
                </xsl:when>
                <xsl:when test="$profile!='bc-DisorderOfLaborAndDelivery'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="362972006"/>
                            <display value="Disorder of labor / delivery (disorder)"/>
                        </coding>
                    </category>
                </xsl:when>
                <xsl:when test="$profile!='bc-DisorderPostPartum'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="362973001"/>
                            <display value="Postpartum disorder"/>
                        </coding>
                    </category>
                </xsl:when>
                <xsl:when test="$profile!='bc-DisorderOfChild'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="414025005"/>
                            <display value="Disorder of fetus or newborn (disorder)"/>
                        </coding>
                    </category>
                 </xsl:when>           
            </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg terminology for Observations.</xd:desc>
    </xd:doc>
    <xsl:template name="bc-coding" mode="doTerminologyMapping" match="/" as="element()">      
        <xsl:variable name="concept" select="key('dataset-concept-lookup', @conceptId, $dataset-doc)"/>     
        <xsl:for-each select="$concept">
           <xsl:variable name="terminologies">
                <xsl:perform-sort select="terminologyAssociation" >
                    <xsl:sort select="@conceptId"/>
                </xsl:perform-sort>
            </xsl:variable> 
            <xsl:variable name="terminology" select="($terminologies/terminologyAssociation[@codeSystemName='SNOMED CT'] | $terminologies/terminologyAssociation[@codeSystemName='LOINC'] | $terminologies/terminologyAssociation)[1]"/>
            <coding>
                <system value="{$terminology/(@system|@codeSystem)}"/>
                <code value="{$terminology/@code}"/>
                <display value="{$terminology/(@display|@displayName)}"/>
            </coding>   
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="any-to-date" match="/" mode="doAnyToDate">
        <xsl:variable name="dateValue" select="nf:calculate-t-date(@value, current-date())"/>
        <valueDateTime value="{$dateValue}"/>
    </xsl:template>

</xsl:stylesheet>
