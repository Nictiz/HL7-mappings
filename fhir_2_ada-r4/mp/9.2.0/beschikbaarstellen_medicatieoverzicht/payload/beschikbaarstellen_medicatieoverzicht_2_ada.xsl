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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:util="urn:hl7:utilities" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">
	<xsl:import href="../../../../zibs2020/payload/zib_latest_package.xsl"/>
	<xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="Bundle-MedicationOverview" select="'http://nictiz.nl/fhir/StructureDefinition/Bundle-MedicationOverview'"/>
    <xsl:variable name="MedicationOverview-Verification" select="'http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-Verification'"/>

	<xd:doc>
		<xd:desc>Base template for the main interaction.</xd:desc>
	</xd:doc>
	<xsl:template match="/">

		<xsl:variable name="bouwstenen" as="element()*">

			<!--  contactpersoon -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:RelatedPerson" mode="nl-core-ContactPerson"/>

			<!-- farmaceutisch_product -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Medication" mode="nl-core-PharmaceuticalProduct"/>

			<!-- zorgverlener -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:PractitionerRole" mode="resolve-HealthProfessional-PractitionerRole"/>

			<!-- zorgaanbieder -->
		    <!-- but not the zorgaanbieder in the List, unless it is also referenced from somewhere else than the List -->
		    <xsl:variable name="listOrganizationReference" select="f:Bundle/f:entry/f:resource/f:List/f:source/f:extension/f:valueReference/f:reference/@value" as="xs:string*"/>
		    <xsl:variable name="referencedElseWhere" select="f:Bundle/f:entry/f:resource/*[not(self::f:List)]//f:reference/@value = $listOrganizationReference"/>
		    
		    <xsl:choose>
		        <xsl:when test="not($referencedElseWhere)">
		            <!-- do not output the zorgaanbieder in the List in bouwstenen -->
		            <xsl:apply-templates select="f:Bundle/f:entry[f:fullUrl/@value ne $listOrganizationReference]/f:resource/f:Organization" mode="nl-core-HealthcareProvider-Organization"/>
		        </xsl:when>
		        <xsl:otherwise>
		            <xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Organization" mode="nl-core-HealthcareProvider-Organization"/>
		        </xsl:otherwise>		        
		    </xsl:choose>
		
			<!-- TODO lichaamslengte -->
			<!-- TODO lichaamsgewicht -->

		</xsl:variable>

		<adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_medicatieoverzicht.xsd">
			<meta status="new" created-by="generated" last-update-by="generated" creation-date="{current-dateTime()}" last-update-date="{current-dateTime()}"/>
			<data>
				<beschikbaarstellen_medicatieoverzicht app="mp-mp920" shortName="beschikbaarstellen_medicatieoverzicht" formName="medicatieoverzicht" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.191" transactionEffectiveDate="2021-04-14T15:39:26" prefix="mp-" language="nl-NL">
					<xsl:attribute name="title">Generated from HL7 FHIR medicatieoverzicht</xsl:attribute>
					<xsl:attribute name="id">DUMMY</xsl:attribute>

					<xsl:choose>
						<xsl:when test="count(f:Bundle/f:entry/f:resource/f:Patient) ge 2 or count(distinct-values(f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)/f:subject/f:reference/@value)) ge 2">
							<xsl:call-template name="util:logMessage">
								<xsl:with-param name="level" select="$logERROR"/>
								<xsl:with-param name="msg">Multiple Patients and/or subject references found. Please check.</xsl:with-param>
							</xsl:call-template>
							<!-- let's still output whatever is in the input -->
							<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Patient" mode="nl-core-Patient"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Patient" mode="nl-core-Patient"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each-group select="f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)" group-by="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/concat(f:system/@value, f:value/@value)">
						<medicamenteuze_behandeling>
							<identificatie>
								<xsl:attribute name="value" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/f:value/@value"/>
								<xsl:attribute name="root" select="local:getOid(f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/f:system/@value)"/>
							</identificatie>
							<!-- medicatieafspraak -->
							<xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = ('16076005', '33633005')]" mode="nl-core-MedicationAgreement"/>
							<!-- toedieningsafspraak -->
							<xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value = '422037009']" mode="nl-core-AdministrationAgreement"/>
							<!-- medicatie_gebruik -->
							<xsl:apply-templates select="current-group()[self::f:MedicationStatement/f:category/f:coding/f:code/@value = '422979000']" mode="nl-core-MedicationUse2"/>
						</medicamenteuze_behandeling>
					</xsl:for-each-group>
					<xsl:if test="not(empty($bouwstenen))">
						<bouwstenen>
							<xsl:copy-of select="$bouwstenen"/>
						</bouwstenen>
					</xsl:if>
				    <!-- documentgegevens --> 
				    <xsl:apply-templates select="f:Bundle[f:meta/f:profile/@value = $Bundle-MedicationOverview]/f:entry/f:resource/f:List[f:code/f:coding/f:code/@value = '11181000146103']" mode="MedicationOverview-2.0"/>
				</beschikbaarstellen_medicatieoverzicht>
			</data>
		</adaxml>
	</xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms MedicationOverview f:List resource to ADA documentgegevens.</xd:desc>
    </xd:doc>
    <xsl:template match="f:List" mode="MedicationOverview-2.0">
        <documentgegevens>
            <!-- document_datum -->
            <xsl:apply-templates select="f:date" mode="#current"/>
            <!-- auteur -->
            <xsl:apply-templates select="f:source" mode="#current"/>
            <!-- verificatie_patient -->
            <!-- verificatie_zorgverlener -->
            <xsl:apply-templates select="f:extension[@url = $MedicationOverview-Verification]" mode="#current"/>
        </documentgegevens>
    </xsl:template>    
    
    <xd:doc>
        <xd:desc>Transforms f:date to ADA document_datum.</xd:desc>
    </xd:doc>
    <xsl:template match="f:date" mode="MedicationOverview-2.0">
        <document_datum datatype="datetime">
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
        </document_datum>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms f:source to ADA auteur with either auteur_is_zorgaanbieder or auteur_is_patient child.</xd:desc>
    </xd:doc>
    <xsl:template match="f:source" mode="MedicationOverview-2.0">
        <xsl:variable name="MedicationOverview-SourceOrganization" select="'http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-SourceOrganization'"/>
        <auteur>
            <xsl:choose>
                <xsl:when test="f:extension/@url = $MedicationOverview-SourceOrganization">
                    <xsl:variable name="reference" select="f:extension[@url = $MedicationOverview-SourceOrganization]/f:valueReference/f:reference/@value"/>
                    <auteur_is_zorgaanbieder>
                        <!-- the zorgaanbieder in ada should not have @id attribute -->
                        <xsl:variable name="zorgaanbiederWithid" as="element()*">
                        <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$reference]/f:resource/f:Organization" mode="nl-core-HealthcareProvider-Organization"/>
                        </xsl:variable>
                    <zorgaanbieder>
                        <xsl:copy-of select="$zorgaanbiederWithid/*"/>
                    </zorgaanbieder>
                    </auteur_is_zorgaanbieder>
                </xsl:when>
                <xsl:when test="f:reference/@value = ancestor::f:Bundle/f:entry[f:resource/f:Patient]/f:fullUrl/@value">
                    <auteur_is_patient value="true"/>
                </xsl:when>
            </xsl:choose>
        </auteur>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms MedicationOverview-Verification f:extension to ADA verificatie_patient and ADA verificatie_zorgverlener children.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $MedicationOverview-Verification]" mode="MedicationOverview-2.0">
        <verificatie_patient>
            <xsl:if test="f:extension[@url = 'VerificationPatient']">
                <geverifieerd_met_patientq value="{f:extension[@url = 'VerificationPatient']/f:valueBoolean/@value}"/>
            </xsl:if>
            <xsl:if test="f:extension[@url = 'VerificationPatientDate']">
                <verificatie_datum>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2ADADate">
                            <xsl:with-param name="dateTime" select="f:extension[@url = 'VerificationPatientDate']/f:valueDateTime/f:value/@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </verificatie_datum>
            </xsl:if>
        </verificatie_patient>
        <verificatie_zorgverlener>
            <xsl:if test="f:extension[@url = 'VerificationHealthProfessional']">
                <geverifieerd_met_zorgverlenerq value="{f:extension[@url = 'VerificationHealthProfessional']/f:valueBoolean/@value}"/>
            </xsl:if>
            <xsl:if test="f:extension[@url = 'VerificationHealthProfessionalDate']">
                <verificatie_datum>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2ADADate">
                            <xsl:with-param name="dateTime" select="f:extension[@url = 'VerificationHealthProfessionalDate']/f:valueDateTime/f:value/@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </verificatie_datum>
            </xsl:if>
        </verificatie_zorgverlener>
    </xsl:template>
    
    
    
    
    
    
    
    
