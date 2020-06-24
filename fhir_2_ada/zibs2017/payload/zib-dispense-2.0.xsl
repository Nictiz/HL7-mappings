<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="nl-core-location-2.0.xsl"/>
    <xsl:import href="zib-pharmaceuticalproduct-2.0.xsl"/>
    <xsl:import href="ext-zib-Medication-AdditionalInformation-2.0.xsl"/>
    
    <xsl:variable name="zib-Dispense-RequestDate" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate'"/>
    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    <xsl:variable name="zib-Dispense-DistributionForm" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-DistributionForm'"/>
    
    <xsl:template match="f:MedicationDispense" mode="zib-Dispense-2.0">
        <verstrekking>
            <!-- identificatie -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- datum -->
            <xsl:choose>
                <xsl:when test="f:whenHandedOver">
                    <xsl:apply-templates select="f:whenHandedOver" mode="#current"/>
                </xsl:when>
                <xsl:otherwise>
                    <datum nullFlavor="UNK"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- aanschrijfdatum -->
            <xsl:apply-templates select="f:extension[@url=$zib-Dispense-RequestDate]" mode="#current"/>
            <!-- verstrekker -->
            <xsl:apply-templates select="f:performer" mode="#current"/>
            <!-- verstrekte_hoeveelheid -->
            <xsl:apply-templates select="f:quantity" mode="#current"/>
            <!-- verstrekt_geneesmiddel -->
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <!-- verbruiksduur -->
            <xsl:apply-templates select="f:daysSupply" mode="#current"/>
            <!-- afleverlocatie -->
            <xsl:apply-templates select="f:destination" mode="#current"/>
            <!-- distributievorm -->
            <xsl:apply-templates select="f:extension[@url=$zib-Dispense-DistributionForm]" mode="#current"/>
            <!-- aanvullende_informatie -->
            <xsl:apply-templates select="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation']" mode="ext-zib-Medication-AdditionalInformation-2.0"/>
            <!-- toelichting -->
            <xsl:apply-templates select="f:note" mode="#current"/>
            <!-- relatie_naar_verstrekkingsverzoek -->
            <xsl:apply-templates select="f:authorizingPrescription" mode="#current"/>
        </verstrekking>
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="zib-Dispense-2.0">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>
    
    <xsl:template match="f:whenHandedOver" mode="zib-Dispense-2.0">
        <datum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
        </datum>
    </xsl:template>
    
    <xsl:template match="f:extension[@url=$zib-Dispense-RequestDate]" mode="zib-Dispense-2.0">
        <aanschrijfdatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="f:valueDateTime/@value"/>
                </xsl:call-template>
            </xsl:attribute>
        </aanschrijfdatum>
    </xsl:template>
    
    <xsl:template match="f:performer" mode="zib-Dispense-2.0">
        <verstrekker>
            <xsl:choose>
                <xsl:when test="f:actor/f:extension[@url=$practitionerrole-reference]">
                    <xsl:apply-templates select="f:actor/f:extension[@url=$practitionerrole-reference]/f:valueReference" mode="#current">
                        <xsl:with-param name="idUnderscore" select="true()" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="referenceValue" select="f:actor/f:reference/@value"/>
                    <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:*)[1]"/>
                    <xsl:choose>
                        <xsl:when test="$resource/local-name()='Practitioner'">
                            <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0"/>
                        </xsl:when>
                        <xsl:when test="$resource/local-name()='Organization'">
                            <xsl:apply-templates select="$resource" mode="nl-core-organization-2.0">
                                <xsl:with-param name="idUnderscore" select="true()" tunnel="yes"/>
                            </xsl:apply-templates>
                        </xsl:when>
                    </xsl:choose>
                    <!-- f:onBehalfOf? -->
                    <!-- nl-core-patient, HCIM MedicalDevice Product, nl-core-relatedperson -->
                </xsl:otherwise>
            </xsl:choose>
        </verstrekker>
    </xsl:template>
    
    <xsl:template match="f:quantity" mode="zib-Dispense-2.0">
        <verstrekte_hoeveelheid>
            <xsl:call-template name="Quantity-to-hoeveelheid-complex">
                <xsl:with-param name="adaWaarde">aantal</xsl:with-param>
            </xsl:call-template>
        </verstrekte_hoeveelheid>
    </xsl:template>
    
    <xsl:template match="f:medicationReference" mode="zib-Dispense-2.0">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <verstrekt_geneesmiddel>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>
        </verstrekt_geneesmiddel>        
    </xsl:template>
    
    <!--<verbruiksduur/>
                <afleverlocatie/>
                <distributievorm/>-->
    <xsl:template match="f:daysSupply" mode="zib-Dispense-2.0">
        <!--<verbruiksduur>-->
            <xsl:call-template name="Duration-to-hoeveelheid">
                <xsl:with-param name="adaElementName">verbruiksduur</xsl:with-param>
            </xsl:call-template>
        <!--</verbruiksduur>-->
    </xsl:template>
    
    <xsl:template match="f:destination" mode="zib-Dispense-2.0">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <afleverlocatie>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:Location" mode="nl-core-location-2.0"/>
        </afleverlocatie>  
    </xsl:template>
    
    <xsl:template match="f:extension[@url=$zib-Dispense-DistributionForm]" mode="zib-Dispense-2.0">
        <!--<distributievorm>-->
            <xsl:call-template name="CodeableConcept-to-code">
                <xsl:with-param name="in" select="f:valueCodeableConcept"/>
                <xsl:with-param name="adaElementName">distributievorm</xsl:with-param>
            </xsl:call-template>
        <!--</distributievorm>-->
    </xsl:template>
    
    <xsl:template match="f:note" mode="zib-Dispense-2.0">
        <toelichting value="{f:text/@value}"/>
    </xsl:template>
    
    <xsl:template match="f:authorizingPrescription" mode="zib-Dispense-2.0">
        <relatie_naar_verstrekkingsverzoek>
            <xsl:call-template name="Identifier-to-identificatie">
                <xsl:with-param name="in" select="f:identifier"/>
            </xsl:call-template>
        </relatie_naar_verstrekkingsverzoek>
    </xsl:template>
    
    <!--<xsl:template name="zib-Dispense-2.0">
        <xsl:param name="verstrekking" as="element()?"/>
        <xsl:param name="medicationdispense-id" as="xs:string?"/>
        
        <xsl:for-each select="$verstrekking">
            <xsl:variable name="resource">
                <MedicationDispense>
                    <xsl:for-each select="$medicationdispense-id">
                        <id value="{.}"/>
                    </xsl:for-each>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense"/>
                    </meta>
                    <!-\- distributievorm -\->
                    <xsl:for-each select="./distributievorm[@code]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-DistributionForm">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
                    <!-\- aanschrijfdatum -\->
                    <xsl:for-each select="./aanschrijfdatum[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate">
                            <valueDateTime value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                        </extension>
                    </xsl:for-each>
                    <!-\- aanvullende_informatie -\->
                    <xsl:for-each select="aanvullende_informatie[@code]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
                    <!-\- relatie naar medicamenteuze behandeling -\->
                    <xsl:for-each select="./../identificatie[@value]">
                        <xsl:call-template name="ext-zib-medication-medication-treatment-2.0">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-\- MVE id -\->
                    <xsl:for-each select="./identificatie[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    <!-\- type bouwsteen, hier een medicatieverstrekking -\->
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="373784005"/>
                            <display value="Dispensing medication (procedure)"/>
                        </coding>
                        <text value="Medicatieverstrekking"/>
                    </category>
                    <!-\- geneesmiddel -\->
                    <xsl:apply-templates select="./verstrekt_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReference"/>
                    <!-\- patiënt -\->
                    <subject>
                        <xsl:apply-templates select="./../../patient" mode="doPatientReference-2.1"/>
                    </subject>
                    <!-\- verstrekker -\->
                    <xsl:apply-templates select="./verstrekker[.//(@value | @code)]" mode="doPerformerActor"/>
                    <!-\- relatie naar verstrekkingsverzoek -\->
                    <xsl:for-each select="./relatie_naar_verstrekkingsverzoek/identificatie[@value]">
                        <authorizingPrescription>
                            <identifier>
                                <xsl:call-template name="id-to-Identifier">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </identifier>
                            <display value="Verstrekkingsverzoek met identificatie {./@value} in identificerend systeem {./@root}."/>
                        </authorizingPrescription>
                    </xsl:for-each>
                    <xsl:for-each select="./verstrekte_hoeveelheid[.//*[@value]]">
                        <quantity>
                            <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                                <xsl:with-param name="eenheid" select="./eenheid"/>
                                <xsl:with-param name="waarde" select="./aantal"/>
                            </xsl:call-template>
                        </quantity>
                    </xsl:for-each>
                    <!-\- verbruiksduur -\->
                    <xsl:for-each select="./verbruiksduur[@value]">
                        <daysSupply>
                            <xsl:call-template name="hoeveelheid-to-Duration">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </daysSupply>
                    </xsl:for-each>
                    <!-\- datum -\->
                    <xsl:for-each select="./datum[@value]">
                        <whenHandedOver value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                    </xsl:for-each>
                    <!-\- afleverlocatie -\->
                    <xsl:for-each select="./afleverlocatie[@value]">
                        <destination>
                            <xsl:apply-templates select="." mode="doLocationReference"/>
                        </destination>
                    </xsl:for-each>
                    <!-\- toelichting  -\->
                    <xsl:for-each select="./toelichting[@value]">
                        <note>
                            <text value="{./@value}"/>
                        </note>
                    </xsl:for-each>
                </MedicationDispense>
            </xsl:variable>
            
            <!-\- Add resource.text -\->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>-->
    
</xsl:stylesheet>