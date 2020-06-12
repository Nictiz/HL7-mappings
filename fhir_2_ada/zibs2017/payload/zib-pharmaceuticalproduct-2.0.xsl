<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:variable name="zib-Product-Description" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Product-Description'"/>
 
    <xsl:template match="f:Medication" mode="zib-PharmaceuticalProduct-2.0">  
        <product>
            <xsl:apply-templates select="f:code" mode="#current"/>
            <xsl:if test="f:extension|f:form|f:ingredient or (f:code/f:extension/@url=$urlExtHL7NullFlavor and (f:extension|f:form|f:ingredient))">
                <product_specificatie>
                    <xsl:apply-templates select="f:code/f:text" mode="#current"/>
                    <xsl:apply-templates select="f:extension[@url =$zib-Product-Description]" mode="#current"/>
                    <xsl:apply-templates select="f:form" mode="#current"/>
                    <xsl:apply-templates select="f:ingredient" mode="#current"/>
                </product_specificatie>
            </xsl:if>
        </product>
    </xsl:template>
        
    <xsl:template match="f:code" mode="zib-PharmaceuticalProduct-2.0">
        <xsl:variable name="addOriginalText" select="f:extension/@url=$urlExtHL7NullFlavor and not(preceding-sibling::f:extension[@url=$zib-Product-Description]) and not(following-sibling::f:form|following-sibling::f:ingredient)"/>   
        <xsl:variable name="addOriginalTextValue" select="if ($addOriginalText) then f:text/@value else ''"/>
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'product_code'"/>
            <xsl:with-param name="originalText" select="$addOriginalTextValue"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>ProductNaam (NL-CM:9.7.19929) is mapped to Medication.code.text</xd:desc>
    </xd:doc>
    <xsl:template match="f:code/f:text" mode="zib-PharmaceuticalProduct-2.0">
        <product_naam>
            <xsl:attribute name="value" select="@value"/>
        </product_naam>
    </xsl:template>
    
    <xsl:template match="f:extension[@url=$zib-Product-Description]" mode="zib-PharmaceuticalProduct-2.0">
        <omschrijving>
            <xsl:attribute name="value" select="f:valueString/@value"/>
        </omschrijving>
    </xsl:template>
        
    <xsl:template match="f:ingredient" mode="zib-PharmaceuticalProduct-2.0">
            <ingredient>                 
                <xsl:apply-templates select="f:amount" mode="zib-PharmaceuticalProduct-2.0"/>
                <xsl:apply-templates select="f:itemCodeableConcept" mode="zib-PharmaceuticalProduct-2.0"/>
            </ingredient>
    </xsl:template>
    
    <xsl:template match="f:form" mode="zib-PharmaceuticalProduct-2.0">
            <xsl:call-template name="CodeableConcept-to-code">
                <xsl:with-param name="in" select="."/>
                <xsl:with-param name="adaElementName" select="'farmaceutische_vorm'"/>
            </xsl:call-template>                
    </xsl:template>

    <xsl:template match="f:ingredient/f:itemCodeableConcept" mode="zib-PharmaceuticalProduct-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'ingredient_code'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:ingredient/f:amount" mode="zib-PharmaceuticalProduct-2.0">
        <sterkte>
            <xsl:call-template name="Ratio-to-hoeveelheid-complex">
                <xsl:with-param name="numeratorAdaName" select="'hoeveelheid_ingredient'"/>
                <xsl:with-param name="denominatorAdaName" select="'hoeveelheid_product'"/>
            </xsl:call-template>
        </sterkte>
    </xsl:template>          


</xsl:stylesheet>
