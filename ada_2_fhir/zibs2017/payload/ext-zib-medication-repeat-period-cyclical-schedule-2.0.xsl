<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
      <xd:doc>
          <xd:desc>Template for shared extension http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule</xd:desc>
        <xd:param name="in">Optional. Ada element containing the repeat period</xd:param>
    </xd:doc>
    <xsl:template name="ext-zib-Medication-RepeatPeriodCyclicalSchedule-2.0"  match="*" as="element()?" mode="doExtZibMedicationRepeatPeriodCyclicalSchedule-2.0">
        <xsl:param name="in" as="element()?" select="."/>
        <!-- herhaalperiode cyclisch schema -->
        <xsl:for-each select="$in">
            <modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule">
                <valueDuration>
                    <xsl:call-template name="hoeveelheid-to-Duration">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueDuration>
            </modifierExtension>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
