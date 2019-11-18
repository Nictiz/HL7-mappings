<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
    <xd:doc>
        <xd:desc>Template for shared extension http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-PeriodOfUse</xd:desc>
        <xd:param name="start">Optional ada element. Contains start date(time).</xd:param>
        <xd:param name="end">Optional ada element. Contains end date(time).</xd:param>
    </xd:doc>
    <xsl:template name="ext-zib-Medication-PeriodOfUse-2.0" as="element()?">
        <xsl:param name="start" as="element()?"/>
        <xsl:param name="end" as="element()?"/>
        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse">
            <valuePeriod>
                <xsl:for-each select="$start[@value]">
                    <start value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                </xsl:for-each>
                <xsl:for-each select="$end[@value]">
                    <end value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                </xsl:for-each>
            </valuePeriod>
        </extension>
    </xsl:template>
</xsl:stylesheet>
