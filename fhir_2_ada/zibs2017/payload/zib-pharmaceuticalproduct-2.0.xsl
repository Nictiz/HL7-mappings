<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
 
    <xsl:template match="f:Medication" mode="zib-PharmaceuticalProduct-2.0">  
        <product>
            <xsl:apply-templates select="node() except (f:meta|f:text|f:code)" mode="#current"/>
            <xsl:apply-templates select="f:code" mode="#current"/>
        </product>
    </xsl:template>
        
        <xsl:template match="f:code" mode="zib-PharmaceuticalProduct-2.0">           
            
            <xsl:call-template name="CodeableConcept-to-code">
                <xsl:with-param name="in" select="."/>
                <xsl:with-param name="adaElementName" select="'product_code'"/>
            </xsl:call-template>
            
        <!--<xsl:for-each select="f:coding">
            <product_code>
                <xsl:call-template name="Coding-to-code">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>                
            </product_code>            
        </xsl:for-each>-->
        
          <!--  code="17469"
            codeSystem="2.16.840.1.113883.2.4.4.10"
            displayName="IBUPROFEN TABLET 600MG"
            codeSystemName="G-Standaard PRK" -->
    
             </xsl:template>
        
</xsl:stylesheet>
