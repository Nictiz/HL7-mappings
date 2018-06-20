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
<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
   <xsl:include href="../hl7/hl7_2_ada_hl7_include.xsl"/>
   <xsl:variable name="ada-unit-seconde" select="('seconde', 's', 'sec', 'second')"/>
   <xsl:variable name="ada-unit-minute" select="('minuut', 'min', 'minute')"/>
   <xsl:variable name="ada-unit-hour" select="('uur', 'h', 'hour')"/>
   <xsl:variable name="ada-unit-day" select="('dag', 'd', 'day')"/>
   <xsl:variable name="ada-unit-week" select="('week', 'wk')"/>
   <xsl:variable name="ada-unit-month" select="('maand', 'mo', 'month')"/>
   <xsl:variable name="ada-unit-year" select="('jaar', 'a', 'year')"/>

   <xsl:template name="mp9-code-attribs">
      <xsl:param name="current-hl7-code" as="element()" select="."/>

      <xsl:choose>
         <xsl:when test="$current-hl7-code[@code]">
            <xsl:attribute name="code" select="./@code"/>
            <xsl:attribute name="codeSystem" select="./@codeSystem"/>
            <xsl:attribute name="displayName" select="./@displayName"/>
            <xsl:if test="./@codeSystemName">
               <xsl:attribute name="codeSystemName" select="./@codeSystemName"/>
            </xsl:if>
         </xsl:when>
         <xsl:when test="$current-hl7-code[@nullFlavor]">
            <xsl:attribute name="code" select="./@nullFlavor"/>
            <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.5.1008'"/>
            <xsl:attribute name="displayName" select="
                  if (./@nullFlavor = 'OTH') then
                     'overig'
                  else
                     if (./@nullFlavor = 'UNK') then
                        'onbekend'
                     else
                        if (./@nullFlavor = 'NI') then
                           'geen informatie'
                        else
                           'unsupported_nullFlavor'"/>
            <xsl:for-each select="./hl7:originalText">
               <xsl:attribute name="originalText" select="./text()"/>
            </xsl:for-each>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="mp9-dagdeel">
      <xsl:param name="PIVL_TS-HD"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-toedieningsschema"/>
      <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'dagdeel']/@type"/>
      <!-- Nacht -->
      <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010100']">
         <dagdeel code="2546009" displayName="'s nachts" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
      </xsl:for-each>
      <!-- Ochtend -->
      <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010106']">
         <dagdeel code="73775008" displayName="'s ochtends" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
      </xsl:for-each>
      <!-- Middag -->
      <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010112']">
         <dagdeel code="255213009" displayName="'s middags" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
      </xsl:for-each>
      <!-- Avond -->
      <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010118']">
         <dagdeel code="3157002" displayName="'s avonds" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-doseerinstructie-from-mp612-cyclisch">
      <xsl:param name="current-hl7-mar"/>
      <xsl:param name="current-volgnr" select="1"/>
      <xsl:param name="hl7-pivl"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-gebruiksinstructie"/>
      <xsl:comment>mp9-doseerinstructie-from-mp612-cyclisch</xsl:comment>
      <!-- herhaalperiode_cyclisch_schema -->
      <xsl:variable name="hl7-herhaal-periode" select="$hl7-pivl[hl7:phase[hl7:width]]/hl7:period"/>
      <!-- er mag er maar eentje zijn, als er toch meerdere zijn die niet gelijk zijn dan geen gestructureerde informatie in de output -->
      <xsl:variable name="hl7-herhaal-periode-string">
         <xsl:for-each select="$hl7-herhaal-periode">
            <item>
               <xsl:value-of select="concat(./@value, ./@unit)"/>
            </item>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="aantal_distinct_cyclisch" select="count(distinct-values($hl7-herhaal-periode-string/item))"/>
      <xsl:variable name="aantal-delen-cyclisch" select="count($hl7-herhaal-periode)"/>
      <xsl:choose>
         <xsl:when test="$aantal_distinct_cyclisch = 1 and $aantal-delen-cyclisch = count($hl7-pivl) - 1">
            <xsl:for-each select="$hl7-herhaal-periode[1]">
               <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'herhaalperiode_cyclisch_schema']/@type"/>
               <herhaalperiode_cyclisch_schema value="{./@value}" unit="{./@unit}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <!-- doseerinstructie -->
            <xsl:for-each select="$hl7-pivl[hl7:phase[hl7:width]]">
               <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
               <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
               <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:variable name="volgnummer" select="$current-volgnr"/>
                  <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'volgnummer']/@type"/>
                  <volgnummer value="{$volgnummer}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"> </volgnummer>
                  <!-- doseerduur cyclisch schema -->
                  <xsl:for-each select="./hl7:phase/hl7:width">
                     <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'doseerduur']/@type"/>
                     <doseerduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                  </xsl:for-each>
                  <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                  <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                  <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                  <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                  <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                     <!-- keerdosis -->
                     <xsl:call-template name="mp9-keerdosis">
                        <xsl:with-param name="hl7-doseQuantity" select="$current-hl7-mar/doseQuantity"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                     </xsl:call-template>
                     <!-- toedieningsschema -->
                     <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
                     <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
                     <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-vaste-frequentie-from-mp-612">
                           <xsl:with-param name="current-hl7-pivl" select="$hl7-pivl[not(hl7:phase)]"/>
                           <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                           <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                        </xsl:call-template>
                     </toedieningsschema>
                     <!-- zo nodig -->
                     <xsl:if test="./hl7:precondition/hl7:observationEventCriterion/hl7:code |./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity">
                        <xsl:call-template name="mp9-zonodig">
                           <xsl:with-param name="max-dose" select="./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity"/>
                           <xsl:with-param name="zonodig-code" select="./hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                           <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                           <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                        </xsl:call-template>
                     </xsl:if>
                     <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->
                  </dosering>
               </doseerinstructie>
            </xsl:for-each>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="$aantal_distinct_cyclisch > 1">
                  <xsl:comment>Found more than one 'herhaalperiode_cyclisch_schema' in input. Cannot convert this and the corresponding doseerinstructie(s) into structured output. Please refer to textual description.</xsl:comment>
               </xsl:when>
               <xsl:when test="not($aantal-delen-cyclisch = count($hl7-pivl))">
                  <xsl:comment>Found a combination of cyclic and non-cyclic dosing schedules.  Cannot convert this and the corresponding doseerinstructie(s) into structured output.Please refer to textual description.</xsl:comment>
               </xsl:when>
               <xsl:otherwise><xsl:value-of select="."/>Unexpected error. Cannot convert doseerinstructie(s) into structured output.</xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>

   </xsl:template>
   <xsl:template name="mp9-doseerinstructie-from-mp612-eenmalig">
      <xsl:param name="current-hl7-mar"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-gebruiksinstructie"/>
      <xsl:comment>mp9-doseerinstructie-from-mp612-eenmalig</xsl:comment>
      <xsl:for-each select="$current-hl7-mar">
         <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
         <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
         <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
            <!-- volgnummer -->
            <xsl:variable name="volgnummer" select="position()"/>
            <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'volgnummer']/@type"/>
            <volgnummer value="{$volgnummer}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"> </volgnummer>
            <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
            <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
            <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
            <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
            <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
               <!-- keerdosis -->
               <xsl:call-template name="mp9-keerdosis">
                  <xsl:with-param name="hl7-doseQuantity" select="./hl7:doseQuantity"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
               </xsl:call-template>
               <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
               <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
               <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                  <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                  <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                     <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                     <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                        <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                     </aantal>
                  </frequentie>
               </toedieningsschema>
            </dosering>
         </doseerinstructie>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-doseerinstructie-from-mp612-tijden">
      <xsl:param name="current-hl7-mar"/>
      <xsl:param name="hl7-pivl"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-gebruiksinstructie"/>
      <xsl:comment>mp9-doseerinstructie-from-mp612-tijden</xsl:comment>
      <xsl:for-each select="$current-hl7-mar">
         <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
         <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
         <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
            <!-- volgnummer -->
            <xsl:variable name="volgnummer" select="position()"/>
            <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'volgnummer']/@type"/>
            <volgnummer value="{$volgnummer}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"> </volgnummer>
            <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
            <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
            <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
            <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
            <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
               <!-- keerdosis -->
               <xsl:call-template name="mp9-keerdosis">
                  <xsl:with-param name="hl7-doseQuantity" select="./hl7:doseQuantity"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
               </xsl:call-template>
               <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
               <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
               <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                  <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                  <!-- only output frequentie if the hl7:period is more than one day ánd an integer -->
                  <!-- once a day is implicit in toedieningstijd: take at noon daily, only need to add frequence when it is take at noon every other day... -->
                  <!-- a time with an interval of more then once a day does not make sense -->
                  <!-- not does a specific with an interval of a partial day (i.e. take at noon every 1,5 day does not make sense) -->
                  <xsl:choose>
                     <xsl:when test="$hl7-pivl[1]/hl7:period[@value = '1'][@unit = 'd']"><!-- Do nothing, no need to output frequency of once a day --></xsl:when>
                     <xsl:when test="$hl7-pivl[1]/hl7:period[not(@unit = 'd')]">
                        <xsl:comment>Found a schedule with a specific time and an interval unequal to 'd'. This is not allowed.</xsl:comment>
                     </xsl:when>
                     <!-- frequency must be the same in all pivl's, let's take the first -->
                     <xsl:when test="$hl7-pivl[1]/hl7:period[@value castable as xs:integer and @value &gt; 1]">
                        <!-- let's output the frequency -->
                        <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                           <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                           <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                           <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                              <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                              <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                           </aantal>
                           <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                           <tijdseenheid value="{$hl7-pivl[1]/hl7:period/@value}" unit="{nf:convertTime_UCUM2ADA_unit($hl7-pivl[1]/hl7:period/@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </frequentie>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:comment>Unexpected error with contents of period in toedieningsschema for toedieningstijd</xsl:comment>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:for-each select="$hl7-pivl[hl7:phase/hl7:center]">
                     <!-- toedientijd -->
                     <xsl:choose>
                        <xsl:when test="./hl7:period[@value castable as xs:integer and @value &gt;= 1][@unit = 'd']">
                           <!-- output the toedieningstijd -->
                           <xsl:variable name="xsd-toedientijd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                           <xsl:variable name="xsd-toedientijd" select="$xsd-ada//xs:complexType[@name = $xsd-toedientijd-complexType]"/>
                           <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7:phase/hl7:center/@value),nf:determine_date_precision(./hl7:phase/hl7:center/@value))}" conceptId="{$xsd-toedientijd/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:comment><!-- Do nothing --></xsl:comment>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </toedieningsschema>
               <xsl:if test="./hl7:precondition/hl7:observationEventCriterion/hl7:code |./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity">
                  <xsl:call-template name="mp9-zonodig">
                     <xsl:with-param name="max-dose" select="./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity"/>
                     <xsl:with-param name="zonodig-code" select="./hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                  </xsl:call-template>
               </xsl:if>
               <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->

            </dosering>
         </doseerinstructie>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-doseerinstructie-from-mp612-var-freq">
      <xsl:param name="hl7-mar"/>
      <xsl:param name="hl7-pivl"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-gebruiksinstructie"/>
      <xsl:comment>mp9-doseerinstructie-from-mp612-var-freq</xsl:comment>
      <xsl:for-each select="$hl7-mar">
         <xsl:variable name="hl7-pivl" select=".//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
         <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
            <xsl:with-param name="current-hl7-mar" select="."/>
            <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
            <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-doseerinstructie-from-mp612-freq">
      <xsl:param name="current-hl7-mar"/>
      <xsl:param name="hl7-pivl"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-gebruiksinstructie"/>
      <xsl:comment>mp9-doseerinstructie-from-mp612-freq</xsl:comment>
      <xsl:for-each select="$current-hl7-mar">
         <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
         <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
         <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
            <!-- volgnummer -->
            <xsl:variable name="volgnummer" select="position()"/>
            <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'volgnummer']/@type"/>
            <volgnummer value="{$volgnummer}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"> </volgnummer>
            <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
            <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
            <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
            <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
            <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
               <!-- keerdosis -->
               <xsl:call-template name="mp9-keerdosis">
                  <xsl:with-param name="hl7-doseQuantity" select="./hl7:doseQuantity"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
               </xsl:call-template>
               <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
               <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
               <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-vaste-frequentie-from-mp-612">
                     <xsl:with-param name="current-hl7-pivl" select="$hl7-pivl"/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                  </xsl:call-template>
               </toedieningsschema>
               <!-- eventueel een zo nodig criterium -->
               <xsl:if test="./hl7:precondition/hl7:observationEventCriterion/hl7:code |./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity">
                  <xsl:call-template name="mp9-zonodig">
                     <xsl:with-param name="max-dose" select="./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity"/>
                     <xsl:with-param name="zonodig-code" select="./hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                  </xsl:call-template>
               </xsl:if>
               <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->
            </dosering>
         </doseerinstructie>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-gebruiksinstructie-from-mp612-2">
      <xsl:param name="effectiveTimes-eenmalig"/>
      <xsl:param name="hl7-current-comp" select="."/>
      <xsl:param name="mar-sorted"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-comp"/>
      <!-- gebruiksinstructie -->
      <xsl:variable name="xsd-gebruiksinstructie-complexType" select="$xsd-comp//xs:element[@name = 'gebruiksinstructie']/@type"/>
      <xsl:variable name="xsd-gebruiksinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-gebruiksinstructie-complexType]"/>
      <xsl:comment>mp9-gebruiksinstructie-from-mp612-2</xsl:comment>
      <gebruiksinstructie conceptId="{$xsd-gebruiksinstructie/xs:attribute[@name='conceptId']/@fixed}">
         <!-- omschrijving -->
         <xsl:variable name="omschrijving">
            <!-- alleen unieke teksten: filter identieke teksten weg -->
            <xsl:for-each select="distinct-values($mar-sorted/hl7:text/text())">
               <xsl:if test="position() > 1">; </xsl:if>
               <xsl:value-of select="."/>
            </xsl:for-each>
         </xsl:variable>
         <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'omschrijving']/@type"/>
         <omschrijving value="{$omschrijving}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
         <!-- toedieningsweg -->
         <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'toedieningsweg']/@type"/>
         <toedieningsweg conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:choose>
               <xsl:when test="$mar-sorted/hl7:routeCode">
                  <xsl:call-template name="mp9-code-attribs">
                     <!-- moeten allemaal dezelfde toedieningsweg hebben voor 1 verstrekking, we nemen de eerste -->
                     <xsl:with-param name="current-hl7-code" select="($mar-sorted/hl7:routeCode)[1]"/>
                  </xsl:call-template>
               </xsl:when>
               <xsl:otherwise>
                  <!-- Niet aanwezig in input 6.12 xml -->
                  <xsl:attribute name="code" select="'NI'"/>
                  <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.5.1008'"/>
                  <xsl:attribute name="displayName" select="'geen informatie'"/>
               </xsl:otherwise>
            </xsl:choose>
         </toedieningsweg>
         <!-- aanvullende_instructie -->
         <!-- ontdubbelen met for-each-group, staat in 6.12 bij iedere MAR en in 9 op een hoger niveau -->
         <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'aanvullende_instructie']/@type"/>
         <xsl:for-each-group select="$mar-sorted/hl7:support2/hl7:medicationAdministrationInstruction/hl7:code[@code]" group-by="@code">
            <xsl:for-each-group select="current-group()" group-by="@codeSystem">
               <xsl:for-each select="current-group()[1]">
                  <aanvullende_instructie conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                     </xsl:call-template>
                  </aanvullende_instructie>
               </xsl:for-each>
            </xsl:for-each-group>
         </xsl:for-each-group>
         <xsl:for-each-group select="$mar-sorted/hl7:support2/hl7:medicationAdministrationInstruction/hl7:code[@nullFlavor]" group-by="@nullFlavor">
            <xsl:for-each-group select="current-group()" group-by="hl7:originalText">
               <xsl:for-each select="current-group()[1]">
                  <aanvullende_instructie conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                     </xsl:call-template>
                  </aanvullende_instructie>
               </xsl:for-each>
            </xsl:for-each-group>
         </xsl:for-each-group>
         <!-- ondersteun alleen de meest voorkomende schema's, zie 
         https://informatiestandaarden.nictiz.nl/wiki/7phcy:V6.12.7_HL7v3-domeinspecificatie_Pharmacy#medicationAdministrationRequest.effectiveTime -->
         <!-- DUS NIET: op- en afbouwschema's, dat moeten geankerde intervallen zijn in meerdere mar's - (nog) niet ondersteund -->
         <xsl:variable name="hl7-pivl" select="$mar-sorted//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
         <xsl:variable name="hl7-ivl" select="$mar-sorted//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
         <xsl:variable name="parallel" as="xs:boolean">
            <!-- are all encountered mar's parallel, i.e. no opbouw/afbouw schedule -->
            <xsl:choose>
               <xsl:when test="not($hl7-ivl/hl7:low/@value)">
                  <xsl:value-of select="true()"/>
               </xsl:when>
               <xsl:when test="count(distinct-values($hl7-ivl/hl7:low/@value)) = 1">
                  <xsl:value-of select="true()"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="false()"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <!-- eenmalig gebruik, in 1 mar met 1 eenmalige effectiveTime -->
            <xsl:when test="count($effectiveTimes-eenmalig) = 1 and count($mar-sorted) = 1">
               <xsl:call-template name="mp9-doseerinstructie-from-mp612-eenmalig">
                  <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
               </xsl:call-template>
            </xsl:when>
            <!-- frequentie, in 1 mar in 1 PIVL_TS (zonder phase) -->
            <xsl:when test="count($mar-sorted) = 1 and not($hl7-pivl[hl7:phase]) and count($hl7-pivl[not(hl7:phase)]) = 1">
               <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                  <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                  <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
               </xsl:call-template>
            </xsl:when>
            <!-- variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel -->
            <xsl:when test="count($mar-sorted) = 2 and count($mar-sorted[hl7:precondition]) = 1 and $parallel">
               <xsl:call-template name="mp9-doseerinstructie-from-mp612-var-freq">
                  <xsl:with-param name="hl7-mar" select="$mar-sorted"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
               </xsl:call-template>
            </xsl:when>
            <!-- cyclisch schema (pil) in 1 mar -->
            <xsl:when test="$hl7-pivl[hl7:phase/hl7:width][hl7:period] and count($mar-sorted) = 1">
               <xsl:call-template name="mp9-doseerinstructie-from-mp612-cyclisch">
                  <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                  <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
               </xsl:call-template>
            </xsl:when>
            <!-- toedientijden - 1 mar, meerdere comps of 1 comp of 1 effectiveTime met tijd, frequentie moet overal hetzelfde zijn en in dagen -->
            <xsl:when test="count($mar-sorted) = 1 and $hl7-pivl[hl7:phase/hl7:center] and count(distinct-values($hl7-pivl/hl7:period/@value)) = 1 and not($hl7-pivl[hl7:period/@unit != 'd'])">
               <xsl:call-template name="mp9-doseerinstructie-from-mp612-tijden">
                  <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                  <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <!-- de rest (nog) niet gestructureerd opleveren -->
               <xsl:comment>Non-supported (complex) dosing scheduled encountered in 6.12. No structured output, please refer to textual description.</xsl:comment>
               <!-- maar wel de maximale dosering, indien aanwezig in 1 MAR-->
               <xsl:if test="count($mar-sorted) = 1 and $mar-sorted/hl7:maxDoseQuantity[.//@value]">                  
                  <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
                  <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
                  <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                     <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                     <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-zonodig">
                           <xsl:with-param name="max-dose" select="$mar-sorted/hl7:maxDoseQuantity"/>
                           <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                           <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                        </xsl:call-template>
                     </dosering>
                  </doseerinstructie>
               </xsl:if>
               
            </xsl:otherwise>
         </xsl:choose>
      </gebruiksinstructie>
   </xsl:template>
   <xsl:template name="mp9-gebruiksinstructie-from-mp9">
      <xsl:param name="hl7-comp" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-comp"/>
      <xsl:variable name="xsd-gebruiksinstructie-complexType" select="$xsd-comp//xs:element[@name = 'gebruiksinstructie']/@type"/>
      <xsl:variable name="xsd-gebruiksinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-gebruiksinstructie-complexType]"/>
      <xsl:for-each select="$hl7-comp">
         <gebruiksinstructie conceptId="{$xsd-gebruiksinstructie/xs:attribute[@name='conceptId']/@fixed}">
            <!-- omschrijving -->
            <xsl:for-each select="./hl7:text">
               <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'omschrijving']/@type"/>
               <omschrijving value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <!-- toedieningsweg -->
            <xsl:for-each select="./hl7:routeCode">
               <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'toedieningsweg']/@type"/>
               <toedieningsweg conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </toedieningsweg>
            </xsl:for-each>
            <!-- aanvullende_instructie -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9085']/hl7:code">
               <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'aanvullende_instructie']/@type"/>
               <aanvullende_instructie conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </aanvullende_instructie>
            </xsl:for-each>
            <xsl:variable name="hl7-doseerinstructie" select="./hl7:entryRelationship[hl7:substanceAdministration/hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9149']"/>
            <!-- herhaalperiode_cyclisch_schema -->
            <!-- er mag er maar eentje zijn -->
            <xsl:for-each select="$hl7-doseerinstructie/hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:phase[hl7nl:width]]/hl7nl:period">
               <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'herhaalperiode_cyclisch_schema']/@type"/>
               <herhaalperiode_cyclisch_schema value="{./@value}" unit="{./@unit}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <!-- doseerinstructie -->
            <xsl:for-each select="$hl7-doseerinstructie">
               <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
               <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
               <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                  <!-- volgnummer -->
                  <xsl:for-each select="./hl7:sequenceNumber">
                     <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'volgnummer']/@type"/>
                     <volgnummer value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                  </xsl:for-each>
                  <!-- doseerduur -->
                  <xsl:choose>
                     <!-- doseerduur in Cyclisch doseerschema. -->
                     <xsl:when test="./hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp/hl7nl:phase/hl7nl:width">
                        <xsl:for-each select="./hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp/hl7nl:phase/hl7nl:width">
                           <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'doseerduur']/@type"/>
                           <doseerduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:for-each>
                     </xsl:when>
                     <!-- overige gevallen -->
                     <xsl:otherwise>
                        <xsl:for-each select="./hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:width">
                           <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'doseerduur']/@type"/>
                           <doseerduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:for-each>
                     </xsl:otherwise>
                  </xsl:choose>
                  <!-- dosering -->
                  <xsl:for-each select="./hl7:substanceAdministration">
                     <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                     <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                     <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                        <!-- keerdosis -->
                        <xsl:for-each select="./hl7:doseQuantity">
                           <xsl:variable name="xsd-keerdosis-complexType" select="$xsd-dosering//xs:element[@name = 'keerdosis']/@type"/>
                           <xsl:variable name="xsd-keerdosis" select="$xsd-ada//xs:complexType[@name = $xsd-keerdosis-complexType]"/>
                           <keerdosis conceptId="{$xsd-keerdosis/xs:attribute[@name='conceptId']/@fixed}">
                              <xsl:variable name="xsd-aantal-complexType" select="$xsd-keerdosis//xs:element[@name = 'aantal']/@type"/>
                              <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                              <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:for-each select="./hl7:low/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                                    <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'min']/@type"/>
                                    <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                 </xsl:for-each>
                                 <xsl:for-each select="./hl7:center/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                                    <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                    <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                 </xsl:for-each>
                                 <xsl:for-each select="./hl7:high/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                                    <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'max']/@type"/>
                                    <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                 </xsl:for-each>
                              </aantal>
                              <xsl:for-each select="(./*/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2'])[1]">
                                 <xsl:variable name="xsd-complexType" select="$xsd-keerdosis//xs:element[@name = 'eenheid']/@type"/>
                                 <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:call-template name="mp9-code-attribs">
                                       <xsl:with-param name="current-hl7-code" select="."/>
                                    </xsl:call-template>
                                 </eenheid>
                              </xsl:for-each>
                           </keerdosis>
                        </xsl:for-each>
                        <!-- toedieningsschema -->
                        <!-- er moet een PIVL_TS zijn om een toedieningsschema te maken -->
                        <xsl:if test=".//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')]">
                           <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
                           <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
                           <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                              <!-- eenvoudig doseerschema met alleen één frequentie -->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][@isFlexible = 'true'][not(@alignment)][hl7nl:frequency][not(hl7nl:phase)]">
                                 <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                 </xsl:call-template>
                              </xsl:for-each>
                              <!-- Eenvoudig doseerschema met alleen één interval.-->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][(@isFlexible = 'false' or not(@isFlexible))][not(@alignment)][hl7nl:frequency]">
                                 <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'interval']/@type"/>
                                 <xsl:variable name="interval-value" select="format-number(number(./hl7nl:frequency/hl7nl:denominator/@value) div number(./hl7nl:frequency/hl7nl:numerator/@value), '0.####')"/>
                                 <interval value="{$interval-value}" unit="{nf:convertTime_UCUM2ADA_unit(./hl7nl:frequency/hl7nl:denominator/@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                              </xsl:for-each>
                              <!-- Eenvoudig doseerschema met één vast tijdstip. -->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][hl7nl:phase[not(hl7nl:width)]]">
                                 <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                 <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7nl:phase/hl7nl:low/@value), nf:determine_date_precision(./hl7nl:phase/hl7nl:low/@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                              </xsl:for-each>
                              <!-- Doseerschema met toedieningsduur. -->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][not(hl7nl:period)][hl7nl:phase[hl7nl:width]]">
                                 <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                 </xsl:call-template>
                                 <xsl:for-each select="hl7nl:phase/hl7nl:low">
                                    <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                    <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                 </xsl:for-each>
                              </xsl:for-each>
                              <!--Doseerschema met meer dan één vast tijdstip.-->
                              <xsl:for-each select="./hl7:effectiveTime[hl7:comp[not(@alignment)][hl7nl:period][hl7nl:phase[not(hl7nl:width)]]][not(hl7:comp/@alignment)][not(hl7:comp[not(hl7nl:period)])][not(hl7:comp[not(hl7nl:phase[not(hl7nl:width)])])]/hl7:comp">
                                 <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                 <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7nl:phase/hl7nl:low/@value), nf:determine_date_precision(./hl7nl:phase/hl7nl:low/@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                              </xsl:for-each>
                              <!-- Cyclisch doseerschema. -->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp[hl7nl:frequency]">
                                 <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                 </xsl:call-template>
                              </xsl:for-each>
                              <!-- Eenmalig gebruik of aantal keren gebruik zonder tijd. -->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][hl7nl:count]/hl7nl:count">
                                 <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                                 <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                                 <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                                    <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                                    <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                       <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                       <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                    </aantal>
                                 </frequentie>
                              </xsl:for-each>
                              <!-- Doseerschema één keer per week op één weekdag. -->
                              <xsl:for-each select="./hl7:effectiveTime[@alignment = 'DW']">
                                 <xsl:for-each select="./hl7nl:period">
                                    <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                                    <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                                    <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                       <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                                       <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                                       <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                          <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                          <!-- altijd 1, 1 keer per week of 1 keer per 2 weken et cetera -->
                                          <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                       </aantal>
                                       <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                                       <tijdseenheid value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                    </frequentie>
                                 </xsl:for-each>
                                 <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
                                    <xsl:with-param name="current_IVL" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                 </xsl:call-template>
                              </xsl:for-each>
                              <!-- Complexer doseerschema met weekdag(en). -->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp/@alignment = 'DW']">
                                 <xsl:for-each select="./hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and @isFlexible = 'true' and hl7nl:frequency]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                       <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                       <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                    </xsl:call-template>
                                 </xsl:for-each>
                                 <xsl:for-each select="./hl7:comp[@alignment = 'DW']">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
                                       <xsl:with-param name="current_IVL" select="."/>
                                       <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                       <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                    </xsl:call-template>
                                 </xsl:for-each>
                              </xsl:for-each>
                              <!-- Doseerschema met één dagdeel -->
                              <xsl:for-each select="./hl7:effectiveTime[@alignment = 'HD']">
                                 <xsl:call-template name="mp9-dagdeel">
                                    <xsl:with-param name="PIVL_TS-HD" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                 </xsl:call-template>
                              </xsl:for-each>
                              <!-- Complexer doseerschema met meer dan één dagdeel. -->
                              <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp/@alignment = 'HD']/hl7:comp">
                                 <xsl:call-template name="mp9-weekdag">
                                    <xsl:with-param name="hl7-phase-low" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                 </xsl:call-template>
                              </xsl:for-each>
                           </toedieningsschema>
                        </xsl:if>
                        <xsl:for-each select="./hl7:precondition/hl7:criterion/hl7:code">
                           <xsl:variable name="xsd-zo_nodig-complexType" select="$xsd-dosering//xs:element[@name = 'zo_nodig']/@type"/>
                           <xsl:variable name="xsd-zo_nodig" select="$xsd-ada//xs:complexType[@name = $xsd-zo_nodig-complexType]"/>
                           <zo_nodig conceptId="{$xsd-zo_nodig/xs:attribute[@name='conceptId']/@fixed}">
                              <xsl:variable name="xsd-criterium-complexType" select="$xsd-zo_nodig//xs:element[@name = 'criterium']/@type"/>
                              <xsl:variable name="xsd-criterium" select="$xsd-ada//xs:complexType[@name = $xsd-criterium-complexType]"/>
                              <criterium conceptId="{$xsd-criterium/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:variable name="xsd-complexType" select="$xsd-criterium//xs:element[@name = 'code']/@type"/>
                                 <code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:call-template name="mp9-code-attribs">
                                       <xsl:with-param name="current-hl7-code" select="."/>
                                    </xsl:call-template>
                                 </code>
                                 <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                                 <!--  <omschrijving value="zo nodig criterium omschrijving in vrije tekst" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23270"/>-->
                              </criterium>
                           </zo_nodig>
                        </xsl:for-each>
                        <xsl:for-each select="./hl7:rateQuantity">
                           <xsl:variable name="xsd-toedieningssnelheid-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningssnelheid']/@type"/>
                           <xsl:variable name="xsd-toedieningssnelheid" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningssnelheid-complexType]"/>
                           <toedieningssnelheid conceptId="{$xsd-toedieningssnelheid/xs:attribute[@name='conceptId']/@fixed}">
                              <xsl:variable name="xsd-waarde-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'waarde']/@type"/>
                              <xsl:variable name="xsd-waarde" select="$xsd-ada//xs:complexType[@name = $xsd-waarde-complexType]"/>
                              <waarde conceptId="{$xsd-waarde/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:for-each select="./hl7:low">
                                    <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'min']/@type"/>
                                    <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                 </xsl:for-each>
                                 <xsl:for-each select="./hl7:center">
                                    <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'vaste_waarde']/@type"/>
                                    <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                 </xsl:for-each>
                                 <xsl:for-each select="./hl7:high">
                                    <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'max']/@type"/>
                                    <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                 </xsl:for-each>
                              </waarde>
                              <xsl:variable name="ucum-eenheid" select="substring-before((./*/@unit)[1], '/')"/>
                              <xsl:variable name="xsd-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'eenheid']/@type"/>
                              <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:call-template name="UCUM2GstdBasiseenheid">
                                    <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
                                 </xsl:call-template>
                              </eenheid>
                              <xsl:variable name="ucum-tijdseenheid" select="substring-after((./*/@unit)[1], '/')"/>
                              <xsl:variable name="xsd-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'tijdseenheid']/@type"/>
                              <tijdseenheid unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                           </toedieningssnelheid>
                        </xsl:for-each>
                        <!-- Doseerschema met toedieningsduur. -->
                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][not(hl7nl:period)]/hl7nl:phase/hl7nl:width">
                           <xsl:variable name="xsd-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsduur']/@type"/>
                           <toedieningsduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23282"/>
                        </xsl:for-each>
                        <!-- Doseerschema één keer per week op één weekdag met toedieningsduur -->
                        <xsl:for-each select="./hl7:effectiveTime[@alignment = 'DW']/hl7nl:phase/hl7nl:width">
                           <xsl:variable name="xsd-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsduur']/@type"/>
                           <toedieningsduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23282"/>

                        </xsl:for-each>
                     </dosering>
                  </xsl:for-each>
               </doseerinstructie>
            </xsl:for-each>
         </gebruiksinstructie>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-gebruiksperiode-eind">
      <xsl:param name="inputValue"/>
      <xsl:param name="xsd-comp"/>
      <xsl:param name="xsd-ada"/>
      <xsl:variable name="xsd-complexType" select="$xsd-comp//xs:element[@name = 'gebruiksperiode_eind']/@type"/>
      <gebruiksperiode_eind value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime($inputValue), nf:determine_date_precision($inputValue))}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
   </xsl:template>
   <xsl:template name="mp9-gebruiksperiode-start">
      <xsl:param name="inputValue"/>
      <xsl:param name="xsd-comp"/>
      <xsl:param name="xsd-ada"/>
      <xsl:variable name="xsd-complexType" select="$xsd-comp//xs:element[@name = 'gebruiksperiode_start']/@type"/>
      <gebruiksperiode_start value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime($inputValue), nf:determine_date_precision($inputValue))}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
   </xsl:template>
   <xsl:template name="mp9-geslacht">
      <xsl:param name="current-administrativeGenderCode" select="."/>
      <xsl:choose>
         <xsl:when test="$current-administrativeGenderCode/@code = 'F'">
            <geslacht value="3" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19831" code="F" codeSystem="2.16.840.1.113883.5.1" displayName="Vrouw"/>
         </xsl:when>
         <xsl:when test="$current-administrativeGenderCode/@code = 'M'">
            <geslacht value="2" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19831" code="M" codeSystem="2.16.840.1.113883.5.1" displayName="Man"/>
         </xsl:when>
         <xsl:when test="$current-administrativeGenderCode/@code = 'UN'">
            <geslacht value="1" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19831" code="UN" codeSystem="2.16.840.1.113883.5.1" displayName="Ongedifferentieerd"/>
         </xsl:when>
         <xsl:otherwise>
            <geslacht value="4" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19831" code="UNK" codeSystem="2.16.840.1.113883.5.1008" displayName="Onbekend"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="mp9-ingredient-eenheid">
      <xsl:param name="hl7-num-or-denom" select="." as="element()?"/>
      <!-- @unit is leeg als de waarde een nullFlavor is, wat vooral legaal is bij nullFlavor QS - aanvullen tot -->
      <xsl:choose>
         <xsl:when test="$hl7-num-or-denom[@unit]">
            <xsl:for-each select="$hl7-num-or-denom[@unit]">
               <xsl:choose>
                  <xsl:when test="./hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                     <xsl:for-each select="./hl7:translation">
                        <xsl:attribute name="code" select="./@code"/>
                        <xsl:attribute name="codeSystem" select="./@codeSystem"/>
                        <xsl:attribute name="displayName" select="./@displayName"/>
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                     <!-- translate UCUM unit to Gstd -->
                     <xsl:call-template name="UCUM2GstdBasiseenheid">
                        <xsl:with-param name="UCUM" select="./@unit"/>
                     </xsl:call-template>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
         </xsl:when>
         <xsl:otherwise>
            <!-- there is no unit -->
            <xsl:attribute name="code">NI</xsl:attribute>
            <xsl:attribute name="codeSystem">2.16.840.1.113883.5.1008</xsl:attribute>
            <xsl:attribute name="displayName">geen informatie</xsl:attribute>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="mp9-ingredient-waarde">
      <xsl:param name="hl7-num-or-denom" as="node()"/>
      <xsl:variable name="gstd-translation" select="$hl7-num-or-denom/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']"/>
      <xsl:choose>
         <xsl:when test="$gstd-translation">
            <xsl:attribute name="value" select="$gstd-translation/@value"/>
         </xsl:when>
         <xsl:when test="./@nullFlavor">
            <xsl:attribute name="nullFlavor" select="./@nullFlavor"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:attribute name="value" select="./@value"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="mp-ingredient-waarde-en-eenheid">
      <xsl:param name="hl7-num-or-denom"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-hoeveelheid"/>
      <xsl:variable name="xsd-complexType" select="$xsd-hoeveelheid//xs:element[@name = 'waarde']/@type"/>
      <xsl:for-each select="$hl7-num-or-denom">
         <waarde conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:call-template name="mp9-ingredient-waarde">
               <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
            </xsl:call-template>
         </waarde>
         <xsl:variable name="xsd-complexType" select="$xsd-hoeveelheid//xs:element[@name = 'eenheid']/@type"/>
         <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:call-template name="mp9-ingredient-eenheid">
               <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
            </xsl:call-template>
         </eenheid>

      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-keerdosis">
      <xsl:param name="hl7-doseQuantity"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-dosering"/>
      <xsl:comment>mp9-keerdosis</xsl:comment>
      <!-- keerdosis -->
      <xsl:for-each select="$hl7-doseQuantity">
         <xsl:variable name="xsd-keerdosis-complexType" select="$xsd-dosering//xs:element[@name = 'keerdosis']/@type"/>
         <xsl:variable name="xsd-keerdosis" select="$xsd-ada//xs:complexType[@name = $xsd-keerdosis-complexType]"/>
         <keerdosis conceptId="{$xsd-keerdosis/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:variable name="xsd-aantal-complexType" select="$xsd-keerdosis//xs:element[@name = 'aantal']/@type"/>
            <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
            <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
               <xsl:for-each select="./hl7:low/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                  <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'min']/@type"/>
                  <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <xsl:for-each select="./hl7:center/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                  <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                  <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <xsl:for-each select="./hl7:high/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                  <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'max']/@type"/>
                  <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
            </aantal>
            <xsl:for-each select="(./*/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2'])[1]">
               <xsl:variable name="xsd-complexType" select="$xsd-keerdosis//xs:element[@name = 'eenheid']/@type"/>
               <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </eenheid>
            </xsl:for-each>
         </keerdosis>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-naamgebruik">
      <xsl:param name="hl7-name"/>
      <xsl:choose>
         <xsl:when test="hl7:family[@qualifier = 'BR' or not(@qualifier)] and not(hl7:family[@qualifier = 'SP'])">
            <naamgebruik value="1" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL1" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam"/>
         </xsl:when>
         <xsl:when test="hl7:family[@qualifier = 'SP'] and not(hl7:family[@qualifier = 'BR' or not(@qualifier)])">
            <naamgebruik value="2" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL2" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner"/>
         </xsl:when>
         <xsl:when test="hl7:family[@qualifier = 'SP'] and not(hl7:family[@qualifier = 'SP']/ancestor::hl7:family[@qualifier = 'BR' or not(@qualifier)])">
            <naamgebruik value="3" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL3" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner gevolgd door eigen geslachtsnaam"/>
         </xsl:when>
         <xsl:when test="hl7:family[@qualifier = 'BR' or not(@qualifier)] and not(hl7:family[@qualifier = 'BR' or not(@qualifier)]/ancestor::hl7:family[@qualifier = 'SP'])">
            <naamgebruik value="4" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL4" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam gevolgd door geslachtsnaam partner"/>
         </xsl:when>
         <xsl:otherwise>
            <naamgebruik value="5" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="OTH" codeSystem="2.16.840.1.113883.5.1008" displayName="Onbekend"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="mp9-naamgegevens">
      <!-- naam binnen patiënt -->
      <xsl:param name="current-hl7-name" select="."/>
      <!-- See for the HL7 spec of name: http://www.hl7.nl/wiki/index.php/DatatypesR1:PN -->
      <naamgegevens conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19799">
         <!-- ongestructureerde_naam -->
         <xsl:for-each select="$current-hl7-name[text()][not(child::*)]">
            <ongestructureerde_naam conceptId="1.2.3.4.5.12345.19799.1">
               <xsl:attribute name="value">
                  <xsl:value-of select="."/>
               </xsl:attribute>
            </ongestructureerde_naam>
         </xsl:for-each>
         <!-- voornamen -->
         <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]]">
            <xsl:variable name="voornamen_concatted">
               <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                  <xsl:value-of select="concat(./text(), ' ')"/>
               </xsl:for-each>
            </xsl:variable>
            <voornamen value="{normalize-space($voornamen_concatted)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19800"/>
         </xsl:for-each>
         <!-- initialen -->
         <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'BR') or not(@qualifier) or @qualifier = 'IN']]">
            <!-- in HL7 mogen de initialen van officiële voornamen niet herhaald / gedupliceerd worden in het initialen veld -->
            <!-- in de zib moeten de initialen juist compleet zijn, dus de initialen hier toevoegen van de officiële voornamen -->
            <xsl:variable name="initialen_concatted">
               <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                  <xsl:for-each select="tokenize(., ' ')">
                     <xsl:value-of select="concat(substring(., 1, 1), '.')"/>
                  </xsl:for-each>
               </xsl:for-each>
               <xsl:for-each select="./hl7:given[@qualifier = 'IN']">
                  <xsl:value-of select="./text()"/>
               </xsl:for-each>
            </xsl:variable>
            <initialen conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19801" value="{$initialen_concatted}"/>
         </xsl:for-each>
         <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'CL')]]">
            <xsl:variable name="roepnamen_concatted">
               <xsl:for-each select="./hl7:given[contains(@qualifier, 'CL')]">
                  <xsl:value-of select="concat(./text(), ' ')"/>
               </xsl:for-each>
            </xsl:variable>
            <roepnaam value="{normalize-space($roepnamen_concatted)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19802"/>
         </xsl:for-each>
         <xsl:call-template name="mp9-naamgebruik">
            <xsl:with-param name="hl7-name" select="$current-hl7-name"/>
         </xsl:call-template>
         <xsl:for-each select="$current-hl7-name/hl7:family[@qualifier = 'BR' or not(@qualifier)]">
            <geslachtsnaam conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19804">
               <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1]">
                  <voorvoegsels conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19805">
                     <xsl:attribute name="value" select="./text()"/>
                  </voorvoegsels>
               </xsl:for-each>
               <achternaam value="Eigengeslachtsnaam" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19806">
                  <xsl:attribute name="value" select="./text()"/>
               </achternaam>
            </geslachtsnaam>
         </xsl:for-each>
         <xsl:for-each select="$current-hl7-name/hl7:family[@qualifier = 'SP']">
            <geslachtsnaam_partner conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19807">
               <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1]">
                  <voorvoegsels_partner value="van " conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19808">
                     <xsl:attribute name="value" select="./text()"/>
                  </voorvoegsels_partner>
               </xsl:for-each>
               <achternaam_partner value="Partner" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19809">
                  <xsl:attribute name="value" select="./text()"/>
               </achternaam_partner>
            </geslachtsnaam_partner>
         </xsl:for-each>
      </naamgegevens>
   </xsl:template>
   <xsl:template name="mp9-toedieningsafspraak-from-mp612">
      <xsl:param name="current-dispense-event"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-mbh"/>
      <xsl:variable name="xsd-toedieningsafspraak-complexType" select="$xsd-mbh//xs:element[@name = 'toedieningsafspraak']/@type"/>
      <xsl:variable name="xsd-toedieningsafspraak" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsafspraak-complexType]"/>
      <!-- let's sort the available hl7:medicationAdministrationRequest's in chronological order -->
      <!-- mar = medicationAdministrationRequest  -->
      <xsl:variable name="mar-sorted" as="element(hl7:medicationAdministrationRequest)*">
         <xsl:for-each select="./hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest">
            <xsl:sort data-type="number" select="nf:appendDate2DateTime((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:low/@value)"/>
            <!-- tested this with xsl:sequence, but the later use of for-each to iterate through the variable $mar does not respect the sorted order, 
                  but takes the input order from the input xml -->
            <!-- the xslt2 perform-sort function has the same result (probably for same reason, since it uses sequence as well) -->
            <!-- so we are useing copy-of here to preserve order, even though it is known to perform worse -->
            <xsl:copy-of select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="IVL_TS" select="$mar-sorted//(hl7:effectiveTime | hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>

      <!-- toedieningsafspraak -->
      <xsl:for-each select="$current-dispense-event">
         <toedieningsafspraak conceptId="{$xsd-toedieningsafspraak/xs:attribute[@name='conceptId']/@fixed}">
            <!-- gebruiksperiode-start -->
            <!-- in 6.12 kun je alleen een conclusie trekken over gebruiksperiode-start, als álle MARs een IVL_TS/low/@value hebben -->
            <xsl:if test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:low/@value)])">
               <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de laagste low als gebruiksperiode startdatum -->
               <!-- omdat $mar gesorteerd is, is dat de eerste $IVL_TS -->
               <xsl:call-template name="mp9-gebruiksperiode-start">
                  <xsl:with-param name="inputValue" select="$IVL_TS[1]/hl7:low/@value"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
               </xsl:call-template>
            </xsl:if>
            <!-- gebruiksperiode-start bij eenmalig gebruik-->
            <xsl:variable name="effectiveTimes-eenmalig" select="$mar-sorted/hl7:effectiveTime[not(@xsi:type) or (local-name-from-QName(resolve-QName(@xsi:type, .)) = 'TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
            <xsl:choose>
               <xsl:when test="count($effectiveTimes-eenmalig) = 1">
                  <xsl:comment>gebruiksperiode-start bij eenmalig gebruik</xsl:comment>
                  <xsl:call-template name="mp9-gebruiksperiode-start">
                     <xsl:with-param name="inputValue" select="$effectiveTimes-eenmalig/@value"/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                  </xsl:call-template>
               </xsl:when>
               <xsl:when test="count($effectiveTimes-eenmalig) = 0">
                  <!-- do nothing -->
               </xsl:when>
               <xsl:otherwise>
                  <xsl:comment>Found more then one instruction for eenmalig gebruik. Not supported to convert this into structured information for gebruiksperiode-start</xsl:comment>
               </xsl:otherwise>
            </xsl:choose>
            <!-- gebruiksperiode-eind -->
            <!-- in 6.12 kun je een conclusie trekken over gebruiksperiode-eind, als álle MARs een IVL_TS/high/@value hebben óf allemaal een start en een width-->
            <!--  zonder startdatum 'zweven' de periodes en kun je geen uitspraak doen over totale gebruiksduur-->
            <!--  zonder width is de gebruiksperiode tot nader order en wordt deze niet opgenomen-->
            <xsl:choose>
               <!-- alle MARs IVL_TS/high/@value-->
               <xsl:when test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:high/@value)])">
                  <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de hoogste high als gebruiksperiode einddatum -->
                  <xsl:variable name="eind-datums" as="element()*">
                     <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                        <xsl:sort data-type="number" select="nf:appendDate2DateTime(./@value)"/>
                        <xsl:sequence select="."/>
                     </xsl:for-each>
                  </xsl:variable>
                  <xsl:call-template name="mp9-gebruiksperiode-eind">
                     <xsl:with-param name="inputValue" select="$eind-datums[last()]/@value"/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                  </xsl:call-template>
               </xsl:when>
               <!-- alle MAR's een low én een width -->
               <xsl:when test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/(hl7:low/@value and hl7:width[@unit = 'd']/@value))])">
                  <!-- alle mar's hebben een low en een width. einddatums uitrekenen -->
                  <xsl:variable name="einddatums" as="element()*">
                     <xsl:for-each select="$IVL_TS">
                        <xsl:variable name="hl7-start-datum" select="./hl7:low/@value"/>
                        <!-- width is altijd in dagen in 6.12 -->
                        <xsl:variable name="hl7-width-in-days" select="./hl7:width/@value"/>
                        <xsl:variable name="xml-start-datum" as="xs:dateTime" select="nf:formatHL72XMLDate(nf:appendDate2DateTime($hl7-start-datum), 'SECONDEN')"/>
                        <xsl:variable name="xml-eind-datum" select="xs:dateTime($xml-start-datum + xs:dayTimeDuration(concat('P', $hl7-width-in-days, 'D')))"/>
                        <xml-eind-datum value="{$xml-eind-datum}"/>
                     </xsl:for-each>
                  </xsl:variable>
                  <xsl:variable name="einddatums-sorted" as="xs:dateTime*">
                     <xsl:for-each select="$einddatums/@value">
                        <xsl:sort data-type="text" select="."/>
                        <xsl:copy-of select="."/>
                     </xsl:for-each>
                  </xsl:variable>
                  <xsl:call-template name="mp9-gebruiksperiode-eind">
                     <xsl:with-param name="inputValue" select="nf:format2HL7Date(xs:string($einddatums-sorted[last()]), 'seconds')"/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                  </xsl:call-template>
               </xsl:when>
            </xsl:choose>
            <!-- identificatie -->
            <xsl:comment>The toedieningsafspraak/id is converted from the medicationDispenseEvent/id. Same root, extension string preconcatenated.</xsl:comment>
            <xsl:for-each select="./hl7:id[@extension]">
               <identificatie root="{./@root}" value="{concat('TAConverted_', ./@extension)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20134"/>
            </xsl:for-each>
            <!-- er is geen afspraakdatum in een 6.12 verstrekkingenbericht -->
            <!-- benaderen met verstrekkingsdatum -->
            <xsl:comment>Afspraakdatum is benaderd met de verstrekkingsdatum (medicationDispenseEvent/effectiveTime)</xsl:comment>
            <!-- afspraakdatum -->
            <xsl:for-each select="./hl7:effectiveTime[@value]">
               <afspraakdatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20133">
                  <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, nf:determine_date_precision(./@value))"/>
               </afspraakdatum>
            </xsl:for-each>
            <!-- gebruiksperiode -->
            <!-- alleen gebruiksperiode output bij 1 MAR die een width heeft, en bij meerder MAR's berekenen we indien mogelijk de einddatum -->
            <xsl:if test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) = 1]">
               <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                  <gebruiksperiode value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22660"/>
               </xsl:for-each>
            </xsl:if>
            <!-- geannuleerd indicator en stoptype wordt niet ondersteund in 6.12, geen output hiervoor-->
            <!--<geannuleerd_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23034" value="UNK"/>
             <stoptype value="1" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22498" code="1" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="Onderbreking"/>-->
            <!-- verstrekker -->
            <xsl:for-each select="./hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
               <xsl:variable name="verstrekker-complexType" select="$xsd-toedieningsafspraak//xs:element[@name = 'verstrekker']/@type"/>
               <xsl:variable name="xsd-verstrekker" select="$xsd-ada//xs:complexType[@name = $verstrekker-complexType]"/>
               <verstrekker conceptId="{$xsd-verstrekker/xs:attribute[@name='conceptId']/@fixed}">
                  <!-- zorgaanbieder -->
                  <xsl:variable name="zorgaanbieder-complexType" select="$xsd-verstrekker//xs:element[@name = 'zorgaanbieder']/@type"/>
                  <xsl:variable name="xsd-zorgaanbieder" select="$xsd-ada//xs:complexType[@name = $zorgaanbieder-complexType]"/>
                  <zorgaanbieder conceptId="{$xsd-zorgaanbieder/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:call-template name="mp9-zorgaanbieder">
                        <xsl:with-param name="hl7-current-organization" select="."/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-zorgaanbieder"/>
                     </xsl:call-template>
                  </zorgaanbieder>
               </verstrekker>
            </xsl:for-each>
            <!-- reden afspraak wordt niet ondersteund in 6.12 -->
            <!--         <reden_afspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22499" value="reden afspraak TA"/>-->
            <!-- geneesmiddel_bij_toedieningsafspraak  -->
            <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
               <xsl:variable name="geneesmiddel_bij_toedieningsafspraak-complexType" select="$xsd-toedieningsafspraak//xs:element[@name = 'geneesmiddel_bij_toedieningsafspraak']/@type"/>
               <xsl:variable name="xsd-geneesmiddel_bij_toedieningsafspraak" select="$xsd-ada//xs:complexType[@name = $geneesmiddel_bij_toedieningsafspraak-complexType]"/>
               <geneesmiddel_bij_toedieningsafspraak conceptId="{$xsd-geneesmiddel_bij_toedieningsafspraak/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
                     <xsl:with-param name="product-hl7" select="."/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-geneesmiddel" select="$xsd-geneesmiddel_bij_toedieningsafspraak"/>
                  </xsl:call-template>
               </geneesmiddel_bij_toedieningsafspraak>
            </xsl:for-each>

            <xsl:call-template name="mp9-gebruiksinstructie-from-mp612-2">
               <xsl:with-param name="effectiveTimes-eenmalig" select="$effectiveTimes-eenmalig"/>
               <xsl:with-param name="hl7-current-comp" select="."/>
               <xsl:with-param name="mar-sorted" select="$mar-sorted"/>
               <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
               <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
            </xsl:call-template>
            <!-- 6.12 kent geen aanvullende informatie en toelichting in vrije tekst -->
            <!--<aanvullende_informatie value="16" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23284" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.14.2053" displayName="Melding lareb"/>
         <toelichting conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22275" value="toelichting bij TA"/>-->
            <!-- MP 6.1x heeft wel een relatie naar het voorschrift (medicatieafspraak + verstrekkingsverzoek) maar geen relatie naar de bouwsteen medicatieafspraak. -->
            <!-- 1..1 R in MP 9 dus een nullFlavor -->
            <relatie_naar_medicatieafspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22394">
               <identificatie conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22395" value="NI" root="'2.16.840.1.113883.5.1008'"/>
            </relatie_naar_medicatieafspraak>
         </toedieningsafspraak>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-toedieningssnelheid">
      <xsl:param name="hl7-ratequantity"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-dosering"/>

      <xsl:for-each select="$hl7-ratequantity">
         <xsl:variable name="xsd-toedieningssnelheid-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningssnelheid']/@type"/>
         <xsl:variable name="xsd-toedieningssnelheid" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningssnelheid-complexType]"/>
         <toedieningssnelheid conceptId="{$xsd-toedieningssnelheid/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:variable name="xsd-waarde-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'waarde']/@type"/>
            <xsl:variable name="xsd-waarde" select="$xsd-ada//xs:complexType[@name = $xsd-waarde-complexType]"/>
            <waarde conceptId="{$xsd-waarde/xs:attribute[@name='conceptId']/@fixed}">
               <xsl:for-each select="./hl7:low">
                  <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'min']/@type"/>
                  <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <xsl:for-each select="./hl7:center">
                  <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'vaste_waarde']/@type"/>
                  <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <xsl:for-each select="./hl7:high">
                  <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'max']/@type"/>
                  <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
            </waarde>
            <xsl:variable name="ucum-eenheid" select="substring-before((./*/@unit)[1], '/')"/>
            <xsl:variable name="xsd-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'eenheid']/@type"/>
            <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
               <xsl:call-template name="UCUM2GstdBasiseenheid">
                  <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
               </xsl:call-template>
            </eenheid>
            <xsl:variable name="ucum-tijdseenheid" select="substring-after((./*/@unit)[1], '/')"/>
            <xsl:variable name="xsd-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'tijdseenheid']/@type"/>
            <tijdseenheid unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
         </toedieningssnelheid>
      </xsl:for-each>

   </xsl:template>
   <xsl:template name="mp9-vaste-frequentie-from-mp-612">
      <xsl:param name="current-hl7-pivl"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-toedieningsschema"/>
      <xsl:comment>mp9-vaste-frequentie-from-mp-612</xsl:comment>
      <xsl:for-each select="$current-hl7-pivl">
         <xsl:for-each select="./hl7:period">
            <xsl:variable name="vaste_frequentie_one_decimal">
               <xsl:choose>
                  <xsl:when test="./@value &lt; 1">
                     <xsl:value-of select="format-number(1 div ./@value, '#.0')"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="xs:float(1.0)"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:variable name="tijdseenheid">
               <xsl:choose>
                  <xsl:when test="./@value &lt; 1">
                     <xsl:value-of select="xs:integer(1)"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="./@value"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:variable name="vaste_frequentie_decimal" select="$vaste_frequentie_one_decimal - floor($vaste_frequentie_one_decimal)"/>
            <!-- only output the structured frequentie if the one decimal rounded to 0 -->
            <xsl:choose>
               <xsl:when test="$vaste_frequentie_decimal = 0">
                  <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                  <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                  <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                     <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                     <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                        <vaste_waarde value="{round($vaste_frequentie_one_decimal)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                     </aantal>
                     <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                     <tijdseenheid value="{$tijdseenheid}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                  </frequentie>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:comment>The period cannot be properly converted to a frequency integer. Period = <xsl:value-of select="./@value"/> <xsl:value-of select="./@unit"/> resulting in frequency/aantal rounded to one decimal of: <xsl:value-of select="$vaste_frequentie_one_decimal"/></xsl:comment>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
      </xsl:for-each>

   </xsl:template>
   <xsl:template name="mp9-verstrekking-from-mp612">
      <xsl:param name="current-hl7-verstrekking" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-mbh"/>
      <xsl:for-each select="$current-hl7-verstrekking">
         <xsl:variable name="xsd-verstrekking-complexType" select="$xsd-mbh//xs:element[@name = 'verstrekking']/@type"/>
         <xsl:variable name="xsd-verstrekking" select="$xsd-ada//xs:complexType[@name = $xsd-verstrekking-complexType]"/>
         <verstrekking conceptId="{$xsd-verstrekking/xs:attribute[@name='conceptId']/@fixed}">
            <!-- identificatie -->
            <xsl:for-each select="./hl7:id[@extension]">
               <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'identificatie']/@type"/>
               <identificatie root="{./@root}" value="{./@extension}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <!-- 6.12 heeft geen echte verstrekkingsdatum -->
            <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'datum']/@type"/>
            <datum nullFlavor="NI" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            <!-- 6.12 heeft de aanschrijfdatum -->
            <xsl:for-each select="./hl7:effectiveTime[@value]">
               <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'aanschrijfdatum']/@type"/>
               <aanschrijfdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <!-- verstrekker -->
            <xsl:for-each select="./hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
               <xsl:variable name="verstrekker-complexType" select="$xsd-verstrekking//xs:element[@name = 'verstrekker']/@type"/>
               <xsl:variable name="xsd-verstrekker" select="$xsd-ada//xs:complexType[@name = $verstrekker-complexType]"/>
               <verstrekker conceptId="{$xsd-verstrekker/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-zorgaanbieder">
                     <xsl:with-param name="hl7-current-organization" select="."/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-verstrekker"/>
                  </xsl:call-template>
               </verstrekker>
            </xsl:for-each>
            <!-- verstrekte_hoeveelheid -->
            <xsl:for-each select="./hl7:quantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
               <xsl:variable name="xsd-verstrekte_hoeveelheid-complexType" select="$xsd-verstrekking//xs:element[@name = 'verstrekte_hoeveelheid']/@type"/>
               <xsl:variable name="xsd-verstrekte_hoeveelheid" select="$xsd-ada//xs:complexType[@name = $xsd-verstrekte_hoeveelheid-complexType]"/>
               <verstrekte_hoeveelheid conceptId="{$xsd-verstrekte_hoeveelheid/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:variable name="xsd-complexType" select="$xsd-verstrekte_hoeveelheid//xs:element[@name = 'aantal']/@type"/>
                  <aantal value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                  <xsl:variable name="xsd-complexType" select="$xsd-verstrekte_hoeveelheid//xs:element[@name = 'eenheid']/@type"/>
                  <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                     </xsl:call-template>
                  </eenheid>
               </verstrekte_hoeveelheid>
            </xsl:for-each>
            <xsl:variable name="xsd-verstrekt_geneesmiddel-complexType" select="$xsd-verstrekking//xs:element[@name = 'verstrekt_geneesmiddel']/@type"/>
            <xsl:variable name="xsd-verstrekt_geneesmiddel" select="$xsd-ada//xs:complexType[@name = $xsd-verstrekt_geneesmiddel-complexType]"/>
            <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
               <verstrekt_geneesmiddel conceptId="{$xsd-verstrekt_geneesmiddel/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
                     <xsl:with-param name="product-hl7" select="."/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-geneesmiddel" select="$xsd-verstrekt_geneesmiddel"/>
                  </xsl:call-template>
               </verstrekt_geneesmiddel>
            </xsl:for-each>
            <xsl:for-each select="./hl7:expectedUseTime/hl7:width">
               <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'verbruiksduur']/@type"/>
               <verbruiksduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <!-- afleverlocatie, distributievorm, aanvullende_informatie, toelichting, relatie_naar_verstrekkingsverzoek 
               not in mp 6.12 verstrekking, no output -->
         </verstrekking>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="mp9-weekdag">
      <!-- mooier zou zijn om de weekdag uit te rekenen op basis van de datum -->
      <xsl:param name="hl7-phase-low"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-toedieningsschema"/>
      <xsl:variable name="hl7-weekdag" select="substring($hl7-phase-low/@value, 1, 8)"/>
      <xsl:variable name="weekdag-xml-date" select="nf:formatHL72XMLDate($hl7-weekdag, 'dag')"/>
      <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'weekdag']/@type"/>
      <weekdag conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
         <xsl:choose>
            <xsl:when test="nf:day-of-week($weekdag-xml-date) = 1">
               <xsl:attribute name="code">307145004</xsl:attribute>
               <xsl:attribute name="displayName">maandag</xsl:attribute>
               <xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
               <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="nf:day-of-week($weekdag-xml-date) = 2">
               <xsl:attribute name="code">307147007</xsl:attribute>
               <xsl:attribute name="displayName">dinsdag</xsl:attribute>
               <xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
               <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="nf:day-of-week($weekdag-xml-date) = 3">
               <xsl:attribute name="code">307148002</xsl:attribute>
               <xsl:attribute name="displayName">woensdag</xsl:attribute>
               <xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
               <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="nf:day-of-week($weekdag-xml-date) = 4">
               <xsl:attribute name="code">307149005</xsl:attribute>
               <xsl:attribute name="displayName">donderdag</xsl:attribute>
               <xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
               <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="nf:day-of-week($weekdag-xml-date) = 5">
               <xsl:attribute name="code">307150005</xsl:attribute>
               <xsl:attribute name="displayName">vrijdag</xsl:attribute>
               <xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
               <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="nf:day-of-week($weekdag-xml-date) = 6">
               <xsl:attribute name="code">307151009</xsl:attribute>
               <xsl:attribute name="displayName">zaterdag</xsl:attribute>
               <xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
               <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="nf:day-of-week($weekdag-xml-date) = 0">
               <xsl:attribute name="code">307146003</xsl:attribute>
               <xsl:attribute name="displayName">zondag</xsl:attribute>
               <xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
               <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
               <xsl:attribute name="nullFlavor">OTH</xsl:attribute>
               <originalText>Unable to convert input ('<xsl:value-of select="$hl7-weekdag"/>') to weekday.</originalText>
            </xsl:otherwise>
         </xsl:choose>
      </weekdag>
   </xsl:template>
   <xsl:template name="mp9-zonodig">
      <xsl:param name="max-dose" as="element()?"/>
      <xsl:param name="zonodig-code" as="element()?"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-dosering"/>
      <xsl:if test="$zonodig-code | $max-dose">
         <xsl:variable name="xsd-zo_nodig-complexType" select="$xsd-dosering//xs:element[@name = 'zo_nodig']/@type"/>
         <xsl:variable name="xsd-zo_nodig" select="$xsd-ada//xs:complexType[@name = $xsd-zo_nodig-complexType]"/>
         <zo_nodig conceptId="{$xsd-zo_nodig/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:for-each select="$zonodig-code">
               <xsl:variable name="xsd-criterium-complexType" select="$xsd-zo_nodig//xs:element[@name = 'criterium']/@type"/>
               <xsl:variable name="xsd-criterium" select="$xsd-ada//xs:complexType[@name = $xsd-criterium-complexType]"/>
               <criterium conceptId="{$xsd-criterium/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:variable name="xsd-complexType" select="$xsd-criterium//xs:element[@name = 'code']/@type"/>
                  <code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                     </xsl:call-template>
                  </code>
                  <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                  <!--  <omschrijving value="zo nodig criterium omschrijving in vrije tekst" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23270"/>-->
               </criterium>
            </xsl:for-each>
            <!-- TODO max dose -->
            <xsl:for-each select="$max-dose[.//@value]">
               <xsl:variable name="xsd-maximale_dosering-complexType" select="$xsd-zo_nodig//xs:element[@name = 'maximale_dosering']/@type"/>
               <xsl:variable name="xsd-maximale_dosering" select="$xsd-ada//xs:complexType[@name = $xsd-maximale_dosering-complexType]"/>
               <maximale_dosering conceptId="{$xsd-maximale_dosering/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:for-each select="(./hl7:numerator/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2'])">
                     <xsl:variable name="xsd-complexType" select="$xsd-maximale_dosering//xs:element[@name = 'aantal']/@type"/>
                     <aantal value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                     <xsl:variable name="xsd-complexType" select="$xsd-maximale_dosering//xs:element[@name = 'eenheid']/@type"/>
                     <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-code-attribs">
                           <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                     </eenheid>
                  </xsl:for-each>
                  <xsl:for-each select="(./hl7:denominator)">
                     <xsl:variable name="xsd-complexType" select="$xsd-maximale_dosering//xs:element[@name = 'tijdseenheid']/@type"/>
                     <tijdseenheid value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                  </xsl:for-each>
               </maximale_dosering>
            </xsl:for-each>
         </zo_nodig>        
      </xsl:if>
   </xsl:template>
   <xsl:template name="mp9-zorgaanbieder">
      <xsl:param name="hl7-current-organization"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-parent-of-zorgaanbieder"/>
      <xsl:variable name="zorgaanbieder2-complexType" select="$xsd-parent-of-zorgaanbieder//xs:element[@name = 'zorgaanbieder']/@type"/>
      <xsl:variable name="xsd-zorgaanbieder2" select="$xsd-ada//xs:complexType[@name = $zorgaanbieder2-complexType]"/>
      <xsl:for-each select="$hl7-current-organization">
         <zorgaanbieder conceptId="{$xsd-zorgaanbieder2/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:for-each select="./hl7:id">
               <xsl:variable name="xsd-complexType" select="$xsd-zorgaanbieder2//xs:element[@name = 'zorgaanbieder_identificatie_nummer']/@type"/>
               <zorgaanbieder_identificatie_nummer value="{./@extension}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
            <!-- fill with nullFlavor if necessary -->
            <xsl:variable name="xsd-complexType" select="$xsd-zorgaanbieder2//xs:element[@name = 'organisatie_naam']/@type"/>
            <organisatie_naam conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
               <xsl:choose>
                  <xsl:when test="./hl7:name">
                     <xsl:attribute name="value" select="./hl7:name/text()"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                  </xsl:otherwise>
               </xsl:choose>
            </organisatie_naam>
         </zorgaanbieder>
      </xsl:for-each>
   </xsl:template>
   <!-- Medication Kind 6.12 to ADA 9 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
      <xsl:param name="product-hl7" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-geneesmiddel"/>
      <xsl:variable name="xsd-product-complexType" select="$xsd-geneesmiddel//xs:element[@name = 'product']/@type"/>
      <xsl:variable name="xsd-product" select="$xsd-ada//xs:complexType[@name = $xsd-product-complexType]"/>
      <product conceptId="{$xsd-product/xs:attribute[@name='conceptId']/@fixed}">
         <xsl:for-each select="./hl7:code[@code or @nullFlavor]">
            <xsl:variable name="xsd-complexType" select="$xsd-product//xs:element[@name = 'product_code']/@type"/>
            <product_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
               <!-- Let op! Er is (nog?) geen ondersteuning voor optionele translations... -->
               <xsl:call-template name="mp9-code-attribs">
                  <xsl:with-param name="current-hl7-code" select="."/>
               </xsl:call-template>
            </product_code>
         </xsl:for-each>
         <xsl:for-each select=".[hl7:code[@nullFlavor]] | .[not(hl7:code)]">
            <xsl:variable name="xsd-product_specificatie-complexType" select="$xsd-product//xs:element[@name = 'product_specificatie']/@type"/>
            <xsl:variable name="xsd-product_specificatie" select="$xsd-ada//xs:complexType[@name = $xsd-product_specificatie-complexType]"/>
            <product_specificatie conceptId="{$xsd-product_specificatie/xs:attribute[@name='conceptId']/@fixed}">
               <!-- product_naam -->
               <xsl:for-each select="./hl7:code/hl7:originalText">
                  <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'product_naam']/@type"/>
                  <product_naam value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <!-- omschrijving -->
               <xsl:for-each select="./hl7:desc">
                  <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'omschrijving']/@type"/>
                  <omschrijving value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <!-- farmaceutische vorm -->
               <xsl:for-each select="./hl7:formCode">
                  <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'farmaceutische_vorm']/@type"/>
                  <farmaceutische_vorm conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                     </xsl:call-template>
                  </farmaceutische_vorm>
               </xsl:for-each>
               <!-- ingredient -->
               <xsl:for-each select="./hl7:activeIngredient | ./hl7:otherIngredient">
                  <xsl:variable name="xsd-ingredient-complexType" select="$xsd-product_specificatie//xs:element[@name = 'ingredient']/@type"/>
                  <xsl:variable name="xsd-ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-ingredient-complexType]"/>
                  <ingredient conceptId="{$xsd-ingredient/xs:attribute[@name='conceptId']/@fixed}">
                     <!-- sterkte -->
                     <xsl:for-each select="./hl7:quantity">
                        <xsl:variable name="xsd-sterkte-complexType" select="$xsd-ingredient//xs:element[@name = 'sterkte']/@type"/>
                        <xsl:variable name="xsd-sterkte" select="$xsd-ada//xs:complexType[@name = $xsd-sterkte-complexType]"/>
                        <sterkte conceptId="{$xsd-sterkte/xs:attribute[@name='conceptId']/@fixed}">
                           <!-- hoeveelheid_ingredient -->
                           <xsl:for-each select="./hl7:numerator[.//@value] | ./hl7:numerator[@nullFlavor]">
                              <xsl:variable name="xsd-hoeveelheid_ingredient-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_ingredient']/@type"/>
                              <xsl:variable name="xsd-hoeveelheid_ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_ingredient-complexType]"/>
                              <hoeveelheid_ingredient conceptId="{$xsd-hoeveelheid_ingredient/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                    <xsl:with-param name="hl7-num-or-denom" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_ingredient"/>
                                 </xsl:call-template>
                              </hoeveelheid_ingredient>
                           </xsl:for-each>
                           <!-- hoeveelheid_product  -->
                           <xsl:for-each select="./hl7:denominator[.//@value]">
                              <xsl:variable name="xsd-hoeveelheid_product-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_product']/@type"/>
                              <xsl:variable name="xsd-hoeveelheid_product" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_product-complexType]"/>
                              <hoeveelheid_product conceptId="{$xsd-hoeveelheid_product/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                    <xsl:with-param name="hl7-num-or-denom" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_product"/>
                                 </xsl:call-template>
                              </hoeveelheid_product>
                           </xsl:for-each>
                        </sterkte>
                     </xsl:for-each>
                     <!-- ingredient_code -->
                     <xsl:for-each select="./(hl7:activeIngredientMaterialKind | ./hl7:ingredientMaterialKind)/hl7:code">
                        <xsl:variable name="xsd-complexType" select="$xsd-ingredient//xs:element[@name = 'ingredient_code']/@type"/>
                        <ingredient_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                           <xsl:call-template name="mp9-code-attribs">
                              <xsl:with-param name="current-hl7-code" select="."/>
                           </xsl:call-template>
                        </ingredient_code>
                     </xsl:for-each>
                  </ingredient>
               </xsl:for-each>
            </product_specificatie>
         </xsl:for-each>
      </product>
   </xsl:template>
   <!-- Medication Dispense Event 6.12 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.110_20130521000000">
      <xsl:param name="current-dispense-event" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-mbh"/>
      <medicamenteuze_behandeling conceptId="{$xsd-mbh/xs:attribute[@name='conceptId']/@fixed}">
         <!-- mbh id is not known in 6.12. We have to make something up -->
         <xsl:for-each select="$current-dispense-event/hl7:id[@extension]">
            <xsl:variable name="identificatie-complexType" select="$xsd-mbh//xs:element[@name = 'identificatie']/@type"/>
            <xsl:comment>MBH id generated from 6.12 dispense identifier</xsl:comment>
            <identificatie value="{concat('MedBehConverted_', ./@extension)}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$identificatie-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
         </xsl:for-each>
         <xsl:call-template name="mp9-toedieningsafspraak-from-mp612">
            <xsl:with-param name="current-dispense-event" select="$current-dispense-event"/>
            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
            <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
         </xsl:call-template>
         <xsl:call-template name="mp9-verstrekking-from-mp612">
            <xsl:with-param name="current-hl7-verstrekking" select="."/>
            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
            <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
         </xsl:call-template>
      </medicamenteuze_behandeling>
   </xsl:template>
   <!-- PatientNL in verstrekking 6.12 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.816_20130521000000">
      <xsl:variable name="current-patient" select="."/>
      <patient conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19798">
         <!-- todo: support for unstructured name -->
         <xsl:for-each select="$current-patient/hl7:Person/hl7:name">
            <xsl:call-template name="mp9-naamgegevens">
               <xsl:with-param name="current-hl7-name" select="."/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:id">
            <patient_identificatienummer conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19829">
               <xsl:attribute name="root" select="./@root"/>
               <xsl:attribute name="value" select="./@extension"/>
            </patient_identificatienummer>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:Person/hl7:birthTime[@value]">
            <geboortedatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19830">
               <xsl:variable name="precision" select="nf:determine_date_precision(./@value)"/>
               <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, $precision)"/>
            </geboortedatum>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:Person/hl7:administrativeGenderCode">
            <xsl:call-template name="mp9-geslacht">
               <xsl:with-param name="current-administrativeGenderCode" select="."/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:Person/hl7:multipleBirthInd[@value]">
            <meerling_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19832">
               <xsl:attribute name="value" select="./@value"/>
            </meerling_indicator>
         </xsl:for-each>
      </patient>
   </xsl:template>
   <!-- Frequency -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139_toedieningsschema">
      <xsl:param name="PIVL_TS"/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-toedieningsschema"/>
      <!-- we are converting to toedieningsschema, cyclisch schema should be ignored here: phase/width -->
      <!-- we will deal with 'vaste toedieningstijd' later, let's also include those here: phase/center -->
      <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
      <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
      <xsl:for-each select="$PIVL_TS[not(hl7:phase/hl7:width)][not(hl7:phase/hl7:center)]">
         <xsl:for-each select="./hl7:period">
            <xsl:variable name="vaste_frequentie_one_decimal">
               <xsl:choose>
                  <xsl:when test="./@value &lt; 1">
                     <xsl:value-of select="format-number(1 div ./@value, '#.0')"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="xs:float(1.0)"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:variable name="tijdseenheid">
               <xsl:choose>
                  <xsl:when test="./@value &lt; 1">
                     <xsl:value-of select="xs:integer(1)"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="./@value"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:variable name="vaste_frequentie_decimal" select="$vaste_frequentie_one_decimal - floor($vaste_frequentie_one_decimal)"/>
            <!-- only output the structured frequentie if the one decimal rounded to 0 -->
            <xsl:choose>
               <xsl:when test="$vaste_frequentie_decimal = 0">
                  <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                  <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                  <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                     <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                     <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                        <vaste_waarde value="{round($vaste_frequentie_one_decimal)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                     </aantal>
                     <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                     <tijdseenheid value="{$tijdseenheid}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                  </frequentie>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:comment>The period cannot be properly converted to a frequency integer. Period = <xsl:value-of select="./@value"/> <xsl:value-of select="./@unit"/> resulting in frequency/aantal rounded to one decimal of: <xsl:value-of select="$vaste_frequentie_one_decimal"/></xsl:comment>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
         <!-- interval is not supported in MP 6.12 - no output -->
      </xsl:for-each>
      <xsl:for-each select="$PIVL_TS[hl7:phase/hl7:center]">
         <!-- only output frequentie if the hl7:period is more than one day ánd an integer -->
         <!-- once a day is implicit in toedieningstijd: take at noon daily, only need to add frequence when it is take at noon every other day... -->
         <!-- a time with an interval of more then once a day does not make sense -->
         <!-- not does a specific with an interval of a partial day (i.e. take at noon every 1,5 day does not make sense) -->
         <xsl:choose>
            <xsl:when test="./hl7:period[@value = '1'][@unit = 'd']"><!-- Do nothing, no need to output frequency of once a day --></xsl:when>
            <xsl:when test="./hl7:period[not(@unit = 'd')]">
               <xsl:comment>Found a schedule with a specific time and an interval unequal to 'd'. This is not allowed.</xsl:comment>
            </xsl:when>
            <xsl:when test="./hl7:period[@value castable as xs:integer and @value &gt; 1]">
               <!-- let's output the frequency -->
               <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                  <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                  <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                     <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                  </aantal>
                  <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                  <tijdseenheid value="{./hl7:period/@value}" unit="{nf:convertTime_UCUM2ADA_unit(./hl7:period/@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </frequentie>
            </xsl:when>
            <xsl:otherwise>
               <xsl:comment>Unexpected error with contents of period in toedieningsschema for toedieningstijd</xsl:comment>
            </xsl:otherwise>
         </xsl:choose>
         <!-- toedientijd -->
         <xsl:choose>
            <xsl:when test="./hl7:period[@value castable as xs:integer and @value &gt;= 1][@unit = 'd']">
               <!-- output the toedieningstijd -->
               <xsl:variable name="xsd-toedientijd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
               <xsl:variable name="xsd-toedientijd" select="$xsd-ada//xs:complexType[@name = $xsd-toedientijd-complexType]"/>
               <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7:phase/hl7:center/@value),nf:determine_date_precision(./hl7:phase/hl7:center/@value))}" conceptId="{$xsd-toedientijd/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:comment><!-- Do nothing --></xsl:comment>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      <!-- weekdag is not supported in MP 6.12 - no input, so no output -->
      <!-- dagdeel is not supported in MP 6.12 - no input, so no output -->
   </xsl:template>
   <!-- MP 9.0 CDA Author Participation -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
      <xsl:param name="author-hl7" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-auteur"/>

      <xsl:for-each select="$author-hl7/hl7:assignedAuthor">
         <xsl:variable name="zorgverlener-complexType" select="$xsd-auteur//xs:element[@name = 'zorgverlener']/@type"/>
         <xsl:variable name="xsd-zorgverlener" select="$xsd-ada//xs:complexType[@name = $zorgverlener-complexType]"/>
         <zorgverlener conceptId="{$xsd-zorgverlener/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:for-each select="./hl7:id">
               <xsl:variable name="xsd-complexType" select="$xsd-zorgverlener//xs:element[@name = 'zorgverlener_identificatie_nummer']/@type"/>
               <zorgverlener_identificatie_nummer value="{./@extension}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:assignedPerson/hl7:name">
               <xsl:variable name="zorgverlener_naam-complexType" select="$xsd-zorgverlener//xs:element[@name = 'zorgverlener_naam']/@type"/>
               <xsl:variable name="xsd-zorgverlener_naam" select="$xsd-ada//xs:complexType[@name = $zorgverlener_naam-complexType]"/>
               <zorgverlener_naam conceptId="{$xsd-zorgverlener_naam/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:variable name="naamgegevens-complexType" select="$xsd-zorgverlener_naam//xs:element[@name = 'naamgegevens']/@type"/>
                  <xsl:variable name="xsd-naamgegevens" select="$xsd-ada//xs:complexType[@name = $naamgegevens-complexType]"/>
                  <naamgegevens conceptId="{$xsd-naamgegevens/xs:attribute[@name='conceptId']/@fixed}">
                     <!-- ongestructureerde_naam -->
                     <xsl:for-each select=".[text()][not(child::*)]">
                        <xsl:variable name="xsd-complexType" select="$xsd-naamgegevens//xs:element[@name = 'ongestructureerde_naam']/@type"/>
                        <ongestructureerde_naam conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                           <xsl:attribute name="value">
                              <xsl:value-of select="."/>
                           </xsl:attribute>
                        </ongestructureerde_naam>
                        <!-- achternaam is 1..1R, die vullen we dan maar even met een nullFlavor vanwege ada xsd foutmeldingen -->
                        <xsl:variable name="geslachtsnaam-complexType" select="$xsd-naamgegevens//xs:element[@name = 'geslachtsnaam']/@type"/>
                        <xsl:variable name="xsd-geslachtsnaam" select="$xsd-ada//xs:complexType[@name = $geslachtsnaam-complexType]"/>
                        <geslachtsnaam conceptId="{$xsd-geslachtsnaam/xs:attribute[@name='conceptId']/@fixed}">
                           <xsl:variable name="xsd-complexType" select="$xsd-geslachtsnaam//xs:element[@name = 'achternaam']/@type"/>
                           <achternaam nullFlavor="NI" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </geslachtsnaam>
                     </xsl:for-each>
                     <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                        <xsl:variable name="xsd-complexType" select="$xsd-naamgegevens//xs:element[@name = 'voornamen']/@type"/>
                        <voornamen value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                     </xsl:for-each>
                     <xsl:for-each select="./hl7:given[@qualifier = 'IN']">
                        <!-- in HL7 mogen de initialen van officiële voornamen niet herhaald / gedupliceerd worden in het initialen veld -->
                        <!-- in de zib moeten de initialen juist compleet zijn, dus de initialen hier toevoegen van de officiële voornamen -->
                        <xsl:variable name="initialen_concatted">
                           <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                              <xsl:for-each select="tokenize(., ' ')">
                                 <xsl:value-of select="concat(substring(., 1, 1), '.')"/>
                              </xsl:for-each>
                           </xsl:for-each>
                           <xsl:for-each select="./hl7:given[@qualifier = 'IN']">
                              <xsl:value-of select="./text()"/>
                           </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="xsd-complexType" select="$xsd-naamgegevens//xs:element[@name = 'initialen']/@type"/>
                        <initialen value="{$initialen_concatted}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                     </xsl:for-each>
                     <xsl:for-each select="./hl7:family">
                        <xsl:variable name="geslachtsnaam-complexType" select="$xsd-naamgegevens//xs:element[@name = 'geslachtsnaam']/@type"/>
                        <xsl:variable name="xsd-geslachtsnaam" select="$xsd-ada//xs:complexType[@name = $geslachtsnaam-complexType]"/>
                        <geslachtsnaam conceptId="{$xsd-geslachtsnaam/xs:attribute[@name='conceptId']/@fixed}">
                           <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1]">
                              <xsl:variable name="xsd-complexType" select="$xsd-geslachtsnaam//xs:element[@name = 'voorvoegsels']/@type"/>
                              <voorvoegsels value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                           </xsl:for-each>
                           <xsl:variable name="xsd-complexType" select="$xsd-geslachtsnaam//xs:element[@name = 'achternaam']/@type"/>
                           <achternaam value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </geslachtsnaam>
                     </xsl:for-each>
                  </naamgegevens>
               </zorgverlener_naam>
            </xsl:for-each>
            <!-- specialisme -->
            <xsl:for-each select="./hl7:code">
               <xsl:variable name="xsd-complexType" select="$xsd-zorgverlener//xs:element[@name = 'specialisme']/@type"/>
               <specialisme conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </specialisme>
            </xsl:for-each>
            <xsl:for-each select="./hl7:representedOrganization">
               <xsl:variable name="zorgaanbieder-complexType" select="$xsd-zorgverlener//xs:element[@name = 'zorgaanbieder']/@type"/>
               <xsl:variable name="xsd-zorgaanbieder" select="$xsd-ada//xs:complexType[@name = $zorgaanbieder-complexType]"/>
               <zorgaanbieder conceptId="{$xsd-zorgaanbieder/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-zorgaanbieder">
                     <xsl:with-param name="hl7-current-organization" select="."/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-zorgaanbieder"/>
                  </xsl:call-template>
               </zorgaanbieder>
            </xsl:for-each>
         </zorgverlener>
      </xsl:for-each>
   </xsl:template>

   <!-- MP 9.0 MP CDA Medication Information -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
      <xsl:param name="product-hl7" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-geneesmiddel"/>
      <xsl:variable name="xsd-product-complexType" select="$xsd-geneesmiddel//xs:element[@name = 'product']/@type"/>
      <xsl:variable name="xsd-product" select="$xsd-ada//xs:complexType[@name = $xsd-product-complexType]"/>
      <product conceptId="{$xsd-product/xs:attribute[@name='conceptId']/@fixed}">
         <xsl:variable name="xsd-complexType" select="$xsd-product//xs:element[@name = 'product_code']/@type"/>
         <product_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:for-each select="./hl7:code">
               <!-- Let op! Er is (nog?) geen ondersteuning voor optionele translations... -->
               <xsl:call-template name="mp9-code-attribs">
                  <xsl:with-param name="current-hl7-code" select="."/>
               </xsl:call-template>
            </xsl:for-each>
         </product_code>
         <xsl:for-each select=".[hl7:code[@nullFlavor]] | .[not(hl7:code)]">
            <xsl:variable name="xsd-product_specificatie-complexType" select="$xsd-product//xs:element[@name = 'product_specificatie']/@type"/>
            <xsl:variable name="xsd-product_specificatie" select="$xsd-ada//xs:complexType[@name = $xsd-product_specificatie-complexType]"/>
            <product_specificatie conceptId="{$xsd-product_specificatie/xs:attribute[@name='conceptId']/@fixed}">
               <!-- naam -->
               <xsl:for-each select="./hl7:name">
                  <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'product_naam']/@type"/>
                  <product_naam value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <!-- omschrijving -->
               <xsl:for-each select="./pharm:desc">
                  <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'omschrijving']/@type"/>
                  <omschrijving value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <!-- farmaceutische vorm -->
               <xsl:for-each select="./pharm:formCode">
                  <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'farmaceutische_vorm']/@type"/>
                  <farmaceutische_vorm conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                     <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                     </xsl:call-template>
                  </farmaceutische_vorm>
               </xsl:for-each>
               <!-- ingredient -->
               <xsl:for-each select="./pharm:ingredient">
                  <xsl:variable name="xsd-ingredient-complexType" select="$xsd-product_specificatie//xs:element[@name = 'ingredient']/@type"/>
                  <xsl:variable name="xsd-ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-ingredient-complexType]"/>
                  <ingredient conceptId="{$xsd-ingredient/xs:attribute[@name='conceptId']/@fixed}">
                     <!-- sterkte -->
                     <xsl:for-each select="./pharm:quantity">
                        <xsl:variable name="xsd-sterkte-complexType" select="$xsd-ingredient//xs:element[@name = 'sterkte']/@type"/>
                        <xsl:variable name="xsd-sterkte" select="$xsd-ada//xs:complexType[@name = $xsd-sterkte-complexType]"/>
                        <sterkte conceptId="{$xsd-sterkte/xs:attribute[@name='conceptId']/@fixed}">
                           <!-- hoeveelheid_ingredient -->
                           <xsl:for-each select="./hl7:numerator[.//@value]">
                              <xsl:variable name="xsd-hoeveelheid_ingredient-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_ingredient']/@type"/>
                              <xsl:variable name="xsd-hoeveelheid_ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_ingredient-complexType]"/>
                              <hoeveelheid_ingredient conceptId="{$xsd-hoeveelheid_ingredient/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                    <xsl:with-param name="hl7-num-or-denom" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_ingredient"/>
                                 </xsl:call-template>
                              </hoeveelheid_ingredient>
                           </xsl:for-each>
                           <!-- hoeveelheid_product  -->
                           <xsl:for-each select="./hl7:denominator[.//@value]">
                              <xsl:variable name="xsd-hoeveelheid_product-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_product']/@type"/>
                              <xsl:variable name="xsd-hoeveelheid_product" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_product-complexType]"/>
                              <hoeveelheid_product conceptId="{$xsd-hoeveelheid_product/xs:attribute[@name='conceptId']/@fixed}">
                                 <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                    <xsl:with-param name="hl7-num-or-denom" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_product"/>
                                 </xsl:call-template>
                              </hoeveelheid_product>
                           </xsl:for-each>
                        </sterkte>
                     </xsl:for-each>
                     <!-- ingredient_code -->
                     <xsl:for-each select="./pharm:ingredient/pharm:code">
                        <xsl:variable name="xsd-complexType" select="$xsd-ingredient//xs:element[@name = 'ingredient_code']/@type"/>
                        <ingredient_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                           <xsl:call-template name="mp9-code-attribs">
                              <xsl:with-param name="current-hl7-code" select="."/>
                           </xsl:call-template>
                        </ingredient_code>
                     </xsl:for-each>
                  </ingredient>
               </xsl:for-each>
            </product_specificatie>
         </xsl:for-each>
      </product>
   </xsl:template>

   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
      <xsl:param name="current_IVL" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-toedieningsschema"/>
      <xsl:for-each select="$current_IVL/hl7nl:phase/hl7nl:low">
         <!-- toedientijd indien van toepassing -->
         <xsl:if test="string-length(./@value) > 8">
            <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
            <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
         </xsl:if>
         <xsl:call-template name="mp9-weekdag">
            <xsl:with-param name="hl7-phase-low" select="."/>
            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
            <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>

   <!-- HL7NL Frequency -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-toedieningsschema"/>

      <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
      <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
      <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
         <xsl:for-each select="./hl7nl:frequency/hl7nl:numerator">
            <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
            <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
            <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
               <xsl:for-each select=".//hl7nl:low[@value]">
                  <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'min']/@type"/>
                  <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
               <xsl:if test=".[@value]">
                  <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                  <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:if>
               <xsl:for-each select=".//hl7nl:high[@value]">
                  <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'max']/@type"/>
                  <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
               </xsl:for-each>
            </aantal>
         </xsl:for-each>
         <xsl:for-each select="./hl7nl:frequency/hl7nl:denominator">
            <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
            <tijdseenheid value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
         </xsl:for-each>
      </frequentie>

   </xsl:template>
   <!-- Medicatieafspraak MP 9.0 Inhoud -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
      <xsl:param name="ma_hl7_90" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-mbh"/>
      <xsl:variable name="ma-complexType" select="$xsd-mbh//xs:element[@name = 'medicatieafspraak']/@type"/>
      <xsl:variable name="xsd-ma" select="$xsd-ada//xs:complexType[@name = $ma-complexType]"/>
      <!-- medicatieafspraak, zonder stoptype -->
      <!-- in 6.12 worden stoptypes niet begrepen -->
      <xsl:for-each select="$ma_hl7_90">
         <medicatieafspraak conceptId="{$xsd-ma/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:variable name="IVL_TS" select="./hl7:effectiveTime[@xsi:type = 'IVL_TS']"/>
            <xsl:for-each select="$IVL_TS/hl7:low">
               <xsl:call-template name="mp9-gebruiksperiode-start">
                  <xsl:with-param name="inputValue" select="./@value"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-comp" select="$xsd-ma"/>
               </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="$IVL_TS/hl7:high">
               <xsl:call-template name="mp9-gebruiksperiode-eind">
                  <xsl:with-param name="inputValue" select="./@value"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-comp" select="$xsd-ma"/>
               </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="./hl7:id">
               <identificatie value="{./@extension}" root="{./@root}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19758"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:author/hl7:time">
               <afspraakdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19757"/>
            </xsl:for-each>
            <xsl:for-each select="$IVL_TS/hl7:width">
               <gebruiksperiode value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19936"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:statusCode">
               <geannuleerd_indicator value="{./@code='nullified'}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23033"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9067']/hl7:value">
               <stoptype conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19954">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </stoptype>
            </xsl:for-each>
            <!-- relatie_naar_afspraak_of_gebruik -->
            <!-- relatie_naar ma -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
               <!-- medicatieafspraak -->
               <relatie_naar_afspraak_of_gebruik conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23238">
                  <identificatie root="{./@root}" value="{./@extension}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23239"/>
               </relatie_naar_afspraak_of_gebruik>
            </xsl:for-each>
            <!-- relatie_naar ta -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9101']/hl7:id">
               <!-- toedieningsafspraak -->
               <relatie_naar_afspraak_of_gebruik conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23238">
                  <identificatie_23288 root="{./@root}" value="{./@extension}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23288"/>
               </relatie_naar_afspraak_of_gebruik>
            </xsl:for-each>
            <!-- relatie_naar gb -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9176']/hl7:id">
               <!-- medicatiegebruik -->
               <relatie_naar_afspraak_of_gebruik conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23238">
                  <identificatie_23289 root="{./@root}" value="{./@extension}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23289"/>
               </relatie_naar_afspraak_of_gebruik>
            </xsl:for-each>
            <!-- voorschrijver -->
            <xsl:variable name="voorschrijver-complexType" select="$xsd-ma//xs:element[@name = 'voorschrijver']/@type"/>
            <xsl:variable name="xsd-voorschrijver" select="$xsd-ada//xs:complexType[@name = $voorschrijver-complexType]"/>
            <voorschrijver conceptId="{$xsd-voorschrijver/xs:attribute[@name='conceptId']/@fixed}">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                  <xsl:with-param name="author-hl7" select="./hl7:author"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-auteur" select="$xsd-voorschrijver"/>
               </xsl:call-template>
            </voorschrijver>
            <!-- reden afspraak -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9068']/hl7:value">
               <reden_afspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22094">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </reden_afspraak>
            </xsl:for-each>
            <!-- reden van voorschrijven -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9160']/hl7:value">
               <reden_van_voorschrijven conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23133">
                  <probleem conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23134">
                     <probleem_naam conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23136">
                        <xsl:call-template name="mp9-code-attribs">
                           <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                     </probleem_naam>
                  </probleem>
               </reden_van_voorschrijven>
            </xsl:for-each>
            <!-- afgesproken_geneesmiddel -->
            <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
               <xsl:variable name="xsd-afgesproken_geneesmiddel-complexType" select="$xsd-ma//xs:element[@name = 'afgesproken_geneesmiddel']/@type"/>
               <xsl:variable name="xsd-afgesproken_geneesmiddel" select="$xsd-ada//xs:complexType[@name = $xsd-afgesproken_geneesmiddel-complexType]"/>
               <afgesproken_geneesmiddel conceptId="{$xsd-afgesproken_geneesmiddel/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product-hl7" select="."/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-geneesmiddel" select="$xsd-afgesproken_geneesmiddel"/>
                  </xsl:call-template>
               </afgesproken_geneesmiddel>
            </xsl:for-each>
            <!-- gebruiksinstructie -->
            <xsl:call-template name="mp9-gebruiksinstructie-from-mp9">
               <xsl:with-param name="hl7-comp" select="."/>
               <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
               <xsl:with-param name="xsd-comp" select="$xsd-ma"/>
            </xsl:call-template>
            <!-- lichaamslengte  -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9122']/hl7:value">
               <lichaamslengte conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23023">
                  <lengte_waarde value="{./@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23024"> </lengte_waarde>
               </lichaamslengte>
            </xsl:for-each>
            <!-- lichaamsgewicht  -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9123']/hl7:value">
               <lichaamsgewicht conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23028">
                  <gewicht_waarde value="{./@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23029"/>
               </lichaamsgewicht>
            </xsl:for-each>
            <!-- aanvullende_informatie -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value">
               <aanvullende_informatie conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23283">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </aanvullende_informatie>
            </xsl:for-each>
            <!-- toelichting -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9069']/hl7:text">
               <toelichting value="{./text()}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22273"/>
            </xsl:for-each>
         </medicatieafspraak>
      </xsl:for-each>
   </xsl:template>
   <!-- Medicatieafspraak MP 9.0 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9216_20180423130413">
      <xsl:param name="ma_hl7_90" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-mbh"/>
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
         <xsl:with-param name="ma_hl7_90" select="$ma_hl7_90"/>
         <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
         <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
      </xsl:call-template>
   </xsl:template>
   <!-- Verstrekkingsverzoek MP 9.0 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9231_20180423130413">
      <xsl:param name="vv_hl7_90" select="."/>
      <xsl:param name="xsd-ada"/>
      <xsl:param name="xsd-mbh"/>
      <xsl:variable name="vv-complexType" select="$xsd-mbh//xs:element[@name = 'verstrekkingsverzoek']/@type"/>
      <xsl:variable name="xsd-vv" select="$xsd-ada//xs:complexType[@name = $vv-complexType]"/>
      <!-- verstrekkingsverzoek  -->
      <xsl:for-each select="$vv_hl7_90">
         <verstrekkingsverzoek conceptId="{$xsd-vv/xs:attribute[@name='conceptId']/@fixed}">
            <!-- identificatie -->
            <xsl:for-each select="./hl7:id">
               <identificatie value="{./@extension}" root="{./@root}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22003"/>
            </xsl:for-each>
            <!-- datum -->
            <xsl:for-each select="./hl7:author/hl7:time">
               <datum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20060"/>
            </xsl:for-each>
            <!-- auteur -->
            <xsl:variable name="auteur-complexType" select="$xsd-vv//xs:element[@name = 'auteur']/@type"/>
            <xsl:variable name="xsd-auteur" select="$xsd-ada//xs:complexType[@name = $auteur-complexType]"/>
            <auteur conceptId="{$xsd-auteur/xs:attribute[@name='conceptId']/@fixed}">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                  <xsl:with-param name="author-hl7" select="./hl7:author"/>
                  <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                  <xsl:with-param name="xsd-auteur" select="$xsd-auteur"/>
               </xsl:call-template>
            </auteur>
            <!-- te_verstrekken_hoeveelheid -->
            <xsl:for-each select="./hl7:quantity">
               <te_verstrekken_hoeveelheid conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19964">
                  <xsl:for-each select="./hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']">
                     <aantal value="{./@value}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22599"/>
                     <eenheid conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22600">
                        <xsl:call-template name="mp9-code-attribs">
                           <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                     </eenheid>
                  </xsl:for-each>
               </te_verstrekken_hoeveelheid>
            </xsl:for-each>
            <!-- aantal_herhalingen -->
            <xsl:for-each select="./hl7:repeatNumber">
               <aantal_herhalingen value="{number(./@value)-1}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22120"/>
            </xsl:for-each>
            <!-- te_verstrekken_geneesmiddel  -->
            <xsl:for-each select="./hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
               <xsl:variable name="xsd-te_verstrekken_geneesmiddel-complexType" select="$xsd-vv//xs:element[@name = 'te_verstrekken_geneesmiddel']/@type"/>
               <xsl:variable name="xsd-te_verstrekken_geneesmiddel" select="$xsd-ada//xs:complexType[@name = $xsd-te_verstrekken_geneesmiddel-complexType]"/>
               <te_verstrekken_geneesmiddel conceptId="{$xsd-te_verstrekken_geneesmiddel/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product-hl7" select="."/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-geneesmiddel" select="$xsd-te_verstrekken_geneesmiddel"/>
                  </xsl:call-template>
               </te_verstrekken_geneesmiddel>
            </xsl:for-each>
            <!-- verbruiksperiode -->
            <xsl:for-each select="./hl7:expectedUseTime/hl7:width">
               <verbruiksperiode conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20062">
                  <duur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20065"/>
               </verbruiksperiode>
            </xsl:for-each>
            <xsl:for-each select="./hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
               <xsl:variable name="xsd-beoogd_verstrekker-complexType" select="$xsd-vv//xs:element[@name = 'beoogd_verstrekker']/@type"/>
               <xsl:variable name="xsd-beoogd_verstrekker" select="$xsd-ada//xs:complexType[@name = $xsd-beoogd_verstrekker-complexType]"/>
               <beoogd_verstrekker conceptId="{$xsd-beoogd_verstrekker/xs:attribute[@name='conceptId']/@fixed}">
                  <xsl:call-template name="mp9-zorgaanbieder">
                     <xsl:with-param name="hl7-current-organization" select="."/>
                     <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                     <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-beoogd_verstrekker"/>
                  </xsl:call-template>
               </beoogd_verstrekker>
            </xsl:for-each>
            <xsl:for-each select="./hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
               <xsl:variable name="concatted_text">
                  <xsl:for-each select="./*">
                     <xsl:value-of select="concat(./text(), ' ')"/>
                  </xsl:for-each>
               </xsl:variable>
               <afleverlocatie value="{normalize-space($concatted_text)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20068"/>
            </xsl:for-each>
            <!-- aanvullende_wensen -->
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9093']/hl7:code">
               <aanvullende_wensen conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22759">
                  <xsl:call-template name="mp9-code-attribs">
                     <xsl:with-param name="current-hl7-code" select="."/>
                  </xsl:call-template>
               </aanvullende_wensen>
            </xsl:for-each>
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9069']/hl7:text">
               <toelichting value="{./text()}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22274"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
               <relatie_naar_medicatieafspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23286">
                  <identificatie value="{./@extension}" root="{./@root}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23287"/>
               </relatie_naar_medicatieafspraak>
            </xsl:for-each>
         </verstrekkingsverzoek>
      </xsl:for-each>
   </xsl:template>
   <!-- PatientNL in voorschrift 9.0.x -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
      <xsl:param name="current-patient" select="."/>
      <patient conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19798">
         <xsl:for-each select="$current-patient/hl7:patient/hl7:name">
            <xsl:call-template name="mp9-naamgegevens">
               <xsl:with-param name="current-hl7-name" select="."/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:id">
            <patient_identificatienummer conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19829">
               <xsl:attribute name="root" select="./@root"/>
               <xsl:attribute name="value" select="./@extension"/>
            </patient_identificatienummer>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:patient/hl7:birthTime[@value]">
            <geboortedatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19830">
               <xsl:variable name="precision" select="nf:determine_date_precision(./@value)"/>
               <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, $precision)"/>
            </geboortedatum>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:patient/hl7:administrativeGenderCode">
            <xsl:call-template name="mp9-geslacht">
               <xsl:with-param name="current-administrativeGenderCode" select="."/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:for-each select="$current-patient/hl7:patient/sdtc:multipleBirthInd[@value]">
            <meerling_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19832">
               <xsl:attribute name="value" select="./@value"/>
            </meerling_indicator>
         </xsl:for-each>
      </patient>
   </xsl:template>
   <!-- helper stuff -->
   <xsl:template name="chooseOperatorAttrib">
      <xsl:param name="operator"/>
      <xsl:choose>
         <xsl:when test="$operator = 'A' or $operator = 'I'">
            <xsl:attribute name="operator" select="$operator"/>
         </xsl:when>
         <xsl:otherwise>
            <!-- geen attribuut opnemen -->
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="make_UCUM2Gstandard_translation">
      <!-- Produceert een regel met de <translation> van a UCUM unit naar de G-standaard -->
      <xsl:param name="UCUMvalue"/>
      <xsl:param name="UCUMunit"/>
      <xsl:choose>
         <xsl:when test="$UCUMunit eq 'ug'">
            <translation value="{$UCUMvalue}" code="252" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Microgram"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'mg'">
            <translation value="{$UCUMvalue}" code="229" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milligram"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'g'">
            <translation value="{$UCUMvalue}" code="215" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Gram"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'ul'">
            <translation value="{$UCUMvalue}" code="254" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Microliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'ml'">
            <translation value="{$UCUMvalue}" code="233" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milliliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'l'">
            <translation value="{$UCUMvalue}" code="222" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Liter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq '[drp]'">
            <translation value="{$UCUMvalue}" code="303" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Druppel"/>
         </xsl:when>
         <!--
            Tablespoons en teaspoons zijn geschrapt uit de lijst units omdat ze niet nauwkeurig zijn. 
         <xsl:when test="$UCUMunit eq '[tsp_us]'">
            <translation value="{$UCUMvalue * 5}" code="233" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milliliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq '[tbs_us]'">
            <translation value="{$UCUMvalue * 15}" code="233" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milliliter"/> 
         </xsl:when>
         -->
         <xsl:when test="$UCUMunit eq '[iU]'">
            <translation value="{$UCUMvalue}" code="217" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Internat.eenh."/>
         </xsl:when>
         <xsl:when test="($UCUMunit eq '1')">
            <translation value="{$UCUMvalue}" code="245" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="stuk"/>
         </xsl:when>
         <xsl:when test="(lower-case($UCUMunit) eq 'eenheid')">
            <translation value="{$UCUMvalue}" code="211" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Eenheid"/>
         </xsl:when>
         <xsl:when test="(lower-case($UCUMunit) eq 'dosis')">
            <translation value="{$UCUMvalue}" code="208" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="dosis"/>
         </xsl:when>
         <xsl:otherwise>
            <translation value="{$UCUMvalue}" code="0" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="niet ondersteunde UCUM eenheid: {$UCUMunit}"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="UCUM2GstdBasiseenheid">
      <xsl:param name="UCUM"/>

      <xsl:variable name="gstd-code">
         <xsl:choose>
            <xsl:when test="string-length($UCUM) > 0">
               <xsl:choose>
                  <xsl:when test="$UCUM = 'cm'">205</xsl:when>
                  <xsl:when test="$UCUM = 'g'">215</xsl:when>
                  <xsl:when test="$UCUM = '[iU]'">217</xsl:when>
                  <xsl:when test="$UCUM = 'kg'">219</xsl:when>
                  <xsl:when test="$UCUM = 'l'">222</xsl:when>
                  <xsl:when test="$UCUM = 'mg'">229</xsl:when>
                  <xsl:when test="$UCUM = 'ml'">233</xsl:when>
                  <xsl:when test="$UCUM = 'mm'">234</xsl:when>
                  <xsl:when test="$UCUM = '1'">245</xsl:when>
                  <xsl:when test="$UCUM = 'ug'">252</xsl:when>
                  <xsl:when test="$UCUM = 'ul'">254</xsl:when>
                  <xsl:when test="$UCUM = '[drp]'">303</xsl:when>
                  <xsl:otherwise>Not supported UCUM eenheid, cannot convert to G-standaard basiseenheid: <xsl:value-of select="$UCUM"/></xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <!-- geen waarde meegekregen --> UCUM is an empty string. Not supported to convert to G-standaard basiseenheid. </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="gstd-displayname">
         <xsl:choose>
            <xsl:when test="string-length($UCUM) > 0">
               <xsl:choose>
                  <xsl:when test="$UCUM = 'cm'">centimeter</xsl:when>
                  <xsl:when test="$UCUM = 'g'">gram</xsl:when>
                  <xsl:when test="$UCUM = '[iU]'">internationale eenheid</xsl:when>
                  <xsl:when test="$UCUM = 'kg'">kilogram</xsl:when>
                  <xsl:when test="$UCUM = 'l'">liter</xsl:when>
                  <xsl:when test="$UCUM = 'mg'">milligram</xsl:when>
                  <xsl:when test="$UCUM = 'ml'">milliliter</xsl:when>
                  <xsl:when test="$UCUM = 'mm'">millimeter</xsl:when>
                  <xsl:when test="$UCUM = '1'">stuk</xsl:when>
                  <xsl:when test="$UCUM = 'ug'">microgram</xsl:when>
                  <xsl:when test="$UCUM = 'ul'">microliter</xsl:when>
                  <xsl:when test="$UCUM = '[drp]'">druppel</xsl:when>
                  <xsl:otherwise>Not supported UCUM eenheid, cannot convert to G-standaard basiseenheid: <xsl:value-of select="$UCUM"/></xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <!-- geen waarde meegekregen --> UCUM is an empty string. Not supported to convert to G-standaard basiseenheid. </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:attribute name="code" select="$gstd-code"/>
      <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.2.4.4.1.900.2'"/>
      <xsl:attribute name="displayName" select="$gstd-displayname"/>
   </xsl:template>
   <xsl:function name="nf:convertGstdBasiseenheid2UCUM" as="xs:string">
      <xsl:param name="GstdBasiseenheid_code" as="xs:string"/>

      <xsl:choose>
         <xsl:when test="$GstdBasiseenheid_code castable as xs:integer">
            <xsl:choose>
               <xsl:when test="$GstdBasiseenheid_code = '205'">cm</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '208'">1</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '211'">1</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '215'">g</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '217'">[iU]</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '219'">kg</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '222'">l</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '229'">mg</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '233'">ml</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '234'">mm</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '245'">1</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '252'">ug</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '254'">ul</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '303'">[drp]</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '345'">1</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '490'">1</xsl:when>
               <xsl:when test="$GstdBasiseenheid_code = '500'">1</xsl:when>
               <xsl:otherwise>Not supported G-standaard basiseenheid: <xsl:value-of select="$GstdBasiseenheid_code"/></xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <!-- geen integer meegekregen --> G-standaard code is not an integer. Not supported G-standaard basiseenheid: "<xsl:value-of select="$GstdBasiseenheid_code"/>". </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="$GstdBasiseenheid_code castable as xs:integer"> </xsl:if>
   </xsl:function>
   <xsl:function name="nf:convertUnit_UCUM2ADA" as="xs:string">
      <xsl:param name="UCUMunit" as="xs:string"/>
      <xsl:choose>
         <xsl:when test="lower-case($UCUMunit) eq 'g'">g</xsl:when>
         <xsl:when test="lower-case($UCUMunit) eq 'kg'">kg</xsl:when>
         <xsl:when test="lower-case($UCUMunit) eq 'cm'">cm</xsl:when>
         <xsl:when test="lower-case($UCUMunit) eq 'm'">m</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$UCUMunit"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="nf:convertTime_UCUM2ADA_unit" as="xs:string?">
      <xsl:param name="UCUM-time" as="xs:string?"/>
      <xsl:if test="$UCUM-time">
         <xsl:choose>
            <xsl:when test="$UCUM-time = 's'">seconde</xsl:when>
            <xsl:when test="$UCUM-time = 'min'">minuut</xsl:when>
            <xsl:when test="$UCUM-time = 'h'">uur</xsl:when>
            <xsl:when test="$UCUM-time = 'd'">dag</xsl:when>
            <xsl:when test="$UCUM-time = 'wk'">week</xsl:when>
            <xsl:when test="$UCUM-time = 'mo'">maand</xsl:when>
            <xsl:when test="$UCUM-time = 'a'">jaar</xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="concat('onbekende tijdseenheid: ', $UCUM-time)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:function>
   <xsl:function name="nf:determine_date_precision">
      <xsl:param name="input-hl7-date"/>
      <xsl:choose>
         <xsl:when test="string-length($input-hl7-date) &lt;= 8">day</xsl:when>
         <xsl:when test="string-length($input-hl7-date) > 8">second</xsl:when>
         <xsl:otherwise>not_supported</xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="nf:day-of-week" as="xs:integer?">
      <!-- courtesy to http://www.xsltfunctions.com/xsl/functx_day-of-week.html -->
      <xsl:param name="date" as="xs:anyAtomicType?"/>
      <xsl:sequence select="
            if (empty($date))
            then
               ()
            else
               xs:integer((xs:date($date) - xs:date('1901-01-06'))
               div xs:dayTimeDuration('P1D')) mod 7
            "/>
   </xsl:function>


   <xsl:function name="nf:format2HL7Date" as="xs:string?">
      <xsl:param name="dateTime"/>
      <!-- precision determines the picture of the date format, currently only use case for day, minute or second. Seconds is the default. -->
      <xsl:param name="precision"/>
      <xsl:variable name="picture" as="xs:string?">
         <xsl:choose>
            <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001][M01][D01][H01][m01]</xsl:when>
            <xsl:otherwise>[Y0001][M01][D01][H01][m01][s01]</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="normalize-space($dateTime) castable as xs:dateTime">
            <xsl:value-of select="format-dateTime(xs:dateTime($dateTime), $picture)"/>
         </xsl:when>
         <xsl:when test="normalize-space($dateTime) castable as xs:date">
            <xsl:value-of select="format-date(xs:date($dateTime), '[Y0001][M01][D01]')"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateTime"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <!-- copy an element with all of it's contents in comments -->
   <xsl:template name="copyElementInComment">
      <xsl:param name="element"/>
      <xsl:text disable-output-escaping="yes">
                       &lt;!--</xsl:text>
      <xsl:for-each select="$element">
         <xsl:call-template name="copyWithoutComments"/>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">--&gt;
</xsl:text>
   </xsl:template>
   <!-- copy without comments -->
   <xsl:template name="copyWithoutComments">
      <xsl:copy>
         <xsl:for-each select="@* | *">
            <xsl:call-template name="copyWithoutComments"/>
         </xsl:for-each>
      </xsl:copy>
   </xsl:template>

</xsl:stylesheet>
