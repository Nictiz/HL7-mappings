<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
    <xd:doc>
        <xd:desc>Template for shared extension http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-PeriodOfUse</xd:desc>
        <xd:param name="start">Optional ada element. Contains start date(time).</xd:param>
        <xd:param name="end">Optional ada element. Contains end date(time).</xd:param>
    </xd:doc>
    <xsl:template name="ext-zib-Medication-PeriodOfUse-2.0" as="element()*">
        <xsl:param name="start"/>
        <xsl:param name="end"/>

            <xsl:if test="$start">
                <gebruiksperiode_start>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2ADADate">
                            <xsl:with-param name="dateTime" select="$start"/>
                        </xsl:call-template>               
                    </xsl:attribute>
                    <xsl:attribute name="dataype">datetime</xsl:attribute>
                </gebruiksperiode_start>  
            </xsl:if>
            <xsl:if test="$end">
                <gebruiksperiode_eind>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2ADADate">
                            <xsl:with-param name="dateTime" select="$end"/>
                        </xsl:call-template>                          
                    </xsl:attribute>
                    <xsl:attribute name="dataype">datetime</xsl:attribute>
                </gebruiksperiode_eind>  
             </xsl:if>
    </xsl:template>
</xsl:stylesheet>
