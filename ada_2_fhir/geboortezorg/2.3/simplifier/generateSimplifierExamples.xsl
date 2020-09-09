<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!--<xsl:variable name="outputDir" select="'../../FHIR3-0-1-Geboortezorg/dev'"/>-->
    <xsl:import href="../../2_fhir_gebz_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="fhirmapping" select="document('../fhirmapping.xml')"/>
    <xsl:key name="fhirmapping-lookup" match="dataset/record" use="ID"/>
    
    <!-- de include bouwstenen voor vrouw, zwangerschap eoc etc. vullen -->
    <xsl:variable name="patient-ada" as="element()">   
        <patient>
            <identificatienummer value="12345678" root="{$oidBurgerservicenummer}"/>
            <naamgegevens>
                <geslachtsnaam>
                    <achternaam value="example"/>                 
                </geslachtsnaam>
            </naamgegevens>        
        </patient>
    </xsl:variable>  
    
    <xd:doc>
        <xd:desc>For each data concept with profile X in fhir mapping create an example</xd:desc>/>
    </xd:doc>
    <xsl:template match="concept" name="createFhirExample" mode="doCreateFhirExample">
        <xsl:variable name="concept" select="."/>
        <xsl:variable name="profile" select="$fhirmapping/dataset/record[ID=$concept/@iddisplay]/profile"/>
        <xsl:variable name="in" select="$fhirmapping/dataset/record[ID=$concept/@iddisplay]/in"/>
        <xsl:for-each select="$concept">
        <xsl:if test="@type='item' and $in='True'">
            <xsl:variable name="adaElement" as="element()">
                <xsl:for-each select=".">
                    <xsl:call-template name="adaElement"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="fhirInstance">
                <xsl:if test="$profile=('nl-core-observation','bc-PregnancyObservation','bc-DeliveryObservation','bc-BirthObservation','bc-MaternalObservation','bc-FetusObservation','bc-ChildObservation','zib-Pregnancy-Gravidity','zib-Pregnancy-Parity','zib-Pregnancy-TermDate')">
                    <xsl:for-each select="$adaElement">
                        <xsl:call-template name="bc-observation">
                            <xsl:with-param name="adaPatient" select="$patient-ada"/>
                            <xsl:with-param name="logicalId" select="concat($patient-ada/naamgegevens/geslachtsnaam/achternaam/@value,'-',replace(name(.),'_','-'),'-',@conceptId)"/>
                        </xsl:call-template>
                    </xsl:for-each>     
                </xsl:if>
                <xsl:if test="$profile=('bc-DisorderOfPregnancy','bc-DisorderOfLaborAndDelivery','bc-DisorderPostPartum','bc-DisorderOfChild')">
                    <xsl:for-each select="$adaElement">
                        <xsl:call-template name="bc-condition">
                            <xsl:with-param name="adaPatient" select="$patient-ada"/>
                            <xsl:with-param name="logicalId" select="concat($patient-ada/naamgegevens/geslachtsnaam/achternaam/@value,'-',replace(name(.),'_','-'),'-',@conceptId)"/>
                        </xsl:call-template>
                    </xsl:for-each>     
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="examples">               
                <xsl:for-each select="$fhirInstance">
                    <xsl:apply-templates mode="doAddReferences">
                        <xsl:with-param name="type" select="$profile"/>
                    </xsl:apply-templates>
                </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$examples" mode="doResourceInResultdoc"/>
        </xsl:if>
        <xsl:apply-templates select="concept" mode="doCreateFhirExample"/>
        </xsl:for-each>
    </xsl:template>  
    
    <xd:doc>
        <xd:desc>Create an ada observation element</xd:desc>/>
    </xd:doc>    
    <xsl:template match="concept" name="adaElement" mode="doadaElement" as="element()?">
        <!--<xsl:element name="{lower-case(replace(replace(replace(replace(replace(replace(replace(name,' ','_'),'\(',''),'\)',''),'\?','q'),'/','_'),',',''),'2','twee'))}">-->
        <xsl:element name="{@shortName}">
            <xsl:attribute name="conceptId" select="@id"/>
            <xsl:attribute name="datatype" select="valueDomain/@type"/>
            <xsl:if test="valueDomain/@type='datetime' or valueDomain/@type='date'">
                <xsl:attribute name="value" select="current-date()"/>    
            </xsl:if>
            <xsl:if test="valueDomain/@type='quantity' or valueDomain/@type='count'">
                <xsl:attribute name="value" select="1"/>
                <xsl:attribute name="unit" select="valueDomain/property/@unit"/>
            </xsl:if>
            <xsl:if test="valueDomain/@type='boolean'">
                <xsl:attribute name="value" select="true()"/>
            </xsl:if>
            <xsl:if test="valueDomain/@type='string' or valueDomain/@type='text'">
                <xsl:attribute name="value" select="'Test'"/>
            </xsl:if>
            <xsl:if test="valueDomain/@type='code'"> 
                <xsl:attribute name="value" select="valueSet/conceptList/concept[1]/@code"/>
                <xsl:attribute name="code" select="valueSet/conceptList/concept[1]/@code"/>
                <xsl:attribute name="codeSystem" select="valueSet/conceptList/concept[1]/@codeSystem"/>
                <xsl:attribute name="displayName" select="valueSet/conceptList/concept[1]/@displayName"/>
            </xsl:if>
        </xsl:element>
     </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:Observation | f:Condition" mode="doResourceInResultdoc">
        <xsl:result-document href="simplifierExamples/Gebz-generated-{concat(name(.),'-',f:id/@value)}.xml"> 
            <xsl:comment select="'auto generated example'"/>
            <xsl:apply-templates select="." mode="ResultOutput"/>
        </xsl:result-document>
    </xsl:template>   
    
    <xd:doc>
        <xd:desc>Add static references to episode of care, subject etc.</xd:desc>/>
    </xd:doc>
    <xsl:template name="addReferences" match="node() | @*" mode="doAddReferences doAddReferencesElements">
        <xsl:param name="type"/>
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="doAddReferencesElements">
                <xsl:with-param name="type" select="$type"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Add focus extension/reference</xd:desc>
    </xd:doc>
    <xsl:template name="addFocusObservation" match="f:meta" mode="doAddReferencesElements">
        <xsl:param name="type"/>
        <xsl:choose>
            <xsl:when test="$type='bc-DeliveryObservation'">
                <xsl:copy-of select="."></xsl:copy-of>
                <extension xmlns="http://hl7.org/fhir" url="http://nictiz.nl/fhir/StructureDefinition/Observation-focusSTU3">
                    <valueReference>
                        <reference value="Procedure/Bevalling"/>
                    </valueReference>
                </extension>              
            </xsl:when>
            <xsl:when test="$type='bc-BirthObservation'">
                <xsl:copy-of select="."></xsl:copy-of>
                <extension xmlns="http://hl7.org/fhir" url="http://nictiz.nl/fhir/StructureDefinition/Observation-focusSTU3">
                    <valueReference>
                        <reference value="Procedure/Geboorte"/>
                    </valueReference>
                </extension>              
            </xsl:when>
            <xsl:when test="$type='bc-PregnancyObservation'">
                <xsl:copy-of select="."></xsl:copy-of>
                <extension xmlns="http://hl7.org/fhir" url="http://nictiz.nl/fhir/StructureDefinition/Observation-focusSTU3">
                    <valueReference>
                        <reference value="Condition/Zwangerschap"/>
                    </valueReference>
                </extension>              
            </xsl:when>
            <xsl:when test="$type='bc-FetusObservation'">
                <xsl:copy-of select="."></xsl:copy-of>
                <extension xmlns="http://hl7.org/fhir" url="http://nictiz.nl/fhir/StructureDefinition/Observation-focusSTU3">
                    <valueReference>
                        <reference value="BodySite/Foetus"/>
                    </valueReference>
                </extension>              
            </xsl:when>
            <xsl:when test="$type='bc-DisorderOfPregnancy'">
                <xsl:copy-of select="."></xsl:copy-of>
                <extension xmlns="http://hl7.org/fhir" url="http://hl7.org/fhir/StructureDefinition/condition-partOf">
                    <valueReference>
                        <reference value="Condition/Zwangerschap"/>
                    </valueReference>
                </extension>              
            </xsl:when>
            <xsl:when test="$type='bc-DisorderOfLaborAndDelivery' or $type='bc-DisorderPostPartum'">
                <xsl:copy-of select="."></xsl:copy-of>
                <extension xmlns="http://hl7.org/fhir" url="http://hl7.org/fhir/StructureDefinition/condition-partOf">
                    <valueReference>
                        <reference value="Procedure/Bevalling"/>
                    </valueReference>
                </extension>              
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."></xsl:copy-of>
            </xsl:otherwise>
        </xsl:choose>   
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Add context reference</xd:desc>
    </xd:doc>
    <xsl:template name="addContextObservation" match="f:subject" mode="doAddReferencesElements">
        <xsl:choose>
            <xsl:when test="name(.)='subject' and not(following-sibling::context)">
                <xsl:copy-of select="."/>
                <context xmlns="http://hl7.org/fhir">
                    <reference value="EpisodeOfCare/Zwangerschapsdossier"/>
                </context>
            </xsl:when>    
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>   
    </xsl:template> 
    
    <xd:doc>
        <xd:desc>Apply all templates</xd:desc>
    </xd:doc>
    <xsl:template match="node()|@*">
        <xsl:apply-templates select="node()|@*" mode="doCreateFhirExample"/>      
    </xsl:template>
        
</xsl:stylesheet>