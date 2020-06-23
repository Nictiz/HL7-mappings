<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:variable name="zib-Dispense-RequestDate" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate'"/>
    
    <xsl:template match="f:MedicationDispense" mode="zib-Dispense-2.0">
        <verstrekking>
            <!-- identificatie -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- datum -->
            <xsl:apply-templates select="f:whenHandedOver" mode="#current"/>
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
            <xsl:apply-templates select="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-DistributionForm']" mode="#current"/>
            <!-- aanvullende_informatie -->
            <xsl:apply-templates select="f:additionalInformation" mode="#current"/>
            <!-- toelichting -->
            <xsl:apply-templates select="f:note" mode="#current"/>
            <!-- relatie_naar_verstrekkingsverzoek -->
            <xsl:apply-templates select="f:authorizingPrescription" mode="#current"/>
        </verstrekking>
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