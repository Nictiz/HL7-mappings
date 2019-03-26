<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA xml to wiki table(s) <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2019-01-25 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml"/>
    <xsl:import href="./../../ada2test-xslt-peri.xsl"/>
    <!-- override ada release file and transaction to be handled -->
    <xsl:param name="doc-ad-transaction" select="document('ada_schemas/RetrieveTransaction-ks-gz-233.xml')"/>
    <xsl:param name="doc-ad-trans-instance" select="document('ada_schemas/tr-2.16.840.1.113883.2.4.3.11.60.90.77.4.2437-2016-11-22T082402_instance.xml')"/>
    <xsl:param name="releaseUri" select="'http://decor.nictiz.nl/decor/services/RetrieveTransaction?id=2.16.840.1.113883.2.4.3.11.60.90.77.4.2437&amp;language=nl-NL&amp;version=2016-11-22T08:24:02&amp;format=xml'"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.90.77.4.2437</xsl:param>
    <xsl:param name="hl7PayloadContext" select="'/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent'"/>

    <xd:doc>
        <xd:desc>Makes concept for transaction concept congenitale_afwijkingen_groep conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40081" 
            which contains all necessary info to create the schematron rules later.
            Special handling here because there is no template association for Kernset 2.3....</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@id = '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40081']" name="makeConceptObsoleteGroup" mode="maak-my-concept">
        <!-- do nothing, this is an obsolete group for schematron checking -->
    </xsl:template>
</xsl:stylesheet>
