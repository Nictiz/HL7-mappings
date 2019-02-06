<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> ahenket</xd:p>
            <xd:p>Contains any constants we might need. Anticipated are OIDs/URIs, ConceptMaps, ...</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="ada-unit-second" select="('seconde', 's', 'sec', 'second')"/>
    <xsl:variable name="ada-unit-minute" select="('minuut', 'min', 'minute')"/>
    <xsl:variable name="ada-unit-hour" select="('uur', 'h', 'hour')"/>
    <xsl:variable name="ada-unit-day" select="('dag', 'd', 'day')"/>
    <xsl:variable name="ada-unit-week" select="('week', 'wk')"/>
    <xsl:variable name="ada-unit-month" select="('maand', 'mo', 'month')"/>
    <xsl:variable name="ada-unit-year" select="('jaar', 'a', 'year')"/>

    <xsl:variable name="ada-unit-kilo" select="('kilo', 'kg', 'kilogram')"/>
    <xsl:variable name="ada-unit-gram" select="('gram', 'g', 'gr')"/>
    <xsl:variable name="ada-unit-cm" select="('centimeter', 'cm')"/>
    <xsl:variable name="ada-unit-m" select="('meter', 'm')"/>

    <xsl:variable name="oidAGB">2.16.840.1.113883.2.4.6.1</xsl:variable>
    <xsl:variable name="oidAGBSpecialismen">2.16.840.1.113883.2.4.6.7</xsl:variable>
    <xsl:variable name="oidAORTAApplicatieID">2.16.840.1.113883.2.4.6.6</xsl:variable>
    <xsl:variable name="oidAORTAProfileID">2.16.840.1.113883.2.4.3.11.1</xsl:variable>
    <xsl:variable name="oidBIGregister">2.16.528.1.1007.5.1</xsl:variable>
    <xsl:variable name="oidBurgerservicenummer">2.16.840.1.113883.2.4.6.3</xsl:variable>
    <xsl:variable name="oidGStandaardGPK">2.16.840.1.113883.2.4.4.1</xsl:variable>
    <xsl:variable name="oidGStandaardPRK">2.16.840.1.113883.2.4.4.10</xsl:variable>
    <xsl:variable name="oidGStandaardHPK">2.16.840.1.113883.2.4.4.7</xsl:variable>
    <xsl:variable name="oidGStandaardSSK">2.16.840.1.113883.2.4.4.1.725</xsl:variable>
    <xsl:variable name="oidGStandaardSNK">2.16.840.1.113883.2.4.4.1.750</xsl:variable>
    <xsl:variable name="oidGStandaardTH122OngewensteGroepen">2.16.840.1.113883.2.4.4.1.902.122</xsl:variable>
    <xsl:variable name="oidGStandaardZInummer">2.16.840.1.113883.2.4.4.8</xsl:variable>
    <xsl:variable name="oidGStandaardTH007Toedieningswegen">2.16.840.1.113883.2.4.4.9</xsl:variable>
    <xsl:variable name="oidGStandaardBST361">2.16.840.1.113883.2.4.4.1.361</xsl:variable>
    <xsl:variable name="oidGStandaardBST902THES2">2.16.840.1.113883.2.4.4.1.900.2</xsl:variable>
    <xsl:variable name="oidGStandaardTH040ContraIndicaties">2.16.840.1.113883.2.4.4.1.902.40</xsl:variable>
    <xsl:variable name="oidHL7AcknowledgementDetailCode">2.16.840.1.113883.5.1100</xsl:variable>
    <xsl:variable name="oidHL7ActCode">2.16.840.1.113883.5.4</xsl:variable>
    <xsl:variable name="oidHL7ActStatus">2.16.840.1.113883.5.14</xsl:variable>
    <xsl:variable name="oidHL7AddressUse">2.16.840.1.113883.5.1119</xsl:variable>
    <xsl:variable name="oidHL7AdministrativeGender">2.16.840.1.113883.5.1</xsl:variable>
    <xsl:variable name="oidHL7InteractionID">2.16.840.1.113883.1.6</xsl:variable>
    <xsl:variable name="oidHL7NullFlavor">2.16.840.1.113883.5.1008</xsl:variable>
    <xsl:variable name="oidHL7ObservationInterpretation">2.16.840.1.113883.5.83</xsl:variable>
    <xsl:variable name="oidHL7ParticipationType">2.16.840.1.113883.5.90</xsl:variable>
    <xsl:variable name="oidHL7RoleCode">2.16.840.1.113883.5.111</xsl:variable>
    <xsl:variable name="oidICPC1NL">2.16.840.1.113883.2.4.4.31.1</xsl:variable>
    <xsl:variable name="oidJournaalregeltypen">2.16.840.1.113883.2.4.4.32.2</xsl:variable>
    <xsl:variable name="oidLOINC">2.16.840.1.113883.6.1</xsl:variable>
    <xsl:variable name="oidNHGTabel14Contactwijze">2.16.840.1.113883.2.4.4.30.14</xsl:variable>
    <xsl:variable name="oidNHGTabel15Verrichtingen">2.16.840.1.113883.2.4.4.30.15</xsl:variable>
    <xsl:variable name="oidNHGTabel25BCodesNumeriek">2.16.840.1.113883.2.4.4.5</xsl:variable>
    <xsl:variable name="oidNHGTabel45DiagnBepal">2.16.840.1.113883.2.4.4.30.45</xsl:variable>
    <xsl:variable name="oidNHGTabel56Profylaxe">2.16.840.1.113883.2.4.4.30.56</xsl:variable>
    <xsl:variable name="oidSBVZOrganization">2.16.528.1.1007</xsl:variable>
    <xsl:variable name="oidSBVZSystems">2.16.528.1.1007.4</xsl:variable>
    <xsl:variable name="oidUCUM">2.16.840.1.113883.6.8</xsl:variable>
    <xsl:variable name="oidURAOrganizations">2.16.528.1.1007.3.3</xsl:variable>
    <xsl:variable name="oidUZIPersons">2.16.528.1.1007.3.1</xsl:variable>
    <xsl:variable name="oidUZISystems">2.16.528.1.1007.3.2</xsl:variable>
    <xsl:variable name="oidUZIRoleCode">2.16.840.1.113883.2.4.15.111</xsl:variable>
    <xsl:variable name="oidSNOMEDCT">2.16.840.1.113883.6.96</xsl:variable>
    
    <xsl:variable name="NHGZoNodigNumeriek">1137</xsl:variable>

    <xsl:variable name="hl7NullFlavorMap" as="element()+">
        <!-- bron: https://www.hl7.nl/wiki/index.php/Vocabulaire.NullFlavor -->
        <map hl7NullFlavor="NI" displayName="geen informatie"/>
        <map hl7NullFlavor="INV" displayName="ongeldig"/>
        <map hl7NullFlavor="DER" displayName="afgeleid"/>
        <!-- er staat 'anders' in de bron, maar 'overig' is een logischere vertaling van other bij valuesets... -->
        <map hl7NullFlavor="OTH" displayName="overig"/>
        <map hl7NullFlavor="NINF" displayName="negatief oneindig"/>
        <map hl7NullFlavor="PINF" displayName="positief oneindig"/>
        <map hl7NullFlavor="UNC" displayName="niet-gecodeerd"/>
        <map hl7NullFlavor="MSK" displayName="gemaskeerd"/>
        <map hl7NullFlavor="NA" displayName="niet van toepassing"/>
        <map hl7NullFlavor="UNK" displayName="onbekend"/>
        <map hl7NullFlavor="ASKU" displayName="gevraagd maar onbekend"/>
        <map hl7NullFlavor="NAV" displayName="tijdelijk niet beschikbaar"/>
        <map hl7NullFlavor="NASK" displayName="niet gevraagd"/>
        <!-- QS wordt gebruikt bij magistrale bereidingen: ingrediënten voor geneesmiddelen, betekent dan eigenlijk 'aanvullen tot' -->
        <map hl7NullFlavor="QS" displayName="voldoende hoeveelheid"/>
        <map hl7NullFlavor="TRC" displayName="spoor"/>
    </xsl:variable>

    <xsl:variable name="oidMap" as="element()+">
        <map oid="{$oidAGB}" uri="http://fhir.nl/fhir/NamingSystem/agb-z" displayName="AGB-Z"/>
        <map oid="{$oidBurgerservicenummer}" uri="http://fhir.nl/fhir/NamingSystem/bsn" displayName="BSN"/>
        <map oid="{$oidGStandaardHPK}" displayName="G-Standaard HPK"/>
        <map oid="{$oidGStandaardPRK}" displayName="G-Standaard PRK"/>
        <map oid="{$oidGStandaardGPK}" displayName="G-Standaard GPK"/>
        <map oid="{$oidGStandaardSNK}" displayName="G-Standaard SNK"/>
        <map oid="{$oidGStandaardSSK}" displayName="G-Standaard SSK"/>
        <map oid="{$oidGStandaardTH007Toedieningswegen}" displayName="G-Standaard TH007 Toedieningswegen"/>
        <map oid="{$oidGStandaardTH040ContraIndicaties}" displayName="G-Standaard TH040 Contraindicaties"/>
        <map oid="{$oidGStandaardTH122OngewensteGroepen}" displayName="G-Standaard TH122 Ongewenste groepen"/>
        <map oid="{$oidGStandaardBST361}" displayName="G-Standaard Bestand 361 a-tabel (eenheid gebruiksadvies)"/>
        <map oid="{$oidGStandaardBST902THES2}" displayName="G-Standaard Bestand 902 Thesaurus 2"/>
        <map oid="{$oidHL7ActCode}" uri="http://hl7.org/fhir/v3/ActCode" displayName="HL7 ActCode"/>
        <map oid="{$oidHL7ActStatus}" uri="http://hl7.org/fhir/v3/ActStatus" displayName="HL7 ActStatus"/>
        <map oid="{$oidHL7AcknowledgementDetailCode}" uri="http://hl7.org/fhir/v3/AcknowledgementDetailCode" displayName="HL7 AcknowledgementDetailCode"/>
        <map oid="{$oidHL7AdministrativeGender}" uri="http://hl7.org/fhir/v3/AdministrativeGender" displayName="HL7 AdministrativeGender"/>
        <map oid="{$oidHL7ObservationInterpretation}" uri="http://hl7.org/fhir/v3/ObservationInterpretation" displayName="HL7 ObservationInterpretation"/>
        <map oid="{$oidHL7ParticipationType}" uri="http://hl7.org/fhir/v3/ParticipationType" displayName="HL7 ParticipationType"/>
        <map oid="{$oidHL7NullFlavor}" uri="http://hl7.org/fhir/v3/NullFlavor" displayName="HL7 NullFlavor"/>
        <map oid="{$oidHL7AddressUse}" uri="http://hl7.org/fhir/v3/AddressUse" displayName="HL7 AddressUse"/>
        <map oid="{$oidHL7RoleCode}" uri="http://hl7.org/fhir/v3/RoleCode" displayName="HL7 RoleCode"/>
        <map oid="{$oidICPC1NL}" uri="http://hl7.org/fhir/sid/icpc-1-nl" displayName="ICPC-1NL"/>
        <map oid="{$oidJournaalregeltypen}" uri="http://fhir.nl/fhir/NamingSystem/journaalregeltypen" displayName="Journaalregeltypen"/>
        <map oid="{$oidLOINC}" uri="http://loinc.org" displayName="LOINC"/>
        <map oid="{$oidNHGTabel14Contactwijze}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-14-contactwijze" displayName="NHG Tabel 14 Contactwijze"/>
        <map oid="{$oidNHGTabel15Verrichtingen}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-15-verrichtingen" displayName="NHG Tabel 15 Verrichtingen"/>
        <map oid="{$oidNHGTabel25BCodesNumeriek}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-25-gebruiksvoorschrift#aanvullend-numeriek" displayName="NHG Tabel 25 B Codes (numeriek)"/>
        <map oid="{$oidNHGTabel45DiagnBepal}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-45-diagnostische-bepalingen" displayName="NHG Tabel 45 Diagnostische bepalingen"/>
        <map oid="{$oidNHGTabel56Profylaxe}" uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-56-profylaxe-en-voorzorg" displayName="NHG Tabel 56 Profylaxe en voorzorg"/>
        <map oid="{$oidSNOMEDCT}" uri="http://snomed.info/sct" displayName="SNOMED CT"/>
        <map oid="{$oidUCUM}" uri="http://unitsofmeasure.org" displayName="UCUM"/>
        <map oid="{$oidURAOrganizations}" uri="http://fhir.nl/fhir/NamingSystem/ura" displayName="URA"/>
        <map oid="{$oidUZIPersons}" uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-pers" displayName="UZI Personen"/>
        <map oid="{$oidUZIRoleCode}" uri="http://fhir.nl/fhir/NamingSystem/uzi-rolcode" displayName="UZI Rolcodes"/>
        <map oid="{$oidUZISystems}" uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-sys" displayName="UZI Systemen"/>
        <map uri="http://hl7.org/fhir/v2/0078" displayName="HL7 Version 2 Table 0078 v2 Interpretation Codes"/>
    </xsl:variable>

    <xsl:variable name="OIDpattern" select="'^[0-2](\.(0|[1-9]\d*))*$'"/>
    <xsl:variable name="UUIDpattern" select="'^[A-Fa-f\d]{8}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{12}$'"/>

</xsl:stylesheet>
