<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3"
   xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:include href="../../hl7/hl7_include.xsl"/>
   <!--   <xsl:include href="../../zib1bbr/zib1bbr_include.xsl"/>  -->
   <!--   <xsl:include href="../../naw/naw_include.xsl"/> -->

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
      <xsl:attribute name="unit" select="nf:convertTime_UCUM2HL7(./@unit)"/>
   </xsl:template>
   <xsl:template name="makeTimeDenominatorAttribs">
      <xsl:attribute name="value" select="1"/>
      <!-- het ADA form biedt geen mogelijkheid een getal te specificeren -->
      <xsl:attribute name="unit" select="nf:convertTime_UCUM2HL7(./@value)"/>
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
            <translation value="{$UCUMvalue}" code="252"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Microgram"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'mg'">
            <translation value="{$UCUMvalue}" code="229"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milligram"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'g'">
            <translation value="{$UCUMvalue}" code="215"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Gram"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'ul'">
            <translation value="{$UCUMvalue}" code="254"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Microliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'ml'">
            <translation value="{$UCUMvalue}" code="233"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milliliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq 'l'">
            <translation value="{$UCUMvalue}" code="222"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Liter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq '[drp]'">
            <translation value="{$UCUMvalue}" code="303"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Druppel"/>
         </xsl:when>
         <!--
            Tablespoons en teaspoons zijn geschrapt uit de lijst UCUM units omdat ze niet nauwkeurig naar SI eenheden om te zetten zijn. 
         <xsl:when test="$UCUMunit eq '[tsp_us]'">
            <translation value="{$UCUMvalue * 5}" code="233" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milliliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq '[tbs_us]'">
            <translation value="{$UCUMvalue * 15}" code="233" codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Milliliter"/> 
         </xsl:when>
         -->
         <xsl:when test="$UCUMunit eq '[iU]'">
            <translation value="{$UCUMvalue}" code="217"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Internat.eenh."/>
         </xsl:when>
         <!-- De officiele UCOM unit is 1, maar via het formulier zou evt. ook eenheid, stuk of dosis binnen kunnen komen -->
         <xsl:when
            test="($UCUMunit eq '1') or ($UCUMunit eq 'eenheid') or ($UCUMunit eq 'stuk') or ($UCUMunit eq 'dosis')">
            <translation value="{$UCUMvalue}" code="211"
               codeSystem="2.16.840.1.113883.2.4.4.1.900.2" displayName="Eenheid"/>
         </xsl:when>
         <xsl:otherwise>
            <translation value="{$UCUMvalue}" code="0" codeSystem="2.16.840.1.113883.2.4.4.1.900.2"
               displayName="niet ondersteunde UCUM eenheid: {$UCUMunit}"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:function name="nf:convertUnit_ADA2UCUM" as="xs:string">
      <xsl:param name="ADAtime" as="xs:string"/>
      <!-- In ADA forms wordt voor stuk/dosis/eenheid het woord 'eenheid' gebruikt, wat in UCUM '1' is -->
      <xsl:choose>
         <xsl:when test="$ADAtime eq 'eenheid'">1</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$ADAtime"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="nf:convertTime_UCUM2HL7" as="xs:string?">
      <xsl:param name="UCUMtime" as="xs:string?"/>
      <xsl:if test="$UCUMtime">
         <xsl:choose>
            <xsl:when test="$UCUMtime eq 'seconde'">s</xsl:when>
            <xsl:when test="$UCUMtime eq 'minuut'">m</xsl:when>
            <xsl:when test="$UCUMtime eq 'uur'">h</xsl:when>
            <xsl:when test="$UCUMtime eq 'dag'">d</xsl:when>
            <xsl:when test="$UCUMtime eq 'week'">wk</xsl:when>
            <xsl:when test="$UCUMtime eq 'maand'">mo</xsl:when>
            <xsl:when test="$UCUMtime eq 'jaar'">a</xsl:when>

            <!-- TODO: Omdat op sommige plekken codelijsten gebruikt zijn, wordt daar al meteen HL7 opgeleverd. 
               Die niet omzetten of foutmelding op geven. -->
            <xsl:when test="$UCUMtime eq 's'">s</xsl:when>
            <xsl:when test="$UCUMtime eq 'm'">m</xsl:when>
            <xsl:when test="$UCUMtime eq 'h'">h</xsl:when>
            <xsl:when test="$UCUMtime eq 'd'">d</xsl:when>
            <xsl:when test="$UCUMtime eq 'wk'">wk</xsl:when>
            <xsl:when test="$UCUMtime eq 'mo'">mo</xsl:when>
            <xsl:when test="$UCUMtime eq 'a'">a</xsl:when>

            <xsl:otherwise>
               <xsl:value-of select="concat('onbekende tijdseenheid: ', $UCUMtime)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:function>

   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
      <!-- Usable Period -->
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
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
      <!--Quantity unit and translation(s)-->
      <xsl:param name="UCUMvalue"/>
      <xsl:param name="UCUMunit"/>

      <xsl:attribute name="unit" select="$UCUMunit"/>
      <xsl:call-template name="make_UCUM2Gstandard_translation">
         <xsl:with-param name="UCUMvalue" select="$UCUMvalue"/>
         <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840">
      <!--MP CDA Dosering-->
      <doseQuantity>
         <xsl:choose>
            <xsl:when test="./aantal/vaste_waarde/@value">
               <center>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000">
                     <xsl:with-param name="UCUMvalue" select="./aantal/vaste_waarde/@value"/>
                     <xsl:with-param name="UCUMunit"
                        select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>
                  </xsl:call-template>
               </center>
            </xsl:when>
            <xsl:when test="./aantal/min/@value or ./aantal/max/@value">
               <xsl:for-each select="./aantal/min">
                  <!-- min komt 0 of 1 keer voor -->
                  <low>
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000">
                        <xsl:with-param name="UCUMvalue" select="./@value"/>
                        <xsl:with-param name="UCUMunit"
                           select="nf:convertUnit_ADA2UCUM(../../eenheid/@value)"/>
                     </xsl:call-template>
                  </low>
               </xsl:for-each>
               <xsl:for-each select="./aantal/max">
                  <!-- max komt 0 of 1 keer voor -->
                  <high>
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000">
                        <xsl:with-param name="UCUMvalue" select="./@value"/>
                        <xsl:with-param name="UCUMunit"
                           select="nf:convertUnit_ADA2UCUM(../../eenheid/@value)"/>
                     </xsl:call-template>
                  </high>
               </xsl:for-each>
            </xsl:when>
         </xsl:choose>
      </doseQuantity>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000">
      <!--maxDoseQuantity-->
      <numerator>
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000">
            <xsl:with-param name="UCUMvalue" select="./aantal/@value"/>
            <xsl:with-param name="UCUMunit" select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>
         </xsl:call-template>
      </numerator>
      <denominator>
         <xsl:attribute name="value" select="1"/>
         <!-- het ADA form biedt geen mogelijkheid een getal te specificeren -->
         <xsl:attribute name="unit" select="nf:convertTime_UCUM2HL7(./tijdseenheid/@value)"/>
      </denominator>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
      <!-- MP CDA Author Participation -->
      <xsl:param name="authorTime"/>
      <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9066"/>
      <xsl:if test="$authorTime[1] instance of element()">
         <xsl:for-each select="$authorTime">
            <time value="20160623165423">
               <xsl:call-template name="makeTSValueAttr"/>
            </time>
         </xsl:for-each>
      </xsl:if>
      <assignedAuthor>
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506"/>
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
         <code code="2" displayName="Reden medicatieafspraak"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <xsl:call-template name="makeCEValue"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405">
      <!-- Toelichting -->
      <act classCode="ACT" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9069"/>
         <code code="48767-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
            displayName="Toelichting"/>
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
                     <xsl:when test="./productcode">
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
                           <xsl:with-param name="productCode" select="./productcode"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="./productspecificatie">
                        <!-- magistrale medicatie -->
                        <xsl:for-each select="./productspecificatie/productnaam">
                           <name>
                              <xsl:value-of select="./@value"/>
                           </name>
                        </xsl:for-each>
                        <xsl:for-each select="./productspecificatie/omschrijving">
                           <pharm:desc>
                              <xsl:value-of select="./@value"/>
                           </pharm:desc>
                        </xsl:for-each>
                        <xsl:for-each select="./productspecificatie/farmaceutischevorm">
                           <pharm:formCode>
                              <xsl:call-template name="makeCodeAttribs">
                                 <xsl:with-param name="originalText" select="."/>
                              </xsl:call-template>
                           </pharm:formCode>
                        </xsl:for-each>
                        <xsl:for-each select="./productspecificatie/ingredient">
                           <pharm:ingredient classCode="INGR">
                              <xsl:call-template
                                 name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013"
                              />
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
            <xsl:variable name="UCUMunit" select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>
            <xsl:attribute name="value" select="$UCUMvalue"/>
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
               <xsl:with-param name="UCUMvalue" select="$UCUMvalue"/>
               <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
            </xsl:call-template>
         </numerator>
      </xsl:for-each>
      <xsl:for-each select="./hoeveelheid_product">
         <denominator xsi:type="PQ">
            <xsl:variable name="UCUMvalue" select="./waarde/@value"/>
            <xsl:variable name="UCUMunit" select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>
            <xsl:attribute name="value" select="$UCUMvalue"/>
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
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
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9074_20160618205801">
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
      <xsl:choose>
         <xsl:when test="../../../herhaalperiode_cyclisch_schema">
            <!-- Cyclisch schema -->
            <effectiveTime operator="A" xsi:type="SXPR_TS">
               <xsl:for-each select="./frequentie">
                  <!-- De frequentie van inname binnen het cyclisch schema. -->
                  <comp>
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947"/>
                  </comp>
               </xsl:for-each>
               <comp>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
               </comp>
            </effectiveTime>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when
                  test="./frequentie/tijdseenheid and not(./interval) and not(./toedientijd) and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <!-- Eenvoudig doseerschema met alleen één frequentie. -->
                  <xsl:for-each select="./frequentie">
                     <effectiveTime>
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"
                        />
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when
                  test="not(./frequentie/tijdseenheid) and ./interval and not(./toedientijd) and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <!-- Eenvoudig doseerschema met alleen één interval. -->
                  <xsl:for-each select="./interval">
                     <effectiveTime>
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"
                        />
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when
                  test="not(./interval) and count(./toedientijd) = 1 and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <!-- Eenvoudig doseerschema met één toedientijd. -->
                  <xsl:for-each select="./toedientijd">
                     <effectiveTime>
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                           <xsl:with-param name="operator" select="'A'"/>
                           <xsl:with-param name="isFlexible" select="'true'"/>
                        </xsl:call-template>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when
                  test="./frequentie/tijdseenheid and not(./interval) and not(./toedientijd) and ../toedieningsduur and not(./weekdag) and not(./dagdeel)">
                  <!-- doseerschema met toedieningsduur én frequentie -->
                  <effectiveTime>
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                  </effectiveTime>
               </xsl:when>
               <xsl:when
                  test="not(./interval) and count(./toedientijd) > 1 and not(../toedieningsduur) and not(./weekdag) and not(./dagdeel)">
                  <!-- Eenvoudig doseerschema met meer dan één toedientijd. -->
                  <effectiveTime operator="A" xsi:type="SXPR_TS">
                     <xsl:for-each select="./toedientijd">
                        <comp xsi:type="hl7nl:PIVL_TS">
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
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
               <xsl:when
                  test="./frequentie/aantal and not(./frequentie/tijdseenheid) and not(./interval)">
                  <!-- Eenmalig gebruik. Of een aantal keer zonder verdere aanduiding wanneer -->
                  <xsl:for-each select="./frequentie">
                     <effectiveTime>
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20160711104612"
                        />
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when
                  test="count(./weekdag) = 1 and count(./toedientijd) &lt;= 1 and not(./frequentie[tijdseenheid/@unit != 'wk'])">
                  <!-- Doseerschema per week op één weekdag. Met evt een toedientijd -->
                  <xsl:variable name="aantalPerWeek">
                     <xsl:value-of
                        select="./frequentie[tijdseenheid/@unit = 'wk'][1]/aantal/vaste_waarde/@value"
                     />
                  </xsl:variable>
                  <xsl:for-each select="./weekdag">
                     <effectiveTime>
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                           <xsl:with-param name="operator" select="'A'"/>
                           <xsl:with-param name="toedientijd" select="./toedientijd"/>
                           <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                        </xsl:call-template>
                     </effectiveTime>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when
                  test="count(./weekdag) > 1 or (./weekdag and count(./frequentie[tijdseenheid/@unit != 'wk']) >= 1) or (./weekdag and count(./toedientijd) > 1)">
                  <!-- Complexer doseerschema met weekdag(en) eventueel gecombineerd met 0 of meer frequenties en vaste tijd(en) -->
                  <xsl:variable name="aantalPerWeek">
                     <xsl:value-of
                        select="./frequentie[tijdseenheid/@unit = 'wk'][1]/aantal/vaste_waarde/@value"
                     />
                  </xsl:variable>
                  <effectiveTime xsi:type="SXPR_TS" operator="A">
                     <xsl:for-each select="./frequentie[tijdseenheid/@unit != 'wk']">
                        <comp>
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"
                           />
                        </comp>
                     </xsl:for-each>
                     <xsl:for-each select="./weekdag">
                        <comp>
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                              <xsl:with-param name="operator">
                                 <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                 <xsl:choose>
                                    <xsl:when test="not(./preceding-sibling::weekdag)">
                                       <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:value-of select="'I'"/>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </xsl:with-param>
                              <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                           </xsl:call-template>
                        </comp>
                     </xsl:for-each>
                     <xsl:for-each select="./toedientijd">
                        <comp xsi:type="hl7nl:PIVL_TS">
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
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
               <xsl:when
                  test="not(./interval) and not(./toedientijd) and not(../toedieningsduur) and not(./weekdag) and count(./dagdeel) = 1">
                  <!-- dagdeel> -->
                  <xsl:choose>
                     <xsl:when test="./dagdeel/@code = '2546009'">
                        <!--  's nachts -->
                        <effectiveTime>
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9159_20160728135022">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid"
                                 select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"
                              />
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:when>
                     <xsl:when test="./dagdeel/@code = '73775008'">
                        <!--  's morgens -->
                        <effectiveTime>
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9156_20160728135021">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid"
                                 select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"
                              />
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:when>
                     <xsl:when test="./dagdeel/@code = '255213009'">
                        <!--  's middags -->
                        <effectiveTime>
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9157_20160728135022">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid"
                                 select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"
                              />
                           </xsl:call-template>
                        </effectiveTime>
                     </xsl:when>
                     <xsl:when test="./dagdeel/@code = '3157002'">
                        <!--  's avonds -->
                        <effectiveTime>
                           <xsl:call-template
                              name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9158_20160728135022">
                              <xsl:with-param name="operator" select="'A'"/>
                              <xsl:with-param name="frequentieTijdseenheid"
                                 select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"
                              />
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
            <xsl:attribute name="value" select="'1'"/>
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
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"
      />
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
         <code code="3" displayName="Reden voor deze toedieningsafspraak"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
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
            <xsl:attribute name="root" select="$MBHroot/identificatie/@root"/>
            <xsl:attribute name="extension"
               select="//$MBHroot/identificatie/@value"/>
         </id>
         <code code="1" displayName="Medicamenteuze behandeling"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>
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
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="root" select="./@root"/>
               </xsl:call-template>
            </xsl:for-each>
         </xsl:if>
         <code code="16076005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"
            displayName="Medicatieafspraak"/>
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
            <xsl:for-each select="./identificatie">
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="root" select="./@root"/>
               </xsl:call-template>
            </xsl:for-each>

            <!-- aantal herhalingen -->
            <xsl:for-each select="./aantal_herhalingen">
               <repeatNumber>
                  <xsl:attribute name="value" select="./@value"/>
               </repeatNumber>
            </xsl:for-each>

            <!-- Te verstrekken hoeveelheid -->
            <xsl:for-each select="./te_verstrekken_hoeveelheid">
               <quantity>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
               </quantity>
            </xsl:for-each>

            <!-- verbruiksperiode -->
            <xsl:for-each select="./verbruiksperiode">
               <expectedUseTime>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="low" select="./ingangsdatum"/>
                     <xsl:with-param name="width" select="./duur"/>
                     <xsl:with-param name="high" select="./einddatum"/>
                  </xsl:call-template>
               </expectedUseTime>
            </xsl:for-each>

            <!-- Te verstrekken geneesmiddel -->
            <xsl:for-each select="./te_verstrekken_geneesmiddel/product">
               <product>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </product>
            </xsl:for-each>

            <!-- beoogd verstrekker -->
            <xsl:for-each select="./beoogdverstrekker/zorgaanbieder">
               <performer>
                  <assignedEntity>
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                  </assignedEntity>
               </performer>
            </xsl:for-each>

            <!-- Auteur / zorgverlener -->
            <xsl:for-each select="./auteur/zorgverlener">
               <author>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                     <xsl:with-param name="authorTime" select="../../datum"/>
                  </xsl:call-template>
               </author>
            </xsl:for-each>

            <!-- afleverlocatie -->
            <xsl:for-each select="./afleverlocatie">
               <participant typeCode="DST">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
               </participant>
            </xsl:for-each>

            <!-- aanvullende wensen -->
            <xsl:for-each select="./aanvullende_wensen">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="COMP">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="./toelichting">
               <!-- kan er 0 of 1 zijn -->
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- relatie naar MA -->
            <xsl:for-each select="./relatie_naar_medicatieafspraak">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                     <xsl:with-param name="identificatieElement" select="./identificatie"/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
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
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
      </representedOrganization>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042">
      <!--MP CDA Organization id name-->
      <xsl:for-each select="./zorgaanbiederidentificatienummer">
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9112_20160710120116"/>
      </xsl:for-each>
      <xsl:for-each select="./organisatienaam">
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
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="root" select="./@root"/>
               </xsl:call-template>
            </xsl:for-each>

            <code codeSystemName="Medicatieproces acts" displayName="Verstrekking" code="373784005"
               codeSystem="2.16.840.1.113883.6.96"/>

            <!-- (uitreik-)datum   (Aanschrijfdatum zit in EntityRelation) -->
            <xsl:for-each select="./datum">
               <effectiveTime>
                  <xsl:call-template name="makeTSValueAttr"/>
               </effectiveTime>
            </xsl:for-each>

            <xsl:for-each select="./verstrekte_hoeveelheid">
               <quantity>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
               </quantity>
            </xsl:for-each>

            <xsl:for-each select="./verbruiksduur">
               <expectedUseTime>
                  <!-- Tijdseenheid is verplicht in dagen -->
                  <width value="{./@value}" unit="d"/>
               </expectedUseTime>
            </xsl:for-each>

            <xsl:for-each select="./verstrekt_geneesmiddel/product">
               <product>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </product>
            </xsl:for-each>

            <xsl:for-each select="./verstrekker/zorgaanbieder">
               <performer>
                  <assignedEntity>
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                  </assignedEntity>
               </performer>
            </xsl:for-each>

            <xsl:for-each select="./afleverlocatie">
               <participant typeCode="DST">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
               </participant>
            </xsl:for-each>

            <xsl:for-each select="./aanschrijfdatum">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./distributievorm">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="./toelichting">
               <!-- kan er 0 of 1 zijn -->
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
               </entryRelationship>
            </xsl:for-each>

            <!-- relatie naar Verstrekkingsverzoek -->
            <xsl:for-each select="./relatie_naar_verstrekkingsverzoek">
               <!-- kunnen er 0 of 1 zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9096_20160623201738"/>
               </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
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
         <code code="4" displayName="Aanschrijfdatum"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="MP Observaties"/>
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
         <code code="3" displayName="Verstrekkingsverzoek"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"
            codeSystemName="Medicatieproces acts"/>
      </supply>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415">
      <!-- Distributievorm -->
      <act classCode="ACT" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9097"/>
         <code code="{./@code}" codeSystem="{./@codeSystem}" codeSystemName="Distributievorm"
            displayName="{./@displayName}"/>
      </act>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
      <xsl:param name="identificatieElement"/>
      <!-- MP Toedieningsafspraak identificatie -->
      <substanceAdministration classCode="SBADM" moodCode="RQO">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9101"/>
         <xsl:if test="$identificatieElement[1] instance of element()">
            <xsl:for-each select="$identificatieElement">
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="root" select="./@root"/>
               </xsl:call-template>
            </xsl:for-each>
         </xsl:if>
         <code displayName="Toedieningsafspraak" code="422037009"
            codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
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
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="root" select="./@root"/>
               </xsl:call-template>
            </xsl:for-each>
         </xsl:if>
         <code code="373784005" displayName="Verstrekking" codeSystem="2.16.840.1.113883.6.96"
            codeSystemName="SNOMED CT"/>
      </supply>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013">
      <!--MP CDA Ingredient-->
      <xsl:for-each select="./sterkte">
         <pharm:quantity>
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9071_20160618204153"/>
         </pharm:quantity>
      </xsl:for-each>
      <xsl:for-each select="./ingredientcode">
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9073_20160618205506">
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
      <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9113"/>
      <xsl:for-each select="./zorgverleneridentificatienummer">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>
      <xsl:for-each select="./specialisme">
         <code>
            <xsl:call-template name="makeCodeAttribs"/>
         </code>
      </xsl:for-each>
      <xsl:for-each select="./zorgverlenernaam">
         <assignedPerson>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
               <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
            </xsl:call-template>
         </assignedPerson>
      </xsl:for-each>
      <xsl:for-each select="./zorgaanbieder/zorgaanbieder">
         <representedOrganization>
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
         </representedOrganization>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744">
      <!--Reden voor medicatiegebruik-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9114"/>
         <code code="6" displayName="Reden voor medicatiegebruik"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"
            codeSystemName="Medicatieproces observaties"/>
         <text>
            <xsl:value-of select="./@value"/>
         </text>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719">
      <!--Reden voor wijzigen/stoppen medicatiegebruik-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9115"/>
         <code code="7" displayName="Reden stoppen/wijzigen medicatiegebruik"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"
            codeSystemName="Medicatieproces observaties"/>
         <value xsi:type="CE" code="{./@code}" displayName="{./@displayName}"
            codeSystem="{./@codeSystem}" codeSystemName="Medicatieafspraak reden"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752">
      <!--Volgens afspraak indicator-->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9117"/>
         <code displayName="Volgens afspraak indicator" code="8"
            codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
         <value xsi:type="BL" value="{./@value}"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9119_20160710204856">
      <xsl:param name="patient"/>
      <!--MP CDA recordTarget2-->

      <xsl:for-each select="$patient">
         <recordTarget>
            <patientRole>
               <xsl:for-each select="./patientidentificatienummer">
                  <xsl:call-template name="makeIIValue">
                     <xsl:with-param name="root" select="./@root"/>
                  </xsl:call-template>
               </xsl:for-each>

               <!-- Adres -->
               <xsl:for-each select="./adresgegevens">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.101.10.2_20141106000000">
                     <xsl:with-param name="adres" select=".."/>
                  </xsl:call-template>
               </xsl:for-each>

               <!-- Telecom gegevens -->
               <xsl:for-each select="./contactgegevens">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706"/>
               </xsl:for-each>

               <patient>
                  <xsl:for-each select="./naamgegevens">
                     <name>
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                           <xsl:with-param name="naamgegevens" select="."/>
                        </xsl:call-template>
                     </name>
                  </xsl:for-each>
                  <xsl:for-each select="./geslacht">
                     <administrativeGenderCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                     </administrativeGenderCode>
                  </xsl:for-each>
                  <xsl:for-each select="./geboortedatum">
                     <birthTime value="19840512">
                        <xsl:call-template name="makeTSValueAttr"/>
                     </birthTime>
                  </xsl:for-each>
                  <!-- meerlingindicator -->
                  <xsl:for-each select="./meerlingindicator">
                     <multipleBirthInd xmlns="urn:hl7-org:sdtc">
                        <xsl:call-template name="makeBLAttribute">
                           <xsl:with-param name="inputValue" select="./@value"/>
                        </xsl:call-template>
                     </multipleBirthInd>
                  </xsl:for-each>
               </patient>
            </patientRole>
         </recordTarget>
      </xsl:for-each>
   </xsl:template>
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
         <code code="8302-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
            displayName="Lengte"/>
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

         <!-- aantal herhalingen -->
         <xsl:for-each select="./aantal_herhalingen">
            <repeatNumber>
               <xsl:attribute name="value" select="./@value"/>
            </repeatNumber>
         </xsl:for-each>

         <!-- Te verstrekken hoeveelheid -->
         <xsl:for-each select="./te_verstrekken_hoeveelheid">
            <quantity>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
            </quantity>
         </xsl:for-each>

         <!-- verbruiksperiode -->
         <xsl:for-each select="./verbruiksperiode">
            <expectedUseTime>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                  <xsl:with-param name="low" select="./ingangsdatum"/>
                  <xsl:with-param name="width" select="./duur"/>
                  <xsl:with-param name="high" select="./einddatum"/>
               </xsl:call-template>
            </expectedUseTime>
         </xsl:for-each>

         <!-- Te verstrekken geneesmiddel -->
         <xsl:for-each select="./te_verstrekken_geneesmiddel/product">
            <product>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                  <xsl:with-param name="product" select="."/>
               </xsl:call-template>
            </product>
         </xsl:for-each>

         <!-- beoogd verstrekker -->
         <xsl:for-each select="./beoogdverstrekker/zorgaanbieder">
            <performer>
               <assignedEntity>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
               </assignedEntity>
            </performer>
         </xsl:for-each>

         <!-- Als auteur is er ofwel een zorgverlener, ofwel een participant als de gebruiker een voorstel doet -->
         <xsl:for-each select="//voorstelgegevens/auteur/auteur_is_zorgverlener/zorgverlener">
            <author>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                  <xsl:with-param name="authorTime" select="../../../voorsteldatum"/>
               </xsl:call-template>
            </author>
         </xsl:for-each>
         <!-- participant - voorstel door patient -->
         <xsl:if test="//voorstelgegevens/auteur/auteur_is_patient/@value = 'true'">
            <participant typeCode="AUT">
               <xsl:for-each select="//voorstelgegevens/voorsteldatum">
                  <time>
                     <xsl:call-template name="makeTSValueAttr"/>
                  </time>
               </xsl:for-each>
               <participantRole classCode="PAT"/>
            </participant>
         </xsl:if>

         <!-- afleverlocatie -->
         <xsl:for-each select="./afleverlocatie">
            <participant typeCode="DST">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
            </participant>
         </xsl:for-each>

         <!-- aanvullende wensen -->
         <xsl:for-each select="./aanvullende_wensen">
            <!-- kunnen er 0 of meer zijn -->
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Toelichting -->
         <xsl:for-each select="./toelichting">
            <!-- kan er 0 of 1 zijn -->
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
            </entryRelationship>
         </xsl:for-each>

         <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
         <entryRelationship typeCode="COMP" inversionInd="true">
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
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
            <xsl:for-each select="./identificatie">
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="root" select="./@root"/>
               </xsl:call-template>
            </xsl:for-each>
            <code code="16076005" displayName="Medicatieafspraak"
               codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
               <text mediaType="text/plain">
                  <xsl:value-of select="./@value"/>
               </text>
            </xsl:for-each>

            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="./geannuleerd_indicator/@value = 'true'">
               <statusCode code="nullified"/>
            </xsl:if>

            <!-- Gebruiksperiode TODO, AD datatype voldoet niet -->
            <xsl:for-each select="./gebruiksperiode">
               <effectiveTime xsi:type="IVL_TS">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="width" select="."/>
                  </xsl:call-template>
               </effectiveTime>
            </xsl:for-each>
            <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
               <routeCode>
                  <xsl:call-template name="makeCodeAttribs"/>
               </routeCode>
            </xsl:for-each>
            <xsl:for-each select="./afgesproken_geneesmiddel/product">
               <consumable>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </consumable>
            </xsl:for-each>
            <xsl:for-each select="./voorschrijver/zorgverlener">
               <author>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                     <xsl:with-param name="authorTime" select="../../afspraakdatum"/>
                  </xsl:call-template>
               </author>
            </xsl:for-each>
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
               <xsl:with-param name="ma" select="."/>
            </xsl:call-template>
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
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9076_20160619200644"/>
         </xsl:for-each>
         <xsl:for-each select="./keerdosis">
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840"/>
         </xsl:for-each>
         <xsl:for-each select="./toedieningssnelheid">
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449"/>
         </xsl:for-each>
         <xsl:for-each select="./zo_nodig/maximale_dosering">
            <maxDoseQuantity>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000"/>
            </maxDoseQuantity>
         </xsl:for-each>


         <!-- Altijd verplicht op deze manier aanwezig in de HL7 -->
         <consumable xsi:nil="true"/>

         <xsl:if test="./zo_nodig">
            <precondition>
               <criterion classCode="OBS">
                  <xsl:choose>
                     <xsl:when test="./zo_nodig/criterium/code/@code">
                        <code codeSystem="2.16.840.1.113883.2.4.4.5">
                           <xsl:attribute name="code" select="./zo_nodig/criterium/code/@code"/>
                           <xsl:attribute name="displayName"
                              select="./zo_nodig/criterium/code/@displayName"/>
                           <!-- Als zowel code als omschrijving voorkomen wordt omschrijving genegeerd -->
                           <!--<xsl:if test="./zo_nodig/criterium/omschrijving/@value">
                              <xsl:attribute name="displayName" select="./zo_nodig/criterium/omschrijving/@value"/>
                              <originalText>
                                 <xsl:value-of select="./zo_nodig/criterium/omschrijving/@value"/>
                              </originalText>
                           </xsl:if>-->
                        </code>
                     </xsl:when>
                     <xsl:when test="./zo_nodig/criterium/omschrijving/@value">
                        <code nullFlavor="OTH">
                           <originalText>
                              <xsl:value-of select="./zo_nodig/criterium/omschrijving/@value"/>
                           </originalText>
                        </code>
                     </xsl:when>
                     <!-- otherwise: geen code en geen omschrijving? Dan niets naar de uitvoer schrijven -->
                  </xsl:choose>
               </criterion>
            </precondition>
         </xsl:if>
      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449">
      <!--MP CDA Toedieningssnelheid-->
      <rateQuantity>
         <xsl:variable name="speedUnit">
            <xsl:value-of select="./eenheid/@value"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="./tijdseenheid/@value"/>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="./waarde/vaste_waarde/@value">
               <center>
                  <xsl:attribute name="value" select="./waarde/vaste_waarde/@value"/>
                  <xsl:attribute name="unit" select="$speedUnit"/>
               </center>
            </xsl:when>
            <xsl:when test="./waarde/min/@value or ./waarde/max/@value">
               <xsl:for-each select="./waarde/min">
                  <!-- min can occur 0 or 1 time -->
                  <low>
                     <xsl:attribute name="value" select="./@value"/>
                     <xsl:attribute name="unit" select="$speedUnit"/>
                  </low>
               </xsl:for-each>
               <xsl:for-each select="./waarde/max">
                  <!-- max can occur 0 or 1 time -->
                  <high>
                     <xsl:attribute name="value" select="./@value"/>
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
               <xsl:call-template name="makeIIValue">
                  <xsl:with-param name="root" select="./@root"/>
               </xsl:call-template>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak"
               codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
               <text mediaType="text/plain">
                  <xsl:value-of select="./@value"/>
               </text>
            </xsl:for-each>

            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="./geannuleerd_indicator/@value = 'true'">
               <statusCode code="nullified"/>
            </xsl:if>

            <!-- Gebruiksperiode TODO, AD datatype voldoet niet -->
            <xsl:for-each select="./gebruiksperiode">
               <effectiveTime xsi:type="IVL_TS">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="width" select="."/>
                  </xsl:call-template>
               </effectiveTime>
            </xsl:for-each>

            <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
               <routeCode>
                  <xsl:call-template name="makeCodeAttribs"/>
               </routeCode>
            </xsl:for-each>

            <xsl:for-each select="./geneesmiddel_bij_toedieningsafspraak/product">
               <consumable>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </consumable>
            </xsl:for-each>

            <!-- Verstrekker -->
            <xsl:for-each select="./verstrekker/zorgaanbieder/zorgaanbieder">
               <author>
                  <time>
                     <xsl:attribute name="value">
                        <xsl:call-template name="format2HL7Date">
                           <xsl:with-param name="dateTime" select="../../../afspraakdatum/@value"/>
                        </xsl:call-template>
                     </xsl:attribute>
                  </time>
                  <assignedAuthor>
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                  </assignedAuthor>
               </author>
            </xsl:for-each>

            <xsl:for-each select="./stoptype">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./reden_afspraak">
               <entryRelationship typeCode="RSON">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9083_20160621100220"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
               <entryRelationship typeCode="SPRT">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./aanvullende_informatie">
               <entryRelationship typeCode="COMP">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022"/>
               </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="./toelichting">
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
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
                  <xsl:for-each select=".">
                     <xsl:call-template
                        name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                  </xsl:for-each>
               </entryRelationship>
            </xsl:for-each>

            <!-- relatie naar MA -->
            <xsl:for-each select="./relatie_naar_medicatieafspraak">
               <!-- kunnen er 0 of meer zijn -->
               <entryRelationship typeCode="REFR">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                     <xsl:with-param name="identificatieElement" select="./identificatie"/>
                  </xsl:call-template>
               </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838"> 
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
            
            <code code="16076005" displayName="Medicatieafspraak"
               codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
               <text mediaType="text/plain">
                  <xsl:value-of select="./@value"/>
               </text>
            </xsl:for-each>

            <!-- Gebruiksperiode TODO, AD datatype voldoet niet -->
            <xsl:for-each select="./gebruiksperiode">
               <effectiveTime xsi:type="IVL_TS">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="width" select="."/>
                  </xsl:call-template>
               </effectiveTime>
            </xsl:for-each>
            <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
               <routeCode>
                  <xsl:call-template name="makeCodeAttribs"/>
               </routeCode>
            </xsl:for-each>

            <xsl:for-each select="./afgesproken_geneesmiddel/product">
               <consumable>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                     <xsl:with-param name="product" select="."/>
                  </xsl:call-template>
               </consumable>
            </xsl:for-each>

            <!-- Als auteur is er ofwel een zorgverlener, ofwel een participant als de gebruiker een voorstel doet -->
            <xsl:for-each select="//voorstelgegevens/auteur/auteur_is_zorgverlener/zorgverlener">
               <author>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                     <xsl:with-param name="authorTime" select="../../../voorsteldatum"/>
                  </xsl:call-template>
               </author>
            </xsl:for-each>
            <!-- participant - voorstel door patient -->
            <xsl:if test="//voorstelgegevens/auteur/auteur_is_patient/@value = 'true'">
               <participant typeCode="AUT">
                  <xsl:for-each select="//voorstelgegevens/voorsteldatum">
                     <time>
                        <xsl:call-template name="makeTSValueAttr"/>
                     </time>
                  </xsl:for-each>
                  <participantRole classCode="PAT"/>
               </participant>
            </xsl:if>

            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
               <xsl:with-param name="ma" select="."/>
            </xsl:call-template>

            <!-- TODO: toelichting bij verzoek: Er zijn nu 2 toelichtingen  die in dezelfde EntityRelationship terecht moeten komen, 
               dus daar moet op hoger niveau naar gekeken worden. -->
            <!-- <xsl:for-each select="//voorstelgegevens/toelichting">
               <entryRelationship typeCode="SUBJ" inversionInd="true">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
               </entryRelationship>
            </xsl:for-each>-->

         </substanceAdministration>
      </xsl:for-each>

   </xsl:template>
   <!--Medicatiegebruik-->
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9154_20160726181533">
      <xsl:param name="gb"/>

      <xsl:variable name="isInGebruik" select="./gebruikindicator/@value" as="xs:boolean"/>

      <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="{not($isInGebruik)}">
         <!-- Feitelijk medicatiegebruik -->
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9154"/>
         <!-- identificatie -->
         <xsl:for-each select="./identificatie">
            <xsl:call-template name="makeIIValue">
               <xsl:with-param name="root" select="./@root"/>
            </xsl:call-template>
         </xsl:for-each>
         <code code="6" displayName="Gebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"
            codeSystemName="Medicatieproces acts"/>
         <xsl:for-each select="./gebruiksinstructie/omschrijving">
            <text mediaType="text/plain">
               <xsl:value-of select="./@value"/>
            </text>
         </xsl:for-each>
         <!-- Gebruiksperiode TODO, AD datatype voldoet niet -->
         <xsl:if test="$isInGebruik">
            <!-- EffectiveTime mag niet voorkomen als gebruiksindicator = false -->
            <xsl:for-each select="./gebruiksperiode">
               <effectiveTime xsi:type="IVL_TS">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                     <xsl:with-param name="width" select="."/>
                  </xsl:call-template>
               </effectiveTime>
            </xsl:for-each>
         </xsl:if>
         <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
            <routeCode>
               <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
         </xsl:for-each>
         <xsl:for-each select="./gebruiksproduct/product">
            <consumable>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                  <xsl:with-param name="product" select="."/>
               </xsl:call-template>
            </consumable>
         </xsl:for-each>

         <!-- Als auteur is er ofwel een zorgverlener, ofwel een participant als de gebruiker een niet voorgeschreven middel registreert -->
         <!-- De auteur is degene die het gebruik vastlegt, terwijl de voorschrijver later in een entryRelationship terugkomt.
              In het bijzonder als de auteur een zorgverlener is, kan via <informant> ook nog vastgelegd worden wie de informatie heeft aangeleverd. -->
         <!-- We doen hier niet aan validatie van de input, dus geen extra controle of ./auteur/auteur_is_patient/@value = false -->
         <xsl:for-each select="./auteur/auteur_is_zorgverlener/zorgverlener">
            <author>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                  <xsl:with-param name="authorTime" select="../../../registratiedatum"/>
               </xsl:call-template>
            </author>
         </xsl:for-each>
         <!-- Informant van het medicatiegebruik: zorgverlener -->
         <xsl:for-each select="./informant/informant_is_zorgverlener/zorgverlener">
            <informant>
               <assignedEntity>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9013_20151127000000"/>
               </assignedEntity>
            </informant>
         </xsl:for-each>

         <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
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

         <!-- Door de schema-definitie wordt afgedwongen dat <participant> na <informant> komt - hierdoor komt de author in dit geval mogelijk na de informant -->
         <!-- participant - registratie door patient -->
         <xsl:if test="./auteur/auteur_is_patient/@value = 'true'">
            <participant typeCode="AUT">
               <xsl:for-each select="./registratiedatum">
                  <time>
                     <xsl:call-template name="makeTSValueAttr"/>
                  </time>
               </xsl:for-each>
               <participantRole classCode="PAT"/>
            </participant>
         </xsl:if>

         <!-- Informant van het medicatiegebruik: patiënt -->
         <xsl:if test="./informant/informant_is_patient/@value = 'true'">
            <participant typeCode="INF">
               <participantRole classCode="PAT"/>
            </participant>
         </xsl:if>

         <!-- Volgens afspraak indicator -->
         <xsl:for-each select="./volgens_afspraak_indicator">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Stoptype -->
         <xsl:for-each select="./stoptype">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Aanvullende Instructie. -->
         <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
            <entryRelationship typeCode="SPRT">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Reden gebruik -->
         <xsl:for-each select="./reden_gebruik">
            <entryRelationship typeCode="RSON">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Reden wijzigen/stoppen gebruik -->
         <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik">
            <entryRelationship typeCode="RSON">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Toelichting -->
         <xsl:for-each select="./toelichting">
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
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
               <xsl:for-each select=".">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
               </xsl:for-each>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar (voorschrift met) voorschrijver -->
         <xsl:for-each select="./voorschrijver/zorgverlener">
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
         <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze. Hier doen we geen input validatie,
              dus wordt elk aanwezig element omgezet. -->
         <xsl:for-each select="./gerelateerde_afspraak/identificatie_medicatieafspraak">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                  <xsl:with-param name="identificatieElement" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./gerelateerde_afspraak/identificatie_toedieningsafspraak">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                  <xsl:with-param name="identificatieElement" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar verstrekking -->
         <xsl:for-each select="./gerelateerde_verstrekking">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                  <xsl:with-param name="identificatieElement" select="./identificatie"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>

         <!-- Relatie naar medicamenteuze behandeling -->
         <entryRelationship typeCode="COMP" inversionInd="true">
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
               <xsl:with-param name="MBHroot" select=".."/>
            </xsl:call-template>
         </entryRelationship>

      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9013_20151127000000">
      <!-- CDA AssignedEntity -->
      <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9013"/>
      <xsl:for-each select="./zorgverleneridentificatienummer">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>
      <xsl:for-each select="./specialisme">
         <code>
            <xsl:call-template name="makeCodeAttribs"/>
         </code>
      </xsl:for-each>

      <!-- Telecom gegevens -->
      <xsl:for-each select="./telefoonemail">
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706"/>
      </xsl:for-each>

      <xsl:for-each select="./zorgverlenernaam">
         <assignedPerson>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
               <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
            </xsl:call-template>
         </assignedPerson>
      </xsl:for-each>
      <xsl:for-each select="./zorgaanbieder/zorgaanbieder">
         <representedOrganization>
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
         </representedOrganization>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
      <!-- HL7NL PIVL_TS Weekdag -->
      <xsl:param name="operator"/>
      <xsl:param name="toedientijd"/>
      <xsl:param name="aantalPerWeek"/>
      <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
      <xsl:call-template name="chooseOperatorAttrib">
         <xsl:with-param name="operator" select="$operator"/>
      </xsl:call-template>
      <xsl:attribute name="isFlexible" select="'true'"/>
      <xsl:attribute name="alignment" select="'DW'"/>
      <xsl:variable name="date4DayOfWeek">
         <xsl:choose>
            <xsl:when test="./@code = '307145004'">
               <!-- maandag -->
               <xsl:value-of select="'19700601'"/>
            </xsl:when>
            <xsl:when test="./@code = '307147007'">
               <!-- dinsdag -->
               <xsl:value-of select="'19700602'"/>
            </xsl:when>
            <xsl:when test="./@code = '307148002'">
               <!-- woensdag -->
               <xsl:value-of select="'19700603'"/>
            </xsl:when>
            <xsl:when test="./@code = '307149005'">
               <!-- donderdag -->
               <xsl:value-of select="'19700604'"/>
            </xsl:when>
            <xsl:when test="./@code = '307150005'">
               <!-- vrijdag -->
               <xsl:value-of select="'19700605'"/>
            </xsl:when>
            <xsl:when test="./@code = '307151009'">
               <!-- zaterdag -->
               <xsl:value-of select="'19700606'"/>
            </xsl:when>
            <xsl:when test="./@code = '307146003'">
               <!-- zondag -->
               <xsl:value-of select="'19700607'"/>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$toedientijd[1] instance of element() and count($toedientijd) = 1">
            <xsl:variable name="toedienDatumtijd">
               <xsl:call-template name="format2HL7Date">
                  <xsl:with-param name="dateTime" select="../toedientijd/@value"/>
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
            <xsl:when test="$aantalPerWeek castable as xs:integer">
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
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
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
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
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
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
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
            <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
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
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9160_20161109134526">
      <xsl:param name="originalText"/>
      <!-- Reden van voorschrijven -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9160"/>
         <code code="10" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"
            codeSystemName="Medicatieproces observaties" displayName="Reden van voorschrijven."/>
         <xsl:choose>
            <xsl:when test="@code">
               <xsl:call-template name="makeCEValue">
                  <xsl:with-param name="originalText" select="$originalText"/>
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
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
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
                     <xsl:when test="./productcode">
                        <xsl:call-template
                           name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
                           <xsl:with-param name="productCode" select="./productcode"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="./productspecificatie">
                        <!-- magistrale medicatie -->
                        <xsl:for-each select="./productspecificatie/productnaam">
                           <name>
                              <xsl:value-of select="./@value"/>
                           </name>
                        </xsl:for-each>
                        <xsl:for-each select="./productspecificatie/omschrijving">
                           <pharm:desc>
                              <xsl:value-of select="./@value"/>
                           </pharm:desc>
                        </xsl:for-each>
                        <xsl:for-each select="./productspecificatie/farmaceutischevorm">
                           <pharm:formCode>
                              <xsl:call-template name="makeCodeAttribs">
                                 <xsl:with-param name="originalText" select="."/>
                              </xsl:call-template>
                           </pharm:formCode>
                        </xsl:for-each>
                        <xsl:for-each select="./productspecificatie/ingredient">
                           <pharm:ingredient classCode="INGR">
                              <xsl:call-template
                                 name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013"
                              />
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
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000">
      <!-- te verstrekken hoeveelheid -->
      <xsl:attribute name="value" select="./aantal/@value"/>
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
         <xsl:with-param name="UCUMvalue" select="./aantal/@value"/>
         <xsl:with-param name="UCUMunit" select="nf:convertUnit_ADA2UCUM(./eenheid/@value)"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000">
      <!--MP MA Voorschrijver-->
      <substanceAdministration classCode="SBADM" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9166"/>
         <code code="16076005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="--TODO--"
            displayName="--TODO--"/>
         <consumable xsi:nil="true"/>
         <author>
            <time nullFlavor="NI"/>
            <assignedAuthor>
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
            </assignedAuthor>
         </author>
      </substanceAdministration>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
      <!-- MP Gebruik Voorschrijver -->
      <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9167"/>
      <xsl:for-each select="./zorgverleneridentificatienummer">
         <xsl:call-template name="makeIIid"/>
      </xsl:for-each>

      <xsl:for-each select="./specialisme">
         <code>
            <xsl:call-template name="makeCodeAttribs"/>
         </code>
      </xsl:for-each>

      <xsl:for-each select="./zorgverlenernaam">
         <assignedPerson>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
               <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
            </xsl:call-template>
         </assignedPerson>
      </xsl:for-each>

      <xsl:for-each select="./zorgaanbieder/zorgaanbieder">
         <representedOrganization>
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
         </representedOrganization>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9169_20170521195457">
      <!--MP CDA Organization Medicatieoverzicht-->

      <!--Zorgaanbieder identificatie-->
      <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>

      <!-- Telecom gegevens -->
      <xsl:for-each select="./telefoonemail">
         <xsl:call-template
            name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706"/>
      </xsl:for-each>

      <!-- Adres -->
      <xsl:for-each select="./adres">
         <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.2_20141106000000">
            <xsl:with-param name="adres" select="."/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9171_20170522091920">
      <!--MP CDA author medicatieoverzicht-->
      <author>
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9171"/>
         <time nullFlavor="NI"/>
         <assignedAuthor>
            <!--identificatie-->
            <id nullFlavor="NI"/>
            <!--Zorgaanbieder-->
            <xsl:for-each select="./zorgaanbieder">
               <representedOrganization>
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9169_20170521195457"/>
               </representedOrganization>
            </xsl:for-each>
         </assignedAuthor>
      </author>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706">
      <!--Telecom gegevens-->
      <xsl:for-each select=".//telefoonnummers">
         <telecom>
            <xsl:attribute name="use" select="./nummersoort/@code"/>
            <xsl:attribute name="value">
               <xsl:text>tel:</xsl:text>
               <xsl:value-of select="./telefoonnummer/@value"/>
            </xsl:attribute>
         </telecom>
      </xsl:for-each>

      <xsl:for-each select=".//emailadressen">
         <telecom>
            <xsl:attribute name="use" select="./emailsoort/@code"/>
            <xsl:attribute name="value">
               <xsl:text>mailto:</xsl:text>
               <xsl:value-of select="./emailadres/@value"/>
            </xsl:attribute>
         </telecom>
      </xsl:for-each>

      <!-- Fax gegevens komen in de ADA XML niet voor -->
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022">
      <!-- MP CDA TA Aanvullende informatie -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9175"/>
         <code code="12" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"
            displayName="Aanvullende informatie Toedieningsafspraak"/>
         <xsl:call-template name="makeCEValue"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315">
      <!-- MP CDA MA Aanvullende informatie -->
      <observation classCode="OBS" moodCode="EVN">
         <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9177"/>
         <code code="11" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"
            displayName="Aanvullende informatie Medicatieafspraak"/>
         <!-- TODO: voor publicatie 9.04: omzetten naar makeCEValue -->
         <xsl:call-template name="makeCDValue"/>
      </observation>
   </xsl:template>
   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9179_20170523115538">
      <!-- MP organizer verifier patiënt-->

      <!-- Als er niet geverifieerd is, dan ook niet opnemen. -->
      <xsl:if test="./geverifieerd_met_patientq/@value = 'true'">
         <participant typeCode="VRF">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9179"/>
            <xsl:for-each select="./verificatiedatum">
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
            <xsl:for-each select="./verificatiedatum">
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
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./reden_afspraak">
            <entryRelationship typeCode="RSON">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9068_20160617150015"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./redenvanvoorschrijven/probleem/probleemnaam">
            <entryRelationship typeCode="RSON">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9160_20161109134526">
                  <xsl:with-param name="originalText" select="."/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
            <entryRelationship typeCode="SPRT">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./lichaamslengte">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9122_20160713172302">
                  <xsl:with-param name="effectiveTime" select="./lengtedatumtijd"/>
                  <xsl:with-param name="PQvalue" select="./lengtewaarde"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./lichaamsgewicht">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9123_20160713212617">
                  <xsl:with-param name="effectiveTime" select="./gewichtdatumtijd"/>
                  <xsl:with-param name="PQvalue" select="./gewichtwaarde"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>
         <!-- TODO: onderstaande is toch precies identiek aan bovenstaande for-each? Kan weg !? -->
         <!--<xsl:for-each select="./lichaamsgewicht">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9123_20160713212617">
                  <xsl:with-param name="effectiveTime" select="./gewichtdatumtijd"/>
                  <xsl:with-param name="PQvalue" select="./gewichtwaarde"/>
               </xsl:call-template>
            </entryRelationship>
         </xsl:for-each>-->
         <xsl:for-each select="./aanvullende_informatie">
            <entryRelationship typeCode="COMP">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315"/>
            </entryRelationship>
         </xsl:for-each>
         <xsl:for-each select="./toelichting">
            <entryRelationship typeCode="SUBJ" inversionInd="true">
               <xsl:call-template
                  name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
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
               <xsl:for-each select=".">
                  <xsl:call-template
                     name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
               </xsl:for-each>
            </entryRelationship>
         </xsl:for-each>
         <!--Relatie naar medicamenteuze behandeling-->
         <entryRelationship typeCode="COMP" inversionInd="true">
            <xsl:call-template
               name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
               <xsl:with-param name="MBHroot" select=".."/>
            </xsl:call-template>
         </entryRelationship>

      </xsl:for-each>
   </xsl:template>

</xsl:stylesheet>
