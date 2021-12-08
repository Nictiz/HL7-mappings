<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../util/constants.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:variable name="mapRedenwijzigenstaken" as="element()+">
        <map xmlns="">
            <mp907 code="5" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Geen of onvoldoende effect" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="58848006" codeSystem="{$oidSNOMEDCT}" displayName="Gebrek aan geneesmiddeleffect" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="58848006" codeSystem="{$oidSNOMEDCT}" displayName="Gebrek aan geneesmiddeleffect" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="6" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Te sterk effect" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112251000146103" codeSystem="{$oidSNOMEDCT}" displayName="Te sterk effect van medicatie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112251000146103" codeSystem="{$oidSNOMEDCT}" displayName="Te sterk effect van medicatie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="8" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Toedieningsweg voldoet niet" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112191000146101" codeSystem="{$oidSNOMEDCT}" displayName="Medicatietoedieningsweg voldoet niet" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112191000146101" codeSystem="{$oidSNOMEDCT}" displayName="Medicatietoedieningsweg voldoet niet" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="9" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Indicatie vervallen" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="183966005" codeSystem="{$oidSNOMEDCT}" displayName="Drug treatment not indicated (situation)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="183966005" codeSystem="{$oidSNOMEDCT}" displayName="Drug treatment not indicated (situation)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="10" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Beleidswijziging" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112751000146109" codeSystem="{$oidSNOMEDCT}" displayName="Beleidswijziging" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112751000146109" codeSystem="{$oidSNOMEDCT}" displayName="Beleidswijziging" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="12" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Wens patiënt" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="184003006" codeSystem="{$oidSNOMEDCT}" displayName="Patient requested treatment (situation)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="184003006" codeSystem="{$oidSNOMEDCT}" displayName="Patient requested treatment (situation)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <!-- dit is alleen bij andere bouwstenen dan TA/MA -->
            <mp907 code="13" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Volgens afspraak" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112211000146102" codeSystem="{$oidSNOMEDCT}" displayName="Behandeling volgens afspraak met patiënt" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112211000146102" codeSystem="{$oidSNOMEDCT}" displayName="Behandeling volgens afspraak met patiënt" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="14" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Hervatten beleid vorige voorschrijver" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="112261000146100" codeSystem="{$oidSNOMEDCT}" displayName="Hervatten van beleid van vorige voorschrijver" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="112261000146100" codeSystem="{$oidSNOMEDCT}" displayName="Hervatten van beleid van vorige voorschrijver" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="15" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Geplande procedure" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="405613005" codeSystem="{$oidSNOMEDCT}" displayName="Verrichting gepland" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="405613005" codeSystem="{$oidSNOMEDCT}" displayName="Verrichting gepland" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Allergie of non-allergische overgevoeligheid of bijwerking" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Allergie of non-allergische overgevoeligheid of bijwerking" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp920 code="473010000" codeSystem="{$oidSNOMEDCT}" displayName="Toestand van overgevoeligheid" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
        <map xmlns="">
            <mp907 code="17" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Correctie" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp910 code="17" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.2" displayName="Correctie" codeSystemName="Reden Medicatieafspraak of -gebruik"/>
            <mp920 code="62691000146103" codeSystem="{$oidSNOMEDCT}" displayName="Foutieve registratie" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
        </map>
    </xsl:variable>

    <xsl:variable name="mapContactpersoonRol" as="element()+">
        <map xmlns="">
            <mp907 code="407542009" codeSystem="{$oidSNOMEDCT}" displayName="Informal carer (person)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp910 code="407542009" codeSystem="{$oidSNOMEDCT}" displayName="Informal carer (person)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <mp920 code="100001" codeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.23.1" displayName="Mantelzorger" codeSystemName="ExtraRolcodes"/>
        </map>
        <map xmlns="">
            <mp907 code="2" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.4" displayName="Thuiszorg" codeSystemName="Medicatieproces rollen"/>
            <mp910 code="768730001" codeSystem="{$oidSNOMEDCT}" displayName="Verzorgingshulp (beroep)" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
            <!-- There is no role code for thuiszorg in MP 920 it is regarded to be a healthcare professional, 
                 see issue https://bits.nictiz.nl/browse/ZIB-1075, custom handling must be done -->
         </map>
       </xsl:variable>
    

</xsl:stylesheet>
