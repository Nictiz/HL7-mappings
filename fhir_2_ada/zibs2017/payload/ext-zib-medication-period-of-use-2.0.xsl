<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xd:doc>
        <xd:desc>Uncomment imports for standalone use and testing.</xd:desc>
    </xd:doc>
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xd:doc>
        <xd:desc>Template for http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-PeriodOfUse</xd:desc>
    </xd:doc>
    <xsl:template match="f:valuePeriod" mode="ext-zib-Medication-PeriodOfUse-2.0">
        <xsl:apply-templates select="f:start" mode="#current"/>
        <xsl:apply-templates select="f:end" mode="#current"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for converting f:start to gebruiksperiode_start</xd:desc>
    </xd:doc>
    <xsl:template match="f:start" mode="ext-zib-Medication-PeriodOfUse-2.0">
        <gebruiksperiode_start>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>               
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_start>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for converting f:end to gebruiksperiode_eind</xd:desc>
    </xd:doc>
    <xsl:template match="f:end" mode="ext-zib-Medication-PeriodOfUse-2.0">
        <gebruiksperiode_eind>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>                          
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_eind>
    </xsl:template>
    
</xsl:stylesheet>
