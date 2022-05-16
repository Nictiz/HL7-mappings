<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output indent="yes"></xsl:output>
    
    <xsl:template match="/">
        <xsl:for-each select="f:Bundle/f:entry/f:resource/f:OperationOutcome">
            <xsl:variable name="issues" as="element(issue)*">
                <xsl:for-each select="f:issue">
                    <xsl:variable name="count" select="count(preceding-sibling::f:issue)+1"/>
                    <xsl:variable name="expression" select="f:expression/@value"/>
                    <xsl:variable name="detailsText" select="f:details/f:text/@value"/>
                    <xsl:choose>
                        <!-- Suppress terminology errors, which are sometimes oddly specific to be sure I don't suppress anything unwanted -->
                        <xsl:when test="$expression = 'Medication.code' and $detailsText/contains(.,'None of the codings provided are in the value set ''ProductCodeCodelijsten''')"/>
                        <xsl:when test="$detailsText/matches(., 'Code System URI ''urn:oid:2[.]16[.]840[.]1[.]113883[.]2[.]4[.]4[.][\d.]+'' is unknown')"/>
                        <xsl:when test="contains($detailsText, 'and a coding is recommended to come from this value set')"/>
                        <xsl:when test="contains($detailsText, 'is not a valid display for the code {http://snomed.info/sct}')"></xsl:when>
                        <xsl:when test="contains($detailsText, 'The Coding provided (urn:oid:2.16.840.1.113883.2.4.4.1.900.2#') and contains($detailsText, ') is not in the value set http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.20.77.11.27--20160830202453')"/>
                        <xsl:when test="contains($detailsText, 'Code System URI ''https://referentiemodel.nhg.org/tabellen/nhg-tabel-25-gebruiksvoorschrift#aanvullend-numeriek'' is unknown so the code cannot be validated')"/>
                        <xsl:when test="matches($detailsText, 'Unable to find code \d+ in http://snomed.info/sct') and contains($detailsText, 'is not valid in the value set ''All codes known to the system''')"/>
                        <!-- Slicing error that will be fixed in next version of package -->
                        <xsl:when test="contains($detailsText, 'Unable to resolve discriminator in definitions: valueCodeableConcept in profile http://nictiz.nl/fhir/StructureDefinition/mp-MedicationUse2')"/>
                        <xsl:otherwise>
                            <issue expression="{$expression}" count="{$count}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:if test="count($issues) gt 0">
                <resource name="{f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/operationoutcome-file']/f:valueString/@value/substring-after(.,'4TouchstoneMPServe\')}">
                    <xsl:copy-of select="$issues"/>
                </resource>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>