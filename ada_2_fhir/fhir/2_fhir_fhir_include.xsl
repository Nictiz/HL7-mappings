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
<!-- Templates of the form 'make<datatype/flavor>Value' correspond to ART-DECOR supported datatypes / HL7 V3 Datatypes R1 -->
<xsl:stylesheet xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--    <xsl:include href="utils.xsl"/>-->
    <xsl:variable name="ada-unit-seconde" select="('seconde', 's', 'sec', 'second')"/>
    <xsl:variable name="ada-unit-minute" select="('minuut', 'min', 'minute')"/>
    <xsl:variable name="ada-unit-hour" select="('uur', 'h', 'hour')"/>
    <xsl:variable name="ada-unit-day" select="('dag', 'd', 'day')"/>
    <xsl:variable name="ada-unit-week" select="('week', 'wk')"/>
    <xsl:variable name="ada-unit-month" select="('maand', 'mo', 'month')"/>
    <xsl:variable name="ada-unit-year" select="('jaar', 'a', 'year')"/>
    <xsl:variable name="oidNullFlavor">2.16.840.1.113883.5.1008</xsl:variable>

    <xsl:variable name="oidAGB">2.16.840.1.113883.2.4.6.1</xsl:variable>
    <xsl:variable name="oidBurgerservicenummer">2.16.840.1.113883.2.4.6.3</xsl:variable>
    <xsl:variable name="oidGStandaardGPK">2.16.840.1.113883.2.4.4.1</xsl:variable>
    <xsl:variable name="oidGStandaardHPK">2.16.840.1.113883.2.4.4.7</xsl:variable>
    <xsl:variable name="oidGStandaardPRK">2.16.840.1.113883.2.4.4.10</xsl:variable>
    <xsl:variable name="oidGStandaardTH007Toedieningswegen">2.16.840.1.113883.2.4.4.9</xsl:variable>
    <xsl:variable name="oidGStandaardBST361">2.16.840.1.113883.2.4.4.1.361</xsl:variable>
    <xsl:variable name="oidGStandaardBST902THES2">2.16.840.1.113883.2.4.4.1.900.2</xsl:variable>
    <xsl:variable name="oidGStandaardTH040ContraIndicaties">2.16.840.1.113883.2.4.4.1.902.40</xsl:variable>
    <xsl:variable name="oidHL7ActCode">2.16.840.1.113883.5.4</xsl:variable>
    <xsl:variable name="oidHL7ObservationInterpretation">2.16.840.1.113883.5.83</xsl:variable>
    <xsl:variable name="oidHL7AcknowledgementDetailCode">2.16.840.1.113883.5.1100</xsl:variable>
    <xsl:variable name="oidICPC1NL">2.16.840.1.113883.2.4.4.31.1</xsl:variable>
    <xsl:variable name="oidJournaalregeltypen">2.16.840.1.113883.2.4.4.32.2</xsl:variable>
    <xsl:variable name="oidLOINC">2.16.840.1.113883.6.1</xsl:variable>
    <xsl:variable name="oidNHGTabel14Contactwijze">2.16.840.1.113883.2.4.4.30.14</xsl:variable>
    <xsl:variable name="oidNHGTabel15Verrichtingen">2.16.840.1.113883.2.4.4.30.15</xsl:variable>
    <xsl:variable name="oidNHGTabel25BCodesNumeriek">2.16.840.1.113883.2.4.4.5</xsl:variable>
    <xsl:variable name="oidNHGTabel45DiagnBepal">2.16.840.1.113883.2.4.4.30.45</xsl:variable>
    <xsl:variable name="oidNHGTabel56Profylaxe">2.16.840.1.113883.2.4.4.30.56</xsl:variable>
    <xsl:variable name="oidUCUM">2.16.840.1.113883.6.8</xsl:variable>
    <xsl:variable name="oidURAOrganizations">2.16.528.1.1007.3.3</xsl:variable>
    <xsl:variable name="oidUZIPersons">2.16.528.1.1007.3.1</xsl:variable>
    <xsl:variable name="oidUZISystems">2.16.528.1.1007.3.2</xsl:variable>
    <xsl:variable name="oidUZIRoleCode">2.16.840.1.113883.2.4.15.111</xsl:variable>
    <xsl:variable name="oidSNOMEDCT">2.16.840.1.113883.6.96</xsl:variable>
    <xsl:variable name="oidMap" as="element()+">
        <map oid="{$oidAGB}" uri="http://fhir.nl/fhir/NamingSystem/agb-z" displayName="AGB-Z"/>
        <map oid="{$oidBurgerservicenummer}" uri="http://fhir.nl/fhir/NamingSystem/bsn" displayName="BSN"/>
        <map oid="{$oidHL7ActCode}" uri="http://hl7.org/fhir/v3/ActCode" displayName="HL7 ActCode"/>
        <map oid="{$oidHL7AcknowledgementDetailCode}" uri="http://hl7.org/fhir/v3/AcknowledgementDetailCode" displayName="HL7 AcknowledgementDetailCode"/>
        <map oid="{$oidGStandaardHPK}" displayName="G-Standaard HPK"/>
        <map oid="{$oidGStandaardPRK}" displayName="G-Standaard PRK"/>
        <map oid="{$oidGStandaardGPK}" displayName="G-Standaard GPK"/>
        <map oid="{$oidGStandaardTH007Toedieningswegen}" displayName="G-Standaard TH007 Toedieningswegen"/>
        <map oid="{$oidGStandaardTH040ContraIndicaties}" displayName="G-Standaard TH040 Contraindicaties"/>
        <map oid="{$oidGStandaardBST361}" displayName="G-Standaard Bestand 361 a-tabel (eenheid gebruiksadvies)"/>
        <map oid="{$oidGStandaardBST902THES2}" displayName="G-Standaard Bestand 902 Thesaurus 2"/>
        <map oid="{$oidHL7ObservationInterpretation}" uri="http://hl7.org/fhir/v3/ObservationInterpretation" displayName="HL7 ObservationInterpretation"/>
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
        <map oid="{$oidUZISystems}" uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-sys" displayName="UZI Systemen"/>
        <map uri="http://hl7.org/fhir/v2/0078" displayName="HL7 Version 2 Table 0078 v2 Interpretation Codes"/>
    </xsl:variable>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="code-to-CodeableConcept" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@codeSystem = $oidNullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                    <valueCode value="{$in/@code}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[not(@codeSystem = $oidNullFlavor)]">
                <coding>
                    <system value="{local:getUri($in/@codeSystem)}"/>
                    <code value="{$in/@code}"/>
                    <xsl:if test="$in/@displayName">
                        <display value="{$in/@displayName}"/>
                    </xsl:if>
                    <!--<userSelected value="true"/>-->
                </coding>
                <!-- ADA heeft nog geen ondersteuning voor vertalingen, dus onderstaande is theoretisch -->
                <xsl:for-each select="$in/translation">
                    <coding>
                        <system value="{local:getUri(@codeSystem)}"/>
                        <code value="{@code}"/>
                        <xsl:if test="@displayName">
                            <display value="{@displayName}"/>
                        </xsl:if>
                    </coding>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="$in[@originalText]">
            <text value="{$in/@originalText}"/>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="hoeveelheid-to-Duration" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:variable name="unit-UCUM" select="$in/nf:convertTime_ADA_unit2UCUM_FHIR(@unit)"/>
        <xsl:choose>
            <xsl:when test="$in[@value]">
                <value value="{$in/@value}" xmlns="http://hl7.org/fhir"/>
                <xsl:if test="$unit-UCUM">
                    <system value="{local:getUri($oidUCUM)}" xmlns="http://hl7.org/fhir"/>
                    <code value="{$unit-UCUM}" xmlns="http://hl7.org/fhir"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor" xmlns="http://hl7.org/fhir">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="numerator"/>
        <xd:param name="denominator"/>
    </xd:doc>
    <xsl:template name="hoeveelheid-complex-to-Ratio" as="element()*">
        <xsl:param name="numerator" as="element()?"/>
        <xsl:param name="denominator" as="element()?"/>

        <xsl:for-each select="$numerator">
            <numerator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="./eenheid"/>
                    <xsl:with-param name="waarde" select="./waarde"/>
                </xsl:call-template>
            </numerator>
        </xsl:for-each>
        <xsl:for-each select="$denominator">
            <denominator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="./eenheid"/>
                    <xsl:with-param name="waarde" select="./waarde"/>
                </xsl:call-template>
            </denominator>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="hoeveelheid-complex-to-Quantity" as="element()*">
        <xsl:param name="waarde" as="element()?"/>
        <xsl:param name="eenheid" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$waarde[not(@value) or @nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                    <xsl:variable name="valueCode" select="
                            if ($waarde[@nullFlavor]) then
                                ($waarde/@nullFlavor)
                            else
                                ('NI')"/>
                    <valueCode value="{$valueCode}"/>
                </extension>
            </xsl:when>
            <xsl:otherwise>
                <value value="{$waarde/@value}"/>
                <xsl:for-each select="$eenheid[@code]">
                    <xsl:for-each select="./@displayName">
                        <unit value="{.}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./@codeSystem">
                        <system value="{.}"/>
                    </xsl:for-each>
                    <code value="{$eenheid/@code}"/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
<!--    <xsl:template name="hoeveelheid-to-Quantity" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[not(@value) or @nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                    <xsl:variable name="valueCode" select="
                            if ($in[@nullFlavor]) then
                                ($in/@nullFlavor)
                            else
                                ('NI')"/>
                    <valueCode value="{$valueCode}"/>
                </extension>
            </xsl:when>
            <xsl:otherwise>
                <value value="{$in/@value}"/>
                <xsl:for-each select="$in[@unit]">
                    <xsl:for-each select="./@displayName">
                        <unit value="{.}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./@codeSystem">
                        <system value="{.}"/>
                    </xsl:for-each>
                    <code value="{$in/@unit}"/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
-->
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="id-to-Identifier" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[@value | @root]">
                <xsl:for-each select="$in/@root">
                    <system value="{local:getUri(.)}"/>
                </xsl:for-each>
                <xsl:for-each select="$in/@value">
                    <value value="{.}"/>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="minmax-to-Range" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in/min[@nullFlavor]">
                <low xmlns="http://hl7.org/fhir">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                        <valueCode value="{$in/min/@nullFlavor}"/>
                    </extension>
                </low>
            </xsl:when>
            <xsl:when test="$in/min[@value]">
                <low xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                        <xsl:with-param name="eenheid" select="$in/../eenheid"/>
                        <xsl:with-param name="waarde" select="$in/min"/>
                    </xsl:call-template>
                </low>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$in/max[@nullFlavor]">
                <high xmlns="http://hl7.org/fhir">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                        <valueCode value="{$in/max/@nullFlavor}"/>
                    </extension>
                </high>
            </xsl:when>
            <xsl:when test="$in/max[@value]">
                <high xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                        <xsl:with-param name="eenheid" select="$in/../eenheid"/>
                        <xsl:with-param name="waarde" select="$in/max"/>
                    </xsl:call-template>
                </high>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="numerator-aantal"/>
        <xd:param name="numerator-eenheid"/>
        <xd:param name="denominator"/>
    </xd:doc>
    <xsl:template name="quotient-to-Ratio" as="element()*">
        <xsl:param name="numerator-aantal" as="element()?"/>
        <xsl:param name="numerator-eenheid" as="element()?"/>
        <xsl:param name="denominator" as="element()?"/>
        <xsl:if test="$numerator-aantal|$numerator-eenheid">
            <numerator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="$numerator-eenheid"/>
                    <xsl:with-param name="waarde" select="$numerator-aantal"/>
                </xsl:call-template>
            </numerator>
        </xsl:if>
        <xsl:for-each select="$denominator">
            <denominator>
                <xsl:call-template name="hoeveelheid-to-Duration">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </denominator>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="ADAtime"/>
    </xd:doc>
    <xsl:function name="nf:convertTime_ADA_unit2UCUM_FHIR" as="xs:string?">
        <xsl:param name="ADAtime" as="xs:string?"/>
        <xsl:if test="$ADAtime">
            <xsl:choose>
                <xsl:when test="$ADAtime = $ada-unit-seconde">s</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-minute">min</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-hour">h</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-day">d</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-week">wk</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-month">mo</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-year">a</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('onbekende tijdseenheid: ', $ADAtime)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    <xd:doc>
        <xd:desc>Get the FHIR System URI based on an input OID from HL7. xs:anyURI if possible, urn:oid:.. otherwise</xd:desc>
        <xd:param name="oid"/>
    </xd:doc>
    <xsl:function name="local:getUri" as="xs:string?">
        <xsl:param name="oid" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$oidMap[@oid = $oid][@uri]">
                <xsl:value-of select="$oidMap[@oid = $oid]/@uri"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('urn:oid:', $oid)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>