<!--    <xd:doc>
        <xd:desc>Template to convert f:list to ADA documentgegevens (920500)</xd:desc>
    </xd:doc>    
    <xsl:template match="f:List[f:meta/f:profile/@value eq 'http://nictiz.nl/fhir/StructureDefinition/MedicationOverview']" mode="MedicationOverview">
        <documentgegevens>
            <!-\- 920501 date -\->
            <xsl:variable name="dt">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="f:date/@value">
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            <document_datum value="{$dt}" datatype="datetime"/>
            <!-\-920-502 auteur-\->
            <auteur>
            <xsl:if test="f:source/f:extension/@url eq 'http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-SourceOrganization'">
                <auteur_is_zorgaanbieder>
                    <xsl:apply-templates select="//f:entry[f:fullUrl/@value eq current()/f:source/f:extension/f:valueReference/f:reference/@value]/f:resource/f:Organization" mode="nl-core-HealthcareProvider-Organization"/>
                    
                    
<!-\-                    <zorgaanbieder>
                        <xsl:variable name="path2Organization"
                          select="//f:entry[f:fullUrl/@value eq current()/f:source/f:extension/f:valueReference/f:reference/@value]/f:resource/f:Organization" as="node()"/>
                        
                        <zorgaanbieder_identificatienummer value="{$path2Organization/f:identifier/f:value/@value}"
                            root="{$path2Organization/f:id/@value}"/> 
                        
                        <!-\\-auteur_is_patient 920-503 (niet 626)-\\->
                        <auteur_is_patient value=""/> <!-\\-'', true, false, UNK-\\->
                            <organisatie_naam value="Apotheek De Gulle Gaper"
                            conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1178"/>
                        <contactgegevens comment="" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1180">
                            <telefoonnummers comment="" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1181">
                                <telefoonnummer value="099-98985678"
                                    conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1182"/>
                            </telefoonnummers>
                        </contactgegevens>
                        <adresgegevens comment="" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1189">
                            <straat value="Dorpsweg"
                                conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1190"/>
                            <huisnummer value="28" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1191"/>
                            <postcode value="1234AB" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1195"/>
                            <woonplaats value="Ons Dorp"
                                conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1196"/>
                            <adres_soort conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.1200"
                                value="5"
                                code="WP"
                                codeSystem="2.16.840.1.113883.5.1119"
                                displayName="Werkadres"/>
                        </adresgegevens>
                    </zorgaanbieder>-\->

                </auteur_is_zorgaanbieder>
            </xsl:if>
            </auteur>
            <!-\-verificatie_patient -\->
            http://nictiz.nl/fhir/StructureDefinition/ext-MedicationOverview.Verification
        </documentgegevens>
    </xsl:template>-->
    
</xsl:stylesheet>
