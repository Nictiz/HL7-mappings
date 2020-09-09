<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!--<xsl:variable name="outputDir" select="'../../FHIR3-0-1-Geboortezorg/dev'"/>-->
    <xsl:import href="../../2_fhir_gebz_include.xsl"/>   
   
    <xd:doc>
        <xd:desc>For each data concept with profile X in fhir mapping create an example</xd:desc>/>
    </xd:doc>
    <xsl:template match="//concept"> <!-- name="createFhirExample" mode="doCreateFhirExample" //community[@name='fhirmapping'] -->
        <xsl:for-each select=".">
            <xsl:variable name="profile" select="community/data[@label='FHIR profile']"/>
            <xsl:variable name="terminologies">
                <xsl:perform-sort select="terminologyAssociation" >
                    <xsl:sort select="@conceptId"/>
                </xsl:perform-sort>
            </xsl:variable> 
            <xsl:variable name="terminology" select="($terminologies/terminologyAssociation[@codeSystemName='SNOMED CT'] | $terminologies/terminologyAssociation[@codeSystemName='LOINC'] | $terminologies/terminologyAssociation)[1]"/>
            <xsl:if test="not($terminology) and $profile=('nl-core-observation','bc-PregnancyObservation','bc-DeliveryObservation','bc-BirthObservation','bc-MaternalObservation','bc-FetusObservation','zib-Pregnancy-Gravidity','zib-Pregnancy-Parity','zib-Pregnancy-TermDate') and @type!='group'">         
                <xsl:text>&#xa;</xsl:text>
                <xsl:value-of select="@iddisplay"/> - <xsl:value-of select="name"/>
             </xsl:if>
            <xsl:apply-templates select="concept"/> <!--  mode="doCreateFhirExample" -->
        </xsl:for-each>
    </xsl:template>  
    
   
    <xd:doc>
        <xd:desc>Apply all templates</xd:desc>
    </xd:doc>
    <xsl:template match="node()|@*">
        <xsl:apply-templates select="node()|@*"/>      
    </xsl:template>
        
</xsl:stylesheet>