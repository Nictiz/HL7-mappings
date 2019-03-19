<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Parameters to be set, may be overridden by an importing stylesheet -->
    <xsl:param name="adaReleaseFile" select="document('kernset-ada-release.xml')"/>
    <xsl:param name="releaseUri" select="'http://decor.nictiz.nl/decor/services/RetrieveTransaction?id=2.16.840.1.113883.2.4.3.11.60.90.77.4.2410&amp;language=nl-NL&amp;version=2014-11-19T17:15:44&amp;format=xml'"/>
    <xsl:param name="hl7PayloadContext" select="'/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent'"/>

    <xsl:import href="../test-xslt/ada2test-xslt.xsl"/>

    <xsl:template match="zorgverlening" mode="doRule">
        <xsl:comment>Regels voor "zorgverlening"</xsl:comment>
        <sch:rule context="{$hl7PayloadContext}">
            <xsl:apply-templates select="datum_start_zorgverantwoordelijkheid[@value]" mode="doAssert4Date">
                <xsl:with-param name="context">hl7:effectiveTime/hl7:low</xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates select="datum_einde_zorgverantwoordelijkheid[@value]" mode="doAssert4Date">
                <xsl:with-param name="context">hl7:effectiveTime/hl7:high</xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates select="eindverantwoordelijk_in_welke_perinatale_periodeq" mode="doAssert4Code">
                <xsl:with-param name="context">hl7:pertinentInformation3[hl7:observation[hl7:code[(@code = 'Rpp' and @codeSystem = '2.16.840.1.113883.2.4.4.13')]]]/hl7:observation/hl7:value</xsl:with-param>                
            </xsl:apply-templates>
            <xsl:apply-templates select="conclusie_risicostatus_na_intake" mode="doAssert4Code">
                <xsl:with-param name="context">hl7:pertinentInformation3[hl7:observation[hl7:code[(@code = 'RiskStat' and @codeSystem = '2.16.840.1.113883.2.4.4.13')]]]/hl7:observation/hl7:value</xsl:with-param>                
            </xsl:apply-templates>
        </sch:rule>
        <xsl:apply-templates select="verwijsdetails" mode="doRule"/>
    </xsl:template>
    
    <xsl:template match="verwijsdetails" mode="doRule">
        <xsl:comment>Regels voor "verwijsdetails"</xsl:comment>
        <sch:rule context="{$hl7PayloadContext}/hl7:pertinentInformation3[hl7:act[hl7:code[(@code = '3457005' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:act">
            <xsl:apply-templates select="datum_verwijzing" mode="doAssert4Date">
                <xsl:with-param name="context">hl7:effectiveTime</xsl:with-param>
            </xsl:apply-templates>
        </sch:rule>
    </xsl:template>


    <!-- Alle xml elementen voor dit bericht dat het attribuut value bevat vanuit ADA -->
    <!-- Voor multiplicity testen > 1 én voor value testen -->
    <!--   <xsl:template match="//*[@transactionRef]//*[@value]">
        <xsl:variable name="currentConceptId" select="@conceptId"/>
        <!-\- naam, concepttype (item of groep) en valuedomain type ophalen -\->
        <xsl:variable name="conceptName" select="$adaReleaseFile/ada//concept[@id=$currentConceptId]/name[@language='nl-NL']/text()"/>
        <xsl:variable name="conceptType" select="$adaReleaseFile/ada//concept[@id=$currentConceptId]/@type"/>
        <xsl:variable name="valuedomainType" select="$adaReleaseFile/ada//concept[@id=$currentConceptId]/valueDomain/@type"/>
        <!-\- Berekenen hoeveel occurences er zijn voor dit specifieke element -\->
        <xsl:variable name="amountOccurences">
            <xsl:variable name="currentConceptId" select="./@conceptId"/>
            <xsl:value-of select="count(preceding::*[@conceptId=$currentConceptId and @value]) + 1 + count(following::*[@conceptId=$currentConceptId and @value])"/>
        </xsl:variable>
        <xsl:variable name="predicateOrAssert">
            <xsl:call-template name="makeSchematronString">
                <xsl:with-param name="currentConcept" select="."/>
                <xsl:with-param name="valuedomainType" select="$valuedomainType"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="occurrence">
            <xsl:choose>
                <xsl:when test="$amountOccurences>1">
                    <!-\- bij meerdere occurences van een item, check op aanwezigheid van dat item, volgorde niet van belang -\->
                    <!-\- de predicate die in occurrence komt hier samenstellen -\->
                    <xsl:value-of select="$predicateOrAssert"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-\- 1 occurrence -\->
                    <xsl:value-of select="$amountOccurences"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-\- Voor het huidge gevonden concept (met een waarde dus) een concept element aanmaken voor multiplicity test -\->
        <!-\- Alléén de eerste keer dat dit dataset concept langs komt -\->
        <xsl:if test="count(preceding::*[@conceptId=$currentConceptId and @value])=0">
            <xsl:choose>
                <!-\- exclude the booleans from occurence testing, does not work when mapped on negationInd -\->
                <!-\- since in the Kernset almost every boolean is mapped on negationInd, we only do value testing... -\->
                <xsl:when test="$valuedomainType='boolean'">
                    <!-\- Do nothing -\->
                </xsl:when>
                <xsl:otherwise>
                    <concept>
                        <xsl:attribute name="multiplicity" select="$amountOccurences"/>
                        <xsl:attribute name="ref" select="$currentConceptId"/>
                        <xsl:value-of select="concat($conceptName, ' moet ', $amountOccurences, ' keer voorkomen.')"/>
                    </concept>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>

        <!-\- Nu hier voor het huidige gevonden concept een value test aanmaken -\->
        <xsl:choose>
            <xsl:when test="@value='*' or substring(@value, 1, 4)='0000' or @value='1970-01-01T00:00:00'">
                <!-\- Does not matter what the value in the instance is, only multiplity test no value test -\->
                <!-\- Do nothing -\->
            </xsl:when>
            <xsl:otherwise>
                <!-\- Voor het huidge gevonden concept (met een waarde dus) een concept element aanmaken voor value test -\->
                <concept>
                    <xsl:attribute name="occurrence" select="$occurrence"/>
                    <xsl:attribute name="ref" select="./@conceptId"/>
                    <!-\- de schematron assert samenstellen afhankelijk van de gevonden attributen -\->
                    <xsl:variable name="assertString">
                        <xsl:choose>
                            <xsl:when test="number($occurrence) = number($occurrence)">
                                <xsl:value-of select="$predicateOrAssert"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-\- er zit een predicate in occurence, check op aanwezigheid van het element -\->
                                <xsl:choose>
                                    <!-\- extra handelingen voor repeterende groep -\->
                                    <xsl:when test="exists(ancestor::uitkomst_per_kind)">
                                        <xsl:variable name="currentBirthDate" select="ancestor::uitkomst_per_kind/baring/demografische_gegevens/geboortedatum/@value"/>
                                        <xsl:variable name="dateTimeValue" select="xs:dateTime($currentBirthDate)"/>
                                        <xsl:variable name="hl7DateTime" select="format-dateTime($dateTimeValue, '[Y0001][M01][D01][H01][m01][s01]')"/>
                                        <xsl:value-of select="concat('.[ancestor::hl7:procedure/hl7:subject/hl7:personalRelationship/hl7:relationshipHolder/hl7:birthTime/@value=''', $hl7DateTime, ''']/.')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'.'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:attribute name="assert" select="$assertString"/>
                    <!-\- Vanaf hier de schematron assert message samenstellen -\->
                    <xsl:if test="string(number($occurrence))!='NaN' and $occurrence &gt; 1">
                        <xsl:value-of select="concat('Voor occurrence ', $occurrence, ' geldt: ')"/>
                    </xsl:if>

                    <!-\- Specifiek voor Perinatale dataset, maak de melding wat vriendelijker voor herhalende groepen -\->
                    <xsl:if test="exists(ancestor::obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap)">
                        <!-\- we zitten in een vorige zwangerschap -\->
                        <xsl:variable name="currentATermeDatum" select="ancestor::obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap/definitieve_a_terme_datum/@value"/>
                        <xsl:value-of select="concat('Voor de zwangerschap met à terme datum ', $currentATermeDatum, ' geldt: ')"/>
                    </xsl:if>
                    <xsl:if test="exists(ancestor::prenatale_controle)">
                        <!-\- we zitten in een prenatale controle -\->
                        <xsl:variable name="currentDatum" select="ancestor::prenatale_controle/datum_controle/@value"/>
                        <xsl:value-of select="concat('Voor de prenatale controle met datum ', $currentDatum, ' geldt: ')"/>
                    </xsl:if>
                    <xsl:if test="exists(ancestor::diagnose)">
                        <!-\- we zitten in een diagnose -\->
                        <xsl:variable name="currentDatum" select="ancestor::diagnose/datum/@value"/>
                        <xsl:value-of select="concat('Voor de diagnose', ' ')"/>
                    </xsl:if>
                    <xsl:if test="exists(ancestor::diagnose) and not(exists(ancestor::obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap))">
                        <!-\- we zitten in een diagnose huidige zwangerschap, die heeft een datum-\->
                        <xsl:variable name="currentDatum" select="ancestor::diagnose/datum/@value"/>
                        <xsl:value-of select="concat('met datum ', $currentDatum, ' geldt: ')"/>
                    </xsl:if>
                    <xsl:if test="exists(ancestor::diagnose) and  exists(ancestor::obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap)">
                        <!-\- we zitten in een diagnose vorige zwangerschap, die heeft geen datum-\->
                        <xsl:value-of select="concat('van deze zwangerschap', ' geldt: ')"/>
                    </xsl:if>
                    <xsl:if test="exists(ancestor::uitkomst_per_kind)">
                        <!-\- we zitten in een uitkomst per kind -\->
                        <xsl:variable name="currentBirthDate" select="ancestor::uitkomst_per_kind/baring/demografische_gegevens/geboortedatum/@value"/>
                        <xsl:value-of select="concat('Voor het kind met geboortedatum ', $currentBirthDate, ' geldt: ')"/>
                    </xsl:if>
                    <xsl:if test="exists(ancestor::diagnose_postpartum)">
                        <!-\- we zitten in een diagnose -\->
                        <xsl:variable name="currentDatum" select="ancestor::diagnose_postpartum/datum/@value"/>
                        <xsl:value-of select="concat('Voor de diagnose postpartum met datum ', $currentDatum, ' geldt: ')"/>
                    </xsl:if>
                    <xsl:choose>
                        <!-\- Ignore time 00:00:00 and treat as a date -\->
                        <xsl:when test="$valuedomainType='date' or ($valuedomainType='datetime' and string-length(@value)=10)  or ($valuedomainType='datetime' and string-length(@value)>10 and substring(@value,12)='00:00:00')">
                            <xsl:variable name="dateValue" select="xs:date(substring(@value,1,10))"/>
                            <xsl:variable name="stringDate" select="format-date($dateValue, '[D1] [MNn] [Y0001]')"/>
                            <xsl:variable name="hl7Date" select="format-date($dateValue, '[Y0001][M01][D01]')"/>
                            <xsl:value-of select="concat('Verwacht is een ',$conceptName, ' met waarde &quot;', $stringDate, '&quot; (',  $hl7Date, ').')"/>
                        </xsl:when>
                        <xsl:when test="$valuedomainType='datetime' and string-length(@value)>10">
                            <xsl:variable name="dateTimeValue" select="xs:dateTime(@value)"/>
                            <xsl:variable name="stringDateTime" select="format-dateTime($dateTimeValue, '[D1] [MNn] [Y0001] [H1]:[m01]:[s01]')"/>
                            <xsl:variable name="hl7DateTime" select="format-dateTime($dateTimeValue, '[Y0001][M01][D01][H01][m01][s01]')"/>
                            <xsl:value-of select="concat('Verwacht is een ',$conceptName, ' met waarde &quot;', $stringDateTime, '&quot; (',  $hl7DateTime, ').')"/>
                        </xsl:when>
                        <xsl:when test="$valuedomainType='code'">
                            <xsl:variable name="currentCode" select="@code"/>
                            <xsl:variable name="codeDisplayName" select="$adaReleaseFile/ada/transactionDatasets[1]/dataset[1]//concept[@id=$currentConceptId]/valueSet[1]/conceptList[1]/*[@code=$currentCode]/name[1]/text()"/>
                            <xsl:value-of select="concat('Verwacht is een ', $conceptName, ' met waarde &quot;', $codeDisplayName, '&quot; (code: ', @code, ').')"/>
                        </xsl:when>
                        <xsl:when test="exists(@unit)">
                            <xsl:value-of select="concat('Verwacht is een ',$conceptName, ' met waarde &quot;', @value, ' ', @unit, '&quot;.')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="concat('Verwacht is een ',$conceptName, ' met waarde &quot;', @value, '&quot;.')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </concept>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates/>
    </xsl:template>

    <!-\- Multiplicity 0 testen -\->
    <xsl:template match="//*[@transactionRef]//*[@hidden='true']">
        <xsl:variable name="currentConceptId" select="@conceptId"/>
        <!-\- Alleen als er geen enkel element bestaat met dezelfde id dat wél een value heeft of child elements -\->

        <xsl:if test="not(//*[@transactionRef]//*[@conceptId=$currentConceptId][@value] or //*[@transactionRef]//*[@conceptId=$currentConceptId]/*)">
            <!-\- naam, concepttype (item of groep) en valuedomain type ophalen -\->
            <xsl:variable name="conceptName" select="$adaReleaseFile/ada/transactionDatasets[1]/dataset[1]//concept[@id=$currentConceptId]/name[@language='nl-NL']/text()"/>
            <xsl:variable name="conceptType" select="$adaReleaseFile/ada/transactionDatasets[1]/dataset[1]//concept[@id=$currentConceptId]/@type"/>
            <!-\- Alleen multiplicity 0 testen op items, niet op groepen -\->
            <xsl:if test="$conceptType='item'">
                <!-\- Groepen gaat te vaak mis, omdat deze vaak anders in HL7 message terecht komen dan in dataset gemodelleerd, denk aan de negationInd... -\->
                <!-\- Dus als multiplicity 0 testen op groepen meerwaarde heeft, dan handmatig toetsen -\->

                <!-\- OK, voor dit concept moeten we multiplicity 0 testen -\->
                <xsl:variable name="valuedomainType" select="$adaReleaseFile/ada/transactionDatasets[1]/dataset[1]//concept[@id=$currentConceptId]/valueDomain/@type"/>
                <!-\- Voor het huidge gevonden concept (met hidden true dus) een concept element aanmaken voor multiplicity test -\->
                <!-\- Alléén de eerste keer dat dit dataset concept langs komt -\->
                <xsl:if test="count(preceding::*[@conceptId=$currentConceptId and @hidden='true'])=0">
                    <concept>
                        <xsl:attribute name="multiplicity" select="0"/>
                        <xsl:attribute name="ref" select="$currentConceptId"/>
                        <xsl:value-of select="concat($conceptName, ' mag niet voorkomen.')"/>
                    </concept>
                </xsl:if>
            </xsl:if>
            <!-\- Voor groepen: test op onderliggende items -\->
            <xsl:if test="$conceptType ='group'">
                <!-\- Alléén de eerste keer dat dit dataset concept langs komt -\->
                <xsl:if test="count(preceding::*[@conceptId=$currentConceptId])=0">
                    <!-\- Voor ieder onderliggend item in deze groep, gevonden in ada release file (ook als er nog groepen tussen zitten) -\->
                    <xsl:for-each select="$adaReleaseFile/ada/transactionDatasets[1]/dataset[1]//concept[@id=$currentConceptId]//concept[@type='item']">
                        <xsl:variable name="currentSubConceptId" select="./@id"/>
                        <xsl:variable name="subConceptName" select="./name[@language='nl-NL']/text()"/>
                        <concept>
                            <xsl:attribute name="multiplicity" select="0"/>
                            <xsl:attribute name="ref" select="$currentSubConceptId"/>
                            <xsl:value-of select="concat('De groep ', $conceptName, ' mag niet voorkomen, en dus het onderliggende concept: ', $subConceptName, ' ook niet.')"/>
                        </concept>
                    </xsl:for-each>
                </xsl:if>
            </xsl:if>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>

    <!-\- template for a part of schematronString for assert or predicate -\->
    <xsl:template name="makeSchematronString">
        <xsl:param name="currentConcept"/>
        <xsl:param name="valuedomainType"/>

        <xsl:choose>
            <xsl:when test="$valuedomainType='identifier'">
                <xsl:value-of select="concat('@extension=''', @value, '''')"/>
            </xsl:when>
            <xsl:when test="$valuedomainType='code'">
                <xsl:choose>
                    <xsl:when test="@codeSystem='2.16.840.1.113883.5.1008'">
                        <!-\- Yak! a nullFlavor -\->
                        <xsl:value-of select="concat('(@nullFlavor=''', @code, ''')')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('(@code=''', @code, '''', ' and @codeSystem=''', @codeSystem, ''')')"/>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:when>
            <xsl:when test="$valuedomainType='quantity' and @unit">
                <xsl:variable name="unit">
                    <xsl:choose>
                        <xsl:when test="@unit='gram'">
                            <xsl:value-of select="'g'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@unit"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="concat('(@value=''', @value, '''', ' and @unit=''', $unit, ''')')"/>
            </xsl:when>
            <xsl:when test="$valuedomainType='count' or ($valuedomainType='quantity' and not(@unit))">
                <xsl:value-of select="concat('@value=''', @value, '''')"/>
            </xsl:when>
            <!-\- also treat time 00:00:00 as just a date! -\->
            <xsl:when test="$valuedomainType='date' or ($valuedomainType='datetime' and string-length(@value)=10) or ($valuedomainType='datetime' and string-length(@value)>10 and substring(@value,12)='00:00:00')">
                <xsl:variable name="dateValue" select="xs:date(substring(@value, 1, 10))"/>
                <xsl:variable name="hl7Date" select="format-date($dateValue, '[Y0001][M01][D01]')"/>
                <!-\- only check on date part of the value string - so ignore the time (if applicable) -\->
                <xsl:value-of select="concat('substring(@value,1,8)=''', $hl7Date, '''')"/>
            </xsl:when>
            <xsl:when test="$valuedomainType='datetime' and string-length(@value)>10">
                <xsl:variable name="dateTimeValue" select="xs:dateTime(@value)"/>
                <xsl:variable name="hl7DateTime" select="format-dateTime($dateTimeValue, '[Y0001][M01][D01][H01][m01][s01]')"/>
                <xsl:value-of select="concat('@value=''', $hl7DateTime, '''')"/>
            </xsl:when>
            <xsl:when test="$valuedomainType='boolean'">
                <xsl:choose>
                    <xsl:when test="boolean(@value='false')">
                        <!-\- waarde is false: value = false of negationInd=true -\->
                        <xsl:value-of select="'(@value=''false'' or @negationInd=''true'')'"/>
                    </xsl:when>
                    <xsl:when test="exists(@nullFlavor) or (@value!='true' and @value!='false')">
                        <!-\- Nog uitwerken, wanneer onbekend wordt doorgegeven voor de boolean -\->
                        <xsl:value-of select="concat('(@nullFlavor=''', @value, ''' or @negationInd=''true'')')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-\- value = true -\->
                        <xsl:value-of select="'(@value=''true'' or (not(exists(@value)) and (@negationInd=''false'' or not(@negationInd))))'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$currentConcept/name()='postcode' or $currentConcept/name()='overige_aandoening'">
                <!-\- Deze komen terecht als text in xml element -\->
                <xsl:value-of select="concat('./text()=''', @value, '''')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('@value=''', @value, '''')"/>
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>
-->
</xsl:stylesheet>
