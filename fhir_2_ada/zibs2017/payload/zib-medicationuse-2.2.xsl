<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir"
    xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions"
    xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="ext-zib-medication-period-of-use-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-stop-type-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-use-duration-2.0.xsl"/>
    <xsl:import href="ext-zib-Medication-AdditionalInformation-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="zib-body-height-2.1.xsl"/>
    <xsl:import href="zib-body-weight-2.1.xsl"/>
    <xsl:import href="zib-problem-2.1.xsl"/>-->

    <xsl:variable name="zib-MedicationUse"
        select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse'"/>
    <xsl:variable name="practitionerrole-reference"
        select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    <xsl:variable name="prescriber-url"
        select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Prescriber'"/>
    <xsl:variable name="author-url"
        select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author'"/>
    <xsl:variable name="periodofuse-url"
        select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'"/>
    <xsl:variable name="zib-MedicationUse-Duration"
        select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration'"/>

    <xd:doc>
        <xd:desc>Template for converting f:MedicationStatement to MedicationUse</xd:desc>
    </xd:doc>
    <xsl:template match="f:MedicationStatement" mode="zib-MedicationUse-2.2">
        <medicatie_gebruik>
            <xsl:apply-templates select="f:effectivePeriod" mode="#current"/>
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <xsl:apply-templates select="f:dateAsserted" mode="#current"/>
            <xsl:apply-templates select="f:taken" mode="#current"/>
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <!-- gebruiksinstructie -->
            <xsl:apply-templates select="f:dosage" mode="zib-instructions-for-use-2.0"/>
            <xsl:apply-templates select="f:informationSource" mode="#current"/>
            <!-- auteur -->
            <xsl:apply-templates select="f:extension[@url=$author-url]" mode="#current"/>
            <xsl:apply-templates select="f:note" mode="#current"/>
        </medicatie_gebruik>
    </xsl:template>

    <!-- identificatie -->
    <xsl:template match="f:identifier" mode="zib-MedicationUse-2.2">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>

    <!-- gebruiksperiode-->
    <xsl:template match="f:effectivePeriod" mode="zib-MedicationUse-2.2">
        <xsl:apply-templates select="f:start" mode="#current"/>
        <xsl:apply-templates select="f:end" mode="#current"/>
    </xsl:template>
    <!-- gebruiksperiode_start -->
    <xsl:template match="f:start" mode="zib-MedicationUse-2.2">
        <gebruiksperiode_start>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_start>
    </xsl:template>
    <!-- gebruiksperiode_eind -->
    <xsl:template match="f:end" mode="zib-MedicationUse-2.2">
        <gebruiksperiode_eind>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_eind>
    </xsl:template>

    <!-- registratiedatum -->
    <xsl:template match="f:dateAsserted" mode="zib-MedicationUse-2.2">
        <registratiedatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </registratiedatum>
    </xsl:template>

    <!-- gebruik_indicator -->
    <!-- 
    ADA = Boolean   
    In FHIR:    
    Code Display	Definition
    y	Yes	Positive assertion that patient has taken medication
    n	No	Negative assertion that patient has not taken medication
    unk	Unknown	Unknown assertion if patient has taken medication
    na	Not Applicable	Patient reporting does not apply -->

    <xsl:template match="f:taken" mode="zib-MedicationUse-2.2">
        <gebruik_indicator>
            <xsl:choose>
                <xsl:when test="@value = 'y'">
                    <xsl:attribute name="value" select="'true'"/>
                </xsl:when>
                <xsl:when test="@value = 'n'">
                    <xsl:attribute name="value" select="'false'"/>
                </xsl:when>
                <xsl:when test="@value = 'na'">
                    <xsl:attribute name="nullFlavor" select="'NA'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor" select="'UNK'"/>
                </xsl:otherwise>
            </xsl:choose>

        </gebruik_indicator>
    </xsl:template>

    <!-- gebruiks_product -->
    <xsl:template match="f:medicationReference" mode="zib-MedicationUse-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <gebruiks_product>
            <xsl:apply-templates
                select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Medication"
                mode="zib-PharmaceuticalProduct-2.0"/>
        </gebruiks_product>
    </xsl:template>

    <!-- informant -->
    <!-- Niet alle references zitten in de Bundle -->
    <xsl:template match="f:informationSource" mode="zib-MedicationUse-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <xsl:variable name="referenceValuePractitionerRole"
            select="f:extension/f:valueReference/f:reference/@value"/>
        <informant>
            <xsl:choose>
                <xsl:when
                    test="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Patient">
                    <informant_is_patient>
                        <xsl:attribute name="value" select="'true'"/>
                    </informant_is_patient>
                </xsl:when>
                <xsl:when
                    test="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Practitioner or ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValuePractitionerRole]/f:resource/f:PractitionerRole">
                    <informant_is_zorgverlener>
                        <xsl:attribute name="value" select="'true'"/>
                    </informant_is_zorgverlener>
                </xsl:when>
                <xsl:when
                    test="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:RelatedPerson">
                    <persoon>
                        <xsl:attribute name="value" select="'true'"/>
                    </persoon>
                </xsl:when>
            </xsl:choose>
        </informant>
    </xsl:template>
    
    <!-- Auteur -->
    <xsl:template match="f:extension[@url=$author-url]" mode="zib-MedicationUse-2.2">
        <xsl:variable name="referenceValue" select="f:valueReference/f:reference/@value"/>
        <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:*)[1]"/>
        <auteur>
            <xsl:choose>
                <xsl:when test="$resource/local-name()='Patient'">        
                    <auteur_is_patient>
                        <xsl:attribute name="value" select="'true'"/>
                    </auteur_is_patient>
                </xsl:when>
                <xsl:when test="$resource/local-name()='Practitioner'">
                    <auteur_is_zorgverlener>
                        <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0"/>
                    </auteur_is_zorgverlener>    
                </xsl:when>
                <xsl:when test="$resource/local-name()='PractitionerRole'">
                    <auteur_is_zorgverlener>
                        <xsl:apply-templates select="$resource" mode="resolve-practitionerRole"/>
                    </auteur_is_zorgverlener>    
                </xsl:when>
                <xsl:when test="$resource/local-name()='Organization'">
                    <auteur_is_zorgverlener>
                        <xsl:apply-templates select="$resource" mode="nl-core-organization-2.0">
                            <xsl:with-param name="organizationIdUnderscore" select="true()" tunnel="yes"/>
                        </xsl:apply-templates>
                    </auteur_is_zorgverlener>   
                </xsl:when>
            </xsl:choose>            
        </auteur>   
    </xsl:template>

    <!-- toelichting -->
    <xsl:template match="f:note" mode="zib-MedicationUse-2.2">
        <toelichting value="{f:text/@value}"/>
    </xsl:template>

</xsl:stylesheet>
