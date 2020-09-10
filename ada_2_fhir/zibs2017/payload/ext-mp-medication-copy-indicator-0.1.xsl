<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
      <xd:doc>
        <xd:desc>Template for shared extension http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator</xd:desc>
        <xd:param name="in">Optional. Ada element containing the duration</xd:param>
    </xd:doc>
    <xsl:template name="ext-mp-Medication-CopyIndicator-0.1" match="*" as="element()?" mode="doExtMpMedicationCopyIndicator-0.1">
        <xsl:param name="in" as="element()?" select="."/>
        <!-- kopie indicator -->
        <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
        <xsl:for-each select="$in">
            <extension url="http://nictiz.nl/fhir/StructureDefinition/mp-Medication-CopyIndicator">
                <valueBoolean value="{(@value='true')}"/>
            </extension>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
