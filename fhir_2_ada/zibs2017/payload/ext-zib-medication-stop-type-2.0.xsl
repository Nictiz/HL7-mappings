<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    
    <xd:doc>
        <xd:desc>Template to resolve modifier extention Stop Type</xd:desc>
    </xd:doc>
    <xsl:template match="f:modifierExtension[@url ='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType']" mode="ext-zib-Medication-Stop-Type-2.0">
        <xsl:apply-templates select="f:valueCodeableConcept" mode="#current"/>
    </xsl:template>
    
    <xsl:template match="f:valueCodeableConcept" mode="ext-zib-Medication-Stop-Type-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'stoptype'"/>
        </xsl:call-template>    
    </xsl:template>
        
</xsl:stylesheet>