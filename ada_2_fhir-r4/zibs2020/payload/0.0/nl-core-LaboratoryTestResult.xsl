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
        <xd:desc>Create a single nl-core-LaboratoryTestResult instance as an Observation FHIR instance from ADA laboratorium_uitslag for a singlular test, that is, when it contains a single laboratorium_test.</xd:desc>
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

    <xd:doc>
        <xd:desc>Create a hierarchy of nl-core-LaboratoryTestResult instances as Observation FHIR instances from ADA laboratorium_uitslag for a panel test, that is, when a single laboratoriunm_uitslag contains multiple laboratorium_test's.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="_nl-core-LaboratoryTestResult-panel" match="laboratorium_uitslag[count(laboratorium_test) &gt; 1]" mode="nl-core-LaboratoryTestResult" as="element(f:Observation)*">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="$in/patient/*" as="element()?"/>
        
        <Observation>
            <xsl:call-template name="insertLogicalId"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult"/>
            </meta>
            <xsl:for-each select="$in/resultaat_status">
                <status>
                    <xsl:call-template name="code-to-code"/>
                </status>
            </xsl:for-each>
            <xsl:for-each select="$in/resultaat_type">
                <category>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </category>
            </xsl:for-each>
            <xsl:for-each select="$in/onderzoek">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </code>
            </xsl:for-each>
            
            <xsl:for-each select="$subject">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="wrapIn">subject</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="$in/uitvoerder">
                <performer>
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                    </xsl:call-template>
                </performer>
            </xsl:for-each>
                        
            <xsl:for-each select="$in/toelichting">
                <note>
                    <text>
                        <xsl:attribute name="value" select="./@value"/>
                    </text>
                </note>
            </xsl:for-each>
            
            <xsl:for-each select="$in/monster">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="wrapIn">specimen</xsl:with-param>
                    <xsl:with-param name="profile">
                        <xsl:choose>
                            <xsl:when test="count(microorganisme) &gt; 0">nl-core-LaboratoryTestResult.Specimen.asMicroorganism</xsl:when>
                            <xsl:otherwise>nl-core-LaboratoryTestResult.Specimen</xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="$in/laboratorium_test">
                <hasMember>
                    <xsl:call-template name="makeReference"/>
                </hasMember>
            </xsl:for-each>
            
            <!-- TODO: derivedFrom, sequelTo -->
        </Observation>
        
        <xsl:for-each select="$in/laboratorium_test">
            <xsl:call-template name="_nl-core-LaboratoryTestResult-individualTest">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Helper template to create a nl-core-LaboratoryTestResult instance representing a single LaboratoryTest (depending on the situation, this might be one of the tests within a panel or the entire zib).</xd:p>
            <xd:p>Note that the match is on laboratorium_test, not on laboratorium_uitslag, but that it's assumed that it is passed as part of a laboratorium_uitslag. This mechanism is needed to distinguish different laboratorium_test's withing a single laboratorium_uitslag. This helper template shouldn't be used directly; instead, the public-facing templates should be used.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="_nl-core-LaboratoryTestResult-individualTest" mode="_nl-core-LaboratoryTestResult-individualTest" match="laboratorium_test" as="element(f:Observation)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="$in/parent::laboratorium_uitslag/patient/*" as="element()?"/>
        
        <!-- The Observation partially represents the root concept of zib LaboratoryTestResult and partially the
             LaboratoryTest concept. Even when multiple instances are used (in a panel sitution), some data from the
             root is represented in all instances. -->
        <xsl:variable name="parent" select="$in/parent::laboratorium_uitslag"/>
        <Observation>
            <xsl:call-template name="insertLogicalId"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult"/>
            </meta>
            <status>
                <xsl:attribute name="value">
                    <xsl:choose>
                        <xsl:when test="$in/test_uitslag_status">
                            <!-- The test itself has a status. Now there are three possibilities regarding resultaat_status on
                                 the root:
                                 * It is absent. In this case we don't need to take care of it.
                                 * It is present and the same. In this case we don't care about it.
                                 * It is present and different. In this case it can be:
                                    * In accordance with this status. This is only possible for cluster tests, and this is
                                      a subtest, so we don't need to care about it here.
                                    * Not in accordance with this status. This is not conformant to the zib and we silently
                                      ignore this situation.
                                 Bottom line: we don't care about resultaat_status here. -->
                            <xsl:call-template name="code-to-code">
                                <xsl:with-param name="in" select="$in/test_uitslag_status"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$parent/resultaat_status">
                            <!-- The individual test doesn't have a status, but since resultaat_status on the root should
                                 always be in accordance with it, we can use it here (both in a singular test and a panel
                                 situation. -->
                            <xsl:call-template name="code-to-code">
                                <xsl:with-param name="in" select="$parent/resultaat_status"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>unknown</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </status>
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
                    <xsl:with-param name="profile">
                        <xsl:choose>
                            <xsl:when test="count(microorganisme) &gt; 0">nl-core-LaboratoryTestResult.Specimen.asMicroorganism</xsl:when>
                            <xsl:otherwise>nl-core-LaboratoryTestResult.Specimen</xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
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
    
    <xd:doc>
        <xd:desc>Create a nl-core-LaboratoryTestResult.Specimen instance as a Specimen FHIR instance from ADA laboratorium_uitslag/monster with microorganisme not populated. This results in a single instance of the profile where `Specimen.type` represents monstermateriaal (if present).</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
<!--    <xsl:template name="nl-core-LaboratoryTestResult.SpecimenAsMaterial" match="monster[not(microorganisme/@code)]" mode="nl-core-LaboratoryTestResult.Specimen" as="element(f:Specimen)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" as="element()?"/>

        <xsl:call-template name="_nl-core-LaboratoryTestResult.Specimen">
            <xsl:with-param name="type" select="monstermateriaal"/>
        </xsl:call-template>
    </xsl:template>
-->    
    <xd:doc>
        <xd:desc>Create one or two nl-core-LaboratoryTestResult.Specimen instances as Specimen FHIR instances from ADA laboratorium_uitslag/monster. Normally, a specimen according to the zib is the source material, not a derivation. However, the zib specifies that the sample may contain a microorganism (isolate) instead of, or in addition to, a source material:
        * When nothing is specified, an instance is created with `Speciment.type` empty.
        * When monstermateriaal is populated, an instance is created where `Specimen.type` represents monstermateriaal.
        * When only microorganisme is populated, an instance is created where `Specimen.type` represents microorganisme.
        * If both are populated, two instances are created where the "microorganisme" instance refers the "monstermateriaal" instance.
        </xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-LaboratoryTestResult-asMicroorganism" match="monster" mode="nl-core-LaboratoryTestResult.Specimen" as="element(f:Specimen)*">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" as="element()?"/>

        <xsl:choose>
            <xsl:when test="not(monstermateriaal or microorganisme)">
                <xsl:call-template name="_nl-core-LaboratoryTestResult.Specimen"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="(monstermateriaal | microorganisme)">
                    <xsl:call-template name="_nl-core-LaboratoryTestResult.Specimen">
                        <xsl:with-param name="in" select="./parent::monster"/>
                        <xsl:with-param name="type" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template to create a nl-core-LaboratoryTestResult.Specimen instance as Specimen FHIR instance from ADA laboratorium_uitslag/monster. This template can result in two slightly different outputs based on the type parameter:
        * if type contains ADA element monstermateriaal, `Specimen.type` will contain that code.
        * if type contains ADA element microorgansime, `Specimen.type` will contain that code. If in contains monstermateriaal, that instance will be referred using `Specimen.parent`.
        </xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="type">Either the monstermateriaal or microorganisme ADA element.</xd:param>
    </xd:doc>
    <xsl:template name="_nl-core-LaboratoryTestResult.Specimen" as="element(f:Specimen)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" as="element()?"/>
        <xsl:param name="type" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Specimen>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile">
                        <xsl:choose>
                            <xsl:when test="local-name($type) = 'microorganisme'">nl-core-LaboratoryTestResult.Specimen.asMicroorganism</xsl:when>
                            <xsl:otherwise>nl-core-LaboratoryTestResult.Specimen</xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.Specimen"/>
                </meta>
                
                <xsl:for-each select="$in/monsternummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier"/>
                    </identifier>
                </xsl:for-each>
                
                <xsl:for-each select="$type">
                    <type>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </type>
                </xsl:for-each>
                
                <xsl:for-each select="$in/aanname_datum_tijd">
                    <receivedTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </receivedTime>
                </xsl:for-each>
                
                <!-- If this instance should represent the microorganisme concept, but there's aslo monstermateriaal
                     defined, refer the monstermateriaal instance through .parent. The input is this very instance of
                     the monster element. -->
                <xsl:if test="$type[self::microorganisme] and $in/monstermateriaal">
                    <parent>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile">nl-core-LaboratoryTestResult.Specimen</xsl:with-param>
                        </xsl:call-template>
                    </parent>
                </xsl:if>
                
                <xsl:variable name="collection" as="element()*">
                    <xsl:for-each select="$in/afname_datum_tijd">
                        <collectedDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="./@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </collectedDateTime>
                    </xsl:for-each>
                    
                    <!-- TODO: Verzamelperiode -->
                    
                    <xsl:for-each select="$in/verzamelvolume">
                        <quantity>
                            <xsl:call-template name="hoeveelheid-to-Quantity"/>
                        </quantity>
                    </xsl:for-each>
                    
                    <xsl:for-each select="$in/afnameprocedure">
                        <method>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </method>
                    </xsl:for-each>

                    <xsl:variable name="bodySite" as="element()*">
                        <xsl:for-each select="morfologie">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-LaboratoryTestResult.Specimen.Morphology">
                                <valueCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept"/>
                                </valueCodeableConcept>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="$in/anatomische_locatie">
                            <xsl:call-template name="nl-core-AnatomicalLocation"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="count($bodySite) &gt; 0">
                        <bodySite>
                            <xsl:copy-of select="$bodySite"/>
                        </bodySite>
                    </xsl:if>
                </xsl:variable>
                <xsl:if test="count($collection) &gt; 0">
                    <collection>
                        <xsl:copy-of select="$collection"/>
                    </collection>
                </xsl:if>
                
                <xsl:variable name="container" as="element()*">
                    <xsl:for-each select="$in/monstervolgnummer">
                        <extension url="http://hl7.org/fhir/StructureDefinition/specimen-sequenceNumber">
                            <value value="{./@value}"/>                            
                        </extension>
                    </xsl:for-each>
                    
                    <xsl:for-each select="$in/containertype">
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
                
                <xsl:for-each select="$in/toelichting">
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
