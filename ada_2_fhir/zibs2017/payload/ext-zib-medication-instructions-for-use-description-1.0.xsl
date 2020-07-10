<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--<xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="../../../util/mp-functions.xsl"/>-->

    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <xd:doc>
        <xd:desc>Template for shared extension http://nictiz.nl/fhir/StructureDefinition/zib-Medication-InstructionsForUseDescription</xd:desc>
        <xd:param name="in">Optional. Ada element containing the instructions for use description text</xd:param>
    </xd:doc>
    <xsl:template name="ext-zib-Medication-InstructionsForUseDescription-1.0" match="*" as="element()?" mode="doExtZibMedicationInstructionsForUseDescription-1.0">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:for-each select="$in">
            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-InstructionsForUseDescription">
                <valueString>
                    <xsl:call-template name="string-to-string">
                        <xsl:with-param name="in" select="nf:gebruiksinstructie-ada-preprocess(., $generateInstructionText)"/>
                    </xsl:call-template>
                </valueString>
            </extension>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
