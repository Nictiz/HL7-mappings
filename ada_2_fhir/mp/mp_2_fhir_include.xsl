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
   <xsl:include href="../fhir/fhir_include.xsl"/>
   <!-- <xsl:include href="../zib1bbr/zib1bbr_include.xsl"/>
   <xsl:include href="../naw/naw_include.xsl"/>
-->
   <xsl:variable name="ada-unit-seconde" select="('seconde', 's', 'sec', 'second')"/>
   <xsl:variable name="ada-unit-minute" select="('minuut', 'min', 'minute')"/>
   <xsl:variable name="ada-unit-hour" select="('uur', 'h', 'hour')"/>
   <xsl:variable name="ada-unit-day" select="('dag', 'd', 'day')"/>
   <xsl:variable name="ada-unit-week" select="('week', 'wk')"/>
   <xsl:variable name="ada-unit-month" select="('maand', 'mo', 'month')"/>
   <xsl:variable name="ada-unit-year" select="('jaar', 'a', 'year')"/>
   <xd:doc>
      <xd:desc/>
      <xd:param name="product"/>
   </xd:doc>
   <xsl:template name="zib-Product">
      <xsl:param name="product" as="element()?"/>
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
      <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
      <xd:param name="patient"/>
      <xd:param name="toedieningsafspraak"/>
   </xd:doc>
   <xsl:template name="zib-AdministrationAgreement-2.0">
      <xsl:param name="patient" as="element()?"/>
      <xsl:param name="toedieningsafspraak" as="element()?"/>
      <xsl:variable name="medication" select="./geneesmiddel_bij_toedieningsafspraak/product"/>
      <xsl:for-each select="$toedieningsafspraak">
         <MedicationDispense>
            <meta>
               <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement"/>
            </meta>
            <!-- product met ingrediënten, niet gecodeerd product -->
            <xsl:if test="$medication/product_code[@codeSystem = '2.16.840.1.113883.5.1008']">
               <contained>
                  <xsl:call-template name="zib-Product">
                     <xsl:with-param name="product" select="$medication"/>
                  </xsl:call-template>
               </contained>
            </xsl:if>
            <!-- TODO, hier verder 20180614 - er moet een functie komen voor ADA 2 UCUM -->
            <xsl:for-each select="./gebruiksperiode">
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration">
                  <valueDuration>
                     <xsl:call-template name="hoeveelheid-to-Duration">
                        <xsl:with-param name="in" select="."/>
                     </xsl:call-template>
                  </valueDuration>
               </extension>
            </xsl:for-each>
            <!-- Not in V3 -->
            <!--<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-ReasonForDispense">
                <valueString value="Eczeem oogleden"/>
            </extension>-->
            <xsl:for-each select="id">
               <identifier>
                  <xsl:call-template name="II-to-Identifier">
                     <xsl:with-param name="in" select="."/>
                  </xsl:call-template>
               </identifier>
            </xsl:for-each>
            <status value="completed"/>
            <category>
               <coding>
                  <system value="http://snomed.info/sct"/>
                  <code value="422037009"/>
                  <display value="Provider medication administration instructions (procedure)"/>
               </coding>
            </category>
            <xsl:choose>
               <xsl:when test="$medication/code[1][@nullFlavor]">
                  <!--<xsl:comment> TODO: medicationReference </xsl:comment>-->
                  <medicationReference>
                     <reference value="#{generate-id($medication)}"/>
                     <display value="{$medication/code[1]/originalText}"/>
                  </medicationReference>
               </xsl:when>
               <xsl:otherwise>
                  <medicationCodeableConcept>
                     <xsl:call-template name="CD-to-CodeableConcept">
                        <xsl:with-param name="in" select="$medication/code"/>
                     </xsl:call-template>
                  </medicationCodeableConcept>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:comment> Patient </xsl:comment>
            <subject>
               <xsl:for-each select="$patient/id">
                  <identifier>
                     <xsl:call-template name="II-to-Identifier">
                        <xsl:with-param name="in" select="."/>
                     </xsl:call-template>
                  </identifier>
               </xsl:for-each>
               <xsl:if test="$patient/*/name">
                  <display value="{normalize-space(string-join($patient/*/name[1]/*/text(),' '))}"/>
               </xsl:if>
            </subject>
            <xsl:comment> Responsible dispensing person (pharmacist and pharmacy) </xsl:comment>
            <xsl:for-each select="responsibleParty[1]">
               <performer>
                  <actor>
                     <xsl:for-each select="*/id">
                        <identifier>
                           <xsl:call-template name="II-to-Identifier">
                              <xsl:with-param name="in" select="."/>
                           </xsl:call-template>
                        </identifier>
                     </xsl:for-each>
                     <xsl:variable name="theName" select="local:getNameForId(ancestor::ControlActProcess, */id)" as="xs:string*"/>
                     <xsl:if test="not(empty($theName))">
                        <display value="{$theName[1]}"/>
                     </xsl:if>
                  </actor>
                  <onBehalfOf>
                     <xsl:for-each select="*/representedOrganization/id">
                        <identifier>
                           <xsl:call-template name="II-to-Identifier">
                              <xsl:with-param name="in" select="."/>
                           </xsl:call-template>
                        </identifier>
                     </xsl:for-each>
                     <xsl:variable name="theName" select="local:getNameForId(ancestor::ControlActProcess, */representedOrganization/id)" as="xs:string*"/>
                     <xsl:if test="not(empty($theName))">
                        <display value="{$theName[1]}"/>
                     </xsl:if>
                  </onBehalfOf>
               </performer>
            </xsl:for-each>
            <xsl:if test="quantity">
               <quantity>
                  <xsl:call-template name="QTY-to-Quantity">
                     <xsl:with-param name="in" select="quantity"/>
                  </xsl:call-template>
               </quantity>
            </xsl:if>
            <!-- TdJ: the V3 dispense date (the over-the-counter-moment), tends to be the point in time the medication is 
                prepared/the package is taken from storage in reality. Hence the mapping to whenPrepared instead of whenHandedOver-->
            <xsl:if test="effectiveTime/@value">
               <whenPrepared value="{local:getDateTime(effectiveTime/@value)}"/>
            </xsl:if>
            <xsl:for-each select="product/dispensedMedication/therapeuticAgentOf/medicationAdministrationRequest">
               <dosageInstruction>
                  <sequence value="{position()}"/>
                  <text value="{text}"/>
                  <xsl:for-each select="support1/medicationStorageInstruction/code">
                     <additionalInstruction>
                        <xsl:call-template name="CD-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </additionalInstruction>
                  </xsl:for-each>
                  <xsl:for-each select="support2/medicationAdministrationInstruction/code">
                     <additionalInstruction>
                        <xsl:call-template name="CD-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                     </additionalInstruction>
                  </xsl:for-each>
                  <xsl:apply-templates select="effectiveTime" mode="DosageTiming"/>
                  <!--
                        <precondition>
                            <observationEventCriterion>
                                <code code="1137" codeSystem="2.16.840.1.113883.2.4.4.5" displayName="zo nodig"/>
                            </observationEventCriterion>
                        </precondition>
                    -->
                  <xsl:for-each select="precondition/observationEventCriterion/code">
                     <xsl:choose>
                        <xsl:when test=".[@code][@codeSystem]">
                           <asNeededCodeableConcept>
                              <xsl:call-template name="CD-to-CodeableConcept">
                                 <xsl:with-param name="in" select="."/>
                              </xsl:call-template>
                           </asNeededCodeableConcept>
                        </xsl:when>
                        <xsl:when test=".[@code = '1137'][@codeSystem = $oidNHGTabel25BCodesNumeriek]">
                           <asNeededBoolean value="true"/>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:for-each>
                  <xsl:if test="routeCode[@code][@codeSystem]">
                     <route>
                        <xsl:call-template name="CD-to-CodeableConcept">
                           <xsl:with-param name="in" select="routeCode"/>
                        </xsl:call-template>
                     </route>
                  </xsl:if>
                  <!-- http://decor.nictiz.nl/medicatieproces/mp-html-20170601T173502/tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.110-2013-05-21T000000.html -->
                  <xsl:choose>
                     <xsl:when test="doseQuantity[center]">
                        <doseQuantity>
                           <xsl:call-template name="QTY-to-Quantity">
                              <xsl:with-param name="in" select="doseQuantity/center"/>
                           </xsl:call-template>
                        </doseQuantity>
                     </xsl:when>
                     <xsl:when test="doseQuantity[low | high]">
                        <doseRange>
                           <xsl:call-template name="IVL_PQ-to-Duration">
                              <xsl:with-param name="in" select="doseQuantity"/>
                           </xsl:call-template>
                        </doseRange>
                     </xsl:when>
                     <xsl:when test="doseQuantity[translation]">
                        <doseQuantity>
                           <xsl:call-template name="QTY-to-Quantity">
                              <xsl:with-param name="in" select="doseQuantity"/>
                           </xsl:call-template>
                        </doseQuantity>
                     </xsl:when>
                  </xsl:choose>
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
                  <xsl:if test="rateQuantity">
                     <rateRatio>
                        <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                           <xsl:with-param name="in" select="rateQuantity"/>
                        </xsl:call-template>
                     </rateRatio>
                  </xsl:if>
               </dosageInstruction>
            </xsl:for-each>
         </MedicationDispense>
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
