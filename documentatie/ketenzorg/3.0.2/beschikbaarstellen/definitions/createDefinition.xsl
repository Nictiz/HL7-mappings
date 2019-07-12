<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    
    <!-- use the zib2017bbr-decor.xml file as input to build your ADA definition file -->
    <xsl:template match="/">
        <xsl:variable name="transactions" as="element()+">
            <xsl:apply-templates select="//transaction[@type = 'stationary'][@effectiveDate = '2017-12-31T00:00:00']"/>
        </xsl:variable>
        <ada xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://decor.nictiz.nl/ada/core/ada.xsd">
            <project prefix="zib2017-" language="nl-NL" versionDate="">
                <release baseUri="http://decor.nictiz.nl/decor/services/RetrieveTransaction"/>
            </project>
            <applications>
                <application version="2017">
                    <views>
                        <view id="1" type="index" target="xforms" addComments="true">
                            <name><xsl:value-of select="//project/name[@language = 'en-US']"/> Index</name>
                            <xsl:for-each select="$transactions">
                                <indexOf ref="{position() + 1}"/>
                            </xsl:for-each>
                            <controls>
                                <button type="xml"/>
                            </controls>
                        </view>
                        <xsl:for-each select="$transactions">
                            <xsl:copy>
                                <xsl:copy-of select="@*"/>
                                <xsl:attribute name="id" select="position() + 1"/>
                                <xsl:copy-of select="node()"/>
                            </xsl:copy>
                        </xsl:for-each>
                    </views>
                </application>
            </applications>
        </ada>
    </xsl:template>
    <xsl:variable name="nlZorgParts" as="xs:string*">
        <!-- Adresgegevens -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.20.5</xsl:text>
        <!-- BasisElementen -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.0.0</xsl:text>
        <!-- Bereik -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.20.1</xsl:text>
        <!-- ContactGegevens -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.20.6</xsl:text>
        <!-- FarmaceutischProduct -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.9.7</xsl:text>
        <!-- GebruiksInstructie -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.9.12</xsl:text>
        <!-- Naamgegevens -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.20.4</xsl:text>
        <!-- Tijdsinterval -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.7.4.2.20.3</xsl:text>
    </xsl:variable>
    <xsl:template match="transaction">
        <view id="2" type="crud" target="xforms" addComments="false" errorSummary="false" transactionId="{@id}" transactionEffectiveDate="{@effectiveDate}">
            <name>
                <xsl:value-of select="replace(ancestor::scenario/name[@language = 'en-US'], 'nl.zorg.(part.)?', '')"/>
            </name>
            <concepts include="all">
                <xsl:if test="not(@id = $nlZorgParts)">
                    <concept ref="{representingTemplate/concept[1]/@ref}">
                        <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.1" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.1" shortName="basic_components_hcimroot">
                            <name language="en-US">Basic Components HCIMRoot</name>
                            <desc language="en-US">Rootconcept of the information model in question</desc>
                            <implementation shortName="hcimroot"/>
                            <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.6" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="item" iddisplay="NL-CM-0.0.6" shortName="identification_number">
                                <name language="en-US">IdentificationNumber</name>
                                <desc language="en-US">Globally unique number that identifies the instantiation of the information model. The number is composed of an identification of the issuer organization and a unique number assigned by this organization</desc>
                                <implementation shortName="identification_number"/>
                                <operationalization language="en-US">AssigningAuthority (OID: AssigningAuthorityOID)</operationalization>
                                <terminologyAssociation conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.6" conceptFlexibility="2017-12-31T00:00:00" code="396278008" codeSystem="2.16.840.1.113883.6.96" displayName="Identification number" codeSystemName="SNOMED Clinical Terms"/>
                                <valueDomain type="identifier"/>
                            </concept>
                            <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.2" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.2" shortName="information_source">
                                <name language="en-US">InformationSource</name>
                                <desc language="en-US">The person who provided the information and ensures the correctness of it.<br/>This is not always a healthprofessional, but it may also be the patient or another person, such as a parent, caretaker or guardian.<br/>The source of information does not have to be the author of the information, who in that case is only instrumental in capturing the information.</desc>
                                <implementation shortName="information_source"/>
                                <terminologyAssociation conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.2" conceptFlexibility="2017-12-31T00:00:00" code="385438008" codeSystem="2.16.840.1.113883.6.96" displayName="Source of information (attribute)" codeSystemName="SNOMED Clinical Terms"/>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.3" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.3" shortName="patient_as_information_source">
                                    <name language="en-US">PatientAsInformationSource</name>
                                    <desc language="en-US">The patient as source of the information</desc>
                                    <implementation shortName="patient_as_information_source"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.140" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-140" shortName="patient">
                                        <name language="en-US">Patient</name>
                                        <desc language="en-US">Root concept of the Patient information model. This root concept contains all data elements of the Patient information model.</desc>
                                        <implementation shortName="patient"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.0.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.1" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-0.1.1"/>
                                    </concept>
                                </concept>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.4" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.4" shortName="health_professional">
                                    <name language="en-US">HealthProfessional</name>
                                    <desc language="en-US">The health professional as source of the information</desc>
                                    <implementation shortName="health_professional"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.141" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-141" shortName="health_professional">
                                        <name language="en-US">HealthProfessional</name>
                                        <desc language="en-US">Root concept of the HealthProfessional information model. This root concept contains all data elements of the HealthProfessional information model.<br/>When referring to this information model the role the health professional fulfils in the healthcare process can be addressed additionally. For health professionals, this could be for example main practitioner or referrer.</desc>
                                        <implementation shortName="health_professional"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.17.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.17.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.2" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-17.1.1"/>
                                    </concept>
                                </concept>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.5" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.5" shortName="related_person_as_information_source">
                                    <name language="en-US">RelatedPersonAsInformationSource</name>
                                    <desc language="en-US">The related person (parent, caregiver, ...) as source of the information</desc>
                                    <implementation shortName="related_person_as_information_source"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.142" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-142" shortName="contact">
                                        <name language="en-US">Contact</name>
                                        <desc language="en-US">Root concept of the Contact information model. This root concept contains all data elements of the Contact information model.</desc>
                                        <implementation shortName="contact"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.3.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.3.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.1" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-3.1.1"/>
                                    </concept>
                                </concept>
                            </concept>
                            <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.7" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.7" shortName="author">
                                <name language="en-US">Author</name>
                                <desc language="en-US">The person who has recorded the information. Depending on the information system in which the data is recorded, this may be the patient, healthcare provider or other person.</desc>
                                <implementation shortName="author"/>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.8" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.8" shortName="patient_as_author">
                                    <name language="en-US">PatientAsAuthor</name>
                                    <desc language="en-US">The patient as author of the information</desc>
                                    <implementation shortName="patient_as_author"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.143" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-143" shortName="patient">
                                        <name language="en-US">Patient</name>
                                        <desc language="en-US">Root concept of the Patient information model. This root concept contains all data elements of the Patient information model.</desc>
                                        <implementation shortName="patient"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.0.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.1" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-0.1.1"/>
                                    </concept>
                                </concept>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.9" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.9" shortName="health_professional_as_author">
                                    <name language="en-US">HealthProfessionalAsAuthor</name>
                                    <desc language="en-US">The health professional as author of the information </desc>
                                    <implementation shortName="health_professional_as_author"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.144" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-144" shortName="health_professional">
                                        <name language="en-US">HealthProfessional</name>
                                        <desc language="en-US">Root concept of the HealthProfessional information model. This root concept contains all data elements of the HealthProfessional information model.<br/>When referring to this information model the role the health professional fulfils in the healthcare process can be addressed additionally. For health professionals, this could be for example main practitioner or referrer.</desc>
                                        <implementation shortName="health_professional"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.17.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.17.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.2" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-17.1.1"/>
                                    </concept>
                                </concept>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.10" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.10" shortName="related_person_as_author">
                                    <name language="en-US">RelatedPersonAsAuthor</name>
                                    <desc language="en-US">The related person (parent, caregiver, ...) as author of the information</desc>
                                    <implementation shortName="related_person_as_author"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.145" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-145" shortName="contact">
                                        <name language="en-US">Contact</name>
                                        <desc language="en-US">Root concept of the Contact information model. This root concept contains all data elements of the Contact information model.</desc>
                                        <implementation shortName="contact"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.3.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.3.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.1" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-3.1.1"/>
                                    </concept>
                                </concept>
                            </concept>
                            <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.11" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.11" shortName="subject">
                                <name language="en-US">Subject</name>
                                <desc language="en-US">The person to whom the information relates. Often this will be the patient, but especially in the case of small children as patients it may be information about the parent or caregiver. Especially in the nurse transfers, for example, Competence and involvement of caregivers carries a role.</desc>
                                <implementation shortName="subject"/>
                                <terminologyAssociation conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.11" conceptFlexibility="2017-12-31T00:00:00" code="131195008" codeSystem="2.16.840.1.113883.6.96" displayName="Subject of information" codeSystemName="SNOMED Clinical Terms"/>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.12" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.12" shortName="patient">
                                    <name language="en-US">Patient</name>
                                    <desc language="en-US">The patient as subject of the information</desc>
                                    <implementation shortName="patient"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.146" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-146" shortName="patient">
                                        <name language="en-US">Patient</name>
                                        <desc language="en-US">Root concept of the Patient information model. This root concept contains all data elements of the Patient information model.</desc>
                                        <implementation shortName="patient"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.0.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.1" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-0.1.1"/>
                                    </concept>
                                </concept>
                                <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.13" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-0.0.13" shortName="related_person_as_subject">
                                    <name language="en-US">RelatedPersonAsSubject</name>
                                    <desc language="en-US">The related person (parent, caregiver, ...) as subject of the information</desc>
                                    <implementation shortName="related_person_as_subject"/>
                                    <concept id="2.16.840.1.113883.2.4.3.11.60.7.2.147" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="1" maximumMultiplicity="1" isMandatory="false" type="group" iddisplay="NL-CM-2017-147" shortName="contact">
                                        <name language="en-US">Contact</name>
                                        <desc language="en-US">Root concept of the Contact information model. This root concept contains all data elements of the Contact information model.</desc>
                                        <implementation shortName="contact"/>
                                        <contains ref="2.16.840.1.113883.2.4.3.11.60.40.1.3.1.1" flexibility="2017-12-31T00:00:00" prefix="zib2017bbr-" datasetId="2.16.840.1.113883.2.4.3.11.60.40.3.3.1" datasetEffectiveDate="2017-12-31T00:00:00" datasetStatusCode="final" datasetVersionLabel="3.1" iType="group" iStatusCode="final" iEffectiveDate="2017-12-31T00:00:00" refdisplay="NL-CM-3.1.1"/>
                                    </concept>
                                </concept>
                            </concept>
                            <concept id="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.14" effectiveDate="2017-12-31T00:00:00" statusCode="final" minimumMultiplicity="0" maximumMultiplicity="1" isMandatory="false" type="item" iddisplay="NL-CM-0.0.14" shortName="date_time">
                                <name language="en-US">DateTime</name>
                                <desc language="en-US">Date and if relevant the time the event to which the information relates took place .<br/>This is the medically relevant date and time.</desc>
                                <implementation shortName="date_time"/>
                                <terminologyAssociation conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.0.14" conceptFlexibility="2017-12-31T00:00:00" code="439771001" codeSystem="2.16.840.1.113883.6.96" displayName="Date of event" codeSystemName="SNOMED Clinical Terms"/>
                                <valueDomain type="datetime"/>
                            </concept>
                        </concept>
                    </concept>
                </xsl:if>
            </concepts>
        </view>
    </xsl:template>
</xsl:stylesheet>