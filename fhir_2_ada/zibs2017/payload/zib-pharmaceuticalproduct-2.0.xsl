<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xd:doc>
        <xd:desc>Uncomment imports for standalone use and testing.</xd:desc>
    </xd:doc>
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
 
    <xsl:template match="f:Medication" mode="zib-PharmaceuticalProduct-2.0">  
        <product>
            <xsl:apply-templates select="f:code" mode="#current"/>
            <product_specificatie>
                <xsl:apply-templates select="f:extension" mode="#current"/>
                <xsl:apply-templates select="f:ingredient" mode="#current"/>
            </product_specificatie>
        </product>
    </xsl:template>
        
    <xsl:template match="f:code" mode="zib-PharmaceuticalProduct-2.0">           
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'product_code'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:extension[@url ='http://nictiz.nl/fhir/StructureDefinition/zib-Product-Description']" mode="zib-PharmaceuticalProduct-2.0">
        <omschrijving>
            <xsl:attribute name="value" select="f:valueString/@value"/>
        </omschrijving>
    </xsl:template>
        
    <xsl:template match="f:ingredient" mode="zib-PharmaceuticalProduct-2.0">
            <ingredient>                 
                <xsl:apply-templates select="f:itemCodeableConcept" mode="zib-PharmaceuticalProduct-2.0"/>
                <xsl:apply-templates select="f:amount" mode="zib-PharmaceuticalProduct-2.0"/>      
            </ingredient>
    </xsl:template>

    <xsl:template match="f:Medication/f:ingredient/f:itemCodeableConcept" mode="zib-PharmaceuticalProduct-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'ingredient_code'"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- WORK in PROGRESS -> needs to become a function -->
    <xsl:template match="f:amount" mode="zib-PharmaceuticalProduct-2.0">
        <sterkte>
            <hoeveelheid_ingredient>
                <waarde>
                    <xsl:attribute name="value" select="f:numerator/f:value/@value"/>
                    <xsl:attribute name="code" select="f:numerator/f:code/@value"/>
                    <xsl:attribute name="codeSystem" select="f:numerator/f:system/@value"/>
                    <xsl:attribute name="displayName" select="f:numerator/f:unit/@value"/>
                </waarde>
            </hoeveelheid_ingredient>
            <hoeveelheid_product>
                <waarde>
                    <xsl:attribute name="value" select="f:denominator/f:value/@value"/>
                    <xsl:attribute name="code" select="f:denominator/f:code/@value"/>
                    <xsl:attribute name="codeSystem" select="f:denominator/f:system/@value"/>
                    <xsl:attribute name="displayName" select="f:denominator/f:unit/@value"/>
                </waarde>
            </hoeveelheid_product>   
        </sterkte>
    </xsl:template>          


</xsl:stylesheet>
