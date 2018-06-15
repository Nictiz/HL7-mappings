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
<xsl:stylesheet xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:include href="../fhir/2_fhir_fhir_include.xsl"/>

   <xd:doc>
      <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
      <xd:param name="patient"/>
      <xd:param name="toedieningsafspraak"/>
   </xd:doc>
   <xsl:template name="zib-AdministrationAgreement-2.0">
      <xsl:param name="patient" as="element()?"/>
      <xsl:param name="toedieningsafspraak" as="element()?"/>
      <xsl:for-each select="$toedieningsafspraak">
         <MedicationDispense>
            <meta>
               <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement"/>
            </meta>
            <!-- product met ingrediënten, niet gecodeerd product -->
            <!-- store the contained_id to later refer to -->
            <xsl:variable name="product" select="./geneesmiddel_bij_toedieningsafspraak/product"/>
            <xsl:variable name="product-id" select="generate-id($product)"/>
            <xsl:for-each select="$product[product_code/@codeSystem = $oidNullFlavor]">
               <contained>
                  <xsl:call-template name="zib-Product">
                     <xsl:with-param name="product" select="."/>
                     <xsl:with-param name="product-id" select="$product-id"/>
                  </xsl:call-template>
               </contained>
            </xsl:for-each>
            <!-- afspraakdatum -->
            <xsl:for-each select="./afspraakdatum[@value]">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AuthoredOn">
                  <valueDateTime value="{./@value}"/>
               </extension>
            </xsl:for-each>
            <!-- reden afspraak -->
            <xsl:for-each select="./reden_afspraak">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-ReasonForDispense">
                  <valueString value="{./@value}"/>
               </extension>
            </xsl:for-each>
            <!-- gebruiksperiode_start -->
            <!-- gebruiksperiode_eind -->
            <xsl:for-each select=".[gebruiksperiode_start | gebruiksperiode_eind]">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-PeriodOfUse">
                  <valuePeriod>
                     <xsl:for-each select="./gebruiksperiode_start">
                        <start value="{./@value}"/>
                     </xsl:for-each>
                     <xsl:for-each select="./gebruiksperiode_eind">
                        <end value="{./@value}"/>
                     </xsl:for-each>
                  </valuePeriod>
               </extension>
            </xsl:for-each>
            <!-- gebruiksperiode -->
            <xsl:for-each select="./gebruiksperiode">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration">
                  <valueDuration>
                     <xsl:call-template name="hoeveelheid-to-Duration">
                        <xsl:with-param name="in" select="."/>
                     </xsl:call-template>
                  </valueDuration>
               </extension>
            </xsl:for-each>
            <!-- reden afspraak -->
            <xsl:for-each select="./aanvullende_informatie">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
                  <valueCodeableConcept>
                     <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                     </xsl:call-template>
                  </valueCodeableConcept>
               </extension>
            </xsl:for-each>
            <!-- relatie naar medicamenteuze behandeling -->
            <xsl:for-each select="./../identificatie">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment">
                  <valueIdentifier>
                     <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="."/>
                     </xsl:call-template>
                  </valueIdentifier>
               </extension>
            </xsl:for-each>
            <!-- kopie indicator -->
            <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
            <xsl:for-each select="./kopie_indicator">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator">
                  <valueBoolean value="{(./@value='true')}"/>
               </extension>
            </xsl:for-each>
            <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule">
                  <valueDuration>
                     <xsl:call-template name="hoeveelheid-to-Duration">
                        <xsl:with-param name="in" select="."/>
                     </xsl:call-template>
                  </valueDuration>
               </extension>
            </xsl:for-each>
            <xsl:for-each select="stoptype">
               <modifierExtension>
                  <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType">
                     <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </valueCodeableConcept>  
                  </extension>
               </modifierExtension>
            </xsl:for-each>
            <xsl:for-each select="./identificatie">
               <identifier>
                  <xsl:call-template name="id-to-Identifier">
                     <xsl:with-param name="in" select="."/>
                  </xsl:call-template>
               </identifier>
            </xsl:for-each>
            <status value="completed">
               <xsl:attribute name="value">
                  <xsl:choose>
                     <xsl:when test="./geannuleerd_indicator/@value='true'">entered-in-error</xsl:when>
                     <xsl:otherwise>completed</xsl:otherwise>
                  </xsl:choose>
               </xsl:attribute>
            </status>
            <category>
               <coding>
                  <system value="http://snomed.info/sct"/>
                  <code value="422037009"/>
                  <display value="Provider's medication administration instructions (procedure)"/>
               </coding>
            </category>
            <xsl:for-each select="./geneesmiddel_bij_toedieningsafspraak/product/product_code">
               <xsl:choose>
                  <xsl:when test=".[@codeSystem = $oidNullFlavor]">
                     <medicationReference>
                        <reference value="#{$product-id}"/>
                        <display value="{./@originalText}"/>
                     </medicationReference>
                  </xsl:when>
                  <xsl:otherwise>
                     <medicationCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </medicationCodeableConcept>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
            <xsl:comment> Patient </xsl:comment>
            <xsl:comment> Possibly not to be included for MedMij related interactions, because patient should be known in infra-context </xsl:comment>
            <xsl:for-each select="$patient">
               <subject>
                  <xsl:for-each select="./patient_identificatienummer">
                     <identifier>
                        <xsl:call-template name="id-to-Identifier">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </identifier>
                  </xsl:for-each>
                  <!--         <xsl:for-each select="./naamgegevens">
                     <name>
                        <xsl:for-each select="./naamgebruik[not(@codeSystem = $oidNullFlavor)]">
                           <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                           <valueCode>
                              <xsl:call-template name="code-to-CodeableConcept">
                                 <xsl:with-param name="in" select="."/>
                              </xsl:call-template>
                           </valueCode>
                           </extension>
                        </xsl:for-each>
                     </name>
                  </xsl:for-each>
         -->
                  <xsl:if test="./naamgegevens">
                     <display value="{normalize-space(string-join(./naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
                  </xsl:if>
               </subject>
            </xsl:for-each>
            <!-- relatie naar medicatieafspraak -->
            <xsl:for-each select="relatie_naar_medicatieafspraak/identificatie">
               <supportingInformation>
                  <identifier>
                     <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="."/>
                     </xsl:call-template>
                  </identifier>
               </supportingInformation>
            </xsl:for-each>
            <!-- verstrekker -->
            <xsl:comment> Responsible dispensing pharmacy </xsl:comment>
            <xsl:for-each select="verstrekker">
               <performer>
                  <xsl:for-each select="./zorgaanbieder/zorgaanbieder">
                     <actor>
                        <xsl:for-each select="./zorgaanbieder_identificatie_nummer">
                           <identifier>
                              <xsl:call-template name="id-to-Identifier">
                                 <xsl:with-param name="in" select="."/>
                              </xsl:call-template>
                           </identifier>
                        </xsl:for-each>
                        <xsl:for-each select="./organisatie_naam[@value]">
                           <display value="{./@value}"/>
                        </xsl:for-each>
                     </actor>
                  </xsl:for-each>
               </performer>
            </xsl:for-each>
            <!-- toelichting -->
            <xsl:comment>Toelichting</xsl:comment>
            <xsl:for-each select="./toelichting[@value]">
               <note>
                  <text value="{./@value}"/>
               </note>
            </xsl:for-each>

            <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
               <dosageInstruction>
                  <xsl:for-each select="./../volgnummer[@value]">
                     <sequence value="{./@value}"/>
                  </xsl:for-each>
                  <xsl:comment>TODO: gebruiksinstructie/omschrijving should be defined one level higher, not per dosageInstruction</xsl:comment>
                  <xsl:for-each select="./../../omschrijving[@value]">
                     <text value="{./@value}"/>
                  </xsl:for-each>
                  <xsl:comment>TODO: gebruiksinstructie/aanvullende_instructie should be defined one level higher, not per dosageInstruction</xsl:comment>
                  <xsl:for-each select="./../../aanvullende_instructie[@code]">
                     <additionalInstruction>
                        <xsl:call-template name="code-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </additionalInstruction>
                  </xsl:for-each>
                  <xsl:for-each select="./toedieningsschema">
                     <xsl:call-template name="zib-Administration-Schedule-2.0">
                        <xsl:with-param name="toedieningsschema" select="."/>
                     </xsl:call-template>
                  </xsl:for-each>
                  <xsl:for-each select="zo_nodig/criterium/code">
                     <asNeededCodeableConcept>
                        <xsl:variable name="in" select="."/>
                        <!-- roep hier niet het standaard template aan omdat criterium/omschrijving ook nog omschrijving zou kunnen bevatten... -->
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
                        <xsl:choose>
                           <xsl:when test="./../omschrijving[@value]">
                              <text value="{./../omschrijving/@value}"/>
                           </xsl:when>
                           <xsl:when test="$in[@originalText]">
                              <text value="{$in/@originalText}"/>
                           </xsl:when>
                        </xsl:choose>
                        <xsl:if test="$in[@originalText]">
                           <text value="{$in/@originalText}"/>
                        </xsl:if>
                     </asNeededCodeableConcept>
                  </xsl:for-each>
                  <xsl:for-each select="./../../toedieningsweg">
                     <route>
                        <xsl:call-template name="code-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </route>
                  </xsl:for-each>
                  <xsl:for-each select="./keerdosis/aantal[vaste_waarde]">
                     <doseQuantity>
                        <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                           <xsl:with-param name="eenheid" select="./../eenheid"/>
                           <xsl:with-param name="waarde" select="./vaste_waarde"/>
                        </xsl:call-template>
                     </doseQuantity>
                  </xsl:for-each>
                  <xsl:for-each select="./keerdosis/aantal[min | max]">
                     <doseRange>
                        <xsl:call-template name="minmax-to-Range">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </doseRange>
                  </xsl:for-each>
                  <!-- maximale_dosering -->
                  <xsl:for-each select="./zo_nodig/maximale_dosering[.//*[@value]]">
                     <maxDosePerPeriod>
                        <xsl:call-template name="quotient-to-Ratio">
                           <xsl:with-param name="denominator" select="./tijdseenheid"/>
                           <xsl:with-param name="numerator-aantal" select="./aantal"/>
                           <xsl:with-param name="numerator-eenheid" select="./eenheid"/>
                        </xsl:call-template>
                     </maxDosePerPeriod>
                  </xsl:for-each>
                  <!-- TODO check of ik deze goed converteer vanuit 6.12
                  <xsl:if test="doseCheckQuantity">
                     <xsl:comment> TODO: doseCheckQuantity </xsl:comment>
                  </xsl:if>
                  <xsl:if test="maxDoseQuantity">
                     <maxDosePerAdministration>
                        <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                           <xsl:with-param name="in" select="maxDoseQuantity"/>
                        </xsl:call-template>
                     </maxDosePerAdministration>
                  </xsl:if>
               -->
                  <xsl:for-each select="./toedieningssnelheid[.//*[@value]]">
                     <xsl:for-each select=".[waarde/vaste_waarde]">
                        <rateRatio>
                           <xsl:call-template name="quotient-to-Ratio">
                              <xsl:with-param name="denominator" select="./tijdseenheid"/>
                              <xsl:with-param name="numerator-aantal" select="./waarde/vaste_waarde"/>
                              <xsl:with-param name="numerator-eenheid" select="./eenheid"/>
                           </xsl:call-template>
                        </rateRatio>
                     </xsl:for-each>
                     <xsl:for-each select=".[waarde/(min | max)]">
                        <rateRange>
                           <xsl:call-template name="minmax-to-Range">
                              <xsl:with-param name="in" select="./waarde"/>
                           </xsl:call-template>
                        </rateRange>
                        <rateQuantity>
                           <xsl:call-template name="hoeveelheid-to-Duration">
                              <xsl:with-param name="in" select="./tijdseenheid"/>
                           </xsl:call-template>
                        </rateQuantity>
                     </xsl:for-each>

                  </xsl:for-each>
                  <!--<xsl:if test="rateQuantity">
                     <rateRatio>
                        <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                           <xsl:with-param name="in" select="rateQuantity"/>
                        </xsl:call-template>
                     </rateRatio>
                  </xsl:if>
               -->
               </dosageInstruction>
            </xsl:for-each>

         </MedicationDispense>
      </xsl:for-each>
   </xsl:template>
   <xd:doc>
      <xd:desc> &lt;xsl:include href="../zib1bbr/zib1bbr_include.xsl"/&gt; &lt;xsl:include href="../naw/naw_include.xsl"/&gt; </xd:desc>
      <xd:param name="toedieningsschema"/>
   </xd:doc>
   <xsl:template name="zib-Administration-Schedule-2.0">
      <xsl:param name="toedieningsschema" as="element()?"/>
      <xsl:for-each select="$toedieningsschema">
         <timing>
            <xsl:if test="./../../doseerduur or ./../toedieningsduur or .//*[@value or @code]">
               <repeat>
                  <!-- doseerduur -->
                  <xsl:comment>doseerduur</xsl:comment>
                  <xsl:for-each select="./../../doseerduur[@value]">
                     <boundsDuration>
                        <xsl:call-template name="hoeveelheid-to-Duration">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </boundsDuration>
                  </xsl:for-each>
                  <!-- toedieningsduur -->
                  <xsl:comment>toedieningsduur</xsl:comment>
                  <xsl:for-each select="./../toedieningsduur[@value]">
                     <duration value="{./@value}"/>
                     <durationUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                  </xsl:for-each>
                  <!-- frequentie -->
                  <xsl:for-each select="./frequentie/aantal/(vaste_waarde | min)[@value]">
                     <frequency value="{./@value}"/>
                  </xsl:for-each>
                  <xsl:for-each select="./frequentie/aantal/(max)[@value]">
                     <frequencyMax value="{./@value}"/>
                  </xsl:for-each>
                  <!-- ./frequentie/tijdseenheid -->
                  <xsl:for-each select="./frequentie/tijdseenheid">
                     <xsl:comment>frequentie/tijdseenheid</xsl:comment>
                     <period value="{./@value}"/>
                     <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                  </xsl:for-each>
                  <!-- interval -->
                  <xsl:for-each select="./interval">
                     <xsl:comment>interval</xsl:comment>
                     <period value="{./@value}"/>
                     <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                  </xsl:for-each>
                  <xsl:for-each select="./weekdag">
                     <dayOfWeek>
                        <xsl:attribute name="value">
                           <xsl:choose>
                              <xsl:when test="./@code = '307145004'">mon</xsl:when>
                              <xsl:when test="./@code = '307147007'">tue</xsl:when>
                              <xsl:when test="./@code = '307148002'">wed</xsl:when>
                              <xsl:when test="./@code = '307149005'">thu</xsl:when>
                              <xsl:when test="./@code = '307150005'">fri</xsl:when>
                              <xsl:when test="./@code = '307151009'">sat</xsl:when>
                              <xsl:when test="./@code = '307146003'">sun</xsl:when>
                           </xsl:choose>
                        </xsl:attribute>
                     </dayOfWeek>
                  </xsl:for-each>
                  <!-- toedientijd -->
                  <xsl:for-each select="./toedientijd[@value]">
                     <xsl:comment>toedientijd</xsl:comment>
                     <timeOfDay value="{format-dateTime(./@value, '[H01]:[m01]:[s01]')}"/>
                  </xsl:for-each>
                  <!-- dagdeel -->
                  <xsl:for-each select="./dagdeel[@code][not(@codeSystem = $oidNullFlavor)]">
                     <xsl:comment>dagdeel</xsl:comment>
                     <when>
                        <xsl:attribute name="value">
                           <xsl:choose>
                              <xsl:when test="./@code = '73775008'">MORN</xsl:when>
                              <xsl:when test="./@code = '255213009'">AFT</xsl:when>
                              <xsl:when test="./@code = '3157002'">EVE</xsl:when>
                              <xsl:when test="./@code = '2546009'">NIGHT</xsl:when>
                           </xsl:choose>
                        </xsl:attribute>
                     </when>
                  </xsl:for-each>
               </repeat>
            </xsl:if>
         </timing>
      </xsl:for-each>
   </xsl:template>
   <xd:doc>
      <xd:desc/>
      <xd:param name="product"/>
      <xd:param name="product-id"/>
   </xd:doc>
   <xsl:template name="zib-Product">
      <xsl:param name="product" as="element()?"/>
      <xsl:param name="product-id" as="xs:string?"/>
      <xsl:for-each select="$product">
         <Medication xmlns="http://hl7.org/fhir">
            <id value="{generate-id(.)}"/>
            <meta>
               <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Product"/>
            </meta>
            <xsl:for-each select="./product_specificatie/omschrijving[@value]">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Product-Description">
                  <valueString value="{replace(string-join(./@value,''),'(^\s+)|(\s+$)','')}"/>
               </extension>
            </xsl:for-each>
            <xsl:for-each select="./product_specificatie/product_naam[@value]">
               <code>
                  <text value="{./@value}"/>
               </code>
            </xsl:for-each>
            <xsl:for-each select="./product_specificatie/farmaceutische_vorm[@code]">
               <form>
                  <xsl:call-template name="code-to-CodeableConcept">
                     <xsl:with-param name="in" select="."/>
                  </xsl:call-template>
               </form>
            </xsl:for-each>
            <xsl:for-each select="./product_specificatie/ingredient">
               <ingredient>
                  <xsl:for-each select="./ingredient_code[@code]">
                     <itemCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </itemCodeableConcept>
                  </xsl:for-each>
                  <isActive value="true"/>
                  <xsl:for-each select="./sterkte">
                     <amount>
                        <xsl:call-template name="hoeveelheid-complex-to-Ratio">
                           <xsl:with-param name="numerator" select="./hoeveelheid_ingredient"/>
                           <xsl:with-param name="denominator" select="./hoeveelheid_product"/>
                        </xsl:call-template>
                     </amount>
                  </xsl:for-each>
               </ingredient>
            </xsl:for-each>
         </Medication>
      </xsl:for-each>
   </xsl:template>




   <xd:doc>
      <xd:desc> copy an element with all of it's contents in comments </xd:desc>
      <xd:param name="element"/>
   </xd:doc>
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

   <xd:doc>
      <xd:desc> copy without comments </xd:desc>
   </xd:doc>
   <xsl:template name="copyWithoutComments">
      <xsl:copy>
         <xsl:for-each select="@* | *">
            <xsl:call-template name="copyWithoutComments"/>
         </xsl:for-each>
      </xsl:copy>
   </xsl:template>



</xsl:stylesheet>
