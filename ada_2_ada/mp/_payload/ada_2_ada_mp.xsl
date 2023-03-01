<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:nfa2a="http://www.nictiz.nl/functions/ada2ada" xmlns:uuid="http://www.uuid.org" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../../util/constants.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>


    <xsl:variable name="mapContactpersoonRol" as="element()+">
        <map xmlns="" rol="mantelzorger">
            <mp907 code="407542009" codeSystem="{$oidSNOMEDCT}" displayName="Informal carer (person)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp910 code="407542009" codeSystem="{$oidSNOMEDCT}" displayName="Informal carer (person)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="100001" codeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.23.1" displayName="Mantelzorger" codeSystemName="ExtraRolcodes"/>
            <mp930 code="100001" codeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.23.1" displayName="Mantelzorger" codeSystemName="ExtraRolcodes"/>
        </map>
        <map xmlns="" rol="thuiszorg">
            <mp907 code="2" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.4" displayName="Thuiszorg" codeSystemName="Medicatieproces rollen"/>
            <mp910 code="768730001" codeSystem="{$oidSNOMEDCT}" displayName="Verzorgingshulp (beroep)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <!-- There is no role code for thuiszorg in MP 920 it is regarded to be a healthcare professional, 
                 see issue https://bits.nictiz.nl/browse/ZIB-1075, custom handling must be done -->
        </map>
    </xsl:variable>

    <xsl:variable name="mapRedenwijzigenstaken" as="element()+">
        <map xmlns="">
            <mp907 code="5" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Geen of onvoldoende effect" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="58848006" codeSystem="{$oidSNOMEDCT}" displayName="gebrek aan geneesmiddeleffect" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="58848006" codeSystem="{$oidSNOMEDCT}" displayName="gebrek aan geneesmiddeleffect" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="58848006" codeSystem="{$oidSNOMEDCT}" displayName="gebrek aan geneesmiddeleffect" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="6" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Te sterk effect" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112251000146103" codeSystem="{$oidSNOMEDCT}" displayName="te sterk effect van medicatie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112251000146103" codeSystem="{$oidSNOMEDCT}" displayName="te sterk effect van medicatie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="112251000146103" codeSystem="{$oidSNOMEDCT}" displayName="te sterk effect van medicatie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>        </map>
        <map xmlns="">
            <mp907 code="8" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Toedieningsweg voldoet niet" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112191000146101" codeSystem="{$oidSNOMEDCT}" displayName="medicatietoedieningsweg voldoet niet" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112191000146101" codeSystem="{$oidSNOMEDCT}" displayName="medicatietoedieningsweg voldoet niet" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="112191000146101" codeSystem="{$oidSNOMEDCT}" displayName="medicatietoedieningsweg voldoet niet" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="9" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Indicatie vervallen" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="183966005" codeSystem="{$oidSNOMEDCT}" displayName="geen indicatie voor medicamenteuze behandeling" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="183966005" codeSystem="{$oidSNOMEDCT}" displayName="geen indicatie voor medicamenteuze behandeling" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="183966005" codeSystem="{$oidSNOMEDCT}" displayName="geen indicatie voor medicamenteuze behandeling" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="10" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Beleidswijziging" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112751000146109" codeSystem="{$oidSNOMEDCT}" displayName="medicatiebeleid veranderd" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112751000146109" codeSystem="{$oidSNOMEDCT}" displayName="medicatiebeleid veranderd" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="112751000146109" codeSystem="{$oidSNOMEDCT}" displayName="medicatiebeleid veranderd" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="12" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Wens patiënt" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="184003006" codeSystem="{$oidSNOMEDCT}" displayName="verzoek van zorgafnemer om behandeling te wijzigen" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="184003006" codeSystem="{$oidSNOMEDCT}" displayName="verzoek van zorgafnemer om behandeling te wijzigen" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="159711000146106" codeSystem="{$oidSNOMEDCT}" displayName="verzoek van zorgafnemer om behandeling te wijzigen" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <!-- dit is alleen bij andere bouwstenen dan TA/MA -->
            <mp907 code="13" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Volgens afspraak" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112211000146102" codeSystem="{$oidSNOMEDCT}" displayName="behandeling volgens afspraak met patiënt" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112211000146102" codeSystem="{$oidSNOMEDCT}" displayName="behandeling volgens afspraak met patiënt" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="112211000146102" codeSystem="{$oidSNOMEDCT}" displayName="behandeling volgens afspraak met patiënt" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="14" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Hervatten beleid vorige voorschrijver" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112261000146100" codeSystem="{$oidSNOMEDCT}" displayName="hervatten van beleid van vorige voorschrijver" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112261000146100" codeSystem="{$oidSNOMEDCT}" displayName="hervatten van beleid van vorige voorschrijver" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="112261000146100" codeSystem="{$oidSNOMEDCT}" displayName="hervatten van beleid van vorige voorschrijver" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="15" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Geplande procedure" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="405613005" codeSystem="{$oidSNOMEDCT}" displayName="verrichting gepland" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="405613005" codeSystem="{$oidSNOMEDCT}" displayName="verrichting gepland" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="405613005" codeSystem="{$oidSNOMEDCT}" displayName="verrichting gepland" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Allergie of non-allergische overgevoeligheid of bijwerking" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Allergie of non-allergische overgevoeligheid of bijwerking" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp920 code="62014003" codeSystem="{$oidSNOMEDCT}" displayName="ongewenste reactie op medicatie en/of drugs" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="62014003" codeSystem="{$oidSNOMEDCT}" displayName="ongewenste reactie op medicatie en/of drugs" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="17" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Correctie" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="17" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Correctie" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp920 code="159691000146109" codeSystem="{$oidSNOMEDCT}" displayName="foutieve registratie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp930 code="159691000146109" codeSystem="{$oidSNOMEDCT}" displayName="foutieve registratie van medicatie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
    </xsl:variable>

    <xsl:variable name="mapTransaction" as="element()+">
        <map xmlns="" usecase="beschikbaarstellen_medicatiegegevens">
            <mp907 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.102" transactionEffectiveDate="2016-03-23T16:32:43" formName="uitwisselen_medicatiegegevens"/>
            <mp920 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.301" transactionEffectiveDate="2022-02-07T00:00:00" formName="medicatiegegevens"/>
            <mp930 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.374" transactionEffectiveDate="2022-06-30T00:00:00" formName="medicatiegegevens"/>
        </map>
        <map xmlns="" usecase="sturen_medicatievoorschrift">
            <mp907 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.95" transactionEffectiveDate="2015-12-01T10:32:15" formName="sturen_voorschrift"/>
            <mp920 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.322" transactionEffectiveDate="2022-02-07T00:00:00" formName="sturen_medicatievoorschrift"/>
            <mp930 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.395" transactionEffectiveDate="2022-06-30T00:00:00" formName="sturen_medicatievoorschrift"/>
        </map>
        <map xmlns="" usecase="sturen_afhandeling_medicatievoorschrift">
            <mp907 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.131" transactionEffectiveDate="2016-07-12T11:39:14" formName="afhandelen_voorschrift"/>
            <mp920 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.334" transactionEffectiveDate="2022-02-07T00:00:00" formName="afhandelen_medicatievoorschrift"/>
            <mp930 transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.407" transactionEffectiveDate="2022-06-30T00:00:00" formName="afhandelen_medicatievoorschrift"/>
        </map>
    </xsl:variable>

    <xd:doc>
        <xd:desc>helper function to make a string out of a code ada element</xd:desc>
        <xd:param name="in">the code ada element</xd:param>
    </xd:doc>
    <xsl:function name="nfa2a:code-2-string" as="xs:string?">
        <xsl:param name="in" as="element()?"/>
        <xsl:for-each select="$in">
            <xsl:choose>
                <xsl:when test="string-length(@originalText) gt 0">
                    <xsl:value-of select="@originalText"/>
                </xsl:when>
                <xsl:when test="string-length(@displayName) gt 0">
                    <xsl:value-of select="@displayName"/>
                </xsl:when>
                <xsl:when test="string-length(@code) gt 0">
                    <xsl:value-of select="string-join(@code | @codeSystem, '|')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@value"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

</xsl:stylesheet>
