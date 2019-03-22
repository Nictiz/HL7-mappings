<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Parameters to be set, may be overridden by an importing stylesheet -->
    <xsl:param name="ad-transaction" select="document('2.3.3/sturen_kernset_geboortezorg/ada_schemas/RetrieveTransaction-ks-gz-233.xml')"/>
    <xsl:param name="ad-trans-instance" select="document('2.3.3/sturen_kernset_geboortezorg/ada_schemas/tr-2.16.840.1.113883.2.4.3.11.60.90.77.4.2437-2016-11-22T082402_instance.xml')"/>
    <xsl:param name="releaseUri" select="'http://decor.nictiz.nl/decor/services/RetrieveTransaction?id=2.16.840.1.113883.2.4.3.11.60.90.77.4.2410&amp;language=nl-NL&amp;version=2014-11-19T17:15:44&amp;format=xml'"/>
    <xsl:param name="hl7PayloadContext" select="'/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent'"/>

    <xsl:import href="../test-xslt/ada2test-xslt.xsl"/>

    <xd:doc>
        <xd:desc>Makes concept for transaction which contains all necessary info to create the schematron rules later.
        Special handling for uitkomst_per_kind, since the xpaths need to be specific per child, depending on ada input</xd:desc>
        <xd:param name="xpath-context">context passed in from the parent group, if applicable, otherwise defaulted</xd:param>
    </xd:doc>
    <xsl:template match="concept[@shortName = 'uitkomst_per_kind']" mode="maak-my-concept">
        <xsl:param name="xpath-context" select="$ad-trans-instance"/>
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="xpath-concept" select="($xpath-context//concept[@ref = $current-concept/@id])"/>
        <xsl:variable name="xpath-tree" select="$xpath-concept/ancestor::node()"/>
        <xsl:variable name="my-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>
        <xsl:variable name="ada-count" select="count($ada-input-concept)"/>

        <xsl:choose>
            <xsl:when test="$ada-count gt 1">
                <xsl:for-each select="$ada-input-concept">
                    <!-- We should be able to distinguish on birthTime -->
                    <!-- hl7:subject/hl7:personalRelationship/hl7:relationshipHolder/hl7:birthTime -->
                    <xsl:variable name="ada-geboortedatum" select="./baring/demografische_gegevens/geboortedatum"/>
                    <xsl:variable name="ada-hl7-datetime" select="substring(nf:ada2hl7-datetime($ada-geboortedatum/@value), 1, 12)"/>
                    <xsl:variable name="new-xpath" select="concat($my-xpath, '/hl7:subject/hl7:personalRelationship/hl7:relationshipHolder/hl7:birthTime[@value=', $ada-hl7-datetime, ']')"/>
                    <my-concept xmlns="" id="{$current-concept/@id}" type="{$current-concept/@type}" shortName="{$current-concept/@shortName}" name="{$current-concept/name[@language='nl-NL']/text()}" valuedomain="{$current-concept/valueDomain/@type}" ada-count="1">
                        <my-xpath xmlns="" value="{$new-xpath}"/>
                        <xsl:choose>
                            <xsl:when test="$current-concept/@type = 'group'">
                                <xsl:apply-templates select="$current-concept/concept" mode="maak-my-concept">
                                    <xsl:with-param name="xpath-context" select="$xpath-concept/.."/>
                                </xsl:apply-templates>
                            </xsl:when>
                            <xsl:when test="$current-concept/@type = 'item'">
                                <xsl:copy-of select="$ada-input-concept"/>
                            </xsl:when>
                        </xsl:choose>
                    </my-concept>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <!-- handle the same as a normal group -->
                <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{$ada-count}">
                    <my-xpath xmlns="" value="{$my-xpath}"/>
                    <xsl:choose>
                        <xsl:when test="@type = 'group'">
                            <xsl:apply-templates select="concept" mode="maak-my-concept">
                                <xsl:with-param name="xpath-context" select="$xpath-concept/.."/>
                            </xsl:apply-templates>
                        </xsl:when>
                        <xsl:when test="@type = 'item'">
                            <xsl:copy-of select="$ada-input-concept"/>
                        </xsl:when>
                    </xsl:choose>
                </my-concept>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xd:doc>
        <xd:desc>Makes concept for transaction, but ignores any ada input since the contents may be determined by the qualifying system</xd:desc>
        <xd:param name="xpath-context">context passed in from the parent group, if applicable, otherwise defaulted</xd:param>
    </xd:doc>
    <xsl:template match="concept[@shortName = ('lokale_persoonsidentificatie', 'partusnummer')]" name="makeConceptIgnoreAdaInput" mode="maak-my-concept">
        <xsl:param name="xpath-context" select="$ad-trans-instance"/>
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="xpath-concept" select="($xpath-context//concept[@ref = $current-concept/@id])"/>
        <xsl:variable name="xpath-tree" select="$xpath-concept/ancestor::node()"/>
        <xsl:variable name="my-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
        </my-concept>
    </xsl:template>


    <xd:doc>
        <xd:desc>Makes concept for transaction which contains all necessary info to create the schematron rules later.
             items here get specific handling because the ada parent has a template association in hl7 
             which is not a parent of the template association for this item.
             That does not work in the generic handling of the ade2test-xslt.xsl.
             This template only works if there is only one template association for the input concept in the transaction, 
             otherwise, even more specific handling will be required.</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@shortName = ('verwijsdetails', 'type_verwijzing', 'anamnese', 'vrouwelijke_genitale_verminkingq', 'type_vrouwelijke_genitale_verminking', 'lengte_gemeten', 'maternale_sterfteq', 'chromosomale_afwijkingenq', 'specificatie_chromosomale_afwijking_groep', 'kindspecifieke_gegevens')]" name="makeConceptNoParentContext" mode="maak-my-concept">
        <xsl:variable name="current-concept" select="."/>
        <!-- use the $ad-trans-instance as context since type_verwijzing is not a child of verwijzing_naar in the hl7 instances -->
        <xsl:variable name="xpath-concept" select="($ad-trans-instance//concept[@ref = $current-concept/@id])"/>
        <xsl:variable name="xpath-tree" select="$xpath-concept/ancestor::node()"/>
        <xsl:variable name="my-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <xsl:choose>
                <xsl:when test="@type = 'group'">
                    <xsl:apply-templates select="concept" mode="maak-my-concept">
                        <xsl:with-param name="xpath-context" select="$xpath-concept/.."/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="@type = 'item'">
                    <xsl:copy-of select="$ada-input-concept"/>
                </xsl:when>
            </xsl:choose>
        </my-concept>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes concept for transaction concept (verwijzing_van|verwijzing_naar)/zorginstelling/zorgaanbieder_identificatie_nummer 
            (zorgaanbieder_identificatie_nummer conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82552 of 82579")
            which contains all necessary info to create the schematron rules later.
            Special handling here because there are multiple template associations (more than one id definition in the template).</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@id = ('2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82552', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82579')]" mode="maak-my-concept">
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="authorOrPerformer">
            <xsl:choose>
                <xsl:when test="@id = '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82552'">author</xsl:when>
                <xsl:when test="@id = '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82579'">performer</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="my-xpath">hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3/hl7:act/hl7:<xsl:value-of select="$authorOrPerformer"/>/hl7:assignedEntity/hl7:representedOrganization/hl7:id</xsl:variable>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <xsl:copy-of select="$ada-input-concept"/>
        </my-concept>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a schematron assert for valuedomain boolean
        Specific handling for when this ends up in @negationInd and the templateAssociation is on the element which has the @negationInd
        </xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="congenitale_afwijkingenq | episiotomieq | irregulaire_antistoffenq | kinderarts_betrokkenq | pijnbestrijdingq | problematiek_kindq | psychiatrieq | sedatieq | vrouwelijke_genitale_verminkingq" mode="doAssert4Boolean">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <xsl:variable name="negation-boolean" select="@value = 'false'"/>
        <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet waarde = ''', string-join(@value | @nullFlavor, ' '), ''' bevatten.', ' Dataset concept id: ', @conceptId, '.')"/></xsl:comment>
        <xsl:choose>
            <xsl:when test="@nullFlavor">
                <sch:assert role="error" test="{$context}[@nullFlavor = '{@nullFlavor}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="@nullFlavor"/>" (nullFlavor: <xsl:value-of select="@nullFlavor"/>). Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:when>
            <xsl:otherwise>
                <sch:assert role="error" test="{$context}[@negationInd='{$negation-boolean}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde '"<xsl:value-of select="@value"/>"'.</sch:assert>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xd:doc>
        <xd:desc>Creates multiplity assert, special handling because template association does not correspond to multiplicity</xd:desc>
    </xd:doc>
    <xsl:template match="my-concept[@shortName = 'verwijsdetails']" mode="doMultiplicityAssert">
        <xsl:variable name="concept-naam" select="@name"/>
        <xsl:variable name="my-xpath">/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3/hl7:act[hl7:templateId/@root='2.16.840.1.113883.2.4.6.10.90.901098']</xsl:variable>
        <xsl:comment><xsl:value-of select="$concept-naam"/> (<xsl:value-of select="@id"/>) moet <xsl:value-of select="@ada-count"/> keer voorkomen.</xsl:comment>
        <!--concept moet precies x keer voorkomen.-->
        <sch:let name="hl7-count" value="count(/{$my-xpath})"/>
        <sch:assert role="error" test="$hl7-count = {@ada-count}"><xsl:value-of select="$concept-naam"/> moet <xsl:value-of select="@ada-count"/> keer voorkomen (dataset concept id: <xsl:value-of select="@id"/>). Aantal gevonden: <sch:value-of select="$hl7-count"/></sch:assert>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes concept for transaction concept pijnbestrijding/methode conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82093" 
            which contains all necessary info to create the schematron rules later.
            Special handling here because the template association in on the same level as concept for pijnbestrijding conceptId=82091....</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@id = '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82093']" name="makeConceptObsoleteGroup" mode="maak-my-concept">
        <!-- do nothing, this is an obsolete group for schematron checking -->
    </xsl:template>
</xsl:stylesheet>
