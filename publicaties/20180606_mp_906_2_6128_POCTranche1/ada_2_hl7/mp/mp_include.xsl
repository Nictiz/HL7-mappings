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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:include href="../hl7/hl7_include.xsl"/>
   <xsl:include href="../zib1bbr/zib1bbr_include.xsl"/>
   <xsl:include href="../naw/naw_include.xsl"/>
   <xsl:variable name="ada-unit-seconde" select="('seconde', 's', 'sec', 'second')"/>
   <xsl:variable name="ada-unit-minute" select="('minuut', 'min', 'minute')"/>
   <xsl:variable name="ada-unit-hour" select="('uur', 'h', 'hour')"/>
   <xsl:variable name="ada-unit-day" select="('dag', 'd', 'day')"/>
   <xsl:variable name="ada-unit-week" select="('week', 'wk')"/>
   <xsl:variable name="ada-unit-month" select="('maand', 'mo', 'month')"/>
   <xsl:variable name="ada-unit-year" select="('jaar', 'a', 'year')"/>

   <xsl:template name="makeEffectiveTime">
      <xsl:param name="effectiveTime"/>
      <xsl:if test="$effectiveTime[1] instance of element()">
         <xsl:for-each select="$effectiveTime">
            <effectiveTime>
               <xsl:call-template name="makeTSValueAttr"/>
            </effectiveTime>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template name="makeTimePQValueAttribs">
      <!-- Variant van makePQValueAttribs waarbij de unit een tijdseenheid is, en die moet nog geconverteerd worden. -->
      <xsl:attribute name="value" select="./@value"/>
      <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM(./@unit)"/>
   </xsl:template>
   <xsl:template name="makeTimeDenominatorAttribs">
      <xsl:attribute name="value" select="./@value"/>
      <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM(./@unit)"/>
   </xsl:template>

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
   <xsl:function name="nf:convertGstdBasiseenheid2UCUM" as="xs:string">
      <xsl:param name="GstdBasiseenheid_code" as="xs:string"/>

      <xsl:choose>
         <xsl:when test="$GstdBasiseenheid_code castable as xs:int">
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
      <xsl:if test="$GstdBasiseenheid_code castable as xs:int"> </xsl:if>
   </xsl:function>
   <xsl:function name="nf:convertUnit_ADA2UCUM" as="xs:string">
      <xsl:param name="ADAunit" as="xs:string"/>
      <!-- TODO: hack in 9.0.4 om de in ADA forms aangepaste eenheden goede HL7 genereert. -->
      <!-- In ADA forms wordt stuk/dosis/eenheid/tablet gebruikt, wat in UCUM '1' is -->
      <xsl:choose>
         <xsl:when test="lower-case($ADAunit) eq 'eenheid'">1</xsl:when>
         <xsl:when test="lower-case($ADAunit) eq 'stuk'">1</xsl:when>
         <xsl:when test="lower-case($ADAunit) eq 'dosis'">1</xsl:when>
         <xsl:when test="lower-case($ADAunit) eq 'tablet'">1</xsl:when>
         <xsl:when test="lower-case($ADAunit) eq 'druppel'">[drp]</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$ADAunit"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="nf:convertTime_ADA_unit2UCUM" as="xs:string?">
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
   <xsl:function name="nf:calculate_Doseerinstructie_Startdate" as="xs:date?">
      <xsl:param name="startdatum-dosering-1" as="xs:date?"/>
      <xsl:param name="dosering"/>
      <xsl:param name="doseerinstructies"/>
      <xsl:choose>
         <xsl:when test="count($doseerinstructies) gt 1">
            <xsl:variable name="current-volgnummer" select="$dosering/../volgnummer/@value"/>
            <xsl:variable name="offset-in-days">
               <!-- doseerduur mag in uur, dag, week, jaar in MP 9-->
               <!-- uur kan niet vertaald naar 6.12, want in 6.12 moet het vertaald worden naar hele dagen bij een cyclisch schema, 
              uur moet daarom uitgesloten zijn in de aanroepende template(s)! -->
               <xsl:variable name="weeks2days" select="sum($doseerinstructies[volgnummer/@value lt $current-volgnummer]/doseerduur[@unit = $ada-unit-week]/@value) * 7"/>
               <xsl:variable name="years2days" select="sum($doseerinstructies[volgnummer/@value lt $current-volgnummer]/doseerduur[@unit = $ada-unit-year]/@value) * 365"/>
               <xsl:value-of select="sum($doseerinstructies[volgnummer/@value lt $current-volgnummer]/doseerduur[@unit = $ada-unit-day]/@value) + $weeks2days + $years2days"/>
            </xsl:variable>
            <xsl:variable name="string-add-days" select="concat('P', $offset-in-days, 'D')"/>
            <xsl:value-of select="$startdatum-dosering-1 + xs:dayTimeDuration($string-add-days)"/>
         </xsl:when>
         <xsl:otherwise>
            <!-- als er maar één doseerinstructie is dan wordt deze begrensd door de gebruiksperiode en hoeft er geen volgorde bepaald te worden,
                 een doseerstartdatum is dan dus niet nodig -->
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="nf:calculate_Duur_In_Dagen">
      <xsl:param name="inputDuur"/>
      <xsl:param name="eenheid_UCUM"/>
      <xsl:choose>
         <xsl:when test="$eenheid_UCUM = 'h'">
            <xsl:value-of select="format-number(number($inputDuur) div number(24), '0.####')"/>
         </xsl:when>
         <xsl:when test="$eenheid_UCUM = 'wk'">
            <xsl:value-of select="format-number(number($inputDuur) * number(7), '0.####')"/>
         </xsl:when>
         <xsl:when test="$eenheid_UCUM = 'a'">
            <!-- schrikkeljaren buiten beschouwing gelaten -->
            <xsl:value-of select="format-number(number($inputDuur) * number(365), '0.####')"/>
         </xsl:when>
         <xsl:when test="$eenheid_UCUM = 'd'">
            <xsl:value-of select="$inputDuur"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="concat('onverwachte tijdseenheid, kan niet omrekenen naar dagen: ', $inputDuur, ' ', $eenheid_UCUM)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <!-- therapeuticAgentOf - Medication Administration Request -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
      <!-- Pass max 1 medicatieafspraak in this template -->
      <xsl:param name="medicatieafspraak" as="element()?" select="."/>

      <xsl:for-each select="$medicatieafspraak/gebruiksinstructie/doseerinstructie">
         <xsl:for-each select="./dosering">
            <xsl:variable name="toedieningsschema" select="./toedieningsschema"/>
            
            <!-- support for variable frequency: 1 to 2 times a day -->
            <xsl:variable name="frequentie_in_first_MAR" as="xs:int?">
               <xsl:choose>
                  <xsl:when test="$toedieningsschema/frequentie/aantal/min[@value castable as xs:int]">
                     <xsl:value-of select="xs:int($toedieningsschema/frequentie/aantal/min/@value)"/>
                  </xsl:when>
                  <xsl:when test="$toedieningsschema/frequentie/aantal/vaste_waarde[@value castable as xs:int]">
                     <xsl:value-of select="xs:int($toedieningsschema/frequentie/aantal/vaste_waarde/@value)"/>
                  </xsl:when>
                  <xsl:when test="not($toedieningsschema/frequentie/aantal/min[@value]) and $toedieningsschema/frequentie/aantal/max[@value castable as xs:int]">
                     <xsl:value-of select="xs:int($toedieningsschema/frequentie/aantal/max/@value)"/>
                  </xsl:when>
               </xsl:choose>
            </xsl:variable>
            <!-- if there is no min frequency, but there is a max, then there must be a 'zo nodig' instruction in the first MAR (medicationAdministrationRequest) -->
            <xsl:variable name="zonodig_in_first_MAR" select="not($toedieningsschema/frequentie/min[@value]) and $toedieningsschema/frequentie/max[@value]"/>
            
            <xsl:call-template name="makeTherapeuticAgentOf_4_template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
               <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
               <xsl:with-param name="dosering" select="."/>
               <xsl:with-param name="frequentie_value" select="$frequentie_in_first_MAR"/>
               <xsl:with-param name="zonodig" select="$zonodig_in_first_MAR"/>
            </xsl:call-template>
            <!-- the zo nodig frequency (max frequency minus min frequency with 'as needed' precondition -->
            <xsl:if test="$toedieningsschema/frequentie/aantal/min[@value castable as xs:int] and $toedieningsschema/frequentie/aantal/max[@value castable as xs:int]">
               <xsl:call-template name="makeTherapeuticAgentOf_4_template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
                  <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
                  <xsl:with-param name="dosering" select="."/>
                  <xsl:with-param name="frequentie_value" select="xs:int($toedieningsschema/frequentie/aantal/max/@value - $toedieningsschema/frequentie/aantal/min/@value)"/>
                  <xsl:with-param name="zonodig" select="true()"/>
               </xsl:call-template>
            </xsl:if>
         </xsl:for-each>
      </xsl:for-each>
   </xsl:template>

   <xsl:template name="makeTherapeuticAgentOf_4_template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
      <xsl:param name="medicatieafspraak" as="element()?"/>
      <xsl:param name="frequentie_value" as="xs:int?"/>
      <xsl:param name="zonodig" as="xs:boolean?"/>
      <xsl:param name="dosering" select="."/>

      <xsl:variable name="herhaalperiode" select="$medicatieafspraak/gebruiksinstructie/herhaalperiode_cyclisch_schema"/>
      <xsl:variable name="doseerinstructies" select="$medicatieafspraak//doseerinstructie"/>
      <!-- TODO, the start and end are now added at ADA level, amend this after ZIB reconciliation is done -->
      <xsl:variable name="gebruiksperiode-start" select="$medicatieafspraak/gebruiksperiode_start"/>
      <!-- een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode kan niet
                 gestructureerd in 6.12 omdat de volgorde dan niet overgebracht kan worden -->
      <xsl:variable name="niet-cyclisch-zonder-start" select="not($herhaalperiode/@value) and count($medicatieafspraak//doseerinstructie) gt 1 and not($gebruiksperiode-start/@value)"/>
      <!-- een niet-cyclisch schema met meerdere doseerinstructies mét startdatum gebruiksperiode kan wel
           gestructureerd in 6.12 omdat de volgorde dan dus wel overgebracht kan worden in meerdere MAR's
           dit gaat mbv de IVL_TS gebruiksperiode -->
      <xsl:variable name="niet-cyclisch-met-start" select="not($herhaalperiode/@value) and count($medicatieafspraak//doseerinstructie) gt 1 and $gebruiksperiode-start/@value"/>

      <!-- bij een niet-cyclisch schema met startdatum gebruik, de juiste startdatum berekenen, 
         de doseerduur gebruiken als gebruiksduur in deze MAR en de eventuele einddatum gebruik negeren -->
      <xsl:variable name="gebruiksperiode-start-value">
         <xsl:choose>
            <xsl:when test="$niet-cyclisch-met-start">
               <xsl:value-of select="nf:calculate_Doseerinstructie_Startdate(xs:date(substring-before($gebruiksperiode-start/@value, 'T')), $dosering, $doseerinstructies)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="$gebruiksperiode-start/@value"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="gebruiksperiode-duur" select="$medicatieafspraak[not($niet-cyclisch-met-start)]/gebruiksperiode | $dosering[$niet-cyclisch-met-start]/../doseerduur"/>
      <xsl:variable name="gebruiksperiode-eind" select="$medicatieafspraak[not($niet-cyclisch-met-start)]/gebruiksperiode_eind"/>
      <xsl:variable name="gebruiksperiode_exists" select="$gebruiksperiode-duur/@value or $gebruiksperiode-start/@value or $gebruiksperiode-eind/@value"/>

      <xsl:variable name="toedieningsschema" select="$medicatieafspraak/gebruiksinstructie/doseerinstructie/dosering/toedieningsschema"/>
      <xsl:variable name="schema_in_1_pivlts" as="xs:boolean">
         <xsl:choose>
            <!-- TODO uitbreiden met mogelijkheden -->
            <xsl:when test="$medicatieafspraak//herhaalperiode_cyclisch_schema">
               <xsl:value-of select="false()"/>
            </xsl:when>
            <xsl:when test="count($toedieningsschema/toedientijd[@value]) > 1">
               <xsl:value-of select="false()"/>
            </xsl:when>
<!--            <xsl:when test="count($toedieningsschema/dagdeel) > 1">
               <xsl:value-of select="false()"/>
            </xsl:when>-->
            <xsl:otherwise>
               <xsl:value-of select="true()"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="eenmalig_gebruik" select="$toedieningsschema/frequentie/aantal/vaste_waarde/@value and not($toedieningsschema/frequentie/tijdseenheid/@value)"/>
      <xsl:variable name="doseerduur-in-uren" select="$medicatieafspraak/gebruiksinstructie/doseerinstructie/doseerduur[@unit = $ada-unit-hour]"/>
      <!-- een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode kan niet
                 gestructureerd in 6.12 omdat de volgorde dan niet overgebracht kan worden -->
      <xsl:variable name="toedieningsschema612_exists" as="xs:boolean">
         <xsl:choose>
            <!-- een cyclisch schema met doseerduur in uren kunnen we niet gestructureerd overbrengen in 6.12 -->
            <xsl:when test="$herhaalperiode and $doseerduur-in-uren">false</xsl:when>
            <!-- een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode kan niet
                 gestructureerd in 6.12 omdat de volgorde dan niet overgebracht kan worden -->
            <xsl:when test="$niet-cyclisch-zonder-start">false</xsl:when>
            <!-- dagdelen worden niet ondersteund in 6.12. Alleen de tekst en gebruiksperiode worden overgenomen. -->
            <xsl:when test="$toedieningsschema//dagdeel[@value or @code]">false</xsl:when>
            <xsl:when test="exists($toedieningsschema//*[local-name(.) != 'dagdeel']/@value)">true</xsl:when>
         </xsl:choose>
      </xsl:variable>

      <therapeuticAgentOf>
         <medicationAdministrationRequest classCode="SBADM" moodCode="RQO">
            <!-- Item(s) :: omschrijving -->
            <xsl:for-each select="$dosering/../../omschrijving">
               <xsl:call-template name="makeSTValue">
                  <xsl:with-param name="xsiType" select="''"/>
                  <xsl:with-param name="elemName">text</xsl:with-param>
               </xsl:call-template>
            </xsl:for-each>
            <statusCode code="active"/>
            <xsl:choose>
               <!-- TODO, alle varianten ondersteunen -->
               <!-- Gebruiksperiode en toedieningsschema, maar géén eenmalig gebruik -->
               <xsl:when test="$gebruiksperiode_exists and $toedieningsschema612_exists and not($eenmalig_gebruik)">
                  <effectiveTime xsi:type="SXPR_TS">
                     <!-- Gebruiksperiode in een IVL_TS comp -->
                     <xsl:for-each select="$medicatieafspraak">
                        <comp xsi:type="IVL_TS">
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20130521000000">
                              <xsl:with-param name="begindatum" select="$gebruiksperiode-start-value"/>
                              <xsl:with-param name="duur" select="$gebruiksperiode-duur"/>
                              <xsl:with-param name="einddatum" select="$gebruiksperiode-eind/@value"/>
                           </xsl:call-template>
                        </comp>
                     </xsl:for-each>
                     <!-- doseerschema, in PIVL_TS('en) te vangen -->
                     <xsl:call-template name="schema_in_comps">
                        <xsl:with-param name="dosering" select="."/>
                        <xsl:with-param name="frequentie_value" select="$frequentie_value"/>
                        <xsl:with-param name="herhaalperiode" select="$herhaalperiode"/>
                        <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
                     </xsl:call-template>
                  </effectiveTime>
               </xsl:when>
               <!-- Gebruiksperiode zonder toedieningsschema: alleen een IVL_TS in effectiveTime -->
               <xsl:when test="$gebruiksperiode_exists and not($toedieningsschema612_exists)">
                  <xsl:for-each select="$medicatieafspraak">
                     <effectiveTime xsi:type="IVL_TS">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20130521000000">
                           <xsl:with-param name="begindatum" select="$gebruiksperiode-start/@value"/>
                           <xsl:with-param name="duur" select="$gebruiksperiode-duur"/>
                           <xsl:with-param name="einddatum" select="$gebruiksperiode-eind/@value"/>
                        </xsl:call-template>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>
               <!-- Géén gebruiksperiode, wel een eenvoudig toedieningsschema in één PIVL_TS in effectiveTime, géén eenmalig gebruik-->
               <xsl:when test="not($gebruiksperiode_exists) and $toedieningsschema612_exists and $schema_in_1_pivlts and not($eenmalig_gebruik)">
                  <!-- "eenvoudig" doseerschema, in één PIVL_TS('en) te vangen -->
                  <xsl:if test="$frequentie_value or ./toedieningsschema[interval/@value]">
                     <xsl:for-each select="./toedieningsschema">
                        <effectiveTime xsi:type="PIVL_TS">
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139">
                              <xsl:with-param name="doseerduur" select="./../../doseerduur[@value]"/>
                              <xsl:with-param name="interval" select="./interval"/>
                              <xsl:with-param name="operator">A</xsl:with-param>
                              <xsl:with-param name="toedieningsschema" select="."/>
                              <xsl:with-param name="vaste_frequentie" select="$frequentie_value"/>
                              <xsl:with-param name="vaste_freq_tijd" select="./frequentie/tijdseenheid"/>
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:for-each>
                  </xsl:if>
               </xsl:when>
               <!-- Géén gebruiksperiode, maar een toedieningsschema dat niet in één PIVL_TS te vangen is -->
               <xsl:when test="not($gebruiksperiode_exists) and not($schema_in_1_pivlts)">
                  <effectiveTime xsi:type="SXPR_TS">
                     <!-- doseerschema, in PIVL_TS('en) te vangen -->
                     <xsl:call-template name="schema_in_comps">
                        <xsl:with-param name="dosering" select="."/>
                        <xsl:with-param name="frequentie_value" select="$frequentie_value"/>
                        <xsl:with-param name="herhaalperiode" select="$herhaalperiode"/>
                        <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
                     </xsl:call-template>
                  </effectiveTime>
               </xsl:when>
               <!-- eenmalig gebruik -->
               <xsl:when test="$eenmalig_gebruik">
                  <xsl:variable name="aantal_keer" select="./toedieningsschema/frequentie/aantal/vaste_waarde/@value"/>
                  <!-- 6.12 ondersteunt alleen eenmalig gebruik -->
                  <xsl:choose>
                     <xsl:when test="$aantal_keer = 1">
                        <!-- Neem startdatum van gebruik als dat beschikbaar is, anders nemen we aan: de datum van vandaag -->
                        <xsl:variable name="date_eenmalig_gebruik">
                           <xsl:choose>
                              <!-- TODO, aanpassen voor juiste startdatum..., nu nog geen ondersteuning in ADA / dataset -->
                              <xsl:when test="$medicatieafspraak/gebruiksperiode/start">
                                 <xsl:call-template name="format2HL7Date">
                                    <xsl:with-param name="dateTime" select="./@value"/>
                                 </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:call-template name="format2HL7Date">
                                    <xsl:with-param name="dateTime" select="string(current-date())"/>
                                 </xsl:call-template>
                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:variable>
                        <effectiveTime>
                           <xsl:attribute name="value" select="$date_eenmalig_gebruik"/>
                        </effectiveTime>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:comment>Voorschrift 6.12 ondersteunt alleen eenmalig gebruik (en dus niet gebruik x keer, waarbij x > 1). 
Gevonden is een x van "<xsl:value-of select="$aantal_keer"/>". Dit kan niet gestructureerd worden meegegeven.</xsl:comment>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
            </xsl:choose>
            <xsl:if test="$herhaalperiode and $doseerduur-in-uren">
               <xsl:comment>Let op! Er is in de input een herhaalperiode voor een cyclisch schema aangetroffen in combinatie met een doseerduur in uren. Dit kan in een 6.12 voorschrift niet gestructureerd worden opgenomen.</xsl:comment>
            </xsl:if>
            <xsl:if test="$niet-cyclisch-zonder-start">
               <xsl:comment>Let op! Er is in de input een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode. Dit kan in een 6.12 voorschrift niet gestructureerd worden opgenomen omdat de volgorde dan niet overgebracht kan worden.</xsl:comment>
            </xsl:if>
            <xsl:if test="$toedieningsschema//dagdeel[@value or @code]">
               <xsl:comment>Let op! Er is in de input een toedieningsschema met een of meerdere dagdelen aangetroffen. Dit kan in een 6.12 voorschrift niet gestructureerd worden opgenomen, daarom vindt u alleen de eventuele gebruiksperiode en tekstuele omschrijving terug.</xsl:comment>
            </xsl:if>
            <!-- Item(s) :: toedieningsweg-->
            <xsl:for-each select="$dosering/../../toedieningsweg">
               <xsl:call-template name="makeCEValue">
                  <xsl:with-param name="xsiType" select="''"/>
                  <xsl:with-param name="elemName">routeCode</xsl:with-param>
               </xsl:call-template>
            </xsl:for-each>
            <!-- Item(s) :: keerdosis-->
            <xsl:for-each select="$dosering/keerdosis">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20150724151109"/>
            </xsl:for-each>
            <!-- <doseCheckQuantity><!-\- MP 9 kent geen elementen in de dataset die mappen op doseCheckQuantity -\-> </doseCheckQuantity>-->
            <!-- Item(s) :: maximale_dosering max_dosering_per_periode-->
            <xsl:for-each select="$dosering/zo_nodig/maximale_dosering[.//@value]">
               <maxDoseQuantity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000"/>
               </maxDoseQuantity>
            </xsl:for-each>
            <xsl:for-each select="$dosering/../../aanvullende_instructie">
               <xsl:variable name="code">
                  <xsl:choose>
                     <xsl:when test="./@codeSystem = '2.16.840.1.113883.2.4.4.5'">
                        <xsl:value-of select="./@code"/>
                     </xsl:when>
                     <xsl:otherwise>OTH</xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:variable name="codeSystem">
                  <xsl:choose>
                     <xsl:when test="./@codeSystem = '2.16.840.1.113883.2.4.4.5'">2.16.840.1.113883.2.4.4.5</xsl:when>
                     <xsl:otherwise>2.16.840.1.113883.5.1008</xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <!-- TODO de plek van originalText moet nog verbeterd, dit gaat niet goed werken -->
               <xsl:variable name="strOriginalText">
                  <xsl:choose>
                     <xsl:when test="./@codeSystem = '2.16.840.1.113883.2.4.4.5'"><!-- leeg --></xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="./@displayName"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <support2 typeCode="SPRT">
                  <!-- Template :: Medication Administration Instruction -->
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.101_20130521000000">
                     <xsl:with-param name="code" select="$code"/>
                     <xsl:with-param name="codeSystem" select="$codeSystem"/>
                     <xsl:with-param name="displayName" select="./@displayName"/>
                     <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                  </xsl:call-template>
               </support2>
            </xsl:for-each>
            <xsl:for-each select="$dosering/zo_nodig/criterium">
               <precondition>
                  <!-- Template :: Observation Event Criterion -->
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9001_20130521000000">
                     <xsl:with-param name="code" select="./code/@code"/>
                     <xsl:with-param name="codeSystem" select="./code/@codeSystem"/>
                     <xsl:with-param name="displayName" select="./code/@displayName"/>
                     <xsl:with-param name="strOriginalText" select="./code/@originalText"/>
                  </xsl:call-template>
               </precondition>
            </xsl:for-each>
            <xsl:if test="$zonodig and not($dosering/zo_nodig/criterium/code[@code = '1137'])">
               <precondition>
                  <observationEventCriterion>
                     <code code="1137" codeSystem="2.16.840.1.113883.2.4.4.5" displayName="zo nodig"/>
                  </observationEventCriterion>
               </precondition>
            </xsl:if>
         </medicationAdministrationRequest>
      </therapeuticAgentOf>

   </xsl:template>

   <!-- Helping template for toedieningsschema in comp elements -->
   <xsl:template name="schema_in_comps">
      <xsl:param name="dosering" select="."/>
      <xsl:param name="frequentie_value" as="xs:int?"/>
      <xsl:param name="herhaalperiode" select="./../../herhaalperiode_cyclisch_schema"/>
      <xsl:param name="medicatieafspraak" select="./../../.."/>
      <xsl:param name="toedieningsschema" select="$dosering/toedieningsschema"/>

      <xsl:variable name="doseerinstructies" select="$medicatieafspraak//doseerinstructie"/>
      <xsl:variable name="doseerduur" select="$dosering/../doseerduur[@value]"/>
      <xsl:variable name="cyclisch-schema" as="xs:boolean" select="exists($herhaalperiode/@value)"/>
      <xsl:variable name="startdatum-dosering-1" as="xs:date">
         <xsl:choose>
            <xsl:when test="$medicatieafspraak/gebruiksperiode_start/@value[. castable as xs:date or . castable as xs:dateTime]">
               <xsl:value-of select="xs:date(substring-before($medicatieafspraak/gebruiksperiode_start/@value, 'T'))"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="current-date()"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="doseerduur-startdatum" select="nf:calculate_Doseerinstructie_Startdate($startdatum-dosering-1, $dosering, $doseerinstructies)"/>
      <!-- de startdatum voor geankerd interval is 
            bij meerdere doseerinstructies verplicht omdat volgorde in 6.12 moet worden afgeleid met deze datums 
            bij 1 doseerinstructie niet op te nemen in 6.12 omdat ook daar dan impliciet de gebruiksperiode geldt, indien aanwezig. 
            Zonder gebruiksperiode zweeft het interval überhaupt ergens - niemand weet waar (behalve misschien via de tekst "te gebruiken bij start vakantie").-->
      <xsl:if test="$cyclisch-schema">
         <xsl:choose>
            <xsl:when test="$doseerduur">
               <comp xsi:type="PIVL_TS">
                  <xsl:call-template name="makeCyclischComp">
                     <xsl:with-param name="herhaalperiode" select="$herhaalperiode"/>
                     <xsl:with-param name="doseerduur-startdatum" select="string($doseerduur-startdatum)"/>
                     <xsl:with-param name="doseerduur" select="$doseerduur"/>
                     <xsl:with-param name="operator">A</xsl:with-param>
                  </xsl:call-template>
               </comp>
            </xsl:when>
            <xsl:otherwise>
               <!-- Herhaalperiode zonder doseerduur, dat is illegaal -->
               <xsl:comment>In de input een herhaalperiode_cyclisch_schema aangetroffen (<xsl:value-of select="$herhaalperiode/@value"/><xsl:value-of select="' '"/><xsl:value-of select="$herhaalperiode/@unit"/>), maar geen doseerduur. Dat is illegaal. Check de input!</xsl:comment>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
      <!-- doseerduur voor andere PIVL_TS'en -->
      <xsl:variable name="doseerduur-niet-cyclisch" select="$doseerduur[not($cyclisch-schema)]"/>

      <xsl:if test="($frequentie_value or $toedieningsschema/interval[@value]) and not($toedieningsschema/toedientijd[@value])">
         <xsl:for-each select="$toedieningsschema">
            <comp xsi:type="PIVL_TS">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139">
                  <xsl:with-param name="doseerduur" select="$doseerduur-niet-cyclisch"/>
                  <xsl:with-param name="interval" select="./interval"/>
                  <xsl:with-param name="operator">A</xsl:with-param>
                  <xsl:with-param name="toedieningsschema" select="."/>
                  <xsl:with-param name="vaste_frequentie" select="$frequentie_value"/>
                  <xsl:with-param name="vaste_freq_tijd" select="./frequentie/tijdseenheid"/>
               </xsl:call-template>
            </comp>
         </xsl:for-each>
      </xsl:if>
      <!-- the comp elementen met toedientijden -->
      <xsl:for-each select="$toedieningsschema/toedientijd[@value]">
         <xsl:variable name="currentToedientijd" select="."/>
         <xsl:variable name="operator">
            <xsl:choose>
               <!-- De eerste toedientijd moet met operator A (doorsnijden van de gebruiksperiode), die daarna met I (verenigen) omdat toedientijden elkaar per definitie uitsluiten -->
               <xsl:when test="index-of($toedieningsschema/toedientijd/@value, $currentToedientijd/@value) = 1">A</xsl:when>
               <xsl:otherwise>I</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <comp xsi:type="PIVL_TS">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139">
               <xsl:with-param name="doseerduur" select="''"/>
               <xsl:with-param name="interval" select="./interval"/>
               <xsl:with-param name="operator" select="$operator"/>
               <xsl:with-param name="toedieningsschema" select="./.."/>
               <xsl:with-param name="toedientijd" select="./@value"/>
               <xsl:with-param name="vaste_frequentie" select="$frequentie_value"/>
               <xsl:with-param name="vaste_freq_tijd" select="./../frequentie/tijdseenheid"/>
            </xsl:call-template>
         </comp>
      </xsl:for-each>

   </xsl:template>

   <!-- Medication Administration Instruction -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.101_20130521000000">
      <xsl:param name="code" as="xs:string?" select="./@code"/>
      <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
      <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
      <xsl:param name="strOriginalText" as="xs:string?"/>
      <medicationAdministrationInstruction>
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9022_20130521000000">
            <xsl:with-param name="code" select="$code"/>
            <xsl:with-param name="codeSystem" select="$codeSystem"/>
            <xsl:with-param name="displayName" select="$displayName"/>
            <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
         </xsl:call-template>
      </medicationAdministrationInstruction>
   </xsl:template>
   <!-- Medication Dispense Request -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.103_20130521000000">
      <xsl:param name="verstrekkingsverzoek" select="."/>
      <medicationDispenseRequest>
         <!-- TEDOEN dit is nu dezelfde identificatie als de prescription id, vraag is of dat wenselijk is -->
         <xsl:for-each select="./identificatie">
            <xsl:call-template name="makeIIid"/>
         </xsl:for-each>
         <statusCode nullFlavor="NA"/>
         <xsl:for-each select="aantal_herhalingen">
            <xsl:if test="@value castable as xs:int">
               <repeatNumber>
                  <xsl:attribute name="value" select="xs:int(./@value) + 1"/>
               </repeatNumber>
            </xsl:if>
         </xsl:for-each>
         <xsl:for-each select="te_verstrekken_hoeveelheid">
            <quantity>
               <xsl:attribute name="value" select="aantal/@value"/>
               <xsl:for-each select="eenheid/@code">
                  <xsl:attribute name="unit">
                     <xsl:value-of select="nf:convertGstdBasiseenheid2UCUM(.)"/>
                  </xsl:attribute>
               </xsl:for-each>
               <xsl:for-each select="eenheid">
                  <translation>
                     <xsl:attribute name="value" select="../aantal/@value"/>
                     <xsl:attribute name="code" select="@code"/>
                     <xsl:attribute name="codeSystem" select="@codeSystem"/>
                     <xsl:attribute name="displayName" select="@displayName"/>
                  </translation>
               </xsl:for-each>
            </quantity>
         </xsl:for-each>
         <xsl:for-each select="afleverlocatie">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9063_20160217000000"/>
         </xsl:for-each>
         <xsl:for-each select="beoogd_verstrekker">
            <performer typeCode="PRF">
               <!-- Template :: Beoogde verstrekker -->
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9017_20130521000000"/>
            </performer>
         </xsl:for-each>
      </medicationDispenseRequest>
   </xsl:template>

   <!-- Medication Combined Order -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.104_20130521000000">
      <xsl:param name="patient"/>
      <!-- There may be more than one medicatiafspraak in this param -->
      <xsl:param name="medicatieafspraak"/>
      <xsl:param name="verstrekkingsverzoek"/>
      <xsl:param name="ma_reference_only"/>
      <prescription classCode="SBADM" moodCode="RQO">
         <!-- Item(s) :: identificatie-->
         <!-- we nemen de identificatie van verstrekkingsverzoek, omdat er per verstrekkingsverzoek een MP 6.12 voorschrift gemaakt wordt -->
         <xsl:for-each select="$verstrekkingsverzoek/identificatie">
            <xsl:call-template name="makeIIValue">
               <xsl:with-param name="xsiType" select="''"/>
               <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
         <statusCode code="active"/>
         <xsl:for-each select="$patient">
            <subject typeCode="SBJ">
               <Patient>
                  <!-- Template :: PatientNL -->
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000"/>
               </Patient>
            </subject>
         </xsl:for-each>
         <xsl:if test="$verstrekkingsverzoek/auteur/zorgverlener or $verstrekkingsverzoek/datum">
            <author typeCode="AUT">
               <xsl:for-each select="$verstrekkingsverzoek/datum">
                  <time>
                     <xsl:call-template name="makeTSValueAttr"/>
                  </time>
               </xsl:for-each>
               <xsl:for-each select="$verstrekkingsverzoek/auteur/zorgverlener">
                  <AssignedPerson>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9043_20150715173504"/>
                  </AssignedPerson>
               </xsl:for-each>
            </author>
         </xsl:if>
         <directTarget typeCode="DIR">
            <prescribedMedication>
               <xsl:for-each select="$verstrekkingsverzoek/te_verstrekken_geneesmiddel/product">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000"/>
               </xsl:for-each>
               <productOf>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.103_20130521000000">
                     <xsl:with-param name="verstrekkingsverzoek" select="$verstrekkingsverzoek"/>
                  </xsl:call-template>
               </productOf>
               <!-- gebruiksinstructie -->
               <xsl:for-each select="$medicatieafspraak">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
                     <xsl:with-param name="medicatieafspraak" select="."/>
                  </xsl:call-template>
               </xsl:for-each>
            </prescribedMedication>
         </directTarget>
         <xsl:for-each select="$medicatieafspraak/reden_van_voorschrijven/probleem/probleem_naam">
            <xsl:variable name="codeSystem">
               <xsl:choose>
                  <xsl:when test="./@codeSystem">
                     <xsl:value-of select="./@codeSystem"/>
                  </xsl:when>
                  <xsl:otherwise>2.16.840.1.113883.5.1008</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <!-- TODO de plek van originalText moet nog verbeterd, dit gaat waarschijnlijk niet goed werken -->
            <xsl:variable name="strOriginalText">
               <xsl:choose>
                  <xsl:when test="$codeSystem = '2.16.840.1.113883.5.1008'">
                     <xsl:value-of select="./@displayName"/>
                  </xsl:when>
                  <xsl:otherwise><!-- leeg --></xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <reason typeCode="RSON">
               <diagnosisEvent>
                  <code code="DX" codeSystem="2.16.840.1.113883.5.4"/>
                  <xsl:call-template name="makeCEValue">
                     <xsl:with-param name="code" select="./@code"/>
                     <xsl:with-param name="codeSystem" select="$codeSystem"/>
                     <xsl:with-param name="displayName" select="./@displayName"/>
                     <xsl:with-param name="elemName">value</xsl:with-param>
                     <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                     <xsl:with-param name="xsiType">CE</xsl:with-param>
                  </xsl:call-template>
               </diagnosisEvent>
            </reason>
         </xsl:for-each>
      </prescription>
   </xsl:template>
   <!-- Medication Kind -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
      <MedicationKind classCode="MMAT" determinerCode="KIND">
         <xsl:choose>
            <xsl:when test="product_code">
               <!-- Item(s) :: product_code -->
               <xsl:for-each select="product_code">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9005_20130521000000"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <code nullFlavor="OTH">
                  <xsl:for-each select="product_specificatie/product_naam">
                     <originalText>
                        <xsl:value-of select="@value"/>
                     </originalText>
                  </xsl:for-each>
               </code>
               <xsl:for-each select="product_specificatie/omschrijving">
                  <desc>
                     <xsl:value-of select="@value"/>
                  </desc>
               </xsl:for-each>
               <xsl:for-each select="product_specificatie/ingredient">
                  <activeIngredient>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.107_20130521000000"/>
                  </activeIngredient>
               </xsl:for-each>
            </xsl:otherwise>
         </xsl:choose>
         <!-- Item(s) :: omschrijving omschrijving-->
         <xsl:for-each select="omschrijving">
            <xsl:call-template name="makeEDValue">
               <xsl:with-param name="xsiType" select="''"/>
               <xsl:with-param name="elemName">desc</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
         <!--            <xsl:for-each select="sterkte | sterkte | sterkte | ingredienten">
               <activeIngredient classCode="ACTI">
                  <!-\- Template :: Active Ingredient -\->
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.107_20130521000000"/>
               </activeIngredient>
            </xsl:for-each>
            <xsl:for-each select="sterkte">
               <otherIngredient classCode="INGR">
                  <!-\- Template :: Other Ingredient -\->
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.109_20130521000000"/>
               </otherIngredient>
            </xsl:for-each>-->
      </MedicationKind>
   </xsl:template>
   <!-- Active Ingredient -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.107_20130521000000">
      <!-- Item(s) :: sterkte-->
      <xsl:for-each select="sterkte">
         <quantity>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.122_20130521000000"/>
         </quantity>
      </xsl:for-each>
      <activeIngredientMaterialKind>
         <!-- Template :: Ingredient Material Kind -->
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.108_20130521000000"/>
      </activeIngredientMaterialKind>
   </xsl:template>
   <!-- Ingredient Material Kind -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.108_20130521000000">
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9018_20130521000000"/>

   </xsl:template>
   <!-- Beoogde verstrekker -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9017_20130521000000">
      <xsl:for-each select="zorgaanbieder">
         <assignedPerson>
            <representedOrganization>
               <xsl:for-each select="zorgaanbieder_identificatie_nummer">
                  <xsl:call-template name="makeIIid"/>
               </xsl:for-each>
               <xsl:for-each select="organisatie_naam">
                  <name>
                     <xsl:value-of select="@value"/>
                  </name>
               </xsl:for-each>
            </representedOrganization>
         </assignedPerson>
      </xsl:for-each>
   </xsl:template>
   <!-- Material Code -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9018_20130521000000">
      <xsl:for-each select="ingredient_code">
         <xsl:call-template name="makeCEValue">
            <xsl:with-param name="elemName">code</xsl:with-param>
            <xsl:with-param name="xsiType"/>
         </xsl:call-template>
      </xsl:for-each>

   </xsl:template>

   <!-- Ingredient quantity -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.122_20130521000000">
      <!-- TEDOEN: add support for translation - helps to roundtrip back to MP 9, due to mandatory translation to G-standaard unit -->
      <xsl:for-each select="hoeveelheid_ingredient/waarde">
         <xsl:call-template name="makePQValue">
            <xsl:with-param name="elemName">numerator</xsl:with-param>
         </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="hoeveelheid_product/waarde">
         <xsl:call-template name="makePQValue">
            <xsl:with-param name="elemName">denominator</xsl:with-param>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <!-- PatientNL -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000">
      <!-- Item(s) :: persoonsidentificatie-->
      <xsl:for-each select="./patient_identificatienummer">
         <xsl:call-template name="makeII.NL.BSNValue">
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">id</xsl:with-param>
         </xsl:call-template>
      </xsl:for-each>
      <statusCode code="active"/>
      <Person>
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.805_20130521000000"/>
      </Person>
   </xsl:template>
   <!-- PersonNL -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.805_20130521000000">
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
         <xsl:with-param name="naamgegevens" select="naamgegevens"/>
      </xsl:call-template>
      <!-- Item(s) :: geslacht-->
      <xsl:for-each select="./geslacht[@code]">
         <xsl:call-template name="makeCVValue">
            <xsl:with-param name="code" select="./@code"/>
            <xsl:with-param name="codeSystem" select="./@codeSystem"/>
            <xsl:with-param name="displayName" select="./@displayName"/>
            <xsl:with-param name="elemName">administrativeGenderCode</xsl:with-param>
            <xsl:with-param name="xsiType" select="''"/>
         </xsl:call-template>
      </xsl:for-each>

      <!-- Item(s) :: geboortedatum-->
      <xsl:for-each select="./geboortedatum[@value]">
         <xsl:call-template name="makeTSValue">
            <xsl:with-param name="inputValue" select="./@value"/>
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">birthTime</xsl:with-param>
         </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="./meerling_indicator[@value]">
         <multipleBirthInd>
            <xsl:call-template name="makeBLAttribute">
               <xsl:with-param name="inputValue" select="./@value"/>
            </xsl:call-template>
         </multipleBirthInd>
      </xsl:for-each>
   </xsl:template>
   <!-- Observation Event Criterion -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9001_20130521000000">
      <xsl:param name="code" as="xs:string?" select="./@code"/>
      <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
      <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
      <xsl:param name="elOriginalText" as="element()*"/>
      <xsl:param name="strOriginalText" as="xs:string?"/>
      <observationEventCriterion>
         <xsl:call-template name="makeCEValue">
            <xsl:with-param name="code" select="$code"/>
            <xsl:with-param name="codeSystem" select="$codeSystem"/>
            <xsl:with-param name="displayName" select="$displayName"/>
            <xsl:with-param name="elemName">code</xsl:with-param>
            <xsl:with-param name="originalText" select="$elOriginalText"/>
            <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
            <xsl:with-param name="xsiType" select="''"/>
         </xsl:call-template>
      </observationEventCriterion>
   </xsl:template>
   <!-- Medication Code -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9005_20130521000000">
      <xsl:call-template name="makeCEValue">
         <xsl:with-param name="xsiType" select="''"/>
         <xsl:with-param name="elemName">code</xsl:with-param>
      </xsl:call-template>
   </xsl:template>
   <!-- CDA AssignedEntity -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9013_20151127000000">
      <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9013"/>
      <xsl:for-each select="./zorgverlener_identificatie_nummer">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>
      <xsl:for-each select="./specialisme">
         <code>
            <xsl:call-template name="makeCodeAttribs"/>
         </code>
      </xsl:for-each>

      <!-- Telecom gegevens -->
      <xsl:for-each select="./telefoon_email">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706"/>
      </xsl:for-each>
      <xsl:for-each select="./zorgverlener_naam">
         <assignedPerson>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
               <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
            </xsl:call-template>
         </assignedPerson>
      </xsl:for-each>
      <xsl:for-each select="./zorgaanbieder/zorgaanbieder">
         <representedOrganization>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
         </representedOrganization>
      </xsl:for-each>
   </xsl:template>
   <!-- Usable Period MP 6.12 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20130521000000">
      <xsl:param name="begindatum" select="./begindatum/@value"/>
      <xsl:param name="duur" select="./duur"/>
      <xsl:param name="einddatum" select="./einddatum/@value"/>

      <!-- gebruiksduur kan in MP 9 dataset ook in uren, weken en jaren, maar moet in een 6.12 voorschrift altijd in dagen -->
      <!-- omrekenen dus -->
      <xsl:variable name="duur_in_dagen" select="nf:calculate_Duur_In_Dagen($duur/@value, nf:convertTime_ADA_unit2UCUM($duur/@unit))"/>
      <!-- Item(s) :: begindatum -->
      <xsl:for-each select="$begindatum[. castable as xs:date or . castable as xs:dateTime]">
         <xsl:call-template name="makeTSValue">
            <xsl:with-param name="inputValue" select="$begindatum"/>
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">low</xsl:with-param>
         </xsl:call-template>
      </xsl:for-each>
      <!-- Item(s) :: gebruiksduur -->
      <xsl:for-each select="$duur[. instance of element()][@value]">
         <xsl:call-template name="makePQValue">
            <xsl:with-param name="inputValue" select="$duur_in_dagen"/>
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">width</xsl:with-param>
            <xsl:with-param name="unit" select="'d'"/>
         </xsl:call-template>
      </xsl:for-each>
      <!-- Item(s) :: einddatum -->
      <xsl:for-each select="$einddatum[. castable as xs:date or . castable as xs:dateTime]">
         <xsl:call-template name="makeTSValue">
            <xsl:with-param name="inputValue" select="$einddatum"/>
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">high</xsl:with-param>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <!-- Usable Period MP 9-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
      <xsl:param name="low"/>
      <xsl:param name="width"/>
      <xsl:param name="high"/>
      <xsl:if test="$low[1] instance of element()">
         <xsl:for-each select="$low">
            <low>
               <xsl:call-template name="makeTSValueAttr"/>
            </low>
         </xsl:for-each>
      </xsl:if>
      <xsl:if test="$width[1] instance of element()">
         <xsl:for-each select="$width">
            <width>
               <xsl:call-template name="makeTimePQValueAttribs"/>
            </width>
         </xsl:for-each>
      </xsl:if>
      <xsl:if test="$high[1] instance of element()">
         <xsl:for-each select="$high">
            <high>
               <xsl:call-template name="makeTSValueAttr"/>
            </high>
         </xsl:for-each>
      </xsl:if>

      <!-- If no duration or enddate is specified, it is until further notice (as specified by Arianne, 19-12-2017) -->
      <xsl:if test="not($width[1] instance of element()) and not($high[1] instance of element())">
         <high>
            <xsl:attribute name="nullFlavor" select="'NI'"/>
         </high>
      </xsl:if>

   </xsl:template>
   <!-- Frequency -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139">
      <xsl:param name="doseerduur"/>
      <xsl:param name="doseerduur-startdatum"/>
      <xsl:param name="interval"/>
      <xsl:param name="operator">I</xsl:param>
      <xsl:param name="toedieningsschema"/>
      <xsl:param name="toedientijd" as="xs:dateTime?"/>
      <xsl:param name="vaste_frequentie" as="xs:int?"/>
      <xsl:param name="vaste_freq_tijd"/>

      <xsl:attribute name="operator" select="$operator"/>
      <xsl:if test="($vaste_frequentie or $interval[. instance of element()]) and not($toedientijd castable as xs:dateTime)">
         <xsl:variable name="unit">
            <xsl:choose>
               <xsl:when test="$vaste_frequentie and $vaste_freq_tijd[@unit]">
                  <xsl:value-of select="$vaste_freq_tijd/@unit"/>
               </xsl:when>
               <xsl:when test="$interval[@unit]">
                  <xsl:value-of select="$interval/@unit"/>
               </xsl:when>
               <xsl:otherwise>ERROR_UNIT</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="value">
            <xsl:choose>
               <xsl:when test="$vaste_frequentie and $vaste_freq_tijd[@value]">
                  <xsl:value-of select="format-number(xs:int($vaste_freq_tijd/@value) div $vaste_frequentie, '0.####')"/>
               </xsl:when>
               <xsl:when test="$interval[@value]">
                  <xsl:value-of select="$interval/@value"/>
               </xsl:when>
               <xsl:otherwise>ERROR_VALUE</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:call-template name="makePQValue">
            <xsl:with-param name="inputValue" select="$value"/>
            <xsl:with-param name="elemName">period</xsl:with-param>
            <xsl:with-param name="unit" select="nf:convertTime_ADA_unit2UCUM($unit)"/>
            <xsl:with-param name="xsiType" select="''"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Toedientijd -->
      <xsl:if test="$toedientijd castable as xs:dateTime">
         <!-- het doseerinterval, meestal 1 dag bij toedientijd -->
         <xsl:variable name="unit">
            <!-- default is 'd', in 6.12 is het zelfs verplicht 'd', maar als de frequentie/tijdseenheid in de input is ingevuld nemen we die -->
            <xsl:choose>
               <xsl:when test="$vaste_freq_tijd[@unit]">
                  <xsl:value-of select="$vaste_freq_tijd/@unit"/>
               </xsl:when>
               <xsl:otherwise>d</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="value">
            <!-- default is '1', maar als de frequentie/tijdseenheid is ingevuld nemen we die -->
            <xsl:choose>
               <xsl:when test="$vaste_freq_tijd[@value]">
                  <xsl:value-of select="format-number(xs:int($vaste_freq_tijd/@value), '0.####')"/>
               </xsl:when>
               <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <phase>
            <center>
               <xsl:attribute name="value">
                  <xsl:call-template name="format2HL7Date">
                     <xsl:with-param name="dateTime" select="string($toedientijd)"/>
                     <xsl:with-param name="precision">minute</xsl:with-param>
                  </xsl:call-template>
               </xsl:attribute>
            </center>
         </phase>
         <xsl:call-template name="makePQValue">
            <xsl:with-param name="inputValue" select="$value"/>
            <xsl:with-param name="elemName">period</xsl:with-param>
            <xsl:with-param name="unit" select="nf:convertTime_ADA_unit2UCUM($unit)"/>
            <xsl:with-param name="xsiType" select="''"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <!-- Cyclisch schema comp -->
   <xsl:template name="makeCyclischComp">
      <xsl:param name="operator">A</xsl:param>
      <xsl:param name="doseerduur"/>
      <xsl:param name="doseerduur-startdatum" as="xs:string?"/>
      <xsl:param name="herhaalperiode"/>

      <!-- in een cyclisch schema moet in 6.12 de doseerduur in dagen  -->
      <xsl:variable name="doseerduur_in_dagen" select="nf:calculate_Duur_In_Dagen($doseerduur/@value, nf:convertTime_ADA_unit2UCUM($doseerduur/@unit))"/>

      <xsl:attribute name="operator" select="$operator"/>
      <xsl:for-each select="$doseerduur[@value and @unit]">
         <phase>
            <xsl:for-each select="$doseerduur-startdatum[. castable as xs:dateTime or . castable as xs:date]">
               <xsl:call-template name="makeTSValue">
                  <xsl:with-param name="elemName">low</xsl:with-param>
                  <xsl:with-param name="inputValue" select="."/>
                  <xsl:with-param name="xsiType"/>
               </xsl:call-template>
            </xsl:for-each>
            <xsl:call-template name="makePQValue">
               <xsl:with-param name="inputValue" select="$doseerduur_in_dagen"/>
               <xsl:with-param name="elemName">width</xsl:with-param>
               <xsl:with-param name="unit" select="'d'"/>
               <xsl:with-param name="xsiType" select="''"/>
            </xsl:call-template>
         </phase>
      </xsl:for-each>
      <xsl:for-each select="$herhaalperiode[. instance of element()]">
         <xsl:call-template name="makePQValue">
            <xsl:with-param name="inputValue" select="./@value"/>
            <xsl:with-param name="elemName">period</xsl:with-param>
            <xsl:with-param name="unit" select="nf:convertTime_ADA_unit2UCUM(./@unit)"/>
            <xsl:with-param name="xsiType" select="''"/>
         </xsl:call-template>
      </xsl:for-each>

   </xsl:template>

   <!--Quantity unit and translation(s)-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
      <xsl:param name="UCUMvalue"/>
      <xsl:param name="UCUMunit"/>

      <xsl:attribute name="unit" select="$UCUMunit"/>
      <xsl:call-template name="make_UCUM2Gstandard_translation">
         <xsl:with-param name="UCUMvalue" select="$UCUMvalue"/>
         <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
      </xsl:call-template>
   </xsl:template>
   <!--Quantity unit and translation(s) based on Gstd input-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000_2">
      <xsl:param name="Gstd_value"/>
      <xsl:param name="Gstd_unit"/>

      <xsl:choose>
         <xsl:when test="$Gstd_unit instance of element() and $Gstd_unit/@code">
            <xsl:attribute name="unit" select="nf:convertGstdBasiseenheid2UCUM($Gstd_unit/@code)"/>
         </xsl:when>
         <xsl:otherwise>
            <!-- an empty unit, will not be valid, but that makes it clear something is wrong with the input -->
            <xsl:attribute name="unit"/>
         </xsl:otherwise>
      </xsl:choose>
      <translation>
         <xsl:attribute name="value" select="$Gstd_value"/>
         <xsl:attribute name="code" select="$Gstd_unit/@code"/>
         <xsl:choose>
            <xsl:when test="string-length($Gstd_unit/@codeSystem) > 1">
               <xsl:attribute name="codeSystem" select="$Gstd_unit/@codeSystem"/>
            </xsl:when>
            <xsl:otherwise>
               <!-- should not happen -->
               <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.4.1.900.2</xsl:attribute>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:attribute name="displayName" select="$Gstd_unit/@displayName"/>
      </translation>
   </xsl:template>
   <!-- Aanvullende gebruiksinstructie NHG Tabel 25 B-codes -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9022_20130521000000">
      <xsl:param name="code" as="xs:string?" select="./@code"/>
      <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
      <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
      <xsl:param name="strOriginalText" as="xs:string?"/>
      <xsl:call-template name="makeCEValue">
         <xsl:with-param name="xsiType" select="''"/>
         <xsl:with-param name="elemName">code</xsl:with-param>
         <xsl:with-param name="code" select="$code"/>
         <xsl:with-param name="codeSystem" select="$codeSystem"/>
         <xsl:with-param name="displayName" select="$displayName"/>
         <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
      </xsl:call-template>
   </xsl:template>
   <!-- Assigned Person IdentifiedConfirmable MedicationCombinedOrder -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9043_20150715173504">
      <xsl:attribute name="classCode">ASSIGNED</xsl:attribute>
      <xsl:for-each select="zorgverlener_identificatie_nummer">
         <xsl:choose>
            <xsl:when test="(@root = '2.16.528.1.1007.3.1') or (@root = '2.16.840.1.113883.2.4.6.1')">
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="elemName">id</xsl:with-param>
                  <xsl:with-param name="root" select="@root"/>
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <id nullFlavor="NI"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      <xsl:for-each select="specialisme">
         <xsl:call-template name="makeCEValue">
            <xsl:with-param name="elemName">code</xsl:with-param>
            <xsl:with-param name="xsiType" select="''"/>
         </xsl:call-template>
      </xsl:for-each>
      <assignee>
         <assigneePerson classCode="PSN" determinerCode="INSTANCE">
            <xsl:for-each select="zorgverlener_naam">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
                  <xsl:with-param name="naamgegevens" select="naamgegevens"/>
               </xsl:call-template>
            </xsl:for-each>
         </assigneePerson>
      </assignee>
      <xsl:for-each select="zorgaanbieder/zorgaanbieder[.//@value]">
         <!-- this is an error in the template:  representedOrganization is not in the xsd -->
         <!-- so Organization is the correct xml element name -->
         <xsl:comment>The message template (9043) incorrectly defines representedOrganization, however the xsd only accepts Organization</xsl:comment>
         <xsl:comment>Closed warnings schematron messages for this element should be ignored.</xsl:comment>
         <Organization classCode="ORG" determinerCode="INSTANCE">
            <xsl:for-each select="zorgaanbieder_identificatie_nummer[@value]">
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="elemName">id</xsl:with-param>
                  <xsl:with-param name="xsiType" select="''"/>
                  <xsl:with-param name="root" select="@root"/>
               </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="organisatie_naam[@value]">
               <name>
                  <xsl:value-of select="@value"/>
               </name>
            </xsl:for-each>
         </Organization>
      </xsl:for-each>
   </xsl:template>
   <!--MP CDA Dosering-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20150724151109">
      <doseQuantity>
         <xsl:for-each select="./aantal/min[@value]">
            <low>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                  <xsl:with-param name="Gstd_value" select="./@value"/>
                  <xsl:with-param name="Gstd_unit" select="./../../eenheid"/>
               </xsl:call-template>
            </low>
         </xsl:for-each>
         <xsl:for-each select="./aantal/vaste_waarde[@value]">
            <center>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                  <xsl:with-param name="Gstd_value" select="./@value"/>
                  <xsl:with-param name="Gstd_unit" select="./../../eenheid"/>
               </xsl:call-template>
            </center>
         </xsl:for-each>
         <xsl:for-each select="./aantal/max[@value]">
            <high>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                  <xsl:with-param name="Gstd_value" select="./@value"/>
                  <xsl:with-param name="Gstd_unit" select="./../../eenheid"/>
               </xsl:call-template>
            </high>
         </xsl:for-each>
      </doseQuantity>
   </xsl:template>

   <!--MP CDA Dosering-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840">
      <doseQuantity>
         <xsl:choose>
            <xsl:when test="./aantal/vaste_waarde/@value">
               <center>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                     <xsl:with-param name="Gstd_value" select="./aantal/vaste_waarde/@value"/>
                     <xsl:with-param name="Gstd_unit" select="./eenheid"/>
                  </xsl:call-template>
               </center>
            </xsl:when>
            <xsl:when test="./aantal/min/@value or ./aantal/max/@value">
               <xsl:for-each select="./aantal/min">
                  <!-- min komt 0 of 1 keer voor -->
                  <low>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000">
                        <xsl:with-param name="UCUMvalue" select="./@value"/>
                        <!-- TODO: tijdelijke fix in 9.04 waarbij de eenheid soms in @unit zit en soms in @value  -->
                        <!--<xsl:with-param name="UCUMunit"
                        select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>-->
                        <xsl:with-param name="UCUMunit" select="
                              if (../../eenheid/@unit) then
                                 nf:convertUnit_ADA2UCUM(../../eenheid/@unit)
                              else
                                 (if (../../eenheid/@value) then
                                    nf:convertUnit_ADA2UCUM(../../eenheid/@value)
                                 else
                                    (if (../../eenheid/@displayName) then
                                       nf:convertUnit_ADA2UCUM(../../eenheid/@displayName)
                                    else
                                       ''))"/>
                     </xsl:call-template>
                  </low>
               </xsl:for-each>
               <xsl:for-each select="./aantal/max">
                  <!-- max komt 0 of 1 keer voor -->
                  <high>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000">
                        <xsl:with-param name="UCUMvalue" select="./@value"/>
                        <!-- TODO: tijdelijke fix in 9.04 waarbij de eenheid soms in @unit zit en soms in @value  -->
                        <!--<xsl:with-param name="UCUMunit"
                        select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>-->
                        <xsl:with-param name="UCUMunit" select="
                              if (../../eenheid/@unit) then
                                 nf:convertUnit_ADA2UCUM(../../eenheid/@unit)
                              else
                                 (if (../../eenheid/@value) then
                                    nf:convertUnit_ADA2UCUM(../../eenheid/@value)
                                 else
                                    (if (../../eenheid/@displayName) then
                                       nf:convertUnit_ADA2UCUM(../../eenheid/@displayName)
                                    else
                                       ''))"/>
                     </xsl:call-template>
                  </high>
               </xsl:for-each>
            </xsl:when>
         </xsl:choose>
      </doseQuantity>
   </xsl:template>
   <!-- Afleverlocatie -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9063_20160217000000">
      <destination>
         <serviceDeliveryLocation>
            <code nullFlavor="NI"/>
            <!-- Item(s) :: afleverlocatie-->
            <addr>
               <desc>
                  <xsl:value-of select="@value"/>
               </desc>
            </addr>
         </serviceDeliveryLocation>
      </destination>
   </xsl:template>
   <!--maxDoseQuantity-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000">
      <numerator xsi:type="PQ">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
            <xsl:with-param name="Gstd_value" select="./aantal/@value"/>
            <xsl:with-param name="Gstd_unit" select="./eenheid"/>
         </xsl:call-template>
      </numerator>
      <denominator xsi:type="PQ">
         <xsl:attribute name="value" select="./tijdseenheid/@value"/>
         <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM(./tijdseenheid/@unit)"/>
      </denominator>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
      <!-- MP CDA Author Participation -->
      <xsl:param name="authorTime"/>
      <xsl:choose>
         <xsl:when test="$authorTime[1] instance of element()">
            <xsl:for-each select="$authorTime">
               <time>
                  <xsl:call-template name="makeTSValueAttr"/>
               </time>
            </xsl:for-each>
         </xsl:when>
         <xsl:otherwise>
            <time nullFlavor="NI"/>
         </xsl:otherwise>
      </xsl:choose>
      <assignedAuthor>
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506"/>
      </assignedAuthor>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209">
      <!--Stoptype-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9067"/>
         <code code="1" displayName="Stoptype" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <value xsi:type="CE" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1">
            <xsl:attribute name="code" select="./@code"/>
            <xsl:attribute name="displayName" select="./@displayName"/>
         </value>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9068_20160617150015">
      <!-- Reden voor medicatieafspraak -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9068"/>
         <code code="2" displayName="Reden medicatieafspraak" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <xsl:call-template name="makeCEValue"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405">
      <!-- Toelichting -->
      <act classCode="ACT" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9069"/>
         <code code="48767-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Toelichting"/>
         <text mediaType="text/plain">
            <xsl:value-of select="./@value"/>
         </text>
      </act>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
      <!--MP CDA Medication Information-->
      <xsl:param name="product"/>
      <xsl:if test="$product[1] instance of element()">
         <xsl:for-each select="$product">
            <manufacturedProduct classCode="MANU">
               <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9070"/>
               <manufacturedMaterial classCode="MMAT" determinerCode="KIND">
                  <xsl:choose>
                     <!-- Als productCode voorkomt, wordt productSpecificatie genegeerd. -->
                     <xsl:when test="./product_code">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
                           <xsl:with-param name="productCode" select="./product_code"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="./product_specificatie">
                        <!-- magistrale medicatie -->
                        <xsl:for-each select="./product_specificatie/product_naam[@value]">
                           <name>
                              <xsl:value-of select="./@value"/>
                           </name>
                        </xsl:for-each>
                        <xsl:for-each select="./product_specificatie/omschrijving[@value]">
                           <pharm:desc>
                              <xsl:value-of select="./@value"/>
                           </pharm:desc>
                        </xsl:for-each>
                        <xsl:for-each select="./product_specificatie/farmaceutische_vorm">
                           <pharm:formCode>
                              <xsl:call-template name="makeCodeAttribs">
                                 <xsl:with-param name="originalText" select="."/>
                              </xsl:call-template>
                           </pharm:formCode>
                        </xsl:for-each>
                        <xsl:for-each select="./product_specificatie/ingredient">
                           <pharm:ingredient classCode="INGR">
                              <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013"/>
                           </pharm:ingredient>
                        </xsl:for-each>
                     </xsl:when>
                  </xsl:choose>
               </manufacturedMaterial>
            </manufacturedProduct>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9071_20160618204153">
      <!--MP Ingredient quantity-->
      <xsl:for-each select="./hoeveelheid_ingredient">
         <numerator xsi:type="PQ">
            <xsl:variable name="UCUMvalue" select="./waarde/@value"/>
            <!-- TODO pub 9.04 patch waarbij eenheden in verschillende attributen kunnen zitten -->
            <xsl:variable name="UCUMunit" select="
                  if (./eenheid/@unit) then
                     nf:convertUnit_ADA2UCUM(./eenheid/@unit)
                  else
                     (if (./eenheid/@value) then
                        nf:convertUnit_ADA2UCUM(./eenheid/@value)
                     else
                        (if (./eenheid/@displayName) then
                           nf:convertUnit_ADA2UCUM(./eenheid/@displayName)
                        else
                           ''))"/>
            <xsl:attribute name="value" select="$UCUMvalue"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
               <xsl:with-param name="UCUMvalue" select="$UCUMvalue"/>
               <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
            </xsl:call-template>
         </numerator>
      </xsl:for-each>
      <xsl:for-each select="./hoeveelheid_product">
         <denominator xsi:type="PQ">
            <xsl:variable name="UCUMvalue" select="./waarde/@value"/>
            <!-- TODO pub 9.04 patch waarbij eenheden in verschillende attributen kunnen zitten -->
            <xsl:variable name="UCUMunit" select="
                  if (./eenheid/@unit) then
                     nf:convertUnit_ADA2UCUM(./eenheid/@unit)
                  else
                     (if (./eenheid/@value) then
                        nf:convertUnit_ADA2UCUM(./eenheid/@value)
                     else
                        (if (./eenheid/@displayName) then
                           nf:convertUnit_ADA2UCUM(./eenheid/@displayName)
                        else
                           ''))"/>
            <xsl:attribute name="value" select="$UCUMvalue"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
               <xsl:with-param name="UCUMvalue" select="$UCUMvalue"/>
               <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
            </xsl:call-template>
         </denominator>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9073_20160618205506">
      <xsl:param name="ingredientCode"/>
      <!--MP CDA Ingredient Material Kind-->
      <pharm:ingredient classCode="MMAT" determinerCode="KIND">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9074_20160618205801">
            <xsl:with-param name="ingredientCode" select="$ingredientCode"/>
         </xsl:call-template>
      </pharm:ingredient>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9074_20160618205801">
      <xsl:param name="ingredientCode"/>
      <!--MP CDA Material Code Ext-->
      <pharm:code>
         <xsl:call-template name="makeCodeAttribs">
            <xsl:with-param name="originalText" select="$ingredientCode"/>
         </xsl:call-template>
      </pharm:code>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9076_20160619200644">
      <!-- MP CDA Toedienschema -->
      <xsl:if test="(../../../herhaalperiode_cyclisch_schema) and (../toedieningsduur)">
         <error> Herhaalperiode cyclisch schema en toedienduur worden niet samen ondersteund. </error>
      </xsl:if>
      <xsl:choose>
         <!-- Cyclisch schema -->
         <xsl:when test="../../../herhaalperiode_cyclisch_schema">
            <effectiveTime operator="A" xsi:type="SXPR_TS">
               <xsl:for-each select="./frequentie">
                  <!-- De frequentie van inname binnen het cyclisch schema. -->
                  <comp>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947"/>
                  </comp>
               </xsl:for-each>
               <comp>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
               </comp>
            </effectiveTime>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <!-- Eenvoudig doseerschema met alleen één frequentie. -->
               <xsl:when test="./frequentie/tijdseenheid and not(./interval) and not(./toedientijd) and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <xsl:for-each select="./frequentie">
                     <effectiveTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>

               <!-- Eenvoudig doseerschema met alleen één interval. -->
               <xsl:when test="not(./frequentie/tijdseenheid) and ./interval and not(./toedientijd) and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <xsl:for-each select="./interval">
                     <effectiveTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>

               <!-- Eenvoudig doseerschema met één toedientijd. -->
               <xsl:when test="not(./interval) and count(./toedientijd) = 1 and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <xsl:for-each select="./toedientijd">
                     <effectiveTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                           <xsl:with-param name="operator" select="'A'"/>
                           <xsl:with-param name="isFlexible" select="'true'"/>
                        </xsl:call-template>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>

               <!-- doseerschema met toedieningsduur én frequentie -->
               <xsl:when test="./frequentie/tijdseenheid and not(./interval) and not(./toedientijd) and ../toedieningsduur and not(./weekdag) and not(./dagdeel)">
                  <effectiveTime>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                  </effectiveTime>
               </xsl:when>

               <!-- Eenvoudig doseerschema met meer dan één toedientijd. -->
               <xsl:when test="not(./interval) and count(./toedientijd) > 1 and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <effectiveTime operator="A" xsi:type="SXPR_TS">
                     <xsl:for-each select="./toedientijd">
                        <comp xsi:type="hl7nl:PIVL_TS">
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                              <xsl:with-param name="operator">
                                 <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                 <xsl:choose>
                                    <xsl:when test="not(./preceding-sibling::toedientijd)">
                                       <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:value-of select="'I'"/>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </xsl:with-param>
                              <xsl:with-param name="isFlexible" select="'true'"/>
                           </xsl:call-template>
                        </comp>
                     </xsl:for-each>
                  </effectiveTime>
               </xsl:when>

               <!-- Eenmalig gebruik. Of een aantal keer zonder verdere aanduiding wanneer -->
               <xsl:when test="./frequentie/aantal and not(./frequentie/tijdseenheid) and not(./interval)">
                  <xsl:for-each select="./frequentie">
                     <effectiveTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20160711104612"/>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>

               <!-- Doseerschema per week op één weekdag. Met evt een toedientijd -->
               <xsl:when test="count(./weekdag) = 1 and count(./toedientijd) &lt;= 1 and not(./frequentie[tijdseenheid/@value != 'week'])">
                  <xsl:variable name="aantalPerWeek">
                     <xsl:value-of select="./frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                  </xsl:variable>
                  <xsl:for-each select="./weekdag">
                     <effectiveTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                           <xsl:with-param name="operator" select="'A'"/>
                           <xsl:with-param name="toedientijd" select="../toedientijd"/>
                           <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                           <xsl:with-param name="weekdagCode" select="./@code"/>
                        </xsl:call-template>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>

               <!-- Complexer doseerschema met weekdag(en) eventueel gecombineerd met 0 of meer frequenties en vaste tijd(en) -->
               <xsl:when test="count(./weekdag) > 1 or (./weekdag and count(./frequentie[tijdseenheid/@value != 'week']) >= 1) or (./weekdag and count(./toedientijd) > 1)">
                  <xsl:variable name="aantalPerWeek">
                     <!-- Zou onzin moeten zijn om meerdere keren per week te combineren met weekdagen -->
                     <xsl:value-of select="./frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                  </xsl:variable>
                  <effectiveTime xsi:type="SXPR_TS" operator="A">
                     <xsl:for-each select="./frequentie[tijdseenheid/@value != 'week']">
                        <comp>
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                        </comp>
                     </xsl:for-each>
                     <xsl:choose>
                        <!-- Weekdag(en) zonder toedientijd -->
                        <xsl:when test="not(./toedientijd)">
                           <xsl:for-each select="./weekdag">
                              <xsl:variable name="effectiveTimeOperator">
                                 <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                 <xsl:choose>
                                    <xsl:when test="not(./preceding-sibling::weekdag)">
                                       <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:value-of select="'I'"/>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </xsl:variable>
                              <comp>
                                 <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                    <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                                    <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                    <xsl:with-param name="weekdagCode" select="./@code"/>
                                 </xsl:call-template>
                              </comp>
                           </xsl:for-each>
                        </xsl:when>
                        <!-- Minstens 1 toedientijd en minstens 1 weekdag: voeg alle combinaties toe -->
                        <xsl:otherwise>
                           <xsl:for-each select="./toedientijd">
                              <xsl:variable name="curToedientijd" select="."/>
                              <!-- Voor de overzichtelijkheid van het resultaat zou het handiger zijn om eerst over weekdagen,
                                   en daarbinnen over toedientijden te itereren, omdat de <comp>'s dan chronologisch staan.
                                   Maar omdat het aangeroepen template de weekdag als context verwacht, is 
                              -->
                              <xsl:for-each select="../weekdag">
                                 <xsl:variable name="curWeekdag" select="."/>
                                 <xsl:variable name="effectiveTimeOperator">
                                    <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                    <xsl:choose>
                                       <xsl:when test="not($curWeekdag/preceding-sibling::weekdag) and not($curToedientijd/preceding-sibling::toedientijd)">
                                          <xsl:value-of select="'A'"/>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:value-of select="'I'"/>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </xsl:variable>
                                 <comp>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                       <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                                       <xsl:with-param name="toedientijd" select="$curToedientijd"/>
                                       <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                       <xsl:with-param name="weekdagCode" select="./@code"/>
                                    </xsl:call-template>
                                 </comp>
                              </xsl:for-each>
                           </xsl:for-each>
                        </xsl:otherwise>
                     </xsl:choose>
                  </effectiveTime>
               </xsl:when>

               <!-- Combinatie dagdeel en weekdag wordt (nog) niet ondersteund. -->

               <!-- dagdeel> -->
               <xsl:when test="not(./interval) and not(./toedientijd) and not(../toedieningsduur) and not(./weekdag) and count(./dagdeel) = 1">
                  <xsl:choose>
                     <xsl:when test="./dagdeel/@code = '2546009'">
                        <!--  's nachts -->
                        <effectiveTime>
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9159_20160728135022">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:when>
                     <xsl:when test="./dagdeel/@code = '73775008'">
                        <!--  's morgens -->
                        <effectiveTime>
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9156_20160728135021">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:when>
                     <xsl:when test="./dagdeel/@code = '255213009'">
                        <!--  's middags -->
                        <effectiveTime>
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9157_20160728135022">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:when>
                     <xsl:when test="./dagdeel/@code = '3157002'">
                        <!--  's avonds -->
                        <effectiveTime>
                           <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9158_20160728135022">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:when>
                  </xsl:choose>
               </xsl:when>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955">
      <!-- HL7NL PIVL_TS Interval -->
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:attribute name="operator" select="'A'"/>
      <xsl:attribute name="isFlexible" select="'false'"/>
      <hl7nl:frequency>
         <hl7nl:numerator xsi:type="hl7nl:INT">
            <xsl:attribute name="value">
               <xsl:value-of select="./@value"/>
            </xsl:attribute>
         </hl7nl:numerator>
         <hl7nl:denominator xsi:type="hl7nl:PQ">
            <xsl:call-template name="makeTimeDenominatorAttribs"/>
         </hl7nl:denominator>
      </hl7nl:frequency>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239">
      <!-- HL7NL PIVL_TS Frequency -->
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:attribute name="operator" select="'A'"/>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
      <!-- HL7NL PIVL_TS Vaste Tijd -->
      <xsl:param name="operator"/>
      <xsl:param name="isFlexible"/>
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:call-template name="chooseOperatorAttrib">
         <xsl:with-param name="operator" select="$operator"/>
      </xsl:call-template>
      <xsl:attribute name="isFlexible" select="$isFlexible = 'true'"/>
      <hl7nl:phase>
         <hl7nl:low>
            <xsl:call-template name="makeTSValueAttr"/>
         </hl7nl:low>
      </hl7nl:phase>
      <hl7nl:period unit="d" value="1"/>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112">
      <!-- HL7NL PIVL_TS Cyclisch schema -->
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:attribute name="operator" select="'A'"/>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:for-each select="../../doseerduur">
         <hl7nl:phase>
            <hl7nl:width xsi:type="hl7nl:PQ">
               <xsl:call-template name="makeTimePQValueAttribs"/>
            </hl7nl:width>
         </hl7nl:phase>
      </xsl:for-each>
      <xsl:for-each select="../../../herhaalperiode_cyclisch_schema">
         <hl7nl:period>
            <xsl:attribute name="value" select="./@value"/>
            <xsl:attribute name="unit" select="'d'"/>
            <!-- Tijdseenheid is per definitie 'dag' -->
         </hl7nl:period>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9083_20160621100220">
      <!-- Reden voor toedieningsafspraak -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9083"/>
         <code code="3" displayName="Reden voor deze toedieningsafspraak" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <text mediaType="text/plain">
            <xsl:value-of select="./@value"/>
         </text>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
      <xsl:param name="MBHroot"/>
      <!--MP MedBeh identificatie-->
      <procedure classCode="PROC" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9084"/>
         <id>
            <xsl:choose>
               <xsl:when test="//$MBHroot/identificatie/@value">
                  <xsl:attribute name="root" select="$MBHroot/identificatie/@root"/>
                  <xsl:attribute name="extension" select="//$MBHroot/identificatie/@value"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:attribute name="nullFlavor" select="'NI'"/>
               </xsl:otherwise>
            </xsl:choose>
         </id>
         <code code="1" displayName="Medicamenteuze behandeling" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>
      </procedure>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
      <!-- MP CDA Aanvullende gebruiksinstructie -->
      <act classCode="ACT" moodCode="RQO">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9085"/>
         <!--<xsl:call-template name="makeCode"/>-->
         <!-- Dus voor nu maar hard coderen -->
         <code>
            <xsl:call-template name="makeNullflavorWithToelichting"/>
         </code>
      </act>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
      <xsl:param name="identificatieElement"/>
      <!-- MP Medicatieafspraak identificatie -->
      <substanceAdministration classCode="SBADM" moodCode="RQO">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9086"/>
         <xsl:if test="$identificatieElement[1] instance of element()">
            <xsl:for-each select="$identificatieElement">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
         </xsl:if>
         <code code="16076005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="Medicatieafspraak"/>
         <consumable xsi:nil="true"/>
      </substanceAdministration>
   </xsl:template>
   <!-- Verstrekkingsverzoek -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9087_20160621125157">
      <xsl:param name="vv"/>

      <xsl:for-each select="$vv">
         <supply classCode="SPLY" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9087"/>

            <!-- identificatie -->
            <xsl:for-each select="./identificatie[@value]">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>

            <code codeSystemName="Medicatieproces acts" displayName="Verstrekkingsverzoek" code="3" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>

            <!-- aantal herhalingen -->
            <xsl:for-each select="./aantal_herhalingen[@value]">
               <repeatNumber>
                  <xsl:attribute name="value" select="xs:int(./@value) + 1"/>
               </repeatNumber>
            </xsl:for-each>

            <!-- Te verstrekken hoeveelheid -->
            <xsl:for-each select="./te_verstrekken_hoeveelheid[//@value]">
               <quantity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
               </quantity>
            </xsl:for-each>

            <!-- verbruiksperiode -->
            <xsl:for-each select="./verbruiksperiode">
               <expectedUseTime>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="low" select="./ingangsdatum"/>
                     <xsl:with-param name="width" select="./duur"/>
                     <xsl:with-param name="high" select="./einddatum"/>
                  </xsl:call-template>
               </expectedUseTime>
            </xsl:for-each>

            <!-- Te verstrekken geneesmiddel -->
            <xsl:for-each select="./te_verstrekken_geneesmiddel/product">
               <product>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </product>
            </xsl:for-each>

            <!-- beoogd verstrekker -->
            <xsl:for-each select="./beoogd_verstrekker/zorgaanbieder">
               <performer>
                  <assignedEntity>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                  </assignedEntity>
               </performer>
            </xsl:for-each>

            <!-- Auteur / zorgverlener -->
            <xsl:for-each select="./auteur/zorgverlener">
               <author>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                     <xsl:with-param name="authorTime" select="../../datum"/>
                  </xsl:call-template>
               </author>
            </xsl:for-each>

            <!-- afleverlocatie -->
            <xsl:for-each select="./afleverlocatie">
               <participant typeCode="DST">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
               </participant>
            </xsl:for-each>

            <!-- aanvullende wensen -->
            <xsl:for-each select="./aanvullende_wensen[@code]">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="./toelichting[@value]">
               <!-- kan er 0 of 1 zijn -->
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- relatie naar MA -->
            <xsl:for-each select="./relatie_naar_medicatieafspraak">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                     <xsl:with-param name="identificatieElement" select="./identificatie"/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                  <xsl:with-param name="MBHroot" select=".."/>
               </xsl:call-template>
            </entryRelationship>

         </supply>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312">
      <!--MP CDA assigned organisatie-->
      <id nullFlavor="NI"/>
      <representedOrganization>
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
      </representedOrganization>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042">
      <!--MP CDA Organization id name-->
      <xsl:for-each select="./zorgaanbieder_identificatie_nummer">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9112_20160710120116"/>
      </xsl:for-each>
      <xsl:for-each select="./organisatie_naam">
         <name>
            <xsl:value-of select="./@value"/>
         </name>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127">
      <!-- Adres Afleverlocatie -->
      <participantRole classCode="SDLOC">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9091"/>
         <addr>
            <!-- Eigenlijk apart template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9092,
                 maar omdat bij de ADA form invoer een enkel adres tekst veld alle info bevat, 
                 stoppen we die maar handmatig in het <desc> veld. -->
            <desc>
               <xsl:value-of select="./@value"/>
            </desc>
         </addr>
      </participantRole>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534">
      <!--Aanvullende wens-->
      <act classCode="ACT" moodCode="RQO">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9093"/>
         <xsl:choose>
            <xsl:when test="./@code">
               <code>
                  <xsl:attribute name="code" select="./@code"/>
                  <xsl:attribute name="codeSystem" select="./@codeSystem"/>
                  <xsl:attribute name="displayName" select="./@displayName"/>
               </code>
            </xsl:when>
            <!-- Niet ondersteund door huidige ADA form; onzeker of vrije tekst dan in displayaName opgeslagen zou worden. -->
            <!--<xsl:otherwise>
               <code nullFlavor="OTH">
                  <originalText>
                     <xsl:value-of select="./@displayName"/>
                  </originalText>
               </code>
            </xsl:otherwise>-->
         </xsl:choose>
      </act>
   </xsl:template>
   <!-- Verstrekking -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9094_20160623194106">
      <xsl:param name="vs"/>

      <xsl:for-each select="$vs">
         <supply classCode="SPLY" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9094"/>
            <!-- identificatie -->
            <xsl:for-each select="./identificatie">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>

            <code codeSystemName="Medicatieproces acts" displayName="Verstrekking" code="373784005" codeSystem="2.16.840.1.113883.6.96"/>

            <!-- (uitreik-)datum   (Aanschrijfdatum zit in EntityRelation) -->
            <xsl:for-each select="./datum">
               <effectiveTime>
                  <xsl:call-template name="makeTSValueAttr"/>
               </effectiveTime>
            </xsl:for-each>

            <xsl:for-each select="./verstrekte_hoeveelheid">
               <quantity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
               </quantity>
            </xsl:for-each>

            <xsl:for-each select="./verbruiks_duur">
               <expectedUseTime>
                  <!-- Tijdseenheid is verplicht in dagen -->
                  <width value="{./@value}" unit="d"/>
               </expectedUseTime>
            </xsl:for-each>

            <xsl:for-each select="./verstrekt_geneesmiddel/product">
               <product>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </product>
            </xsl:for-each>

            <xsl:for-each select="./verstrekker/zorgaanbieder">
               <performer>
                  <assignedEntity>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                  </assignedEntity>
               </performer>
            </xsl:for-each>

            <xsl:for-each select="./afleverlocatie">
               <participant typeCode="DST">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
               </participant>
            </xsl:for-each>

            <xsl:for-each select="./aanschrijfdatum">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./distributievorm">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="./toelichting">
               <!-- kan er 0 of 1 zijn -->
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- relatie naar Verstrekkingsverzoek -->
            <xsl:for-each select="./relatie_naar_verstrekkingsverzoek">
               <!-- kunnen er 0 of 1 zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9096_20160623201738"/>
               </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                  <xsl:with-param name="MBHroot" select=".."/>
               </xsl:call-template>
            </entryRelationship>

         </supply>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047">
      <!--Aanschrijfdatum-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9095"/>
         <code code="4" displayName="Aanschrijfdatum" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="MP Observaties"/>
         <value xsi:type="TS">
            <xsl:attribute name="value">
               <xsl:call-template name="format2HL7Date">
                  <xsl:with-param name="dateTime" select="./@value"/>
               </xsl:call-template>
            </xsl:attribute>
         </value>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9096_20160623201738">
      <!--'MP Verstrekkingsverzoek identificatie'-->
      <supply classCode="SPLY" moodCode="RQO">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9096"/>
         <id root="{./identificatie/@root}" extension="{./identificatie/@value}"/>
         <code code="3" displayName="Verstrekkingsverzoek" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>
      </supply>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415">
      <!-- Distributievorm -->
      <act classCode="ACT" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9097"/>
         <code code="{./@code}" codeSystem="{./@codeSystem}" codeSystemName="Distributievorm" displayName="{./@displayName}"/>
      </act>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
      <xsl:param name="identificatieElement"/>
      <!-- MP Toedieningsafspraak identificatie -->
      <substanceAdministration classCode="SBADM" moodCode="RQO">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9101"/>
         <xsl:if test="$identificatieElement[1] instance of element()">
            <xsl:for-each select="$identificatieElement">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
         </xsl:if>
         <code displayName="Toedieningsafspraak" code="422037009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
         <consumable xsi:nil="true"/>
      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
      <xsl:param name="identificatieElement"/>
      <!--MP Verstrekking identificatie-->
      <supply classCode="SPLY" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9102"/>
         <xsl:if test="$identificatieElement[1] instance of element()">
            <xsl:for-each select="$identificatieElement">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
         </xsl:if>
         <code code="373784005" displayName="Verstrekking" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
      </supply>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013">
      <!--MP CDA Ingredient-->
      <xsl:for-each select="./sterkte">
         <pharm:quantity>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9071_20160618204153"/>
         </pharm:quantity>
      </xsl:for-each>
      <xsl:for-each select="./ingredient_code">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9073_20160618205506">
            <xsl:with-param name="ingredientCode" select="."/>
         </xsl:call-template>
      </xsl:for-each>
      <!-- De 'aanvullen tot' indicatie is hier niet geimplementeerd omdat dit in ADA niet aan te geven is. -->
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
      <!-- MP CDA Medication Code -->
      <xsl:param name="productCode"/>
      <xsl:if test="$productCode[1] instance of element()">
         <xsl:for-each select="$productCode">
            <xsl:call-template name="makeCode"/>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9112_20160710120116">
      <!-- MP CDA Zorgaanbieder identificaties -->
      <xsl:call-template name="makeIIid"/>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506">
      <!-- MP CDA Zorgverlener -->
      <!--<templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9113"/>-->
      <xsl:for-each select="./zorgverlener_identificatie_nummer[@value]">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>
      <xsl:for-each select="./specialisme[@code]">
         <code>
            <xsl:call-template name="makeCodeAttribs"/>
         </code>
      </xsl:for-each>
      <xsl:for-each select="./zorgverlener_naam">
         <assignedPerson>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
               <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
            </xsl:call-template>
         </assignedPerson>
      </xsl:for-each>
      <xsl:for-each select="./zorgaanbieder/zorgaanbieder">
         <representedOrganization>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
         </representedOrganization>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744">
      <!--Reden voor medicatiegebruik-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9114"/>
         <code code="6" displayName="Reden voor medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="Medicatieproces observaties"/>
         <text>
            <xsl:value-of select="./@value"/>
         </text>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719">
      <!--Reden voor wijzigen/stoppen medicatiegebruik-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9115"/>
         <code code="7" displayName="Reden stoppen/wijzigen medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="Medicatieproces observaties"/>
         <value xsi:type="CE" code="{./@code}" displayName="{./@displayName}" codeSystem="{./@codeSystem}" codeSystemName="Medicatieafspraak reden"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752">
      <!--Volgens afspraak indicator-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9117"/>
         <code displayName="Volgens afspraak indicator" code="8" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <value xsi:type="BL" value="{./@value}"/>
      </observation>
   </xsl:template>
   <!-- template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9119_20160710204856 verwijderd: aanroepen vervangen door zib versie -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947">
      <!-- HL7NL PIVL_TS Frequency NoRange -->
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:attribute name="operator" select="'A'"/>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <hl7nl:frequency>
         <hl7nl:numerator xsi:type="hl7nl:INT">
            <xsl:attribute name="value" select="./aantal/vaste_waarde/@value"/>
         </hl7nl:numerator>
         <xsl:for-each select="./tijdseenheid">
            <hl7nl:denominator unit="wk" value="1" xsi:type="hl7nl:PQ">
               <xsl:call-template name="makeTimeDenominatorAttribs"/>
            </hl7nl:denominator>
         </xsl:for-each>
      </hl7nl:frequency>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20160711104612">
      <!-- HL7NL PIVL_TS Aantal keer. -->
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:attribute name="operator" select="'A'"/>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <hl7nl:period nullFlavor="NI"/>
      <xsl:for-each select="./aantal/vaste_waarde">
         <hl7nl:count>
            <xsl:attribute name="value" select="./@value"/>
         </hl7nl:count>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9122_20160713172302">
      <!-- MP CDA Body Height -->
      <xsl:param name="effectiveTime"/>
      <xsl:param name="PQvalue"/>
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9122"/>
         <code code="8302-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Lengte"/>
         <xsl:call-template name="makeEffectiveTime">
            <xsl:with-param name="effectiveTime" select="$effectiveTime"/>
         </xsl:call-template>
         <xsl:if test="$PQvalue[1] instance of element()">
            <xsl:for-each select="$PQvalue">
               <xsl:call-template name="makePQValue"/>
            </xsl:for-each>
         </xsl:if>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9123_20160713212617">
      <!-- MP CDA Body Weight -->
      <xsl:param name="effectiveTime"/>
      <xsl:param name="PQvalue"/>
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9123"/>
         <code code="3142-7" codeSystem="2.16.840.1.113883.6.1" displayName="Body Weight"/>
         <xsl:call-template name="makeEffectiveTime">
            <xsl:with-param name="effectiveTime" select="$effectiveTime"/>
         </xsl:call-template>
         <xsl:if test="$PQvalue[1] instance of element()">
            <xsl:for-each select="$PQvalue">
               <xsl:call-template name="makePQValue"/>
            </xsl:for-each>
         </xsl:if>
      </observation>
   </xsl:template>
   <!--Voorstel Verstrekkingsverzoek-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9131_20160714202241">
      <xsl:param name="vvv"/>
      <!--MP CDA Voorstel Verstrekkingsverzoek-->

      <supply classCode="SPLY" moodCode="PRP">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9131"/>
         <code codeSystemName="Medicatieproces acts" displayName="Verstrekkingsverzoek" code="3" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>
         <!-- aantal herhalingen -->
         <xsl:for-each select="./aantal_herhalingen[@value]">
            <repeatNumber>
               <xsl:attribute name="value" select="xs:int(./@value) + 1"/>
            </repeatNumber>
         </xsl:for-each>

         <!-- Te verstrekken hoeveelheid -->
         <xsl:for-each select="./te_verstrekken_hoeveelheid">
            <quantity>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
            </quantity>
         </xsl:for-each>

         <!-- verbruiksperiode -->
         <xsl:for-each select="./verbruiksperiode">
            <expectedUseTime>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                  <xsl:with-param name="low" select="./ingangsdatum"/>
                  <xsl:with-param name="width" select="./duur"/>
                  <xsl:with-param name="high" select="./einddatum"/>
               </xsl:call-template>
            </expectedUseTime>
         </xsl:for-each>

         <!-- Te verstrekken geneesmiddel -->
         <xsl:for-each select="./te_verstrekken_geneesmiddel/product">
            <product>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                  <xsl:with-param name="product" select="."/>
               </xsl:call-template>
            </product>
         </xsl:for-each>

         <!-- beoogd verstrekker -->
         <xsl:for-each select="./beoogd_verstrekker/zorgaanbieder">
            <performer>
               <assignedEntity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
               </assignedEntity>
            </performer>
         </xsl:for-each>

         <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
         <xsl:for-each select="//voorstelgegevens/auteur">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
               <xsl:with-param name="authorTime" select="../voorstel_datum"/>
            </xsl:call-template>
         </xsl:for-each>

         <!-- afleverlocatie -->
         <xsl:for-each select="./afleverlocatie">
            <participant typeCode="DST">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
            </participant>
         </xsl:for-each>

         <!-- Toelichting op het voorstel (er is ook een toelichting bij de MA) -->
         <xsl:for-each select="//voorstelgegevens/toelichting">
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9183_20170818085324"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- aanvullende wensen -->
         <xsl:for-each select="./aanvullende_wensen">
            <!-- kunnen er 0 of meer zijn -->
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Toelichting bij het gebruik -->
         <xsl:for-each select="./toelichting">
            <!-- kan er 0 of 1 zijn -->
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
            </entryRelationship>
         </xsl:for-each>

         <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
         <entryRelationship typeCode="COMP" inversionInd="true">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
               <xsl:with-param name="MBHroot" select=".."/>
            </xsl:call-template>
         </entryRelationship>
      </supply>
   </xsl:template>
   <!-- Medicatieafspraak -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9148_20160725130413">
      <!-- Medicatieafspraak met eventueel op-/afbouw schema. -->
      <xsl:param name="ma"/>
      <xsl:for-each select="$ma">
         <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9148"/>

            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503"/>

            <xsl:for-each select="./afgesproken_geneesmiddel/product">
               <consumable>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </consumable>
            </xsl:for-each>
            <xsl:for-each select="./voorschrijver/zorgverlener">
               <author>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                     <xsl:with-param name="authorTime" select="../../afspraakdatum"/>
                  </xsl:call-template>
               </author>
            </xsl:for-each>
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
               <xsl:with-param name="ma" select="."/>
            </xsl:call-template>

            <!-- Kopie-indicator -->
            <xsl:if test="./kopie_indicator">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                     <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:if>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                  <xsl:with-param name="MBHroot" select=".."/>
               </xsl:call-template>
            </entryRelationship>

         </substanceAdministration>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340">
      <!-- MP CDA Dosering -->
      <substanceAdministration classCode="SBADM" moodCode="RQO">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9149"/>
         <xsl:if test="not(../../herhaalperiode_cyclisch_schema)">
            <!-- Alleen bij een NIET cyclisch schema -->
            <xsl:for-each select="../doseerduur">
               <!-- TODO: ondersteuning voor 'tot nader order' - niet urgent omdat dit in ADA niet kan worden opgegeven -->
               <effectiveTime xsi:type="IVL_TS">
                  <width>
                     <xsl:call-template name="makeTimePQValueAttribs"/>
                  </width>
               </effectiveTime>
            </xsl:for-each>
         </xsl:if>
         <xsl:for-each select="./toedieningsschema">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9076_20160619200644"/>
         </xsl:for-each>
         <xsl:for-each select="./keerdosis">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840"/>
         </xsl:for-each>
         <xsl:for-each select="./toedieningssnelheid">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449"/>
         </xsl:for-each>
         <xsl:for-each select="./zo_nodig/maximale_dosering[.//@value]">
            <maxDoseQuantity>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000"/>
            </maxDoseQuantity>
         </xsl:for-each>

         <!-- Altijd verplicht op deze manier aanwezig in de HL7 -->
         <consumable xsi:nil="true"/>

         <xsl:for-each select="./zo_nodig/criterium[.//@code or .//@value]">
            <precondition>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9182_20170601000000">
                  <xsl:with-param name="code" select="./code/@code"/>
                  <xsl:with-param name="codeSystem" select="./code/@codeSystem"/>
                  <xsl:with-param name="displayName" select="./code/@displayName"/>
                  <xsl:with-param name="strOriginalText" select="./code/@originalText"/>
               </xsl:call-template>
            </precondition>
         </xsl:for-each>
      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449">
      <!--MP CDA Toedieningssnelheid-->
      <rateQuantity>
         <xsl:variable name="speedUnit">
            <!-- TODO: tijdelijke fix in 9.04 waarbij de eenheid soms in @unit zit en soms in @value  -->
            <!--<xsl:value-of select="./eenheid/@value"/>-->
            <xsl:value-of select="
                  if (./eenheid/@unit) then
                     nf:convertUnit_ADA2UCUM(./eenheid/@unit)
                  else
                     (if (./eenheid/@value) then
                        nf:convertUnit_ADA2UCUM(./eenheid/@value)
                     else
                        (if (./eenheid/@displayName) then
                           nf:convertUnit_ADA2UCUM(./eenheid/@displayName)
                        else
                           ''))"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="./tijdseenheid/@unit"/>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="./waarde/vaste_waarde/@value">
               <center>
                  <xsl:choose>
                     <xsl:when test="./tijdseenheid/@value">
                        <xsl:attribute name="value" select="./waarde/vaste_waarde/@value div ./tijdseenheid/@value"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:attribute name="value" select="./waarde/vaste_waarde/@value"/>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:attribute name="unit" select="$speedUnit"/>
               </center>
            </xsl:when>
            <xsl:when test="./waarde/min/@value or ./waarde/max/@value">
               <xsl:for-each select="./waarde/min">
                  <!-- min can occur 0 or 1 time -->
                  <low>
                     <xsl:choose>
                        <xsl:when test="../../tijdseenheid/@value">
                           <xsl:attribute name="value" select="./@value div ../../tijdseenheid/@value"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:attribute name="value" select="./@value"/>
                        </xsl:otherwise>
                     </xsl:choose>
                     <xsl:attribute name="unit" select="$speedUnit"/>
                  </low>
               </xsl:for-each>
               <xsl:for-each select="./waarde/max">
                  <!-- max can occur 0 or 1 time -->
                  <high>
                     <xsl:choose>
                        <xsl:when test="../../tijdseenheid/@value">
                           <xsl:attribute name="value" select="./@value div ../../tijdseenheid/@value"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:attribute name="value" select="./@value"/>
                        </xsl:otherwise>
                     </xsl:choose>
                     <xsl:attribute name="unit" select="$speedUnit"/>
                  </high>
               </xsl:for-each>
            </xsl:when>
         </xsl:choose>
      </rateQuantity>
   </xsl:template>
   <!-- Toedieningsafspraak -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9152_20160726163318">
      <xsl:param name="ta"/>
      <xsl:for-each select="$ta">
         <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9152"/>
            <xsl:for-each select="./identificatie">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
               <text mediaType="text/plain">
                  <xsl:value-of select="./@value"/>
               </text>
            </xsl:for-each>

            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="./geannuleerd_indicator/@value = 'true'">
               <statusCode code="nullified"/>
            </xsl:if>

            <!-- Gebruiksperiode -->
            <!-- TODO: Tijdelijke fix (9.04) waarbij aparte velden in ADA form staan voor effectiveTime\low en -\high -->
            <xsl:if test="./gebruiksperiode or ./gebruiksperiode_start or ./gebruiksperiode_eind">
               <effectiveTime xsi:type="IVL_TS">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                     <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                     <xsl:with-param name="width" select="./gebruiksperiode"/>
                  </xsl:call-template>
               </effectiveTime>
            </xsl:if>

            <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
               <routeCode>
                  <xsl:call-template name="makeCodeAttribs"/>
               </routeCode>
            </xsl:for-each>

            <xsl:for-each select="./geneesmiddel_bij_toedieningsafspraak/product">
               <consumable>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </consumable>
            </xsl:for-each>

            <!-- Verstrekker -->
            <xsl:for-each select="./verstrekker/zorgaanbieder/zorgaanbieder">
               <author>
                  <time>
                     <xsl:choose>
                        <xsl:when test="../../../afspraakdatum/@value">
                           <xsl:attribute name="value">
                              <xsl:call-template name="format2HL7Date">
                                 <xsl:with-param name="dateTime" select="../../../afspraakdatum/@value"/>
                              </xsl:call-template>
                           </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:attribute name="nullFlavor" select="'NI'"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </time>
                  <assignedAuthor>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                  </assignedAuthor>
               </author>
            </xsl:for-each>

            <xsl:for-each select="./stoptype">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./reden_afspraak">
               <entryRelationship typeCode="RSON">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9083_20160621100220"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
               <entryRelationship typeCode="SPRT">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./aanvullende_informatie">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./toelichting">
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
               </entryRelationship>
            </xsl:for-each>

            <!--Doseerinstructie-->
            <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
               <entryRelationship typeCode="COMP">
                  <xsl:for-each select="../volgnummer">
                     <sequenceNumber>
                        <xsl:attribute name="value" select="./@value"/>
                     </sequenceNumber>
                  </xsl:for-each>
                  <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                  <xsl:if test="not(../volgnummer)">
                     <sequenceNumber>
                        <xsl:attribute name="value" select="1"/>
                     </sequenceNumber>
                  </xsl:if>
                  <xsl:for-each select=".">
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                  </xsl:for-each>
               </entryRelationship>
            </xsl:for-each>

            <!-- Kopie-indicator -->
            <xsl:if test="./kopie_indicator">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                     <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:if>

            <!-- relatie naar MA -->
            <xsl:for-each select="./relatie_naar_medicatieafspraak">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                     <xsl:with-param name="identificatieElement" select="./identificatie"/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>
            <!-- Als relatie naar MA ontbreekt: vul nullFlavor OID in met waarde 'NI' -->
            <xsl:if test="not(./relatie_naar_medicatieafspraak)">
               <substanceAdministration classCode="SBADM" moodCode="RQO">
                  <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9086"/>
                  <id extension="NI" root="2.16.840.1.113883.5.1008"/>
                  <code code="16076005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="Medicatieafspraak"/>
                  <consumable xsi:nil="true"/>
               </substanceAdministration>
            </xsl:if>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                  <xsl:with-param name="MBHroot" select=".."/>
               </xsl:call-template>
            </entryRelationship>

         </substanceAdministration>
      </xsl:for-each>
   </xsl:template>

   <!--Voorstel Medicatieafspraak-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9153_20160726162345">
      <xsl:param name="vma"/>
      <!-- MP CDA Voorstel Medicatieafspraak -->

      <xsl:for-each select="$vma">
         <substanceAdministration classCode="SBADM" moodCode="PRP">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9153"/>

            <!-- Geen id bij voorstel MA: dit is een vluchtig ding waar toch niet naar verwezen mag worden. -->

            <code code="16076005" displayName="Medicatieafspraak" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
               <text mediaType="text/plain">
                  <xsl:value-of select="./@value"/>
               </text>
            </xsl:for-each>

            <!-- Gebruiksperiode -->
            <!-- TODO: Tijdelijke fix (9.04) waarbij aparte velden in ADA form staan voor effectiveTime\low en -\high -->
            <xsl:if test="./gebruiksperiode or ./gebruiksperiode_start or ./gebruiksperiode_eind">
               <effectiveTime xsi:type="IVL_TS">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                     <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                     <xsl:with-param name="width" select="./gebruiksperiode"/>
                  </xsl:call-template>
               </effectiveTime>
            </xsl:if>
            <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
               <routeCode>
                  <xsl:call-template name="makeCodeAttribs"/>
               </routeCode>
            </xsl:for-each>

            <xsl:for-each select="./afgesproken_geneesmiddel/product">
               <consumable>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </consumable>
            </xsl:for-each>

            <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
            <xsl:for-each select="//voorstelgegevens/auteur">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
                  <xsl:with-param name="authorTime" select="../voorstel_datum"/>
               </xsl:call-template>
            </xsl:for-each>

            <!-- Toelichting op het voorstel (er is ook een toelichting bij de MA) -->
            <xsl:for-each select="//voorstelgegevens/toelichting">
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9183_20170818085324"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
               <xsl:with-param name="ma" select="."/>
            </xsl:call-template>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                  <xsl:with-param name="MBHroot" select=".."/>
               </xsl:call-template>
            </entryRelationship>

         </substanceAdministration>
      </xsl:for-each>
   </xsl:template>

   <!--Medicatiegebruik t/m MP 9.04; vervangen door 9190 -->
   <!--<xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9154_20160726181533">
      <xsl:param name="gb"/>

      <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>

      <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="{not($isInGebruik)}">
         <!-\- Feitelijk medicatiegebruik -\->
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9154"/>
         <!-\- identificatie -\->
         <xsl:for-each select="./identificatie">
            <xsl:call-template name="makeIIid"/>
         </xsl:for-each>
         <code code="6" displayName="Gebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"
            codeSystemName="Medicatieproces acts"/>
         <xsl:for-each select="./gebruiksinstructie/omschrijving">
            <text mediaType="text/plain">
               <xsl:value-of select="./@value"/>
            </text>
         </xsl:for-each>
         <!-\- Gebruiksperiode -\->
         <!-\-<xsl:if test="$isInGebruik"> -\->
            <!-\- EffectiveTime mag niet voorkomen als gebruiksindicator = false
                 Deze eis gaat vervallen, en er is sowieso geen reden om dit in de conversie af te dwingen. -\->
            <!-\- TODO: Tijdelijke fix (9.04) waarbij aparte velden in ADA form staan voor effectiveTime\low en -\high -\->
            <xsl:if test="./gebruiksperiode or ./gebruiksperiode_start or ./gebruiksperiode_eind">
               <effectiveTime xsi:type="IVL_TS">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                     <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                     <xsl:with-param name="width" select="./gebruiksperiode"/>
                  </xsl:call-template>
               </effectiveTime>
            </xsl:if>
         <!-\-</xsl:if>-\->
         <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
            <routeCode>
               <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
         </xsl:for-each>
         <xsl:for-each select="./gebruiks_product/product">
            <consumable>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                  <xsl:with-param name="product" select="."/>
               </xsl:call-template>
            </consumable>
         </xsl:for-each>

         <!-\- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -\->
         <xsl:for-each select="./auteur">
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
               <xsl:with-param name="authorTime" select="../registratiedatum"/>
            </xsl:call-template>
         </xsl:for-each>
         
         <!-\- Informant van het medicatiegebruik: zorgverlener -\->
         <xsl:for-each select="./informant/informant_is_zorgverlener/zorgverlener">
            <informant>
               <assignedEntity>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
               </assignedEntity>
            </informant>
         </xsl:for-each>
         
         <!-\- Informant van het medicatiegebruik: contactpartij = ander persoon -\->
         <xsl:for-each select="./informant/persoon">
            <informant>
               <relatedEntity classCode="AGNT">
                  <code code="407542009" codeSystem="2.16.840.1.113883.6.96"
                     displayName="Informal carer (person)"/>
                  <relatedPerson classCode="PSN" determinerCode="INSTANCE">
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
                        <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
                     </xsl:call-template>
                  </relatedPerson>
               </relatedEntity>
            </informant>
         </xsl:for-each>

         <!-\- Informant van het medicatiegebruik: patiënt -\->
         <xsl:if test="./informant/informant_is_patient/@value = 'true'">
            <informant>
               <assignedEntity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
               </assignedEntity>
            </informant>
         </xsl:if>

         <!-\- Volgens afspraak indicator -\->
         <xsl:for-each select="./volgens_afspraak_indicator">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752"/>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Stoptype -\->
         <xsl:for-each select="./stoptype">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Aanvullende Instructie. -\->
         <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
            <entryRelationship typeCode="SPRT">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818"/>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Reden gebruik -\->
         <xsl:for-each select="./reden_gebruik">
            <entryRelationship typeCode="RSON">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744"/>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Reden wijzigen/stoppen gebruik -\->
         <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik">
            <entryRelationship typeCode="RSON">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719"/>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Toelichting -\->
         <xsl:for-each select="./toelichting">
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
            </entryRelationship>
         </xsl:for-each>

         <!-\-Doseerinstructie-\->
         <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
            <entryRelationship typeCode="COMP">
               <xsl:for-each select="../volgnummer">
                  <sequenceNumber>
                     <xsl:attribute name="value" select="./@value"/>
                  </sequenceNumber>
               </xsl:for-each>
               <!-\- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -\->
               <xsl:if test="not(../volgnummer)">
                  <sequenceNumber>
                     <xsl:attribute name="value" select="1"/>
                  </sequenceNumber>
               </xsl:if>
               <xsl:for-each select=".">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
               </xsl:for-each>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Relatie naar (voorschrift met) voorschrijver -\->
         <xsl:for-each select="./voorschrijver/zorgverlener">
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -\->
         <!-\- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -\->
         <xsl:for-each select="./gerelateerde_afspraak/identificatie_medicatieafspraak">
            <!-\- kunnen er 0 of 1 zijn -\->
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                  <xsl:with-param name="identificatieElement" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./gerelateerde_afspraak/identificatie_toedieningsafspraak">
            <!-\- kunnen er 0 of 1 zijn -\->
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                  <xsl:with-param name="identificatieElement" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Relatie naar verstrekking -\->
         <xsl:for-each select="./gerelateerde_verstrekking">
            <!-\- kunnen er 0 of 1 zijn -\->
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                  <xsl:with-param name="identificatieElement" select="./identificatie"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>

         <!-\- Relatie naar medicamenteuze behandeling -\->
         <entryRelationship typeCode="COMP" inversionInd="true">
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
               <xsl:with-param name="MBHroot" select=".."/>
            </xsl:call-template>
         </entryRelationship>

      </substanceAdministration>
   </xsl:template>
-->

   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
      <!-- HL7NL PIVL_TS Weekdag -->
      <xsl:param name="operator"/>
      <xsl:param name="toedientijd"/>
      <xsl:param name="aantalPerWeek"/>
      <xsl:param name="weekdagCode"/>

      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:call-template name="chooseOperatorAttrib">
         <xsl:with-param name="operator" select="$operator"/>
      </xsl:call-template>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:attribute name="alignment" select="'DW'"/>
      <xsl:variable name="date4DayOfWeek">
         <xsl:choose>
            <xsl:when test="$weekdagCode = '307145004'">
               <!-- maandag -->
               <xsl:value-of select="'19700601'"/>
            </xsl:when>
            <xsl:when test="$weekdagCode = '307147007'">
               <!-- dinsdag -->
               <xsl:value-of select="'19700602'"/>
            </xsl:when>
            <xsl:when test="$weekdagCode = '307148002'">
               <!-- woensdag -->
               <xsl:value-of select="'19700603'"/>
            </xsl:when>
            <xsl:when test="$weekdagCode = '307149005'">
               <!-- donderdag -->
               <xsl:value-of select="'19700604'"/>
            </xsl:when>
            <xsl:when test="$weekdagCode = '307150005'">
               <!-- vrijdag -->
               <xsl:value-of select="'19700605'"/>
            </xsl:when>
            <xsl:when test="$weekdagCode = '307151009'">
               <!-- zaterdag -->
               <xsl:value-of select="'19700606'"/>
            </xsl:when>
            <xsl:when test="$weekdagCode = '307146003'">
               <!-- zondag -->
               <xsl:value-of select="'19700607'"/>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$toedientijd[1] instance of element() and count($toedientijd) = 1">
            <xsl:variable name="toedienDatumtijd">
               <xsl:call-template name="format2HL7Date">
                  <xsl:with-param name="dateTime" select="$toedientijd[1]/@value"/>
               </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="toedienTijd">
               <xsl:value-of select="substring($toedienDatumtijd, 9)"/>
            </xsl:variable>
            <xsl:variable name="dateTime4DoW">
               <xsl:value-of select="concat($date4DayOfWeek, $toedienTijd)"/>
            </xsl:variable>
            <hl7nl:phase>
               <hl7nl:low>
                  <xsl:attribute name="value" select="$dateTime4DoW"/>
               </hl7nl:low>
            </hl7nl:phase>
         </xsl:when>
         <xsl:otherwise>
            <hl7nl:phase>
               <hl7nl:low>
                  <xsl:attribute name="value" select="$date4DayOfWeek"/>
               </hl7nl:low>
            </hl7nl:phase>
         </xsl:otherwise>
      </xsl:choose>
      <hl7nl:period unit="wk">
         <xsl:choose>
            <xsl:when test="$aantalPerWeek castable as xs:int">
               <xsl:attribute name="value" select="$aantalPerWeek"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:attribute name="value" select="'1'"/>
            </xsl:otherwise>
         </xsl:choose>
      </hl7nl:period>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9156_20160728135021">
      <!--  HL7NL PIVL_TS Ochtend -->
      <xsl:param name="operator"/>
      <xsl:param name="frequentieTijdseenheid"/>
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:call-template name="chooseOperatorAttrib">
         <xsl:with-param name="operator" select="$operator"/>
      </xsl:call-template>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:attribute name="alignment" select="'HD'"/>
      <hl7nl:phase>
         <hl7nl:low value="1970010106"/>
         <hl7nl:high value="1970010112"/>
      </hl7nl:phase>
      <hl7nl:period>
         <xsl:choose>
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:int">
               <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
               <xsl:attribute name="unit" select="$frequentieTijdseenheid/@unit"/>
            </xsl:when>
            <xsl:otherwise>
               <!-- assume once a day -->
               <xsl:attribute name="value" select="'1'"/>
               <xsl:attribute name="unit" select="'d'"/>
            </xsl:otherwise>
         </xsl:choose>
      </hl7nl:period>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9157_20160728135022">
      <!--  HL7NL PIVL_TS Middag -->
      <xsl:param name="operator"/>
      <xsl:param name="frequentieTijdseenheid"/>
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:call-template name="chooseOperatorAttrib">
         <xsl:with-param name="operator" select="$operator"/>
      </xsl:call-template>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:attribute name="alignment" select="'HD'"/>
      <hl7nl:phase>
         <hl7nl:low value="1970010112"/>
         <hl7nl:high value="1970010118"/>
      </hl7nl:phase>
      <hl7nl:period>
         <xsl:choose>
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:int">
               <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
               <xsl:attribute name="unit" select="$frequentieTijdseenheid/@unit"/>
            </xsl:when>
            <xsl:otherwise>
               <!-- assume once a day -->
               <xsl:attribute name="value" select="'1'"/>
               <xsl:attribute name="unit" select="'d'"/>
            </xsl:otherwise>
         </xsl:choose>
      </hl7nl:period>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9158_20160728135022">
      <!--  HL7NL PIVL_TS Avond -->
      <xsl:param name="operator"/>
      <xsl:param name="frequentieTijdseenheid"/>
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:call-template name="chooseOperatorAttrib">
         <xsl:with-param name="operator" select="$operator"/>
      </xsl:call-template>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:attribute name="alignment" select="'HD'"/>
      <hl7nl:phase>
         <hl7nl:low value="1970010118"/>
         <hl7nl:high value="1970010200"/>
      </hl7nl:phase>
      <hl7nl:period>
         <xsl:choose>
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:int">
               <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
               <xsl:attribute name="unit" select="$frequentieTijdseenheid/@unit"/>
            </xsl:when>
            <xsl:otherwise>
               <!-- assume once a day -->
               <xsl:attribute name="value" select="'1'"/>
               <xsl:attribute name="unit" select="'d'"/>
            </xsl:otherwise>
         </xsl:choose>
      </hl7nl:period>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9159_20160728135022">
      <!--  HL7NL PIVL_TS Nacht  -->
      <xsl:param name="operator"/>
      <xsl:param name="frequentieTijdseenheid"/>
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:call-template name="chooseOperatorAttrib">
         <xsl:with-param name="operator" select="$operator"/>
      </xsl:call-template>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:attribute name="alignment" select="'HD'"/>
      <hl7nl:phase>
         <hl7nl:low value="1970010100"/>
         <hl7nl:high value="1970010106"/>
      </hl7nl:phase>
      <hl7nl:period>
         <xsl:choose>
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:int">
               <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
               <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM($frequentieTijdseenheid/@unit)"/>
            </xsl:when>
            <xsl:otherwise>
               <!-- assume once a day -->
               <xsl:attribute name="value" select="'1'"/>
               <xsl:attribute name="unit" select="'d'"/>
            </xsl:otherwise>
         </xsl:choose>
      </hl7nl:period>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9160_20161109134526">
      <xsl:param name="originalText"/>
      <!-- Reden van voorschrijven -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9160"/>
         <code code="10" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="Medicatieproces observaties" displayName="Reden van voorschrijven."/>
         <xsl:choose>
            <xsl:when test="@code">
               <xsl:call-template name="makeCEValue">
                  <!-- TODO Hack 9.04: originalText zorgt er voor dat er altijd een <originalText> tag onder <value>
                       wordt aangemaakt. Nu Reden van Voorschrijven gecodeerd wordt opgegeven is dat ongewenst. -->
                  <!-- <xsl:with-param name="originalText" select="$originalText"/>-->
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <value xsi:type="CE">
                  <xsl:call-template name="makeNullflavorWithToelichting"/>
               </value>
            </xsl:otherwise>
         </xsl:choose>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
      <!-- HL7NL PIVL_TS Toedieningsduur -->
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:attribute name="operator" select="'A'"/>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:for-each select="../toedieningsduur">
         <hl7nl:phase>
            <hl7nl:width xsi:type="hl7nl:PQ">
               <xsl:call-template name="makeTimePQValueAttribs"/>
            </hl7nl:width>
         </hl7nl:phase>
      </xsl:for-each>
      <xsl:for-each select="./frequentie">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
      <!-- HL7NL Frequency -->
      <hl7nl:frequency>
         <xsl:for-each select="./aantal">
            <hl7nl:numerator xsi:type="hl7nl:INT">
               <xsl:choose>
                  <xsl:when test="./vaste_waarde">
                     <xsl:attribute name="value" select="./vaste_waarde/@value"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <!-- variabele frequentie -->
                     <hl7nl:uncertainRange>
                        <xsl:for-each select="./min">
                           <hl7nl:low xsi:type="hl7nl:INT">
                              <xsl:attribute name="value" select="./@value"/>
                           </hl7nl:low>
                        </xsl:for-each>
                        <xsl:for-each select="./max">
                           <hl7nl:high xsi:type="hl7nl:INT">
                              <xsl:attribute name="value" select="./@value"/>
                           </hl7nl:high>
                        </xsl:for-each>
                     </hl7nl:uncertainRange>
                  </xsl:otherwise>
               </xsl:choose>
            </hl7nl:numerator>
         </xsl:for-each>
         <xsl:for-each select="./tijdseenheid">
            <hl7nl:denominator xsi:type="hl7nl:PQ">
               <xsl:call-template name="makeTimeDenominatorAttribs"/>
            </hl7nl:denominator>
         </xsl:for-each>
      </hl7nl:frequency>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
      <xsl:param name="product"/>
      <!--MP CDA Medication Information (Proposal)-->

      <xsl:if test="$product[1] instance of element()">
         <xsl:for-each select="$product">
            <manufacturedProduct classCode="MANU">
               <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9163"/>
               <manufacturedMaterial classCode="MMAT" determinerCode="KIND">
                  <xsl:choose>
                     <xsl:when test="./product_code">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
                           <xsl:with-param name="productCode" select="./product_code"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="./product_specificatie">
                        <!-- magistrale medicatie -->
                        <xsl:for-each select="./product_specificatie/product_naam">
                           <name>
                              <xsl:value-of select="./@value"/>
                           </name>
                        </xsl:for-each>
                        <xsl:for-each select="./product_specificatie/omschrijving">
                           <!-- TODO: bij VVV moet je toch alleen <name> kunnen opgeven? -->
                           <!--<xsl:if test="@value ne ''">-->
                           <pharm:desc>
                              <xsl:value-of select="./@value"/>
                           </pharm:desc>
                           <!--</xsl:if>-->
                        </xsl:for-each>
                        <xsl:for-each select="./product_specificatie/farmaceutische_vorm">
                           <pharm:formCode>
                              <xsl:call-template name="makeCodeAttribs">
                                 <xsl:with-param name="originalText" select="."/>
                              </xsl:call-template>
                           </pharm:formCode>
                        </xsl:for-each>
                        <xsl:for-each select="./product_specificatie/ingredient">
                           <pharm:ingredient classCode="INGR">
                              <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013"/>
                           </pharm:ingredient>
                        </xsl:for-each>
                     </xsl:when>
                  </xsl:choose>
               </manufacturedMaterial>
            </manufacturedProduct>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000">
      <!--DoseQuantity and translation(s)-->
      <xsl:param name="UCUMvalue"/>
      <xsl:param name="UCUMunit"/>
      <xsl:attribute name="value" select="$UCUMvalue"/>
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
         <xsl:with-param name="UCUMvalue" select="$UCUMvalue"/>
         <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
      </xsl:call-template>
   </xsl:template>
   <!--DoseQuantity and translation(s)obv Gstd input-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
      <xsl:param name="Gstd_value"/>
      <xsl:param name="Gstd_unit"/>

      <xsl:attribute name="value" select="$Gstd_value"/>
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000_2">
         <xsl:with-param name="Gstd_value" select="$Gstd_value"/>
         <xsl:with-param name="Gstd_unit" select="$Gstd_unit"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000">
      <!-- te verstrekken hoeveelheid -->
      <xsl:attribute name="value" select="./aantal/@value"/>
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
         <xsl:with-param name="UCUMvalue" select="./aantal/@value"/>
         <!-- TODO: tijdelijke fix in 9.04 waarbij de eenheid soms in @unit zit en soms in @value en/of @displayName -->
         <!--<xsl:with-param name="UCUMunit"
                        select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>-->
         <xsl:with-param name="UCUMunit" select="
               if (./eenheid/@unit) then
                  nf:convertUnit_ADA2UCUM(./eenheid/@unit)
               else
                  (if (./eenheid/@value) then
                     nf:convertUnit_ADA2UCUM(./eenheid/@value)
                  else
                     (if (./eenheid/@displayName) then
                        nf:convertUnit_ADA2UCUM(./eenheid/@displayName)
                     else
                        ''))"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000">
      <!--MP MA Voorschrijver-->
      <substanceAdministration classCode="SBADM" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9166"/>
         <code code="16076005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED Clinical Terms" displayName="Prescription of"/>
         <consumable xsi:nil="true"/>
         <author>
            <time nullFlavor="NI"/>
            <assignedAuthor>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506"/>
            </assignedAuthor>
         </author>
      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
      <!-- MP Gebruik Voorschrijver -->
      <!--<templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9167"/>-->
      <xsl:for-each select="./zorgverlener_identificatie_nummer">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>

      <xsl:for-each select="./specialisme">
         <code>
            <xsl:call-template name="makeCodeAttribs"/>
         </code>
      </xsl:for-each>

      <xsl:for-each select="./zorgverlener_naam">
         <assignedPerson>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
               <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
            </xsl:call-template>
         </assignedPerson>
      </xsl:for-each>

      <xsl:for-each select="./zorgaanbieder/zorgaanbieder">
         <representedOrganization>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
         </representedOrganization>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9169_20170521195457">
      <!--MP CDA Organization Medicatieoverzicht-->

      <!--Zorgaanbieder identificatie-->
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>

      <!-- Telecom gegevens -->
      <xsl:for-each select="./telefoon_email">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706"/>
      </xsl:for-each>

      <!-- Adres -->
      <xsl:for-each select="./adres">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.2_20141106000000">
            <xsl:with-param name="adres" select="."/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <!--<xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9171_20170522091920">
      <!-\-MP CDA author medicatieoverzicht - obsolete sinds MP 9.0.5 -\->
      <author>
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9171"/>
         <time nullFlavor="NI"/>
         <assignedAuthor>
            <!-\-identificatie-\->
            <id nullFlavor="NI"/>
            <!-\-Zorgaanbieder-\->
            <xsl:for-each select="./zorgaanbieder">
               <representedOrganization>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9169_20170521195457"/>
               </representedOrganization>
            </xsl:for-each>
         </assignedAuthor>
      </author>
   </xsl:template>
   -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9171_20180111143827">
      <!--MP CDA author medicatieoverzicht - vanaf versie 9.0.5 -->
      <author>
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9171"/>
         <time nullFlavor="NI"/>
         <assignedAuthor>
            <xsl:if test="./auteur_is_zorgaanbieder/@value = 'true'">
               <!--identificatie-->
               <id nullFlavor="NI"/>
               <!--Zorgaanbieder-->
               <xsl:for-each select="./auteur_is_zorgaanbieder/zorgaanbieder">
                  <representedOrganization>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9169_20170521195457"/>
                  </representedOrganization>
               </xsl:for-each>
            </xsl:if>
            <!--Patient-->
            <xsl:if test="./auteur_is_patient/@value = 'true'">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
            </xsl:if>
         </assignedAuthor>
      </author>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706">
      <!--Telecom gegevens-->
      <xsl:for-each select=".//telefoonnummers">
         <telecom>
            <xsl:attribute name="use" select="./nummer_soort/@code"/>
            <xsl:attribute name="value">
               <xsl:text>tel:</xsl:text>
               <xsl:value-of select="./telefoonnummer/@value"/>
            </xsl:attribute>
         </telecom>
      </xsl:for-each>

      <xsl:for-each select=".//email_adressen">
         <telecom>
            <xsl:attribute name="use" select="./email_soort/@code"/>
            <xsl:attribute name="value">
               <xsl:text>mailto:</xsl:text>
               <xsl:value-of select="./email_adres/@value"/>
            </xsl:attribute>
         </telecom>
      </xsl:for-each>

      <!-- Fax gegevens komen in de ADA XML niet voor -->
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022">
      <!-- MP CDA TA Aanvullende informatie -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9175"/>
         <code code="12" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" displayName="Aanvullende informatie Toedieningsafspraak"/>
         <xsl:call-template name="makeCEValue"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9176_20170522183626">
      <xsl:param name="identificatieElement"/>
      <!-- MP Medicatiegebruik identificatie -->
      <substanceAdministration classCode="SBADM" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9176"/>
         <xsl:if test="$identificatieElement[1] instance of element()">
            <xsl:for-each select="$identificatieElement">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
         </xsl:if>
         <code code="6" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" displayName="Medicatiegebruik"/>
         <consumable xsi:nil="true"/>
      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315">
      <!-- MP CDA MA Aanvullende informatie -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9177"/>
         <code code="11" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" displayName="Aanvullende informatie Medicatieafspraak"/>
         <xsl:call-template name="makeCEValue"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9179_20170523115538">
      <!-- MP organizer verifier patiënt-->

      <!-- Als er niet geverifieerd is, dan ook niet opnemen. -->
      <xsl:if test="./geverifieerd_met_patientq/@value = 'true'">
         <participant typeCode="VRF">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9179"/>
            <xsl:for-each select="./verificatie_datum">
               <time>
                  <xsl:call-template name="makeTSValueAttr"/>
               </time>
            </xsl:for-each>
            <participantRole classCode="PAT"/>
         </participant>
      </xsl:if>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9180_20170523115753">
      <!--MP organizer verifier zorgverlener-->

      <!-- Als er niet geverifieerd is, dan ook niet opnemen. -->
      <xsl:if test="./geverifieerd_met_zorgverlenerq/@value = 'true'">
         <participant typeCode="VRF">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9180"/>
            <xsl:for-each select="./verificatie_datum">
               <time>
                  <xsl:call-template name="makeTSValueAttr"/>
               </time>
            </xsl:for-each>
            <participantRole classCode="ASSIGNED"/>
         </participant>
      </xsl:if>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
      <!-- MP CDA (voorstel) Medicatieafspraak onderdelen -->
      <xsl:param name="ma"/>
      <xsl:for-each select="$ma">
         <xsl:for-each select="./stoptype">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./reden_afspraak">
            <entryRelationship typeCode="RSON">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9068_20160617150015"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./reden_van_voorschrijven/probleem/probleem_naam">
            <entryRelationship typeCode="RSON">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9160_20161109134526">
                  <xsl:with-param name="originalText" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
            <entryRelationship typeCode="SPRT">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./lichaamslengte">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9122_20160713172302">
                  <xsl:with-param name="effectiveTime" select="./lengte_datum_tijd"/>
                  <xsl:with-param name="PQvalue" select="./lengte_waarde"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./lichaamsgewicht">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9123_20160713212617">
                  <xsl:with-param name="effectiveTime" select="./gewicht_datum_tijd"/>
                  <xsl:with-param name="PQvalue" select="./gewicht_waarde"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./aanvullende_informatie">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./toelichting">
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
            </entryRelationship>
         </xsl:for-each>
         <!--Doseerinstructie-->
         <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
            <entryRelationship typeCode="COMP">
               <xsl:for-each select="../volgnummer">
                  <sequenceNumber>
                     <xsl:attribute name="value" select="./@value"/>
                  </sequenceNumber>
               </xsl:for-each>
               <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
               <xsl:if test="not(../volgnummer)">
                  <sequenceNumber>
                     <xsl:attribute name="value" select="1"/>
                  </sequenceNumber>
               </xsl:if>
               <xsl:for-each select=".">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
               </xsl:for-each>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar afspraak of gebruik -->
         <xsl:for-each select="./relatie_naar_afspraak_of_gebruik">
            <!-- Relatie naar MA -->
            <xsl:for-each select="./identificatie[@value]">
               <!-- kunnen er 0 of 1 zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                     <xsl:with-param name="identificatieElement" select="."/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>
            <!-- Relatie naar TA -->
            <xsl:for-each select="./identificatie_23288[@value]">
               <!-- kunnen er 0 of 1 zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                     <xsl:with-param name="identificatieElement" select="."/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>
            <!-- Relatie naar GB -->
            <xsl:for-each select="./identificatie_23289[@value]">
               <!-- kunnen er 0 of 1 zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9176_20170522183626">
                     <xsl:with-param name="identificatieElement" select="."/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>
         </xsl:for-each>

      </xsl:for-each>
   </xsl:template>
   <!-- Zo nodig criterium -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9182_20170601000000">
      <xsl:param name="code" as="xs:string?" select="./@code"/>
      <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
      <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
      <xsl:param name="elOriginalText" as="element()*"/>
      <xsl:param name="strOriginalText" as="xs:string?" select="./@originalText"/>
      <criterion>
         <xsl:call-template name="makeCEValue">
            <xsl:with-param name="code" select="$code"/>
            <xsl:with-param name="codeSystem" select="$codeSystem"/>
            <xsl:with-param name="displayName" select="$displayName"/>
            <xsl:with-param name="elemName">code</xsl:with-param>
            <xsl:with-param name="originalText" select="$elOriginalText"/>
            <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
            <xsl:with-param name="xsiType" select="''"/>
         </xsl:call-template>
      </criterion>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9183_20170818085324">
      <!-- Toelichting bij voorstelgegevens -->
      <!-- Identiek aan 9069, met een ander templateId omdat er bij voorstellen 2 toelichtingen zijn. -->
      <act classCode="ACT" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9183"/>
         <code code="48767-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Toelichting"/>
         <text mediaType="text/plain">
            <xsl:value-of select="./@value"/>
         </text>
      </act>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503">
      <!-- MP CDA Medicatieafspraak onderdelen 1 -->
      <xsl:for-each select="./identificatie">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>
      <code code="16076005" displayName="Medicatieafspraak" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
      <xsl:for-each select="./gebruiksinstructie/omschrijving">
         <text mediaType="text/plain">
            <xsl:value-of select="./@value"/>
         </text>
      </xsl:for-each>

      <!-- statusCode: voor foutcorrectie -->
      <xsl:if test="./geannuleerd_indicator/@value = 'true'">
         <statusCode code="nullified"/>
      </xsl:if>

      <!-- Gebruiksperiode -->
      <!-- TODO: Tijdelijke fix (9.04) waarbij aparte velden in ADA form staan voor effectiveTime\low en -\high -->
      <xsl:if test="./gebruiksperiode or ./gebruiksperiode_start or ./gebruiksperiode_eind">
         <effectiveTime xsi:type="IVL_TS">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
               <xsl:with-param name="low" select="./gebruiksperiode_start"/>
               <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
               <xsl:with-param name="width" select="./gebruiksperiode"/>
            </xsl:call-template>
         </effectiveTime>
      </xsl:if>
      <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
         <routeCode>
            <xsl:call-template name="makeCodeAttribs"/>
         </routeCode>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9185_20170818000000">
      <xsl:param name="ma"/>
      <!-- MP CDA Medicatieafspraak voorstel vv -->

      <xsl:for-each select="$ma">
         <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9185"/>

            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503"/>

            <!-- afwijking tov het normale MA template: bij product zijn meer velden optioneel -->
            <xsl:for-each select="./afgesproken_geneesmiddel/product">
               <consumable>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </consumable>
            </xsl:for-each>
            <xsl:for-each select="./voorschrijver/zorgverlener">
               <author>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                     <xsl:with-param name="authorTime" select="../../afspraakdatum"/>
                  </xsl:call-template>
               </author>
            </xsl:for-each>
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
               <xsl:with-param name="ma" select="."/>
            </xsl:call-template>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                  <xsl:with-param name="MBHroot" select=".."/>
               </xsl:call-template>
            </entryRelationship>

         </substanceAdministration>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
      <xsl:param name="authorTime"/>
      <!--MP CDA author zorgverlener of patient-->

      <author>
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9187"/>

         <!-- Voorstel- of Registratiedatum -->
         <xsl:for-each select="$authorTime">
            <time>
               <xsl:call-template name="makeTSValueAttr"/>
            </time>
         </xsl:for-each>

         <xsl:for-each select="./auteur_is_zorgverlener/zorgverlener">
            <assignedAuthor>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506"/>
            </assignedAuthor>
         </xsl:for-each>
         <xsl:if test="./auteur_is_patient/@value = 'true'">
            <assignedAuthor>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
            </assignedAuthor>
         </xsl:if>

      </author>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000">
      <!-- MP CDA author of informant patient -->
      <xsl:for-each select="//patient/patient_identificatienummer">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>
      <code code="ONESELF" displayName="Self" codeSystem="2.16.840.1.113883.5.111" codeSystemName="HL7 Role code"/>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543">
      <!-- Gebruikindicator -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9189"/>
         <code displayName="Gebruikindicator" code="15" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <value xsi:type="BL" value="{./@value}"/>
      </observation>
   </xsl:template>

   <!--Medicatiegebruik - vanaf MP 9.0.5 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9190_20171025120141">
      <xsl:param name="gb"/>

      <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>

      <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
         <!-- Feitelijk medicatiegebruik -->
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9190"/>
         <!-- identificatie -->
         <xsl:for-each select="./identificatie">
            <xsl:call-template name="makeIIid"/>
         </xsl:for-each>
         <code code="6" displayName="Gebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>
         <xsl:for-each select="./gebruiksinstructie/omschrijving">
            <text mediaType="text/plain">
               <xsl:value-of select="./@value"/>
            </text>
         </xsl:for-each>
         <!-- Gebruiksperiode -->
         <!--<xsl:if test="$isInGebruik"> -->
         <!-- EffectiveTime mag niet voorkomen als gebruiksindicator = false
                 Deze eis gaat vervallen, en er is sowieso geen reden om dit in de conversie af te dwingen. -->
         <!-- TODO: Tijdelijke fix (9.04) waarbij aparte velden in ADA form staan voor effectiveTime\low en -\high -->
         <xsl:if test="./gebruiksperiode or ./gebruiksperiode_start or ./gebruiksperiode_eind">
            <effectiveTime xsi:type="IVL_TS">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                  <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                  <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                  <xsl:with-param name="width" select="./gebruiksperiode"/>
               </xsl:call-template>
            </effectiveTime>
         </xsl:if>
         <!--</xsl:if>-->
         <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
            <routeCode>
               <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
         </xsl:for-each>
         <xsl:for-each select="./gebruiks_product/product">
            <consumable>
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                  <xsl:with-param name="product" select="."/>
               </xsl:call-template>
            </consumable>
         </xsl:for-each>

         <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
         <xsl:for-each select="./auteur">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
               <xsl:with-param name="authorTime" select="../registratiedatum"/>
            </xsl:call-template>
         </xsl:for-each>

         <!-- Informant van het medicatiegebruik: zorgverlener -->
         <xsl:for-each select="./informant/informant_is_zorgverlener/zorgverlener">
            <informant>
               <assignedEntity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
               </assignedEntity>
            </informant>
         </xsl:for-each>

         <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
         <xsl:for-each select="./informant/persoon">
            <informant>
               <relatedEntity classCode="AGNT">
                  <code code="407542009" codeSystem="2.16.840.1.113883.6.96" displayName="Informal carer (person)"/>
                  <relatedPerson classCode="PSN" determinerCode="INSTANCE">
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
                        <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
                     </xsl:call-template>
                  </relatedPerson>
               </relatedEntity>
            </informant>
         </xsl:for-each>

         <!-- Informant van het medicatiegebruik: patiënt -->
         <xsl:if test="./informant/informant_is_patient/@value = 'true'">
            <informant>
               <assignedEntity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
               </assignedEntity>
            </informant>
         </xsl:if>

         <!-- Gebruik indicator -->
         <xsl:for-each select="./gebruik_indicator">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Volgens afspraak indicator -->
         <xsl:for-each select="./volgens_afspraak_indicator">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Stoptype -->
         <xsl:for-each select="./stoptype">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Aanvullende Instructie. -->
         <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
            <entryRelationship typeCode="SPRT">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Reden gebruik -->
         <xsl:for-each select="./reden_gebruik">
            <entryRelationship typeCode="RSON">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Reden wijzigen/stoppen gebruik -->
         <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik">
            <entryRelationship typeCode="RSON">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Toelichting -->
         <xsl:for-each select="./toelichting">
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
            </entryRelationship>
         </xsl:for-each>

         <!--Doseerinstructie-->
         <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
            <entryRelationship typeCode="COMP">
               <xsl:for-each select="../volgnummer">
                  <sequenceNumber>
                     <xsl:attribute name="value" select="./@value"/>
                  </sequenceNumber>
               </xsl:for-each>
               <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
               <xsl:if test="not(../volgnummer)">
                  <sequenceNumber>
                     <xsl:attribute name="value" select="1"/>
                  </sequenceNumber>
               </xsl:if>
               <xsl:for-each select=".">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
               </xsl:for-each>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar (voorschrift met) voorschrijver -->
         <xsl:for-each select="./voorschrijver/zorgverlener">
            <entryRelationship typeCode="REFR">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Kopie-indicator -->
         <xsl:if test="./kopie_indicator">
            <entryRelationship typeCode="COMP">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                  <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:if>

         <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
         <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -->
         <xsl:for-each select="./gerelateerde_afspraak/identificatie_medicatieafspraak">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                  <xsl:with-param name="identificatieElement" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./gerelateerde_afspraak/identificatie_toedieningsafspraak">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                  <xsl:with-param name="identificatieElement" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar verstrekking -->
         <xsl:for-each select="./gerelateerde_verstrekking">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                  <xsl:with-param name="identificatieElement" select="./identificatie"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar medicamenteuze behandeling -->
         <entryRelationship typeCode="COMP" inversionInd="true">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
               <xsl:with-param name="MBHroot" select=".."/>
            </xsl:call-template>
         </entryRelationship>

      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
      <xsl:param name="isKopie"/>
      <!-- Kopie-indicator  -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9200"/>
         <code displayName="Kopie-indicator" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <value xsi:type="BL" value="{$isKopie}"/>
      </observation>
   </xsl:template>
   <!-- Medicatieafspraak inhoud - vanaf MP 9.0.6 -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180419121646">
      <!-- MA Onderdelen 1 -->
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503"/>
      
      <xsl:for-each select="./afgesproken_geneesmiddel/product">
         <consumable>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
               <xsl:with-param name="product" select="."/>
            </xsl:call-template>
         </consumable>
      </xsl:for-each>
      <xsl:for-each select="./voorschrijver/zorgverlener">
         <author>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
               <xsl:with-param name="authorTime" select="../../afspraakdatum"/>
            </xsl:call-template>
         </author>
      </xsl:for-each>
      <!-- Overige onderdelen van deze MA -->
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
         <xsl:with-param name="ma" select="."/>
      </xsl:call-template>
      
      <!-- Kopie-indicator -->
      <xsl:if test="./kopie_indicator">
         <entryRelationship typeCode="COMP">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
               <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
            </xsl:call-template>
         </entryRelationship>
      </xsl:if>
      
      <!--Relatie naar medicamenteuze behandeling-->
      <entryRelationship typeCode="COMP" inversionInd="true">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
            <xsl:with-param name="MBHroot" select=".."/>
         </xsl:call-template>
      </entryRelationship>
   </xsl:template>
   
   <!-- Medicatieafspraak -->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9216_20160423130413">
      <!-- Medicatieafspraak met eventueel op-/afbouw schema. -->
      <xsl:param name="ma"/>
      <xsl:for-each select="$ma">
         <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9216"/>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180419121646"/>
         </substanceAdministration>
      </xsl:for-each>
   </xsl:template>
   <!-- Verstrekkingsverzoek vanaf 9.0.6-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9231_20180423130413">
      <xsl:param name="vv"/>
      
      <xsl:for-each select="$vv">
         <supply classCode="SPLY" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9231"/>
            
            <!-- identificatie -->
            <xsl:for-each select="./identificatie[@value]">
               <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            
            <code codeSystemName="SNOMED CT" displayName="Verstrekkingsverzoek" code="52711000146108" codeSystem="2.16.840.1.113883.6.96"/>
            
            <!-- aantal herhalingen -->
            <xsl:for-each select="./aantal_herhalingen[@value]">
               <repeatNumber>
                  <xsl:attribute name="value" select="xs:int(./@value) + 1"/>
               </repeatNumber>
            </xsl:for-each>
            
            <!-- Te verstrekken hoeveelheid -->
            <xsl:for-each select="./te_verstrekken_hoeveelheid[//@value]">
               <quantity>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
               </quantity>
            </xsl:for-each>
            
            <!-- verbruiksperiode -->
            <xsl:for-each select="./verbruiksperiode">
               <expectedUseTime>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="low" select="./ingangsdatum"/>
                     <xsl:with-param name="width" select="./duur"/>
                     <xsl:with-param name="high" select="./einddatum"/>
                  </xsl:call-template>
               </expectedUseTime>
            </xsl:for-each>
            
            <!-- Te verstrekken geneesmiddel -->
            <xsl:for-each select="./te_verstrekken_geneesmiddel/product">
               <product>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </product>
            </xsl:for-each>
            
            <!-- beoogd verstrekker -->
            <xsl:for-each select="./beoogd_verstrekker/zorgaanbieder">
               <performer>
                  <assignedEntity>
                     <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                  </assignedEntity>
               </performer>
            </xsl:for-each>
            
            <!-- Auteur / zorgverlener -->
            <xsl:for-each select="./auteur/zorgverlener">
               <author>
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                     <xsl:with-param name="authorTime" select="../../datum"/>
                  </xsl:call-template>
               </author>
            </xsl:for-each>
            
            <!-- afleverlocatie -->
            <xsl:for-each select="./afleverlocatie">
               <participant typeCode="DST">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
               </participant>
            </xsl:for-each>
            
            <!-- aanvullende wensen -->
            <xsl:for-each select="./aanvullende_wensen[@code]">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="COMP">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
               </entryRelationship>
            </xsl:for-each>
            
            <!-- Toelichting -->
            <xsl:for-each select="./toelichting[@value]">
               <!-- kan er 0 of 1 zijn -->
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
               </entryRelationship>
            </xsl:for-each>
            
            <!-- relatie naar MA -->
            <xsl:for-each select="./relatie_naar_medicatieafspraak">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                     <xsl:with-param name="identificatieElement" select="./identificatie"/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>
            
            <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                  <xsl:with-param name="MBHroot" select=".."/>
               </xsl:call-template>
            </entryRelationship>
            
         </supply>
      </xsl:for-each>
   </xsl:template>
   
   
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
