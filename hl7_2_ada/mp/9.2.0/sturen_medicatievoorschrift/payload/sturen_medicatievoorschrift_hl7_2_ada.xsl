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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../hl7_2_ada_mp92_include.xsl"/>
    <xsl:import href="../../../../zibs2020/payload/all-zibs.xsl"/>
    <!-- to be phased out _zib2020.xsl -->
    <xsl:import href="../../../../zibs2020/payload/_zib2020.xsl"/>
    <xsl:import href="../../../../../ada_2_ada/ada/AddConceptIds.xsl"/>

    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <!-- Dit is een conversie van MP 9.1.0 naar ADA 9.0 voorschrift bericht -->
    <!-- parameter to control whether or not the result should contain a reference to the ada xsd -->
    <xsl:param name="outputSchemaRef" as="xs:boolean" select="true()"/>
    <xsl:param name="schemaFileString" as="xs:string?">../../hl7_2_ada/mp/9.2.0/sturen_medicatievoorschrift/ada_schemas/sturen_medicatievoorschrift.xsd</xsl:param>
    <!-- whether or not this hl7_2_ada conversion should deduplicate bouwstenen, such as products, health providers, health professionals, contact persons -->
    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="false()"/>
    <!--    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="true()"/>-->
    <!-- wether or not to add adaconcept id's, this is not really necessary, so out of performance considerations this should be false() -->
    <!--        <xsl:param name="addAdaConceptId" as="xs:boolean?" select="false()"/>-->
    <xsl:param name="addAdaConceptId" as="xs:boolean?" select="true()"/>

    <xsl:variable name="medicatiegegevens-lijst-92" select="//hl7:organizer[@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4'] | //hl7:ClinicalDocument"/>
    <xsl:variable name="filename" select="tokenize(document-uri(/), '/')[last()]"/>
    <xsl:variable name="extension" select="tokenize($filename, '\.')[last()]"/>
    <xsl:variable name="idBasedOnFilename" select="replace($filename, concat('.', $extension, '$'), '')"/>
    <xsl:param name="theId">
        <xsl:choose>
            <xsl:when test="string-length($idBasedOnFilename) gt 0">
                <xsl:value-of select="$idBasedOnFilename"/>
            </xsl:when>
            <xsl:when test="string-length($medicatiegegevens-lijst-92/../../../hl7:id/@extension) gt 0">
                <!-- let's use the extension of the message id -->
                <xsl:value-of select="$medicatiegegevens-lijst-92/../../../hl7:id/@extension"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="generate-id(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>


    <xsl:variable name="elmContactPerson">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">contact_person</xsl:when>
            <xsl:otherwise>contactpersoon</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="elmHealthcareProvider">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">healthcare_provider</xsl:when>
            <xsl:otherwise>zorgaanbieder</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="elmHealthProfessional">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">health_professional</xsl:when>
            <xsl:otherwise>zorgverlener</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
   



    <xd:doc>
        <xd:desc> if this xslt is used stand alone the template below could be used. </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="patient-recordTarget" select="//hl7:recordTarget/hl7:patientRole"/>
        <xsl:call-template name="Voorschrift-90-ADA">
            <xsl:with-param name="patient" select="$patient-recordTarget"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create adaxml for transaction voorschrift</xd:desc>
        <xd:param name="patient">HL7 patient</xd:param>
    </xd:doc>
    <xsl:template name="Voorschrift-90-ADA">
        <xsl:param name="patient" select="//hl7:recordTarget/hl7:patientRole"/>
        <xsl:call-template name="doGeneratedComment">
            <xsl:with-param name="in" select="//*[hl7:ControlActProcess]"/>
        </xsl:call-template>
        <xsl:variable name="adaXml">
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:if test="$outputSchemaRef">
                    <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_sturen_medicatievoorschrift.xsd</xsl:attribute>
                </xsl:if>
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <sturen_medicatievoorschrift app="mp-mp920" shortName="sturen_medicatievoorschrift" formName="sturen_voorschrift" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.271" transactionEffectiveDate="2021-05-05T10:25:34" versionDate="" prefix="mp-" language="nl-NL" title="{$theId}" id="{$theId}">
                        <xsl:for-each select="$patient">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20210701">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="language" select="$language"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- medicatiebouwstenen -->
                        <xsl:variable name="component" select="//*[hl7:templateId/@root = $templateId-medicatieafspraak] | //*[hl7:templateId/@root = $templateId-verstrekkingsverzoek]"/>
                        <xsl:for-each-group select="$component" group-by="concat(hl7:entryRelationship/hl7:procedure[hl7:templateId = $templateId-medicamenteuze-behandeling]/hl7:id/@root, hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id/@extension)">
                            <!-- medicamenteuze_behandeling -->
                            <medicamenteuze_behandeling>
                                <xsl:for-each select="hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id">
                                    <xsl:variable name="elemName">identificatie</xsl:variable>
                                    <xsl:element name="{$elemName}">
                                        <xsl:for-each select="@extension">
                                            <xsl:attribute name="value" select="."/>
                                        </xsl:for-each>
                                        <xsl:for-each select="@root">
                                            <xsl:attribute name="root" select="."/>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>
                                <!-- medicatieafspraak -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatieafspraak]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9324_20201015132016">
                                        <xsl:with-param name="ma_hl7" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- verstrekkingsverzoek -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-verstrekkingsverzoek]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9356_20210402132627">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </medicamenteuze_behandeling>
                        </xsl:for-each-group>
                        <!-- lengte / gewicht van vóór 9.1.0 die in MA zitten ook converteren -->
                        <xsl:if test="//*[hl7:templateId/@root = ($templateId-lichaamslengte, $templateId-lichaamsgewicht, $templateId-labuitslag)]">
                            <bouwstenen>
                                <!-- lichaamslengte  -->
                                <xsl:for-each select="//*[hl7:templateId/@root = $templateId-lichaamslengte]">
                                    <xsl:call-template name="zib-Lichaamslengte-3.1"/>
                                </xsl:for-each>
                                <!-- lichaamsgewicht  -->
                                <xsl:for-each select="//*[hl7:templateId/@root = $templateId-lichaamsgewicht]">
                                    <xsl:call-template name="zib-Lichaamsgewicht-3.1"/>
                                </xsl:for-each>
                            </bouwstenen>
                        </xsl:if>
                    </sturen_medicatievoorschrift>
                </data>
            </adaxml>
        </xsl:variable>

        <xsl:variable name="adaXmlWithBouwstenen">
            <xsl:choose>
                <xsl:when test="$deduplicateAdaBouwstenen = true()">
                    <xsl:variable name="adaXmlDeduplicated">
                        <xsl:apply-templates select="$adaXml" mode="deduplicateBouwstenenStep1"/>
                    </xsl:variable>
                    <xsl:apply-templates select="$adaXmlDeduplicated" mode="deduplicateBouwstenenStep2"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- don't deduplicate the bouwstenen -->
                    <xsl:apply-templates select="$adaXml" mode="handleBouwstenen"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- add conceptIds, not really necessary but for now helpful in comparing roundtrip stuff -->
        <xsl:apply-templates select="$adaXmlWithBouwstenen" mode="addConceptId"/>

    </xsl:template>

    <xd:doc>
        <xd:desc>Handle HL7 stuff to create an ada zibRoot HCIM</xd:desc>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for ada parent of zibroot</xd:param>
    </xd:doc>
    <xsl:template name="HL7element2Zibroot" match="hl7:*" mode="HL7element2Zibroot">
        <xsl:param name="schemaFragment" as="element(xs:complexType)?"/>

        <!-- multi language support for ada element names -->
        <xsl:variable name="elmZibroot">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">hcimroot</xsl:when>
                <xsl:otherwise>zibroot</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootIdentification">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">identification_number</xsl:when>
                <xsl:otherwise>identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootAuthor">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">author</xsl:when>
                <xsl:otherwise>auteur</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootAuthorPatient">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient_as_author</xsl:when>
                <xsl:otherwise>patient_als_auteur</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootAuthorHealthProfessional">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_as_author</xsl:when>
                <xsl:otherwise>zorgverlener_als_auteur</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:element name="{$elmZibroot}">

            <!-- identification number -->
            <xsl:for-each select="hl7:id">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName" select="$elmZibrootIdentification"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- author -->
            <!-- participant exists in HL7 template, don't want to throw that information away -->
            <!-- may be only one author in zibroot, could theoretically encounter both author and participant in HL7 -->
            <xsl:variable name="hl7Author">
                <xsl:choose>
                    <xsl:when test="hl7:author">
                        <xsl:sequence select="hl7:author"/>
                    </xsl:when>
                    <xsl:when test="hl7:participant[@typeCode = 'RESP']">
                        <xsl:sequence select="hl7:participant[@typeCode = 'RESP']"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:for-each select="$hl7Author/*">
                <xsl:element name="{$elmZibrootAuthor}">

                    <xsl:choose>
                        <xsl:when test="hl7:patient | hl7:assignedAuthor[hl7:code/@code = 'ONESELF']">
                            <xsl:element name="{$elmZibrootAuthorPatient}">
                                <xsl:element name="{$elmPatient}">
                                    <xsl:attribute name="value" select="$patients/patient_information/*[local-name() = $elmPatient]/@id"/>
                                    <xsl:attribute name="datatype">reference</xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:when>
                        <!-- healthprofessional as author -->
                        <xsl:when test="(hl7:assignedPerson | hl7:assignedAuthor | hl7:participantRole)[not(hl7:code/@code = 'ONESELF')]">
                            <xsl:for-each select="hl7:assignedPerson | hl7:assignedAuthor | hl7:participantRole">
                                <xsl:element name="{$elmZibrootAuthorHealthProfessional}">
                                    <!-- output the actual healthcare professional -->
                                    <xsl:call-template name="HandleHealthProfessional"/>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- related person as author not in HL7v3 template  -->
                        <!-- no mapping needed -->
                    </xsl:choose>
                </xsl:element>
            </xsl:for-each>

        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
