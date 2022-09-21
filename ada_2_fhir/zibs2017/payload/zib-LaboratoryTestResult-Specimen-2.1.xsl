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
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <!-- ============================================================================================== -->
    <!-- FIXME/TODO? We plakken hier het monsternummer en het monstervolgnummer aan elkaar met een '-'. Dit betekent dat we hier buiten het lab om een identificatie maken. Dat kan niet goed gaan.
        Verder weten we uit de praktijk dat labs monsternummer en monstervolgnummer en container-id door elkaar gooien, dus misschien is de input al vervuild.
    -->
    <!-- FIXME/TODO? Isolaat parent en Catethertip worden contained resources. Dit wordt oook zo gedaan in de FHIR STU3 core voorbeelden. Juist/onjuist in ons geval? -->
    <!-- ============================================================================================== -->

    <xsl:variable name="labSpecimens" as="element()*">
        <xsl:for-each-group select="//laboratory_test_result/specimen[.//(@value | @code | @nullFlavor)] | //laboratorium_uitslag/monster[.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <uniek-materiaal xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="(specimen_material | monstermateriaal)/(@displayName | @originalText)"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doLaboratoryResultSpecimenEntry-2.1">
                    <xsl:with-param name="uuid" select="$uuid"/>
                    <xsl:with-param name="searchMode">match</xsl:with-param>
                </xsl:apply-templates>
            </uniek-materiaal>
        </xsl:for-each-group>
    </xsl:variable>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="laboratoryResultSpecimenReference" match="laboratory_test_result/specimen[.//(@value | @code | @nullFlavor)] | laboratorium_uitslag/monster[.//(@value | @code | @nullFlavor)]" mode="doLaboratoryResultSpecimenReference-2.1" as="element()+">
        <xsl:variable name="theIdentifier" select="identificatie_nummer[@value] | identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$labSpecimens[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference value="{nf:getFullUrlOrId($theGroupElement/f:entry)}"/>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>

        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produces a FHIR entry element with a Specimen resource for LaboratoryTestResult</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a uuid from scratch limits reproduction of the same output as the uuids will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this resource is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Specimen.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="laboratoryResultSpecimenEntry" match="laboratory_test_result/specimen[.//(@value | @code | @nullFlavor)] | laboratorium_uitslag/monster[.//(@value | @code | @nullFlavor)]" mode="doLaboratoryResultSpecimenEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value] | ancestor::*/hcimroot/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>

        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-LaboratoryTestResult-Specimen-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                    <xsl:with-param name="dateT" select="$dateT"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of HCIM LaboratoryTestResult concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Specimen">zib-LaboratoryTestResult-Specimen</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Specimen resource for LaboratoryTestResult.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-LaboratoryTestResult-Specimen-2.1" match="laboratorium_test[not(laboratorium_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | laboratory_test[not(laboratory_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element()" mode="doZibLaboratoryTestResultSpecimen-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="currentAdaTransaction" select="./ancestor::*[ancestor::data]"/>
            <xsl:variable name="containedSpecimenId" select="generate-id(microorganism | microorganisme)"/>
            <xsl:variable name="containedDeviceId" select="generate-id(specimen_source | bron_monster)"/>
            <xsl:variable name="specimenSubject" as="element()*">
                <xsl:choose>
                    <!--ST	NL-CM:13.1.29			BronMonster	0..1	Indien het materiaal niet rechtstreeks bij de patiënt afgenomen, maar afkomstig is van een aan de patiënt gerelateerd voorwerp, zoals b.v een cathetertip, kan deze bron van het materiaal hier vastgelegd worden.	118170007 Specimen source identity-->
                    <xsl:when test="specimen_source | bron_monster">
                        <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-MedicalDeviceProduct</xsl:variable>
                        <Device>
                            <xsl:if test="string-length($containedDeviceId) gt 0">
                                <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $containedDeviceId)}"/>
                            </xsl:if>
                            <meta>
                                <profile value="{$profileValue}"/>
                            </meta>
                            <type>
                                <text value="{(specimen_source | bron_monster)/@value}"/>
                            </type>
                        </Device>
                        <subject>
                            <reference value="#{$containedDeviceId}"/>
                            <display value="{(specimen_source | bron_monster)/@value}"/>
                        </subject>
                    </xsl:when>
                    <!-- NL-CM:0.0.12			Patient -->
                    <xsl:otherwise>
                        <xsl:for-each select="$adaPatient">
                            <subject>
                                <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                            </subject>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="receivedDateTime" as="element()?">
                <!--TS	NL-CM:13.1.25			AannameDatumTijd	0..1	Datum en tijdstip waarop het materiaal bij het laboratorium of prikpunt is afgegeven. Het gaat hierbij om materiaal dat door de patiënt zelf verzameld is.		-->
                <xsl:if test="received_date_time | aanname_datum_tijd">
                    <receivedTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="received_date_time | aanname_datum_tijd"/>
                            <xsl:with-param name="inputDateT" select="$dateT"/>
                        </xsl:call-template>
                    </receivedTime>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="collectionDetails" as="element()?">
                <xsl:if test="
                        collection_period | verzamelperiode |
                        collected_volume | verzamelvolume |
                        collection_method | afname_procedure |
                        anatomical_location | anatomische_locatie">
                    <collection>
                        <!-- Pre-adopt 2019 where datatype has changed for NL-CM:13.1.24 CollectionPeriod from TS to TimeInterval -->
                        <!-- https://bits.nictiz.nl/browse/MM-767 -->
                        <xsl:for-each select="collection_period/duration | verzamelperiode/tijds_duur">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Specimen-CollectionDuration">
                                <valueDuration>
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueDuration>
                            </extension>
                        </xsl:for-each>
                        <xsl:choose>
                            <!--TS	NL-CM:13.1.24			Verzamelperiode	0..1	Indien het materiaal niet op één tijdstip afgenomen is maar gedurende een bepaalde tijd verzameld is, kan deze periode in dit concept vastgelegd worden. Een voorbeeld is 24 uurs urine.-->
                            <!-- https://bits.nictiz.nl/browse/ZIB-669 -->
                            <!--TS	NL-CM:20.3.2		startDatumTijd	0..1	De begindatum en tijd van het interval		-->
                            <!--TS	NL-CM:20.3.3		eindDatumTijd	0..1	De einddatum en tijd van het interval		-->
                            <!--PQ	NL-CM:20.3.4		tijdsDuur	0..1	De tijdsduur van het interval in een gewenste tijdseenheid (bv. dagen of uren, etc.).-->
                            <xsl:when test="collection_period[start_date_time | end_date_time] | verzamelperiode[start_datum_tijd | eind_datum_tijd]">
                                <collectedPeriod>
                                    <xsl:call-template name="startend-to-Period">
                                        <!-- StartDateTime -->
                                        <xsl:with-param name="start" select="collection_period/start_date_time | verzamelperiode/start_datum_tijd"/>
                                        <!-- EndDateTime -->
                                        <xsl:with-param name="end" select="collection_period/end_date_time | verzamelperiode/eind_datum_tijd"/>
                                        <xsl:with-param name="inputDateT" select="$dateT"/>
                                    </xsl:call-template>
                                </collectedPeriod>
                            </xsl:when>
                            <!--TS	NL-CM:13.1.17			AfnameDatumTijd	0..1	Tijdstip van afname van het materiaal.	399445004 specimen collection date-->
                            <xsl:when test="collection_period[@nullFlavor | @value] | verzamelperiode[@nullFlavor | @value] | collection_date_time | afname_datum_tijd">
                                <collectedDateTime>
                                    <xsl:call-template name="date-to-datetime">
                                        <xsl:with-param name="in" select="collection_date_time | afname_datum_tijd"/>
                                    </xsl:call-template>
                                </collectedDateTime>
                            </xsl:when>
                        </xsl:choose>

                        <!--PQ	NL-CM:13.1.23			Verzamelvolume	0..1	Totale volume van het verzamelde materiaal. Indien het noodzakelijk is om de absolute hoeveelheid van een bepaalde stof in het afgenomen of verzamelde materiaal te bepalen, dient het volume hiervan opgegeven te worden.-->
                        <xsl:if test="collected_volume | verzamelvolume">
                            <quantity>
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="collected_volume | verzamelvolume"/>
                                </xsl:call-template>
                            </quantity>
                        </xsl:if>

                        <!--CD	NL-CM:13.1.18			Afnameprocedure	0..1	Indien relevant voor de uitslag kan de wijze van verkrijgen van het monster opgegeven worden.	118171006 Specimen procedure	AfnameprocedureCodelijst-->
                        <xsl:if test="collection_method | afname_procedure">
                            <method>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="collection_method | afname_procedure"/>
                                </xsl:call-template>
                            </method>
                        </xsl:if>

                        <!--CD	NL-CM:13.1.26			AnatomischeLocatie	0..1	Anatomische locatie waar het materiaal verzameld is, bijvoorbeeld elleboog.	118169006 Specimen source topography	MonsterAnatomischeLocatieCodelijst-->
                        <xsl:if test="anatomical_location | anatomische_locatie">
                            <bodySite>
                                <!--CD	NL-CM:13.1.27			Lateraliteit	0..1	Lateraliteit verbijzondert de anatomische locatie door, indien van toepassing, de zijdigheid vast te leggen, bijvoorbeeld links.	272741003 Laterality	LateraliteitCodelijst-->
                                <xsl:for-each select="laterality | lateraliteit">
                                    <extension url="http://nictiz.nl/fhir/StructureDefinition/BodySite-Qualifier">
                                        <valueCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="."/>
                                            </xsl:call-template>
                                        </valueCodeableConcept>
                                    </extension>
                                </xsl:for-each>
                                <!--CD	NL-CM:13.1.28			Morfologie	0..1	Morfologie beschrijft morfologische afwijkingen van de normale vorm van de anatomische locatie waar het materiaal is afgenomen, bijvoorbeeld wond, zweer.	118168003 Specimen source morphology	MorfologieCodelijst-->
                                <xsl:for-each select="morphology | morfologie">
                                    <extension url="http://nictiz.nl/fhir/StructureDefinition/BodySite-Morphology">
                                        <valueCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="."/>
                                            </xsl:call-template>
                                        </valueCodeableConcept>
                                    </extension>
                                </xsl:for-each>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="anatomical_location | anatomische_locatie"/>
                                </xsl:call-template>
                            </bodySite>
                        </xsl:if>
                    </collection>
                </xsl:if>
            </xsl:variable>

            <!--NL-CM:13.1.2		Monster	0..1	Container van het concept Monster. Deze container bevat alle gegevenselementen van het concept Monster.	123038009 monster-->
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">
                    <xsl:choose>
                        <xsl:when test="microorganism | microorganisme">http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Specimen-Isolate</xsl:when>
                        <xsl:otherwise>http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Specimen</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <Specimen>
                    <xsl:if test="$referById">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>

                    <!--CD	NL-CM:13.1.22			Microorganisme	0..1	Bij met name microbiologische bepalingen is soms geen sprake materiaal maar van een isolaat met daarop een bepaald micro-organisme. Dit concept biedt de mogelijkheid informatie omtrent dit micro-organisme vast te leggen.		MicroorganismeCodelijst-->
                    <!--Assumptions when there is a micro-organism:
                        - collection info is about original specimen, not about the derived specimen (micro-organism)
                        - specimen_id and container info are about the derived specimen
                    -->
                    <xsl:if test="microorganism | microorganisme">
                        <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Specimen</xsl:variable>

                        <contained>
                            <Specimen>
                                <xsl:if test="string-length($containedSpecimenId) gt 0">
                                    <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $containedSpecimenId)}"/>
                                </xsl:if>
                                <meta>
                                    <profile value="{$profileValue}"/>
                                </meta>
                                <xsl:if test="specimen_material | monstermateriaal">
                                    <type>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="specimen_material | monstermateriaal"/>
                                        </xsl:call-template>
                                    </type>
                                </xsl:if>
                                <xsl:copy-of select="$specimenSubject/self::f:subject"/>
                                <xsl:copy-of select="$receivedDateTime"/>
                                <xsl:copy-of select="$collectionDetails"/>
                            </Specimen>
                        </contained>
                    </xsl:if>
                    <!--ST	NL-CM:13.1.29			BronMonster	0..1	Indien het materiaal niet rechtstreeks bij de patiënt afgenomen, maar afkomstig is van een aan de patiënt gerelateerd voorwerp, zoals b.v een cathetertip, kan deze bron van het materiaal hier vastgelegd worden.	118170007 Specimen source identity-->
                    <xsl:if test="$specimenSubject[self::f:Device]">
                        <contained>
                            <xsl:copy-of select="$specimenSubject/self::f:Device"/>
                        </contained>
                    </xsl:if>

                    <!--NL-CM:0.0.6   Identificatienummer-->
                    <!--II	NL-CM:13.1.15			Monsternummer	0..*	Identificerend nummer van het afgenomen materiaal, ter referentie voor navraag bij bronorganisatie. In de transmurale setting bestaat dit nummer uit een monsternummer inclusief de identificatie van de uitgevende organisatie, om uniek te zijn buiten de grenzen van een organisatie.-->
                    <!-- https://bits.nictiz.nl/browse/ZIB-1016 -->
                    <xsl:for-each select="specimen_id | monsternummer">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>

                    <!--CD	NL-CM:13.1.16			Monstermateriaal	0..1	Monstermateriaal beschrijft het afgenomen materiaal. Indien de LOINC testcode impliciet ook een materiaal beschrijft, mag dit element daar niet mee in strijd zijn. Indien gewenst kan dit gegeven wel een meer gedetailleerde beschrijving van het materiaal geven: LOINC codes bevatten de materialen alleen op hoofdniveau.
                    Dit is in lijn met de afspraken die gemaakt zijn in het IHE/Nictiz programma e-Lab. Indien de test uitgevoerd is op een afgeleid materiaal (bijv. plasma) bevat dit element toch het afgenomen materiaal (in dit geval bloed). De LOINC code zal in het algemeen in dit geval wel naar plasma wijzen.
                    370133003 Specimen substance	MonstermateriaalCodelijst-->
                    <xsl:choose>
                        <xsl:when test="microorganism | microorganisme">
                            <type>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="microorganism | microorganisme"/>
                                </xsl:call-template>
                            </type>
                        </xsl:when>
                        <xsl:otherwise>
                            <type>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="specimen_material | monstermateriaal"/>
                                </xsl:call-template>
                            </type>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:copy-of select="$specimenSubject/self::f:subject"/>

                    <xsl:if test="not(microorganism | microorganisme)">
                        <xsl:copy-of select="$receivedDateTime"/>
                    </xsl:if>
                    <xsl:if test="microorganism | microorganisme">
                        <parent>
                            <reference value="#{$containedSpecimenId}"/>
                            <xsl:if test="(specimen_material | monstermateriaal)[@code | @displayName]">
                                <display value="{string-join((specimen_material | monstermateriaal)/(@code, @displayName), ': ')}"/>
                            </xsl:if>
                        </parent>
                    </xsl:if>
                    <xsl:if test="not(microorganism | microorganisme)">
                        <xsl:copy-of select="$collectionDetails"/>
                    </xsl:if>

                    <xsl:if test="specimen_number_extension | monstervolgnummer | container_type | containertype">
                        <container>
                            <!--INT	NL-CM:13.1.20			Monstervolgnummer	0..1	Het monstervolgnummer wordt toegepast, als het verzamelde materiaal uit de oorspronkelijke buis of container verdeeld wordt over meerdere buizen. In combinatie met het monsternummer biedt het volgnummer de mogelijkheid de buis of container uniek te identificeren.		-->
                            <!-- https://bits.nictiz.nl/browse/ZIB-1016 Er kan logisch gezien maar 1 monsternummer zijn -->
                            <xsl:variable name="specimenNumber" select="specimen_id | monsternummer" as="element()?"/>
                            <xsl:for-each select="specimen_number_extension | monstervolgnummer">
                                <xsl:variable name="specimenNumberExtension" select="@value"/>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" as="element()">
                                            <xsl:copy copy-namespaces="no">
                                                <xsl:copy-of select="@*"/>
                                                <xsl:copy-of select="$specimenNumber/@root"/>
                                                <xsl:attribute name="value" select="string-join(($specimenNumber/@value, $specimenNumberExtension), '-')"/>
                                            </xsl:copy>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </identifier>
                            </xsl:for-each>

                            <!--CD	NL-CM:13.1.21			Containertype	0..1	Containertype beschrijft het omhulsel waarin het materiaal verzameld of verstuurd is. Voorbeelden zijn bloedbuizen, transportcontainer evt incl. kweekmedium.		ContainerTypeCodelijst-->
                            <xsl:if test="container_type | containertype">
                                <type>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="container_type | containertype"/>
                                    </xsl:call-template>
                                </type>
                            </xsl:if>
                        </container>
                    </xsl:if>

                    <!--ST	NL-CM:13.1.19			Toelichting	0..1	Opmerking over de afname, bijv. afname na (glucose)stimulus of medicijn inname.	48767-8 Annotation comment-->
                    <xsl:for-each select="(comment | toelichting)[@value]">
                        <note>
                            <text>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </text>
                        </note>
                    </xsl:for-each>
                    
                </Specimen>
            </xsl:variable>

            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>