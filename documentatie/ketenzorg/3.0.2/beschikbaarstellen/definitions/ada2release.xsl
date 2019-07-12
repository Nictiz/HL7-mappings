<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Copyright © ART-DECOR Expert Group and ART-DECOR Open Tools
    see https://art-decor.org/mediawiki/index.php?title=Copyright
    
    This program is free software; you can redistribute it and/or modify it under the terms 
    of the GNU Affero General Public Licenseas published by the Free Software Foundation; 
    either version 3 of the License, or (at your option) any later version.
    
    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
    without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
    See the GNU Affero General Public Licensefor more details.
    
    See http://www.gnu.org/licenses/
-->
<!--
    Input: a {project}-ada.xml doc
    Output: a {project}-{versionDate}-{language}-ada.xml doc
    
    Will retrieve transaction for each view, output contains all attributes and constructs from {project}-ada.xml doc 
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="ada-basics.xsl"/>
    <xsl:include href="shortName.xsl"/>
    
    <xsl:variable name="transactions" as="element()">
        <transactionDatasets>
            <xsl:for-each select="distinct-values(//*/@transactionId/string())">
                <xsl:variable name="uri" select="concat($releaseBaseUri, '?id=', ., '&amp;language=', $language,'&amp;version=', $versionDate, '&amp;format=xml')"/>
                <xsl:copy-of select="document($uri)"/>
            </xsl:for-each>
        </transactionDatasets>
    </xsl:variable>
    <xsl:variable name="nlZorgParts" as="xs:string*">
        <!-- Adresgegevens -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.40.1.20.5.1</xsl:text>
        <!-- Bereik -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.40.1.20.1.1</xsl:text>
        <!-- ContactGegevens -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.40.1.20.6.1</xsl:text>
        <!-- FarmaceutischProduct -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.40.1.9.7.19926</xsl:text>
        <!-- GebruiksInstructie -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.40.1.9.12.22504</xsl:text>
        <!-- Naamgegevens -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.40.1.20.4.1</xsl:text>
        <!-- Tijdsinterval -->
        <xsl:text>2.16.840.1.113883.2.4.3.11.60.40.1.20.3.1</xsl:text>
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:result-document href="{replace(base-uri(), '.xml', '-release.xml')}" method="xml">
            <xsl:comment>ADA release generator version 1, <xsl:value-of select="current-dateTime()"/>
            </xsl:comment>
            <xsl:text/>
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="ada">
        <xsl:copy>
            <xsl:attribute name="adaVersion" select="'1'"/>
            <xsl:attribute name="release" select="current-dateTime()"/>
            <xsl:attribute name="app" select="$projectName"/>
            <xsl:apply-templates select="(@* except @xsi:noNamespaceSchemaLocation)|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="view">
        <view>
            <xsl:apply-templates select="@*"/>
            <!-- relevant for apps with multiple cruds for different transactions -->
            <xsl:for-each select="indexOf">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:variable name="num" select="@ref"/>
                    <xsl:attribute name="shortName">
                        <xsl:call-template name="shortName">
                            <xsl:with-param name="name">
                                <xsl:value-of select="//view[@id = $num]/name"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:attribute>
                </xsl:copy>
            </xsl:for-each>
            <xsl:copy-of select="name"/>
            <implementation>
                <xsl:attribute name="shortName">
                    <xsl:call-template name="shortName">
                        <xsl:with-param name="name">
                            <xsl:value-of select="name"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:attribute>
            </implementation>
            <xsl:variable name="theConcepts" select="concepts" as="element()*"/>
            <!-- Supported for indexes:
                Old:
                <view type="index" transactionId=".." ..> <concepts/> </view>
                    Meaning: handle everything under concepts for view/@transactionId
                
                New:
                <view type="index" ..> <concepts/> </view>
                    Meaning: handle everything under concepts for all transactions that have a crud view
                or
                <view type="index" ..> <concepts transactionId=".." transactionEffectiveDate=".."/> <concepts transactionId=".." transactionEffectiveDate=".."/> </view>
                    Meaning: handle everything under concepts for respective concepts/@transactionId. Each concepts elements should point to a different transaction using both transactionId and transactionEffectiveDate
            -->
            <xsl:choose>
                <xsl:when test="(@transactionId and indexOf/concepts) or (indexOf/concepts and concepts)">
                    <xsl:message terminate="yes">Ambiguous definition. Found view[@id = <xsl:value-of select="@id"/>][@type = <xsl:value-of select="@type"/>] with (@transactionId and indexOf/concepts) or (indexOf/concepts and concepts). These combinations are not allowed</xsl:message>
                </xsl:when>
                <xsl:when test="@transactionId and (count($theConcepts) gt 1 or $theConcepts[@transactionId])">
                    <xsl:message terminate="yes">Ambiguous definition. Found view[@id = <xsl:value-of select="@id"/>][@type = <xsl:value-of select="@type"/>] with @transactionId and multiple concepts elements or concepts element with @transactionId. If there is a view/@transactionId, there can be only one concepts element</xsl:message>
                </xsl:when>
                <xsl:when test="$theConcepts[not(@transactionId)] and $theConcepts[@transactionId]">
                    <xsl:message terminate="yes">Ambiguous definition. Found view[@id = <xsl:value-of select="@id"/>][@type = <xsl:value-of select="@type"/>] with concepts elements both with and without @transactionId. If there are multiple concepts elements then all shall have a transactionId attribute, otherwise there can only be exactly one concepts element without @transactionId to indicate concepts for all transactions</xsl:message>
                </xsl:when>
                <xsl:when test="not(@type = 'index') and count($theConcepts) gt 1">
                    <xsl:message terminate="yes">Ambiguous definition. Found view[@id = <xsl:value-of select="@id"/>][@type = <xsl:value-of select="@type"/>] with multiple concepts elements. Unless this is an index view there can be only one concepts element</xsl:message>
                </xsl:when>
                <xsl:when test="count(distinct-values($theConcepts/string-join((@transactionId,@transactionEffectiveDate, '')))) != count($theConcepts/string-join((@transactionId,@transactionEffectiveDate, '')))">
                    <xsl:message terminate="yes">Ambiguous definition. Found view[@id = <xsl:value-of select="@id"/>][@type = <xsl:value-of select="@type"/>] with duplicate concepts definitions. @transactionId / @transactionEffectiveDate should be unique per concepts elements</xsl:message>
                </xsl:when>
                <!-- Old style -->
                <xsl:when test="@transactionId">
                    <xsl:variable name="transactionId" select="@transactionId"/>
                    <xsl:variable name="transaction" select="$transactions//dataset[@transactionId = $transactionId]" as="element()?"/>
                    <dataset>
                        <xsl:copy-of select="$transaction/@*"/>
                        <xsl:if test="count($transactions//dataset[@shortName = $transaction/@shortName]) gt 1">
                            <xsl:attribute name="shortName">
                                <xsl:call-template name="shortName">
                                    <xsl:with-param name="name" select="name[1]"/>
                                </xsl:call-template>
                                <xsl:text>_</xsl:text>
                                <xsl:value-of select="$transaction/@shortName"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="copyConcept">
                            <xsl:with-param name="datasetConcepts" select="$transaction"/>
                            <xsl:with-param name="viewConcepts" select="$theConcepts"/>
                        </xsl:call-template>
                    </dataset>
                </xsl:when>
                <!-- New - apply concepts to all transactions with a crud view -->
                <xsl:when test="$theConcepts[not(@transactionId)]">
                    <xsl:for-each select="../view[@type = 'crud'][@transactionId]">
                        <xsl:variable name="transactionId" select="@transactionId"/>
                        <xsl:variable name="transactionEffectiveDate" select="@transactionEffectiveDate"/>
                        <xsl:variable name="transaction" select="$transactions//dataset[@transactionId = $transactionId][@transactionEffectiveDate = $transactionEffectiveDate]" as="element()?"/>
                        <dataset>
                            <xsl:copy-of select="$transaction/@*"/>
                            <xsl:if test="count($transactions//dataset[@shortName = $transaction/@shortName]) gt 1">
                                <xsl:attribute name="shortName">
                                    <xsl:call-template name="shortName">
                                        <xsl:with-param name="name" select="name[1]"/>
                                    </xsl:call-template>
                                    <xsl:text>_</xsl:text>
                                    <xsl:value-of select="$transaction/@shortName"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="copyConcept">
                                <xsl:with-param name="datasetConcepts" select="$transaction"/>
                                <xsl:with-param name="viewConcepts" select="$theConcepts"/>
                            </xsl:call-template>
                        </dataset>
                    </xsl:for-each>
                </xsl:when>
                <!-- New - apply indexOf/concepts to all transactions with a crud view -->
                <xsl:when test="indexOf[concepts]">
                    <xsl:for-each select="indexOf[concepts]">
                        <xsl:variable name="viewRef" select="@ref"/>
                        <xsl:variable name="view" select="../../view[@id = $viewRef][@transactionId]" as="element(view)"/>
                        <xsl:variable name="transactionId" select="$view/@transactionId"/>
                        <xsl:variable name="transactionEffectiveDate" select="$view/@transactionEffectiveDate"/>
                        <xsl:variable name="transaction" select="$transactions//dataset[@transactionId = $transactionId][@transactionEffectiveDate = $transactionEffectiveDate]" as="element()?"/>
                        <dataset>
                            <xsl:copy-of select="$transaction/@*"/>
                            <xsl:if test="count($transactions//dataset[@shortName = $transaction/@shortName]) gt 1">
                                <xsl:attribute name="shortName">
                                    <xsl:call-template name="shortName">
                                        <xsl:with-param name="name" select="name[1]"/>
                                    </xsl:call-template>
                                    <xsl:text>_</xsl:text>
                                    <xsl:value-of select="$transaction/@shortName"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="copyConcept">
                                <xsl:with-param name="datasetConcepts" select="$transaction"/>
                                <xsl:with-param name="viewConcepts" select="concepts"/>
                            </xsl:call-template>
                        </dataset>
                    </xsl:for-each>
                </xsl:when>
                <!-- New - apply concepts to respective transactions -->
                <xsl:when test="$theConcepts[@transactionId]">
                    <xsl:for-each select="$theConcepts[@transactionId]">
                        <xsl:variable name="transactionId" select="@transactionId"/>
                        <xsl:variable name="transactionEffectiveDate" select="@transactionEffectiveDate"/>
                        <xsl:variable name="transaction" select="$transactions//dataset[@transactionId = $transactionId][@transactionEffectiveDate = $transactionEffectiveDate]" as="element()?"/>
                        <dataset>
                            <xsl:copy-of select="$transaction/@*"/>
                            <xsl:if test="count($transactions//dataset[@shortName = $transaction/@shortName]) gt 1">
                                <xsl:attribute name="shortName">
                                    <xsl:call-template name="shortName">
                                        <xsl:with-param name="name" select="name[1]"/>
                                    </xsl:call-template>
                                    <xsl:text>_</xsl:text>
                                    <xsl:value-of select="$transaction/@shortName"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="copyConcept">
                                <xsl:with-param name="datasetConcepts" select="$transaction"/>
                                <xsl:with-param name="viewConcepts" select="."/>
                            </xsl:call-template>
                        </dataset>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
            <xsl:copy-of select="controls"/>
        </view>
    </xsl:template>

    <xsl:template name="copyConcept">
        <xsl:param name="datasetConcepts" as="element()?"/>
        <xsl:param name="viewConcepts" as="element()?"/>
        <xsl:for-each select="$datasetConcepts/concept">
            <xsl:variable name="id" select="@id"/>
            <xsl:variable name="containedid" select="contains/@ref" as="xs:string?"/>
            <xsl:variable name="containeded" select="contains/@flexibility" as="xs:string?"/>
            <xsl:variable name="viewConcept" select="$viewConcepts/concept[@ref = $id]"/>
            <!-- if this concept is a group and 'contains', and content is not merged into the fullDatasetTree, nor in the viewConcept, 
                then assume we need to be able to reference some other object in the xforms. For that we need the group to act as an 
                item of type identifier -->
            <xsl:variable name="treatAsReference" select="exists(.[@type = 'group'][contains][not(concept | valueDomain | valueSet | $viewConcept[concept | valueDomain | valueSet])])" as="xs:boolean"/>
            <xsl:variable name="reference" as="element(concept)?">
                <xsl:if test="$treatAsReference and not(empty($containedid)) and $containedid = $nlZorgParts">
                    <xsl:copy-of select="$transactions//concept[@id = $containedid][@effectiveDate = $containeded][not(.//contains[not(@ref = $nlZorgParts)])]"/>
                </xsl:if>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$viewConcepts/@include = 'all' or @id = $viewConcepts/concept/@ref">
                    <xsl:variable name="adaCommunityConcept" as="element()">
                        <concept>
                            <xsl:for-each select="community[@name='ada']/data">
                                <xsl:attribute name="{@type}" select="./text()"/>
                            </xsl:for-each>
                        </concept>
                    </xsl:variable>
                    <xsl:copy>
                        <!-- Standard behaviour of copy-of is to override existing atts with the same name.
                             So we copy for this concept: 1) decor atts 2) myCommunity ada atts 3) {project}-ada.xml atts
                             Thus 3) will take precedence over the 2), and 2) over 1)
                        -->
                        <xsl:copy-of select="@*"/>
                        <!-- Override potential minimumMultiplicity when the concept is optional. It might be what we 
                            want in the transaction views, but not in the ADA UI. We want conditional concepts to be optional.
                            We do this before any potential secondary overrides from ADA Community so that those are respected.
                        -->
                        <xsl:if test="@minimumMultiplicity and @minimumMultiplicity != 0 and @conformance='C'">
                            <xsl:attribute name="minimumMultiplicity">0</xsl:attribute>
                        </xsl:if>
                        <xsl:copy-of select="$adaCommunityConcept/(@* except @valueDomainType)"/>
                        <xsl:copy-of select="$viewConcept/(@* except @ref)"/>
                        
                        <xsl:if test="$treatAsReference and not($reference)">
                            <xsl:attribute name="type">item</xsl:attribute>
                        </xsl:if>
                        
                        <xsl:if test="$viewConcept/@notPresentWhen and (@minimumMultiplicity != 0 and not(@conformance = 'C'))">
                            <xsl:message terminate="no">WARNING: notPresentWhen on <xsl:value-of select="implementation/@shortName"/> and minimumMultiplicity != 0</xsl:message>
                        </xsl:if>
                        <!-- Copy everything except concept children and valueSet-->
                        <xsl:apply-templates select="* except (concept | valueSet | valueDomain)"/>
                        <!-- Copy children which are introduced in ada definitions -->
                        <xsl:copy-of select="$viewConcept/(* except concept)"/>
                        <!-- Copy first valueDomain.
                            If a valueDomain is defined in ADA definition, this will take precendence -->
                        <xsl:if test="not($viewConcept/valueDomain)">
                            <xsl:apply-templates select="valueDomain">
                                <xsl:with-param name="adaCommunityConcept" select="$adaCommunityConcept" as="element()"/>
                            </xsl:apply-templates>
                        </xsl:if>
                        <!-- Copy first valueSet, no support for multiple valueSets with values yet.
                            If a valueSet is defined in ADA definition, this will take precedence -->
                        <xsl:if test="not($viewConcept/valueSet)">
                            <xsl:choose>
                                <xsl:when test="valueSet/conceptList[concept | exception]">
                                    <xsl:copy-of select="valueSet[conceptList[concept | exception]][1]"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:copy-of select="valueSet"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="$viewConcept">
                            <xsl:call-template name="copyConcept">
                                <xsl:with-param name="datasetConcepts" select="$viewConcept"/>
                                <xsl:with-param name="viewConcepts" as="element()">
                                    <concepts include="all"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:if>
                        
                        <xsl:if test="$treatAsReference">
                            <xsl:choose>
                                <xsl:when test="$reference">
                                    <xsl:call-template name="copyConcept">
                                        <xsl:with-param name="datasetConcepts" select="$reference"/>
                                        <xsl:with-param name="viewConcepts" select="$viewConcepts"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <valueDomain type="identifier"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        
                        <xsl:call-template name="copyConcept">
                            <xsl:with-param name="datasetConcepts" select="."/>
                            <xsl:with-param name="viewConcepts" select="$viewConcepts"/>
                        </xsl:call-template>
                    </xsl:copy>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="copyConcept">
                        <xsl:with-param name="datasetConcepts" select="."/>
                        <xsl:with-param name="viewConcepts" select="$viewConcepts"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="valueDomain">
        <xsl:param name="adaCommunityConcept" as="element()?"/>
        
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="$adaCommunityConcept/@valueDomainType">
                    <xsl:attribute name="type" select="$adaCommunityConcept/@valueDomainType"/>
                    <xsl:copy-of select="@* except @type"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="@*"/>
                    <xsl:if test="@type = 'datetime'">
                        <xsl:attribute name="type">string</xsl:attribute>
                        <xsl:comment>converted to string to support things like T-500 or other syntaxes</xsl:comment>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:copy-of select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@*|node()" mode="#all">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>