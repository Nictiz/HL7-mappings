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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA [...] to FHIR [...] conforming to profile [...]</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create a nl-core-[zib name] instance as a [resource name] FHIR instance from ADA [ADA instance name].</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-LaboratoryTestResult-singular" match="laboratorium_uitslag[count(laboratorium_test) = 1]" mode="nl-core-LaboratoryTestResult" as="element(f:Observation)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:call-template name="_nl-core-LaboratoryTestResult-individualTest">
            <xsl:with-param name="in" select="laboratorium_test"/>
            <xsl:with-param name="subject" select="$subject"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="_nl-core-LaboratoryTestResult-panel" match="laboratorium_uitslag[count(laboratorium_test) &gt; 1]" mode="nl-core-LaboratoryTestResult" as="element(f:Observation)*">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <Observation>
            <xsl:call-template name="insertLogicalId"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult"/>
            </meta>
            <xsl:for-each select="resultaat_status">
                <status>
                    <xsl:call-template name="code-to-code"/>
                </status>
            </xsl:for-each>
            <xsl:for-each select="resultaat_type">
                <category>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </category>
            </xsl:for-each>
            <xsl:for-each select="onderzoek">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </code>
            </xsl:for-each>
            
            <xsl:for-each select="$subject">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="wrapIn">subject</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="uitvoerder">
                <performer>
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                    </xsl:call-template>
                </performer>
            </xsl:for-each>
                        
            <xsl:for-each select="toelichting">
                <note>
                    <text>
                        <xsl:attribute name="value" select="./@value"/>
                    </text>
                </note>
            </xsl:for-each>
            
            <xsl:for-each select="monster">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="wrapIn">specimen</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="laboratorium_test">
                <hasMember>
                    <xsl:call-template name="makeReference"/>
                </hasMember>
            </xsl:for-each>
            
            <!-- TODO: derivedFrom, sequelTo -->
        </Observation>
        
        <xsl:for-each select="laboratorium_test">
            <xsl:call-template name="_nl-core-LaboratoryTestResult-individualTest">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="_nl-core-LaboratoryTestResult-individualTest" mode="_nl-core-LaboratoryTestResult-individualTest" match="laboratorium_test" as="element(f:Observation)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="$in/parent::laboratorium_uitslag/patient/*" as="element()?"/>
        
        <xsl:variable name="parent" select="$in/parent::laboratorium_uitslag"/>
        <Observation>
            <xsl:call-template name="insertLogicalId"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult"/>
            </meta>
            <xsl:for-each select="$in/test_uitslag_status">
                <status>
                    <xsl:call-template name="code-to-code"/>
                </status>
            </xsl:for-each>
            <xsl:for-each select="$parent/resultaat_type">
                <category>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </category>
            </xsl:for-each>
            <xsl:for-each select="$in/test_code">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </code>
            </xsl:for-each>
            
            <xsl:for-each select="$subject">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="wrapIn">subject</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="$in/test_datum_tijd">
                <effectiveDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="./@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </effectiveDateTime>
            </xsl:for-each>
            <xsl:for-each select="$parent/uitvoerder">
                <performer>
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                    </xsl:call-template>
                </performer>
            </xsl:for-each>
            
            <xsl:for-each select="$in/test_uitslag">
                <xsl:call-template name="any-to-value">
                    <xsl:with-param name="elemName">value</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="$in/interpretatie_vlaggen">
                <interpretation>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </interpretation>
            </xsl:for-each>
            <xsl:for-each select="$in/uitslag_interpretatie">
                <interpretation>
                    <text>
                        <xsl:attribute name="value" select="./@value"/>
                    </text>
                </interpretation>
            </xsl:for-each>
            
            <xsl:for-each select="$parent/toelichting">
                <note>
                    <text>
                        <xsl:attribute name="value" select="./@value"/>
                    </text>
                </note>
            </xsl:for-each>
            
            <xsl:for-each select="$in/testmethode">
                <method>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </method>
            </xsl:for-each>
            
            <xsl:for-each select="$parent/monster">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="wrapIn">specimen</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:if test="$in/referentie_ondergrens or $in/referentie_bovengrens">
                <xsl:for-each select="$in/referentie_ondergrens">
                    <xsl:call-template name="any-to-value">
                        <xsl:with-param name="elemName">low</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$in/referentie_bovengrens">
                    <xsl:call-template name="any-to-value">
                        <xsl:with-param name="elemName">high</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:if>
            
            <!-- TODO: derivedFrom, sequelTo -->
        </Observation>
    </xsl:template>
    
    <xsl:template name="nl-core-LaboratoryTestResult.SpecimenAsMaterial" match="monster[monstermateriaal/@code]" mode="nl-core-LaboratoryTestResult.Specimen" as="element(f:Specimen)*">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" as="element()?"/>
        
        <xsl:call-template name="_nl-core-LaboratoryTestResult.Specimen">
            <xsl:with-param name="type" select="monstermateriaal"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="nl-core-LaboratoryTestResult.SpecimenAsMicroorganism" match="monster[microorganisme/@code]" mode="nl-core-LaboratoryTestResult.Specimen" as="element(f:Specimen)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" as="element()?"/>

        <xsl:if test="monstermateriaal">
            <xsl:call-template name="_nl-core-LaboratoryTestResult.Specimen">
                <xsl:with-param name="type" select="monstermateriaal"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:call-template name="_nl-core-LaboratoryTestResult.Specimen">
            <xsl:with-param name="type" select="microorganisme"/>
            <xsl:with-param name="parent" select="."/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="_nl-core-LaboratoryTestResult.Specimen" as="element(f:Specimen)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" as="element()?"/>
        <xsl:param name="type" required="yes"/>
        <xsl:param name="parent" as="element()*"/>
        
        <xsl:for-each select="$in">
            <Specimen>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.Specimen"/>
                </meta>
                
                <xsl:for-each select="monsternummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier"/>
                    </identifier>
                </xsl:for-each>
                
                <xsl:for-each select="$type">
                    <type>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </type>
                </xsl:for-each>
                
                <xsl:for-each select="aanname_datum_tijd">
                    <receivedTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </receivedTime>
                </xsl:for-each>
                
                <xsl:for-each select="$parent">
                    <parent>
                        <xsl:call-template name="makeReference"/>
                    </parent>
                </xsl:for-each>
                
                <xsl:variable name="collection" as="element()*">
                    <xsl:for-each select="afname_datum_tijd">
                        <collectedDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="./@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </collectedDateTime>
                    </xsl:for-each>
                    
                    <!-- TODO: Verzamelperiode -->
                    
                    <xsl:for-each select="verzamelvolume">
                        <quantity>
                            <xsl:call-template name="hoeveelheid-to-Quantity"/>
                        </quantity>
                    </xsl:for-each>
                    
                    <xsl:for-each select="afnameprocedure">
                        <method>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </method>
                    </xsl:for-each>
                    
                    <xsl:for-each select="anatomische_locatie">
                        <bodySite>
                            <xsl:call-template name="nl-core-AnatomicalLocation"/>
                        </bodySite>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:if test="count($collection) &gt; 0">
                    <collection>
                        <xsl:copy-of select="$collection"/>
                    </collection>
                </xsl:if>
                
                <xsl:variable name="container">
                    <xsl:for-each select="monstervolgnummer">
                        <extension url="http://hl7.org/fhir/StructureDefinition/specimen-sequenceNumber">
                            
                        </extension>
                    </xsl:for-each>
                    
                    <xsl:for-each select="containertype">
                        <type>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </type>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:if test="count($container) &gt; 0">
                    <container>
                        <xsl:copy-of select="$container"/>
                    </container>
                </xsl:if>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </note>
                </xsl:for-each>
            </Specimen>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="laboratorium_uitslag" mode="_generateId">
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="laboratorium_uitslag" mode="_generateDisplay">
    </xsl:template>
</xsl:stylesheet>
