<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Parameters to be set, may be overridden by an importing stylesheet -->
    <xsl:param name="doc-ad-transaction" select="document('2.3.3/sturen_kernset_geboortezorg/ada_schemas/RetrieveTransaction-ks-gz-233.xml')"/>
    <xsl:param name="doc-ad-trans-instance" select="document('2.3.3/sturen_kernset_geboortezorg/ada_schemas/tr-2.16.840.1.113883.2.4.3.11.60.90.77.4.2437-2016-11-22T082402_instance.xml')"/>
    <xsl:param name="releaseUri" select="'http://decor.nictiz.nl/decor/services/RetrieveTransaction?id=2.16.840.1.113883.2.4.3.11.60.90.77.4.2410&amp;language=nl-NL&amp;version=2014-11-19T17:15:44&amp;format=xml'"/>
    <xsl:param name="hl7PayloadContext" select="'/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent'"/>

    <xsl:import href="../test-xslt/ada2test-xslt.xsl"/>

    <xd:doc>
        <xd:desc>Makes concept for transaction which contains all necessary info to create the schematron rules later.
            Special handling for diagnoseinterventie_postpartum, since the xpaths need to be specific per diagnosis, depending on ada input</xd:desc>
        <xd:param name="parent-hl7-element">context passed in from the parent group, if applicable, otherwise defaulted</xd:param>
        <xd:param name="parent-concept">the parent concept (association) as exists in the transaction xml ($doc-ad-trans-instance), if applicable</xd:param>
    </xd:doc>
    <xsl:template match="concept[@shortName = 'diagnoseinterventie_postpartum']" mode="maak-my-concept">
        <xsl:param name="parent-hl7-element" select="$doc-ad-trans-instance//hl7:instance"/>
        <xsl:param name="parent-concept" as="element(concept)?"/>

        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="current-xpath-concept-temp" select="$parent-hl7-element//concept[@ref = $current-concept/@id]"/>
        <!-- defensive programming, but should not happen that there is more than one association for this concept -->
        <xsl:variable name="current-xpath-concept" select="$current-xpath-concept-temp[1]"/>

        <xsl:variable name="xpath-tree" select="$current-xpath-concept/ancestor::node()"/>
        <xsl:variable name="my-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:variable name="relative-xpath" select="nf:get-relative-xpath($parent-hl7-element, $parent-concept, $current-xpath-concept)" as="xs:string?"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>
        <xsl:variable name="ada-count" select="count($ada-input-concept)"/>

        <xsl:choose>
            <xsl:when test="$ada-count gt 1">
                <xsl:for-each select="$ada-input-concept">
                    <!-- We should be able to distinguish on pathologie_vrouw code -->
                    <!-- hl7:subject/hl7:personalRelationship/hl7:relationshipHolder/hl7:birthTime -->
                    <xsl:variable name="ada-path-vrouw" select="./pathologie_vrouw"/>
                    <xsl:variable name="new-append-xpath">[hl7:observation/hl7:value[@code='<xsl:value-of select="$ada-path-vrouw/@code"/>']]</xsl:variable>
                    <xsl:variable name="new-xpath" select="concat($my-xpath, $new-append-xpath)"/>
                    <my-concept xmlns="" id="{$current-concept/@id}" type="{$current-concept/@type}" shortName="{$current-concept/@shortName}" name="{$current-concept/name[@language='nl-NL']/text()}" valuedomain="{$current-concept/valueDomain/@type}" ada-count="1">
                        <my-xpath xmlns="" value="{$new-xpath}"/>
                        <xsl:if test="$relative-xpath">
                            <relative-xpath xmlns="" value="{concat($relative-xpath, $new-append-xpath)}"/>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="$current-concept/@type = 'group'">
                                <xsl:apply-templates select="$current-concept/concept" mode="maak-my-concept">
                                    <xsl:with-param name="parent-hl7-element" select="$current-xpath-concept/.."/>
                                    <xsl:with-param name="parent-concept" select="$current-xpath-concept"/>
                                    <xsl:with-param name="override-parent-xpath" select="$new-xpath"/>
                                    <xsl:with-param name="override-ada-input" select="."/>
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
                <!-- this group has same template association as it's parent, so do not use this group for schematron checking -->
                <!-- do pass the appropriate parent xpath, which should be postnatale_fase conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.16" -->
                <xsl:variable name="current-xpath-concept-temp" select="$parent-hl7-element//concept[@ref = '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.16']"/>
                <!-- defensive programming, but should not happen that there is more than one association for this concept -->
                <xsl:variable name="current-xpath-concept" select="$current-xpath-concept-temp[1]"/>
                <xsl:apply-templates select="$current-concept/concept" mode="maak-my-concept">
                    <xsl:with-param name="parent-hl7-element" select="$current-xpath-concept/.."/>
                    <xsl:with-param name="parent-concept" select="$current-xpath-concept"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes concept for transaction which contains all necessary info to create the schematron rules later.
            Special handling for uitkomst_per_kind, since the xpaths need to be specific per child, depending on ada input</xd:desc>
        <xd:param name="parent-hl7-element">context passed in from the parent group, if applicable, otherwise defaulted</xd:param>
        <xd:param name="parent-concept">the parent concept (association) as exists in the transaction xml ($doc-ad-trans-instance), if applicable</xd:param>
    </xd:doc>
    <xsl:template match="concept[@shortName = 'uitkomst_per_kind']" mode="maak-my-concept">
        <xsl:param name="parent-hl7-element" select="$doc-ad-trans-instance//hl7:instance"/>
        <xsl:param name="parent-concept" as="element(concept)?"/>

        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="current-xpath-concept-temp" select="$parent-hl7-element//concept[@ref = $current-concept/@id]"/>
        <!-- defensive programming, but should not happen that there is more than one association for this concept -->
        <xsl:variable name="current-xpath-concept" select="$current-xpath-concept-temp[1]"/>

        <xsl:variable name="xpath-tree" select="$current-xpath-concept/ancestor::node()"/>
        <xsl:variable name="my-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:variable name="relative-xpath" select="nf:get-relative-xpath($parent-hl7-element, $parent-concept, $current-xpath-concept)" as="xs:string?"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>
        <xsl:variable name="ada-count" select="count($ada-input-concept)"/>

        <xsl:choose>
            <xsl:when test="$ada-count gt 1">
                <xsl:for-each select="$ada-input-concept">
                    <!-- We should be able to distinguish on birthTime -->
                    <!-- hl7:subject/hl7:personalRelationship/hl7:relationshipHolder/hl7:birthTime -->
                    <xsl:variable name="ada-geboortedatum" select="./baring/demografische_gegevens/geboortedatum"/>
                    <xsl:variable name="ada-hl7-datetime" select="substring(nf:ada2hl7-datetime($ada-geboortedatum/@value), 1, 12)"/>
                    <xsl:variable name="new-append-xpath">[hl7:subject/hl7:personalRelationship/hl7:relationshipHolder/hl7:birthTime[substring(@value,1,12)='<xsl:value-of select="$ada-hl7-datetime"/>']]</xsl:variable>
                    <xsl:variable name="new-xpath" select="concat($my-xpath, $new-append-xpath)"/>
                    <my-concept xmlns="" id="{$current-concept/@id}" type="{$current-concept/@type}" shortName="{$current-concept/@shortName}" name="{$current-concept/name[@language='nl-NL']/text()}" valuedomain="{$current-concept/valueDomain/@type}" ada-count="1">
                        <my-xpath xmlns="" value="{$new-xpath}"/>
                        <xsl:if test="$relative-xpath">
                            <relative-xpath xmlns="" value="{concat($relative-xpath, $new-append-xpath)}"/>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="$current-concept/@type = 'group'">
                                <!-- voeding_kind is not a child of ada uitkomst_per_kind in ada but it is in hl7,
                                     so we need to add it here -->
                                <xsl:variable name="current_rangn_kind" select="./baring/demografische_gegevens/rangnummer_kind/@value" as="xs:string?"/>
                                <xsl:variable name="this_postnat_kindgegevens" select="postnatale_fase/kindspecifieke_gegevens[rangnummer_kind/@value = $current_rangn_kind]"/>
                                <xsl:apply-templates select="$current-concept/concept | $this_postnat_kindgegevens/*[not(local-name() = 'rangnummer_kind')]" mode="maak-my-concept">
                                    <xsl:with-param name="parent-hl7-element" select="$current-xpath-concept/.."/>
                                    <xsl:with-param name="parent-concept" select="$current-xpath-concept"/>
                                    <xsl:with-param name="override-parent-xpath" select="$new-xpath"/>
                                    <xsl:with-param name="override-ada-input" select="."/>
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
                    <xsl:apply-templates select="$current-concept/concept" mode="maak-my-concept">
                        <xsl:with-param name="parent-hl7-element" select="$current-xpath-concept/.."/>
                        <xsl:with-param name="parent-concept" select="$current-xpath-concept"/>
                    </xsl:apply-templates>
                </my-concept>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>



    <xd:doc>
        <xd:desc>Makes concept for transaction, but ignores any ada input since the contents may be determined by the qualifying system</xd:desc>
        <xd:param name="parent-hl7-element">context passed in from the parent group, if applicable, otherwise defaulted</xd:param>
        <xd:param name="parent-concept"/>
    </xd:doc>
    <xsl:template match="concept[@shortName = ('lokale_persoonsidentificatie', 'partusnummer')]" name="makeConceptIgnoreAdaInput" mode="maak-my-concept">
        <xsl:param name="parent-hl7-element" select="$doc-ad-trans-instance//hl7:instance"/>
        <xsl:param name="parent-concept" as="element(concept)?"/>
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="current-xpath-concept" select="($parent-hl7-element//concept[@ref = $current-concept/@id])"/>
        <xsl:variable name="xpath-tree" select="$current-xpath-concept/ancestor::node()"/>
        <xsl:variable name="my-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:variable name="relative-xpath" select="nf:get-relative-xpath($parent-hl7-element, $parent-concept, $current-xpath-concept)" as="xs:string?"/>
        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <xsl:if test="$relative-xpath">
                <relative-xpath xmlns="" value="{$relative-xpath}"/>
            </xsl:if>
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
    <xsl:template match="concept[@shortName = ('anamnese', 'chromosomale_afwijkingenq', 'lengte_gemeten', 'maternale_sterfteq', 'specificatie_chromosomale_afwijking_groep', 'type_verwijzing', 'type_vrouwelijke_genitale_verminking', 'verwijsdetails', 'vrouwelijke_genitale_verminkingq')]" name="makeConceptNoParentContext" mode="maak-my-concept">
        <!-- use the $ad-trans-instance as context since this ada element is not a child of it's ada parent in the hl7 instances -->
        <xsl:variable name="parent-hl7-element" select="$doc-ad-trans-instance//hl7:instance"/>

        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="current-xpath-concept" select="($parent-hl7-element//concept[@ref = $current-concept/@id])"/>
        <xsl:variable name="xpath-tree" select="$current-xpath-concept/ancestor::node()"/>
        <xsl:variable name="my-xpath" select="string-join($xpath-tree/@withpredicate, '/')" as="xs:string?"/>
        <xsl:variable name="relative-xpath" select="concat('//', $my-xpath)"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <xsl:if test="$relative-xpath">
                <relative-xpath xmlns="" value="{$relative-xpath}"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="@type = 'group'">
                    <xsl:apply-templates select="concept" mode="maak-my-concept">
                        <xsl:with-param name="parent-hl7-element" select="$current-xpath-concept/.."/>
                        <xsl:with-param name="parent-concept" select="$current-xpath-concept"/>
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
        <xsl:variable name="relative-xpath" select="concat('//', $my-xpath)"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <relative-xpath xmlns="" value="{$relative-xpath}"/>
            <xsl:copy-of select="$ada-input-concept"/>
        </my-concept>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes concept for transaction concept (zwangerschap)/definitieve_a_terme_datum 
            (conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82160")
            which contains all necessary info to create the schematron rules later.
            Special handling here because there are multiple template associations (more than one id definition in the template)
            and the parent (zwangerschap) has a templateAssociation on too high a level (CareProvisionEvent).</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@id = ('2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82160')]" mode="maak-my-concept">
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="my-xpath">hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3/hl7:observation[hl7:templateId/@root='2.16.840.1.113883.2.4.6.10.90.900928']/hl7:value</xsl:variable>
        <xsl:variable name="relative-xpath" select="concat('//', $my-xpath)"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <relative-xpath xmlns="" value="{$relative-xpath}"/>
            <xsl:copy-of select="$ada-input-concept"/>
        </my-concept>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes concept for transaction concept uitkomst_per_kind/ziekenhuisnummer_lvrid 
            (conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40005")
            which contains all necessary info to create the schematron rules later.
            Special handling here because there are multiple template associations (more than one id definition in the template)
            and the parent (uitkomst_per_kind) has more than one child concept with name ziekenhuisnummer_lvrid.</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@id = ('2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40005')]" mode="maak-my-concept">
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="my-xpath">hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3/hl7:organizer/hl7:component/hl7:procedure[hl7:templateId/@root='2.16.840.1.113883.2.4.6.10.90.901102']/hl7:location/hl7:healthCareFacility/hl7:id</xsl:variable>
        <xsl:variable name="relative-xpath" select="concat('//', $my-xpath)"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <relative-xpath xmlns="" value="{$relative-xpath}"/>
            <xsl:copy-of select="$ada-input-concept"/>
        </my-concept>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes concept for transaction concept (zwangerschap)/wijze_einde_zwangerschap 
            (conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80625")
            which contains all necessary info to create the schematron rules later.
            Special handling here because there are multiple template associations (more than one id definition in the template)
            and the parent (zwangerschap) has a templateAssociation on too high a level (CareProvisionEvent).</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@id = ('2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80625')]" mode="maak-my-concept">
        <xsl:variable name="current-concept" select="."/>
        <xsl:variable name="my-xpath">hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3/hl7:observation[hl7:templateId/@root='2.16.840.1.113883.2.4.6.10.90.900876']/hl7:value</xsl:variable>
        <xsl:variable name="relative-xpath" select="concat('//', $my-xpath)"/>

        <xsl:variable name="ada-input-concept" select="$ada-input//data/*//*[@conceptId = $current-concept/@id][* or (@value | @code | @nullFlavor)]" as="element()*"/>

        <my-concept xmlns="" id="{@id}" type="{@type}" shortName="{@shortName}" name="{name[@language='nl-NL']/text()}" valuedomain="{valueDomain/@type}" ada-count="{count($ada-input-concept)}">
            <my-xpath xmlns="" value="{$my-xpath}"/>
            <relative-xpath xmlns="" value="{$relative-xpath}"/>
            <xsl:copy-of select="$ada-input-concept"/>
        </my-concept>
    </xsl:template>


    <xd:doc>
        <xd:desc>Creates a schematron multiplicity assert for valuedomain boolean which has a corresponding group, therefore if the group multiplicity is more than one, then the boolean (negationInd = 'false') will also appear more than once
        Specific handling for when this ends up in @negationInd and the templateAssociation is on the element which has the @negationInd
        </xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="my-concept[@shortName = ('chromosomale_afwijkingenq', 'congenitale_afwijkingenq', 'episiotomieq', 'irregulaire_antistoffenq', 'kinderarts_betrokkenq', 'overige_aandoeningq', 'pijnbestrijdingq', 'problematiek_kindq', 'psychiatrieq', 'sedatieq', 'vrouwelijke_genitale_verminkingq')]" mode="doMultiplicityAssert">
        <xsl:param name="context" as="xs:string?" select="./relative-xpath/@value"/>
        <xsl:variable name="concept-naam" select="@name"/>
        <xsl:variable name="negation-boolean" select="@value = 'false'"/>
        <xsl:variable name="my-xpath" select="$context"/>
        <xsl:comment><xsl:value-of select="$concept-naam"/> (<xsl:value-of select="@id"/>) moet <xsl:value-of select="@ada-count"/> keer voorkomen.</xsl:comment>
        <!--These concepts are always 0..1, so more than one really means one-->
        <sch:let name="hl7-count" value="if (count({$my-xpath}) = 0) then 0 else 1"/>
        <sch:assert role="error" test="$hl7-count = {@ada-count}"><xsl:value-of select="$concept-naam"/> moet <xsl:value-of select="@ada-count"/> keer voorkomen (dataset concept id: <xsl:value-of select="@id"/>). Aantal gevonden: <sch:value-of select="$hl7-count"/></sch:assert>
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
        <xd:desc>Creates multiplity assert, special handling because template association does not take account of negationInd or nullFlavor</xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="my-concept[@shortName = ('betrokkenheid_kinderarts', 'congenitale_afwijkingen_groep', 'overige_aandoening', 'pijnbestrijding', 'specificatie_chromosomale_afwijking_groep')]" mode="doMultiplicityAssert">
        <xsl:param name="context" as="xs:string?" select="./relative-xpath/@value"/>
        <xsl:variable name="concept-naam" select="@name"/>
        <xsl:variable name="my-xpath" select="concat($context, '[not(@negationInd=''true'')][not(@nullFlavor)]')"/>
        <xsl:comment><xsl:value-of select="$concept-naam"/> (<xsl:value-of select="@id"/>) moet <xsl:value-of select="@ada-count"/> keer voorkomen.</xsl:comment>
        <!--concept moet precies x keer voorkomen.-->
        <sch:let name="hl7-count" value="count({$my-xpath})"/>
        <sch:assert role="error" test="$hl7-count = {@ada-count}"><xsl:value-of select="$concept-naam"/> moet <xsl:value-of select="@ada-count"/> keer voorkomen (dataset concept id: <xsl:value-of select="@id"/>). Aantal gevonden: <sch:value-of select="$hl7-count"/></sch:assert>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates a multiplicity schematron assert for valuedomain boolean
            Specific handling for when this ends up in @negationInd and the templateAssociation is on the element which has the @negationInd
        </xd:desc>
        <xd:param name="context">context xpath to the hl7 element containing the value</xd:param>
    </xd:doc>
    <xsl:template match="chromosomale_afwijkingenq | congenitale_afwijkingenq | episiotomieq | irregulaire_antistoffenq | kinderarts_betrokkenq | overige_aandoeningq | pijnbestrijdingq | problematiek_kindq | psychiatrieq | sedatieq | vrouwelijke_genitale_verminkingq" mode="doAssert4Boolean">
        <xsl:param name="context" as="xs:string?">.</xsl:param>
        <xsl:variable name="concept-naam" select="../@name"/>
        <xsl:variable name="negation-boolean" select="@value = 'false'"/>
        <xsl:comment><xsl:value-of select="concat($concept-naam, ' moet waarde = ''', string-join(@value | @nullFlavor, ' '), ''' bevatten.', ' Dataset concept id: ', @conceptId, '.')"/></xsl:comment>
        <xsl:choose>
            <xsl:when test="@nullFlavor">
                <sch:assert role="error" test="{$context}[@nullFlavor = '{@nullFlavor}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde "<xsl:value-of select="@nullFlavor"/>" (nullFlavor: <xsl:value-of select="@nullFlavor"/>). Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:when>
            <xsl:otherwise>
                <sch:assert role="error" test="{$context}[@negationInd='{$negation-boolean}']/.">Verwacht is een <xsl:value-of select="$concept-naam"/> met waarde '"<xsl:value-of select="@value"/>"'. Dataset concept id: <xsl:value-of select="@conceptId"/>.</sch:assert>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>concept for transaction concept:
            verwijsdetails/redenen_van_verwijzing/van_1e_naar_2e_lijn conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82450"
            vorige_baring conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80709"
            kindspecifieke_gegevens_vorige_uitkomsten conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.21"
            baring conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40002"
            ziekenhuis_baring conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82114"
            demografische_gegevens conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40006"  
            perinatale_sterfte_groep conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40279"
            kindspeficieke_maternale_gegevens conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.71"
            kindspeficieke_uitkomst_gegevens conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.72"
            lichamelijk_onderzoek_kind conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80766"
            pijnbestrijding/methode conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82093" 
            urine_bloed_en_aanvullende_onderzoeken conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80959"
            which contains all necessary info to create the schematron rules later.
            
            Special handling here because for example the template association is on the same level as concept for it's parent....</xd:desc>
        <xd:param name="parent-hl7-element"/>
        <xd:param name="parent-concept"/>
        <xd:param name="override-parent-xpath"/>
        <xd:param name="override-ada-input"/>
    </xd:doc>
    <xsl:template match="concept[@id = ('2.16.840.1.113883.2.4.3.11.60.90.77.2.6.21', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.71', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.72', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.161', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40002', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40006', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.40279', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80709', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80766', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.80959', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82093', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82114', '2.16.840.1.113883.2.4.3.11.60.90.77.2.6.82450')]" name="makeConceptObsoleteGroup" mode="maak-my-concept">
        <xsl:param name="parent-hl7-element" select="$doc-ad-trans-instance//hl7:instance"/>
        <xsl:param name="parent-concept" as="element(concept)?"/>
        <xsl:param name="override-parent-xpath" as="xs:string?"/>
        <xsl:param name="override-ada-input" as="node()*"/>

        <!-- do nothing for this concept, this is an obsolete group for schematron checking -->
        <!-- however it's child concepts should be handled -->
        <xsl:apply-templates select="concept" mode="maak-my-concept">
            <xsl:with-param name="parent-hl7-element" select="$parent-hl7-element"/>
            <xsl:with-param name="parent-concept" select="$parent-concept"/>
            <xsl:with-param name="override-parent-xpath" select="$override-parent-xpath"/>
            <xsl:with-param name="override-ada-input" select="$override-ada-input"/>
        </xsl:apply-templates>

    </xsl:template>

    <xd:doc>
        <xd:desc>concept for transaction concept:
                kindspecifieke_gegevens  conceptId="2.16.840.1.113883.2.4.3.11.60.90.77.2.6.161" 
            which contains all necessary info to create the schematron rules later.
            
            Special handling here because the contents of postnatale_fase/kindspecifieke_gegevens is handled in uitkomst_per_kind
            , where the data lands in hl7....</xd:desc>
    </xd:doc>
    <xsl:template match="concept[@id = ('2.16.840.1.113883.2.4.3.11.60.90.77.2.6.161')]/*" name="makeConceptHandledGroup" mode="maak-my-concept">
        <!-- do nothing for this concept, this group is handled elsewhere for schematron checking -->
    </xsl:template>
</xsl:stylesheet>
