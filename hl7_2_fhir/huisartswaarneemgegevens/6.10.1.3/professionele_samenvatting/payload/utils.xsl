<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

Author: Alexander Henket

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all" version="2.0">
    <!-- import because we want to be able to override the param for macAddress -->
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:import href="../../../../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 28-F1-0E-48-1D-92 is the mac address of a Nictiz device and may not be used outside of Nictiz -->
    <xsl:param name="macAddress">28-F1-0E-48-1D-92</xsl:param>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 15, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> ahenket</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Handle these issues in an OperationOutcome</xd:desc>
    </xd:doc>
    <xsl:variable name="issues" select=".//hl7:acknowledgement/hl7:acknowledgementDetail | .//hl7:ControlActProcess/hl7:reasonOf/hl7:justifiedDetectedIssue" as="element()*"/>
    
    <xd:doc>
        <xd:desc>Handle acknowledgementDetail as OperationOutcome</xd:desc>
    </xd:doc>
    <xsl:template match="*" mode="doOperationOutcome">
        <xsl:if test="$issues">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{generate-id(.)}"/>
                <resource>
                    <OperationOutcome>
                        <xsl:for-each select="$issues">
                            <xsl:variable name="severity" as="item()">
                                <xsl:choose>
                                    <xsl:when test="@typeCode">
                                        <xsl:copy-of select="@typeCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:copy-of select="(ancestor::hl7:*/hl7:acknowledgement/@typeCode)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="code" as="element()">
                                <xsl:choose>
                                    <xsl:when test="hl7:code">
                                        <xsl:copy-of select="hl7:code"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <hl7:code code="INTERR" codeSystem="{$oidHL7AcknowledgementDetailCode}" displayName="Internal system error"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="text" select="hl7:text | hl7:value" as="element()?"/>
                            <xsl:variable name="location" select="hl7:location" as="element()*"/>
                            <issue xmlns="http://hl7.org/fhir">
                                <severity value="{local:getSeverity($severity)}"/>
                                <!-- TODO: http://hl7.org/fhir/valueset-issue-type.html -->
                                <code value="processing"/>
                                <details>
                                    <xsl:call-template name="CD-to-CodeableConcept">
                                        <xsl:with-param name="in" select="$code"/>
                                    </xsl:call-template>
                                </details>
                                <xsl:if test="$text">
                                    <diagnostics value="{$text}"/>
                                </xsl:if>
                                <xsl:for-each select="$location">
                                    <location value="{.}"/>
                                </xsl:for-each>
                            </issue>
                        </xsl:for-each>
                    </OperationOutcome>
                </resource>
            </entry>
        </xsl:if>
    </xsl:template>
    
    <!-- ============================= -->
    <!-- ==== DOSAGE TIMING STUFF ==== -->
    <!-- ============================= -->
    
    <xd:doc>
        <xd:desc>
            <xd:p>These are Medication Process 9 and out of scope for now: <xd:ref name="MP CDA Dosering">http://decor.nictiz.nl/medicatieproces/mp-html-20170601T173502/tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.9149-2016-07-25T134340.html</xd:ref></xd:p>
            <xd:p>These are Medication Process 6 as in use on the LSP: <xd:ref name="Medication Dispense Event">http://decor.nictiz.nl/medicatieproces/mp-html-20170601T173502/tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.110-2013-05-21T000000.html</xd:ref></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:effectiveTime" mode="DosageTiming">
        <xsl:variable name="theDT" select="local-name-from-QName(resolve-QName(@xsi:type, .))"/>
        <xsl:variable name="theNS" select="namespace-uri-from-QName(resolve-QName(@xsi:type, .))"/>
        <xsl:choose>
            <!--<!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and @isFlexible = 'true' and not(@alignment)][hl7nl:frequency][not(hl7nl:phase)]">
                <timing xmlns="http://hl7.org/fhir">
                    <repeat>
                        <xsl:call-template name="doDosageTimingHL7NLPIVL_TSFrequency">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </repeat>
                </timing>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and (@isFlexible = 'false' or not(@isFlexible))][hl7nl:frequency]">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSInterval">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:phase[not(hl7nl:width)]]">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSVasteTijd">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][not(hl7nl:period)][hl7nl:phase[hl7nl:width]]">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSToedieningsduur">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[not(hl7nl:width)]]]">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSAantalKeer">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]">
                <xsl:call-template name="doDosageTimingSXPR_TSDoseerschemaMetMeerDanEenVastTijdstip">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:count]">
                <xsl:call-template name="doDosageTimingSXPR_TSCyclischDoseerschema">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[@alignment = 'DW']">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSWeekdag">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp/@alignment = 'DW']">
                <xsl:call-template name="doDosageTimingSXPR_TSComplexerDoseerschemaMetWeekdagen">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[@alignment = 'HD'][hl7nl:phase/hl7nl:low/@value = '1970010100']">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSNacht">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[@alignment = 'HD'][hl7nl:phase/hl7nl:low/@value = '1970010106']">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSOchtend">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[@alignment = 'HD'][hl7nl:phase/hl7nl:low/@value = '1970010112']">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSMiddag">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[@alignment = 'HD'][hl7nl:phase/hl7nl:low/@value = '1970010118']">
                <xsl:call-template name="doDosageTimingHL7NLPIVL_TSAvond">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>
            <!-\- MP 9.x -\->
            <xsl:when test=".[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp/@alignment = 'HD']">
                <xsl:call-template name="doDosageTimingSXPR_TSComplexerDoseerschemaMetMeerDanEenDagdeel">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:when>-->
            <!-- http://decor.nictiz.nl/medicatieproces/mp-html-20170601T173502/tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.110-2013-05-21T000000.html -->
            <!-- MP 6.1x -->
            <xsl:when test=".[($theDT = 'SXPR_TS' and $theNS = 'urn:hl7-org:v3')]">
                <timing xmlns="http://hl7.org/fhir">
                    <repeat>
                        <xsl:call-template name="doDosageTimingSXPR_TS">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </repeat>
                </timing>
            </xsl:when>
            <!-- Hwg 6.12 -->
            <xsl:when test=".[($theDT = 'IVL_TS' and $theNS = 'urn:hl7-org:v3')][*:low | *:high]">
                <timing xmlns="http://hl7.org/fhir">
                    <repeat>
                        <xsl:call-template name="doDosageTimingIVL_TS">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </repeat>
                </timing>
            </xsl:when>
            <!-- MP 6.1x -->
            <xsl:when test=".[($theDT = 'IVL_TS' and $theNS = 'urn:hl7-org:v3')][*:width]">
                <timing xmlns="http://hl7.org/fhir">
                    <repeat>
                        <xsl:call-template name="doDosageTimingIVL_TS">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </repeat>
                </timing>
            </xsl:when>
            <!-- MP 6.1x -->
            <xsl:when test=".[($theDT = 'PIVL_TS' and $theNS = 'urn:hl7-org:v3')]">
                <timing xmlns="http://hl7.org/fhir">
                    <repeat>
                        <xsl:call-template name="doDosageTimingPIVL_TS">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </repeat>
                </timing>
            </xsl:when>
            <!-- MP 6.1x -->
            <xsl:when test=".[($theDT = 'TS' and $theNS = 'urn:hl7-org:v3') or not(@xsi:type)]">
                <timing xmlns="http://hl7.org/fhir">
                    <event value="{local:getDateTime(@value)}"/>
                    <repeat>
                        <xsl:call-template name="doDosageTimingTS">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </repeat>
                </timing>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment> FIXME Found unsupported dosage timing expression <xsl:value-of select="name(.)"/>[@xsi:type="<xsl:value-of select="@xsi:type"/>"] </xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--<xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSFrequency">
        <xsl:param name="in" as="element()"/>
        <xsl:variable name="thefhirUnit" select="local:getPeriod($in/hl7:period/@unit)" as="xs:string?"/>
        <frequency value="1" xmlns="http://hl7.org/fhir"/>
        <xsl:if test="not(empty($thefhirUnit))">
            <period value="{$in/hl7:period/@value}" xmlns="http://hl7.org/fhir"/>
            <periodUnit value="{$thefhirUnit}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSInterval">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSInterval </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSVasteTijd">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSVasteTijd </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSToedieningsduur">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSVasteTijd </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingSXPR_TSDoseerschemaMetMeerDanEenVastTijdstip">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingSXPR_TSDoseerschemaMetMeerDanEenVastTijdstip </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingSXPR_TSCyclischDoseerschema">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingSXPR_TSCyclischDoseerschema </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSAantalKeer">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSAantalKeer </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSWeekdag">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSWeekdag </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingSXPR_TSComplexerDoseerschemaMetWeekdagen">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingSXPR_TSComplexerDoseerschemaMetWeekdagen </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSNacht">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSNacht </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSOchtend">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSOchtend </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSMiddag">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSMiddag </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingHL7NLPIVL_TSAvond">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingHL7NLPIVL_TSAvond </xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingSXPR_TSComplexerDoseerschemaMetMeerDanEenDagdeel">
        <xsl:param name="in" as="element()"/>
        <xsl:comment> TODO dosage timing expression doDosageTimingSXPR_TSComplexerDoseerschemaMetMeerDanEenDagdeel </xsl:comment>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingSXPR_TS">
        <xsl:param name="in" as="element()"/>
        <xsl:variable name="theIVL_TScomp" select="$in/hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]" as="element()?"/>
        <xsl:variable name="thePIVL_TScomp" select="$in/hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][1]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theIVL_TScomp[hl7:low | hl7:high]">
                <boundsPeriod xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="IVL_TS-to-Period">
                        <xsl:with-param name="in" select="$theIVL_TScomp"/>
                    </xsl:call-template>
                </boundsPeriod>
            </xsl:when>
            <xsl:when test="$theIVL_TScomp[hl7:width]">
                <boundsDuration xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="PQ-to-Duration">
                        <xsl:with-param name="in" select="$theIVL_TScomp/hl7:width"/>
                    </xsl:call-template>
                </boundsDuration>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="$thePIVL_TScomp">
            <xsl:variable name="thefhirValue" select="$thePIVL_TScomp/hl7:period/@value" as="xs:decimal"/>
            <xsl:variable name="thefhirUnit" select="local:getPeriod($thePIVL_TScomp/hl7:period/@unit)" as="xs:string?"/>
            <xsl:choose>
                <xsl:when test="$thefhirValue ge 1">
                    <frequency value="1" xmlns="http://hl7.org/fhir"/>
                    <period value="{$thefhirValue}" xmlns="http://hl7.org/fhir"/>
                    <xsl:if test="not(empty($thefhirUnit))">
                        <periodUnit value="{$thefhirUnit}" xmlns="http://hl7.org/fhir"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <frequency value="{round(1 div $thefhirValue)}" xmlns="http://hl7.org/fhir"/>
                    <period value="1" xmlns="http://hl7.org/fhir"/>
                    <xsl:if test="not(empty($thefhirUnit))">
                        <periodUnit value="{$thefhirUnit}" xmlns="http://hl7.org/fhir"/>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingPIVL_TS">
        <xsl:param name="in" as="element()"/>
        <!--<xsl:comment> TODO dosage timing expression doDosageTimingPIVL_TS </xsl:comment>-->
        <xsl:variable name="thefhirUnit" select="local:getPeriod($in/hl7:period/@unit)" as="xs:string?"/>
        <frequency value="1" xmlns="http://hl7.org/fhir"/>
        <xsl:if test="not(empty($thefhirUnit))">
            <period value="{$in/hl7:period/@value}" xmlns="http://hl7.org/fhir"/>
            <periodUnit value="{$thefhirUnit}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingIVL_TS">
        <xsl:param name="in" as="element()"/>
        <!--<xsl:comment> TODO dosage timing expression doDosageTimingIVL_TS </xsl:comment>-->
        <xsl:choose>
            <xsl:when test="$in[hl7:low | hl7:high]">
                <boundsPeriod xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="IVL_TS-to-Period">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </boundsPeriod>
            </xsl:when>
            <xsl:when test="$in[hl7:width]">
                <boundsDuration xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="PQ-to-Duration">
                        <xsl:with-param name="in" select="$in/hl7:width"/>
                    </xsl:call-template>
                </boundsDuration>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="doDosageTimingTS">
        <xsl:param name="in" as="element()"/>
        <!--<xsl:comment> TODO dosage timing expression doDosageTimingTS </xsl:comment>-->
        <count value="1" xmlns="http://hl7.org/fhir"/>
    </xsl:template>
    
    <!-- =================== -->
    <!-- ==== FUNCTIONS ==== -->
    <!-- =================== -->
    
    <xd:doc>
        <xd:desc>Get an xs:dateTime of xs:date from an HL7 ISO 8601 string</xd:desc>
        <xd:param name="dateTime"/>
    </xd:doc>
    <xsl:function name="local:getDateTime" as="xs:string?">
        <xsl:param name="dateTime" as="xs:string?"/>
        <xsl:variable name="year" select="substring($dateTime, 1, 4)"/>
        <xsl:variable name="month" select="substring($dateTime, 5, 2)"/>
        <xsl:variable name="day" select="substring($dateTime, 7, 2)"/>
        <xsl:variable name="pDate" select="concat($year, '-', $month, '-', $day)"/>
        <xsl:variable name="hour" select="substring($dateTime, 9, 4)"/>
        <xsl:variable name="minute" select="substring($dateTime, 11, 2)"/>
        <xsl:variable name="second" select="substring($dateTime, 13, 2)"/>
        <xsl:variable name="pTime" select="concat($hour, '-', $minute, '-', $second)"/>
        <xsl:choose>
            <xsl:when test="concat($pDate, 'T', $pTime) castable as xs:dateTime">
                <xsl:value-of select="concat($pDate, 'T', $pTime)"/>
            </xsl:when>
            <xsl:when test="$pDate castable as xs:date">
                <xsl:value-of select="$pDate"/>
            </xsl:when>
        </xsl:choose>
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
    <xd:doc>
        <xd:desc>Tries to create an as stable as possible URI from and hl7:id element. urn:oid:@root.@extension if @root and @extension is numeric. urn:uuid:@extension if extension is uuid. urn:uuid:@root if @root is uuid. nf:get-fhir-uuid($id[1]) otherwise.</xd:desc>
        <xd:param name="id"/>
        <xd:param name="maskIdentifiers">Array of 0..* @root values that should be masked</xd:param>
    </xd:doc>
    <xsl:function name="local:getUriFromId" as="xs:string?">
        <xsl:param name="id" as="element()+"/>
        <xsl:param name="maskIdentifiers" as="xs:string*"/>
        <xsl:choose>
            <!-- root = oid and extension = numeric -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@root, $OIDpattern)][matches(@extension, '^\d+$')]">
                <xsl:variable name="ii" select="$id[matches(@root, $OIDpattern)][matches(@extension, '^\d+$')][1]"/>
                <xsl:value-of select="concat('urn:oid:', $ii/string-join((@root, replace(@extension, '^0+', '')[not(. = '')]),'.'))"/>
            </xsl:when>
            <!-- root = oid and no extension -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@root, $OIDpattern)][not(@extension)]">
                <xsl:variable name="ii" select="$id[matches(@root, $OIDpattern)][not(@extension)][1]"/>
                <xsl:value-of select="concat('urn:oid:', $ii/string-join((@root, replace(@extension, '^0+', '')[not(. = '')]),'.'))"/>
            </xsl:when>
            <!-- root = 'not important' and extension = uuid -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@extension, $UUIDpattern)]">
                <xsl:variable name="ii" select="$id[matches(@extension, $UUIDpattern)][1]"/>
                <xsl:value-of select="concat('urn:uuid:', $ii/@extension)"/>
            </xsl:when>
            <!-- root = uuid and extension = 'not important' -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@root, $UUIDpattern)]">
                <xsl:variable name="ii" select="$id[matches(@root, $UUIDpattern)][1]"/>
                <xsl:value-of select="concat('urn:uuid:', $ii/@root)"/>
            </xsl:when>
            <!-- give up and do new uuid -->
            <xsl:otherwise>
                <xsl:value-of select="nf:get-fhir-uuid($id[1])"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc>Tries to create an as stable as possible id from and hl7:id element. @root.@extension if @root and @extension is numeric. @extension if extension is uuid. @root if @root is uuid. nf:get-fhir-uuid($id[1]) otherwise.</xd:desc>
        <xd:param name="id"/>
        <xd:param name="maskIdentifiers">Array of 0..* @root values that should be masked</xd:param>
    </xd:doc>
    <xsl:function name="local:getIdFromId" as="xs:string?">
        <xsl:param name="id" as="element()+"/>
        <xsl:param name="maskIdentifiers" as="xs:string*"/>
        <xsl:choose>
            <!-- root = oid and extension = numeric -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@root, $OIDpattern)][matches(@extension, '^\d+$')]">
                <xsl:variable name="ii" select="$id[matches(@root, $OIDpattern)][matches(@extension, '^\d+$')][1]"/>
                <xsl:value-of select="$ii/string-join((@root, replace(@extension, '^0+', '')[not(. = '')]), '.')"/>
            </xsl:when>
            <!-- root = oid and no extension -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@root, $OIDpattern)][not(@extension)]">
                <xsl:variable name="ii" select="$id[matches(@root, $OIDpattern)][not(@extension)][1]"/>
                <xsl:value-of select="$ii/string-join((@root, replace(@extension, '^0+', '')[not(. = '')]), '.')"/>
            </xsl:when>
            <!-- root = 'not important' and extension = uuid -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@extension, $UUIDpattern)]">
                <xsl:variable name="ii" select="$id[matches(@extension, $UUIDpattern)][1]"/>
                <xsl:value-of select="$ii/@extension"/>
            </xsl:when>
            <!-- root = uuid and extension = 'not important' -->
            <xsl:when test="$id[not(@root = $maskIdentifiers)][matches(@root, $UUIDpattern)]">
                <xsl:variable name="ii" select="$id[matches(@root, $UUIDpattern)][1]"/>
                <xsl:value-of select="$ii/@root"/>
            </xsl:when>
            <!-- give up and do new uuid -->
            <xsl:otherwise>
                <xsl:value-of select="nf:get-uuid($id[1])"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc>Get the displayName based on an input OID from HL7. string if possible, just oid otherwise</xd:desc>
        <xd:param name="oid"/>
    </xd:doc>
    <xsl:function name="local:getOidDisplayName" as="xs:string?">
        <xsl:param name="oid" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$oidMap[@oid = $oid][@displayName]">
                <xsl:value-of select="$oidMap[@oid = $oid]/@displayName"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$oid"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc>Get the displayName based on an input CD for HL7. string if possible, 'Weergave ontbreekt' otherwise</xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="local:getCDDisplayName" as="xs:string">
        <xsl:param name="in" as="element()"/>
        
        <xsl:for-each select="$in">
            <xsl:if test="@code">
                <xsl:value-of select="concat(string-join((@code, @displayName), ' - '), ' (', local:getOidDisplayName(@codeSystem), ')')"/>
            </xsl:if>
            <xsl:if test="hl7:originalText">
                <xsl:if test="@code">
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:value-of select="hl7:originalText"/>
            </xsl:if>
            <xsl:if test="not(@code | hl7:originalText)">
                <xsl:text>weergave ontbreekt</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="v3unit"/>
    </xd:doc>
    <xsl:function name="local:getPeriod" as="xs:string?">
        <xsl:param name="v3unit" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$periodMap[@v3unit = $v3unit][@fhirunit]">
                <xsl:value-of select="$periodMap[@v3unit = $v3unit]/@fhirunit"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    <xsl:variable name="periodMap" as="element()+">
        <map v3unit="s" fhirunit="s"/>
        <map v3unit="min" fhirunit="min"/>
        <map v3unit="h" fhirunit="h"/>
        <map v3unit="d" fhirunit="d"/>
        <map v3unit="wk" fhirunit="wk"/>
        <map v3unit="mo" fhirunit="mo"/>
        <map v3unit="a" fhirunit="a"/>
    </xsl:variable>
    <xd:doc>
        <xd:desc>Finds hl7:name elements as sibling of hl7:id elements in a given context (search context). Not every id has a name to it. Usually for efficiency reasons the name is mentioned once.</xd:desc>
        <xd:param name="searchScope"/>
        <xd:param name="theIDs">All ids for the same person/organization/entity</xd:param>
    </xd:doc>
    <xsl:function name="local:getNameForId" as="element(hl7:name)*">
        <xsl:param name="searchScope" as="element()*"/>
        <xsl:param name="theIDs" as="element()*"/>
        
        <xsl:for-each select="$theIDs">
            <xsl:variable name="theRoot" select="@root"/>
            <xsl:variable name="theExt" select="@extension"/>
            
            <xsl:choose>
                <xsl:when test="$theRoot and $theExt">
                    <xsl:copy-of select="$searchScope//hl7:id[@root = $theRoot][@extension = $theExt]/../hl7:name"/>
                </xsl:when>
                <xsl:when test="$theRoot">
                    <xsl:copy-of select="$searchScope//hl7:id[@root = $theRoot]/../hl7:name"/>
                </xsl:when>
                <xsl:when test="$theExt">
                    <xsl:copy-of select="$searchScope//hl7:id[@extension = $theExt]/../hl7:name"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    <xd:doc>
        <xd:desc>fatal | error | warning | information</xd:desc>
        <xd:param name="in">acknowledgementDetail/@typeCode or acknowledgement/@typeCode</xd:param>
    </xd:doc>
    <xsl:function name="local:getSeverity">
        <xsl:param name="in" as="item()"/>
        
        <xsl:choose>
            <xsl:when test="$in = 'W'">warning</xsl:when>
            <xsl:when test="$in = 'I'">information</xsl:when>
            <xsl:when test="$in = 'E'">error</xsl:when>
            <xsl:when test="$in = 'AE'">error</xsl:when>
            <xsl:when test="$in = 'AR'">warning</xsl:when>
            <xsl:when test="$in = 'AA'">information</xsl:when>
            <xsl:when test="$in = 'CE'">error</xsl:when>
            <xsl:when test="$in = 'CR'">warning</xsl:when>
            <xsl:when test="$in = 'CA'">information</xsl:when>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="local:width2duration" as="xs:duration?">
        <xsl:param name="in" as="element()?"/>
        <xsl:variable name="theValue" select="$in/@value"/>
        <xsl:variable name="theUnit" select="$in/@unit"/>
        <xsl:choose>
            <xsl:when test="empty($in)"/>
            <xsl:when test="$theUnit = 's'">
                <xsl:value-of select="xs:dayTimeDuration(concat('PT',$theValue,'S'))"/>
            </xsl:when>
            <xsl:when test="$theUnit = 'min'">
                <xsl:value-of select="xs:dayTimeDuration(concat('PT',$theValue,'M'))"/>
            </xsl:when>
            <xsl:when test="$theUnit = 'h'">
                <xsl:value-of select="xs:dayTimeDuration(concat('PT',$theValue,'H'))"/>
            </xsl:when>
            <xsl:when test="$theUnit = 'd'">
                <xsl:value-of select="xs:dayTimeDuration(concat('P',$theValue,'D'))"/>
            </xsl:when>
            <xsl:when test="$theUnit = 'w'">
                <xsl:value-of select="xs:dayTimeDuration(concat('P',$theValue * 7,'D'))"/>
            </xsl:when>
            <xsl:when test="$theUnit = 'mo'">
                <xsl:value-of select="xs:yearMonthDuration(concat('P',$theValue,'M'))"/>
            </xsl:when>
            <xsl:when test="$theUnit = 'y'">
                <xsl:value-of select="xs:yearMonthDuration(concat('P',$theValue,'Y'))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>Cannot calculate duration for unsupported unit in hl7:width[<xsl:value-of select="for $att in $in/@* return concat(' ',name($att),'=',$att)"/>]</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <!-- =================== -->
    <!-- ==== DATATYPES ==== -->
    <!-- =================== -->
    
    <xd:doc>
        <xd:desc></xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="AD-to-Address" as="element()*">
        <xsl:param name="in" as="element()*"/>
        <xsl:for-each select="$in[not(@nullFlavor)]">
            <address xmlns="http://hl7.org/fhir">
                <xsl:if test="tokenize(@use, '\s') = 'OR'">
                    <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-address-official">
                        <valueBoolean value="true"/>
                    </extension>
                </xsl:if>
                <xsl:if test="@use">
                    <xsl:choose>
                        <xsl:when test="tokenize(@use, '\s') = ('WP','DIR','PUB')"><use value="work"/></xsl:when>
                        <xsl:when test="@use = ('H','HP','HV')"><use value="home"/></xsl:when>
                        <xsl:when test="@use = 'TMP'"><use value="temp"/></xsl:when>
                        <xsl:when test="@use = 'OLD'"><use value="old"/></xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="tokenize(@use, '\s') = 'PST' and tokenize(@use, '\s') = 'PHYS'"><type value="both"/></xsl:when>
                        <xsl:when test="tokenize(@use, '\s') = 'PST'"><type value="pst"/></xsl:when>
                        <xsl:when test="tokenize(@use, '\s') = 'PHYS'"><type value="phys"/></xsl:when>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="not(*)">
                    <text><xsl:value-of select="."/></text>
                </xsl:if>
                <xsl:variable name="line" select="string-join(hl7:streetName | hl7:houseNumber | hl7:houseNumberNumeric | hl7:buildingNumberSuffix | hl7:additionalLocator | hl7:direction | hl7:censusTract | hl7:carrier | hl7:unitID | hl7:unitType, ' ')"/>
                <xsl:if test="string-length($line) gt 0">
                    <line value="{$line}">
                        <xsl:for-each select="hl7:streetName">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:houseNumber">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:buildingNumberSuffix">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:additionalLocator">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                    </line>
                </xsl:if>
                <xsl:for-each select="hl7:streetAddressLine">
                    <line value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:city">
                    <city value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:county">
                    <district value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:state">
                    <state value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:postalCode">
                    <postalCode value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:country">
                    <country value="{.}"/>
                </xsl:for-each>
                <xsl:if test="hl7:useablePeriod[hl7:low | hl7:high]">
                    <period>
                        <xsl:call-template name="IVL_TS-to-Period">
                            <xsl:with-param name="in" select="hl7:useablePeriod"/>
                        </xsl:call-template>
                    </period>
                </xsl:if>
            </address>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="CD-to-CodeableConcept" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor" xmlns="http://hl7.org/fhir">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[@code]">
                <coding xmlns="http://hl7.org/fhir">
                    <system value="{local:getUri($in/@codeSystem)}"/>
                    <code value="{$in/@code}"/>
                    <xsl:if test="$in/@displayName">
                        <display value="{$in/@displayName}"/>
                    </xsl:if>
                    <!--<userSelected value="true"/>-->
                </coding>
                <xsl:for-each select="$in/hl7:translation">
                    <coding xmlns="http://hl7.org/fhir">
                        <system value="{local:getUri(@codeSystem)}"/>
                        <code value="{@code}"/>
                        <xsl:if test="@displayName">
                            <display value="{@displayName}"/>
                        </xsl:if>
                    </coding>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="$in[hl7:originalText]">
            <text value="{$in/hl7:originalText}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc></xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="EN-to-HumanName" as="element()*">
        <xsl:param name="in" as="element()*"/>
        <xsl:for-each select="$in[not(@nullFlavor)]">
            <name xmlns="http://hl7.org/fhir">
                <xsl:if test="@use">
                    <xsl:choose>
                        <xsl:when test="@use = 'A'"><use value="anonymous"/></xsl:when>
                        <xsl:when test="@use = 'OR'"><use value="official"/></xsl:when>
                        <xsl:when test="@use = 'TMP'"><use value="temp"/></xsl:when>
                        <xsl:when test="@use = 'L'"><use value="usual"/></xsl:when>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="not(*)">
                    <text><xsl:value-of select="."/></text>
                </xsl:if>
                <xsl:if test="hl7:prefix[tokenize(@qualifier,'\s') = 'VV'] | hl7:family">
                    <family value="{hl7:prefix[tokenize(@qualifier,'\s') = 'VV'] | hl7:family | hl7:delimiter}">
                        <xsl:for-each select="
                            hl7:prefix[tokenize(@qualifier,'\s') = 'VV'] | 
                            hl7:prefix[tokenize(@qualifier,'\s') = 'VV'] | 
                            hl7:family[tokenize(@qualifier,'\s') = 'SP'] | 
                            hl7:family[tokenize(@qualifier,'\s') = 'BR']">
                            <xsl:choose>
                                <xsl:when test=".[tokenize(@qualifier,'\s') = 'VV'][tokenize(@qualifier,'\s') = 'BR' or following-sibling::hl7:family[tokenize(@qualifier,'\s') = 'BR']]">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
                                        <valueString value="{.}"/>
                                    </extension>
                                </xsl:when>
                                <xsl:when test=".[tokenize(@qualifier,'\s') = 'VV'][tokenize(@qualifier,'\s') = 'SP' or following-sibling::hl7:family[tokenize(@qualifier,'\s') = 'SP']]">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/partnername-partner-prefix">
                                        <valueString value="{.}"/>
                                    </extension>
                                </xsl:when>
                                <xsl:when test=".[tokenize(@qualifier,'\s') = 'BR']">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                                        <valueString value="{.}"/>
                                    </extension>
                                </xsl:when>
                                <xsl:when test=".[tokenize(@qualifier,'\s') = 'SP']">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                                        <valueString value="{.}"/>
                                    </extension>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </family>
                </xsl:if>
                <xsl:for-each select="hl7:given">
                    <given value="{.}">
                        <xsl:if test="tokenize(@qualifier, '\s') = 'IN'">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                <valueCode value="IN"/>
                            </extension>
                        </xsl:if>
                        <xsl:if test="tokenize(@qualifier, '\s') = 'CL'">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                <valueCode value="CL"/>
                            </extension>
                        </xsl:if>
                        <xsl:if test="tokenize(@qualifier, '\s') = 'BR'">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                <valueCode value="BR"/>
                            </extension>
                        </xsl:if>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="hl7:prefix[not(tokenize(@qualifier,'\s') = 'VV')]">
                    <prefix value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:suffix">
                    <suffix value="{.}"/>
                </xsl:for-each>
                <xsl:if test="hl7:validTime">
                    <period>
                        <xsl:call-template name="IVL_TS-to-Period">
                            <xsl:with-param name="in" select="hl7:validTime"/>
                        </xsl:call-template>
                    </period>
                </xsl:if>
            </name>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Creates an identifier element from an II datatype input element. Masks the value if applicable</xd:desc>
        <xd:param name="in">V3 Datatype II element, e.g. hl7:id</xd:param>
        <xd:param name="maskIdentifiers">Array of 0..* @root values that should be masked</xd:param>
    </xd:doc>
    <xsl:template name="II-to-Identifier" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="maskIdentifiers" as="xs:string*"/>
        <identifier xmlns="http://hl7.org/fhir">
            <xsl:choose>
                <xsl:when test="$in[@nullFlavor]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                        <valueCode value="{$in/@nullFlavor}"/>
                    </extension>
                </xsl:when>
                <xsl:when test="$in[@root = $maskIdentifiers]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                        <valueCode value="masked"/>
                    </extension>
                </xsl:when>
                <xsl:when test="$in[@root | @extension]">
                    <system value="{local:getUri($in/@root)}"/>
                    <value value="{$in/@extension}"/>
                </xsl:when>
            </xsl:choose>
        </identifier>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="IVL_PQ-to-Duration" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in/hl7:low[@nullFlavor]">
                <low xmlns="http://hl7.org/fhir">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                        <valueCode value="{$in/hl7:low/@nullFlavor}"/>
                    </extension>
                </low>
            </xsl:when>
            <xsl:when test="$in/hl7:low[@value]">
                <low xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="QTY-to-Quantity">
                        <xsl:with-param name="in" select="$in/hl7:low"/>
                    </xsl:call-template>
                </low>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$in/hl7:high[@nullFlavor]">
                <high xmlns="http://hl7.org/fhir">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                        <valueCode value="{$in/hl7:high/@nullFlavor}"/>
                    </extension>
                </high>
            </xsl:when>
            <xsl:when test="$in/hl7:high[@value]">
                <high xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="QTY-to-Quantity">
                        <xsl:with-param name="in" select="$in/hl7:high"/>
                    </xsl:call-template>
                </high>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="IVL_TS-to-Period" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:variable name="theWidth" select="local:width2duration($in/hl7:width)"/>
        <xsl:choose>
            <xsl:when test="$in/hl7:low[@nullFlavor | @value]">
                <start xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="TS-to-dateTime">
                        <xsl:with-param name="in" select="$in/hl7:low"/>
                    </xsl:call-template>
                </start>
            </xsl:when>
            <xsl:when test="$in[hl7:high/@value] and not(empty($theWidth))">
                <xsl:variable name="theHigh" as="element()">
                    <x>
                        <xsl:call-template name="TS-to-dateTime">
                            <xsl:with-param name="in" select="$in/hl7:high"/>
                        </xsl:call-template>
                    </x>
                </xsl:variable>
                <xsl:variable name="theLow">
                    <xsl:choose>
                        <xsl:when test="$theHigh/@value castable as xs:dateTime and $theWidth castable as xs:dayTimeDuration">
                            <xsl:value-of select="xs:dateTime($theHigh/@value) - xs:dayTimeDuration($theWidth)"/>
                        </xsl:when>
                        <xsl:when test="$theHigh/@value castable as xs:dateTime and $theWidth castable as xs:yearMonthDuration">
                            <xsl:value-of select="xs:dateTime($theHigh/@value) - xs:yearMonthDuration($theWidth)"/>
                        </xsl:when>
                        <xsl:when test="$theHigh/@value castable as xs:date and $theWidth castable as xs:dayTimeDuration">
                            <xsl:value-of select="xs:date($theHigh/@value) - xs:dayTimeDuration($theWidth)"/>
                        </xsl:when>
                        <xsl:when test="$theHigh/@value castable as xs:date and $theWidth castable as xs:yearMonthDuration">
                            <xsl:value-of select="xs:date($theHigh/@value) - xs:yearMonthDuration($theWidth)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:if test="not(empty($theLow))">
                    <start value="{$theLow}" xmlns="http://hl7.org/fhir"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$in/hl7:high[@nullFlavor | @value]">
                <end xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="TS-to-dateTime">
                        <xsl:with-param name="in" select="$in/hl7:high"/>
                    </xsl:call-template>
                </end>
            </xsl:when>
            <xsl:when test="$in[hl7:low/@value] and not(empty($theWidth))">
                <xsl:variable name="theLow" as="element()">
                    <x>
                        <xsl:call-template name="TS-to-dateTime">
                            <xsl:with-param name="in" select="$in/hl7:low"/>
                        </xsl:call-template>
                    </x>
                </xsl:variable>
                <xsl:variable name="theHigh">
                    <xsl:choose>
                        <xsl:when test="$theLow/@value castable as xs:dateTime and $theWidth castable as xs:dayTimeDuration">
                            <xsl:value-of select="xs:dateTime($theLow/@value) + xs:dayTimeDuration($theWidth)"/>
                        </xsl:when>
                        <xsl:when test="$theLow/@value castable as xs:dateTime and $theWidth castable as xs:yearMonthDuration">
                            <xsl:value-of select="xs:dateTime($theLow/@value) + xs:yearMonthDuration($theWidth)"/>
                        </xsl:when>
                        <xsl:when test="$theLow/@value castable as xs:date and $theWidth castable as xs:dayTimeDuration">
                            <xsl:value-of select="xs:date($theLow/@value) + xs:dayTimeDuration($theWidth)"/>
                        </xsl:when>
                        <xsl:when test="$theLow/@value castable as xs:date and $theWidth castable as xs:yearMonthDuration">
                            <xsl:value-of select="xs:date($theLow/@value) + xs:yearMonthDuration($theWidth)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:if test="not(empty($theHigh))">
                    <end value="{$theHigh}" xmlns="http://hl7.org/fhir"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="PQ-to-Duration" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor" xmlns="http://hl7.org/fhir">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[@value]">
                <value value="{$in/@value}" xmlns="http://hl7.org/fhir"/>
                <xsl:if test="$in[@unit[not(. = '1')]]">
                    <system value="{local:getUri($oidUCUM)}" xmlns="http://hl7.org/fhir"/>
                    <code value="{$in/@unit}" xmlns="http://hl7.org/fhir"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="TS-to-dateTime" as="item()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor" xmlns="http://hl7.org/fhir">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[@value]">
                <xsl:variable name="dt-no-tz" select="replace($in/@value, '[+-]\d*', '')"/>
                <xsl:variable name="year" select="substring($dt-no-tz, 1, 4)"/>
                <xsl:variable name="month" select="substring($dt-no-tz, 5, 2)"/>
                <xsl:variable name="day" select="substring($dt-no-tz, 7, 2)"/>
                <xsl:variable name="date" select="string-join(($year[string-length() gt 0], $month[string-length() gt 0], $day[string-length() gt 0]), '-')"/>
                
                <xsl:variable name="hour" select="substring($dt-no-tz, 9, 2)"/>
                <xsl:variable name="minute" select="substring($dt-no-tz, 11, 2)"/>
                <xsl:variable name="second" select="substring($dt-no-tz, 13, 2)"/>
                <xsl:variable name="time" select="string-join(($hour[string-length() gt 0], if (string-length($minute) gt 0) then $minute else if (string-length($hour) gt 0) then '00' else (), if (string-length($second) gt 0) then $second else if (string-length($hour) gt 0) then '00' else ()), ':')"/>
                
                <xsl:variable name="timezone">
                    <xsl:choose>
                        <xsl:when test="matches($in/@value, '[+-]')">
                            <xsl:value-of select="replace($in/@value, '^.*([+-]\d*)$', '$1')"/>
                        </xsl:when>
                        <xsl:when test="empty($hour)"/>
                        <xsl:otherwise>
                            <!-- AAAAAAARRRGGGHH! HL7 FHIR requires timezone, but XSLT does not offer a way to calculate the timeonze at a given date time -->
                            <xsl:value-of select="format-dateTime(current-dateTime(), '[Z]', (), (), 'nl')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:variable name="datetime">
                    <xsl:choose>
                        <xsl:when test="string-length($time) gt 0">
                            <xsl:value-of select="concat($date, 'T', $time, $timezone)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$date"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:attribute name="value" select="$datetime"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="QTY-to-Quantity" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor" xmlns="http://hl7.org/fhir">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[@value][@unit[not(. = '1')]]">
                <value value="{$in/@value}" xmlns="http://hl7.org/fhir"/>
                <system value="{local:getUri($oidUCUM)}" xmlns="http://hl7.org/fhir"/>
                <code value="{$in/@unit}" xmlns="http://hl7.org/fhir"/>
            </xsl:when>
            <xsl:when test="$in/hl7:translation[@value][@codeSystem = $oidGStandaardBST361][@displayName]">
                <xsl:variable name="input" select="$in/hl7:translation[@value][@codeSystem = $oidGStandaardBST361]"/>
                <value value="{$input/@value}" xmlns="http://hl7.org/fhir"/>
                <unit value="{$input/@displayName}" xmlns="http://hl7.org/fhir"/>
            </xsl:when>
            <xsl:when test="$in/hl7:translation[@value][@codeSystem = $oidGStandaardBST902THES2][@displayName]">
                <xsl:variable name="input" select="$in/hl7:translation[@value][@codeSystem = $oidGStandaardBST902THES2]"/>
                <value value="{$input/@value}" xmlns="http://hl7.org/fhir"/>
                <unit value="{$input/@displayName}" xmlns="http://hl7.org/fhir"/>
            </xsl:when>
            <xsl:otherwise>
                <value value="{$in/@value}" xmlns="http://hl7.org/fhir"/>
                <xsl:if test="$in[@unit[not(. = '1')]]">
                    <system value="{local:getUri($oidUCUM)}" xmlns="http://hl7.org/fhir"/>
                    <code value="{$in/@unit}" xmlns="http://hl7.org/fhir"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="RTO_QTY_QTY-to-Ratio" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:if test="$in">
            <numerator xmlns="http://hl7.org/fhir">
                <xsl:call-template name="QTY-to-Quantity">
                    <xsl:with-param name="in" select="$in/hl7:numerator"/>
                </xsl:call-template>
            </numerator>
            <denominator xmlns="http://hl7.org/fhir">
                <xsl:call-template name="QTY-to-Quantity">
                    <xsl:with-param name="in" select="$in/hl7:denominator"/>
                </xsl:call-template>
            </denominator>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc></xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="TEL-to-ContactPoint">
        <xsl:param name="in" as="element()*"/>
        <xsl:for-each select="$in">
            <telecom xmlns="http://hl7.org/fhir">
                <xsl:choose>
                    <xsl:when test="tokenize(@use, '\s') = 'PG'">
                        <system value="pager"/>
                    </xsl:when>
                    <xsl:when test="starts-with(@value, 'mailto:') or contains(@value, '@')">
                        <system value="email"/>
                    </xsl:when>
                    <xsl:when test="starts-with(@value, 'tel:')">
                        <system value="phone"/>
                    </xsl:when>
                    <xsl:when test="starts-with(@value, 'fax:')">
                        <system value="fax"/>
                    </xsl:when>
                    <xsl:when test="matches(@value, '^[a-z-]+:')">
                        <system value="url"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <system value="other"/>
                    </xsl:otherwise>
                </xsl:choose>
                <value value="{replace(@value, '^(tel|http|https|fax|mailto|ftp):', '')}"/>
                <xsl:choose>
                    <xsl:when test="tokenize(@use, '\s') = 'WP'">
                        <use value="work"/>
                    </xsl:when>
                    <xsl:when test="tokenize(@use, '\s') = ('H', 'HP', 'HV')">
                        <use value="home"/>
                    </xsl:when>
                    <xsl:when test="tokenize(@use, '\s') = ('MC', 'PG')">
                        <use value="mobile"/>
                    </xsl:when>
                    <xsl:when test="tokenize(@use, '\s') = 'TMP'">
                        <use value="temp"/>
                    </xsl:when>
                </xsl:choose>
            </telecom>
        </xsl:for-each>
        
        <telecom xmlns="http://hl7.org/fhir">
            <system value="phone"/>
            <value value="0612345990"/>
            <use value="work"/>
        </telecom>
        <telecom xmlns="http://hl7.org/fhir">
            <system value="email"/>
            <value value="devries@work.com"/>
            <use value="work"/>
        </telecom>
    </xsl:template>
    
    <xsl:variable name="OIDpattern" select="'^[0-2](\.(0|[1-9]\d*))*$'"/>
    <xsl:variable name="UUIDpattern" select="'^[A-Fa-f\d]{8}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{12}$'"/>
    
    <xsl:variable name="oidUZIPersons">2.16.528.1.1007.3.1</xsl:variable>
    <xsl:variable name="oidUZISystems">2.16.528.1.1007.3.2</xsl:variable>
    <xsl:variable name="oidURAOrganizations">2.16.528.1.1007.3.3</xsl:variable>
    <xsl:variable name="oidUZIRoleCode">2.16.840.1.113883.2.4.15.111</xsl:variable>
    <xsl:variable name="oidAGB">2.16.840.1.113883.2.4.6.1</xsl:variable>
    <xsl:variable name="oidBurgerservicenummer">2.16.840.1.113883.2.4.6.3</xsl:variable>
    <xsl:variable name="oidNHGTabel14Contactwijze">2.16.840.1.113883.2.4.4.30.14</xsl:variable>
    <xsl:variable name="oidNHGTabel15Verrichtingen">2.16.840.1.113883.2.4.4.30.15</xsl:variable>
    <xsl:variable name="oidNHGTabel25BCodesNumeriek">2.16.840.1.113883.2.4.4.5</xsl:variable>
    <xsl:variable name="oidNHGTabel45DiagnBepal">2.16.840.1.113883.2.4.4.30.45</xsl:variable>
    <xsl:variable name="oidNHGTabel56Profylaxe">2.16.840.1.113883.2.4.4.30.56</xsl:variable>
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
    <xsl:variable name="oidLOINC">2.16.840.1.113883.6.1</xsl:variable>
    <xsl:variable name="oidUCUM">2.16.840.1.113883.6.8</xsl:variable>
    <xsl:variable name="oidSNOMEDCT">2.16.840.1.113883.6.96</xsl:variable>
    <xsl:variable name="oidICPC1NL">2.16.840.1.113883.2.4.4.31.1</xsl:variable>
    <!-- SOAP/SOEP entries -->
    <xsl:variable name="oidJournaalregeltypen">2.16.840.1.113883.2.4.4.32.2</xsl:variable>
    <xsl:variable name="oidMap" as="element()+">
        <map oid="{$oidHL7ActCode}"                        uri="http://hl7.org/fhir/v3/ActCode" displayName="HL7 ActCode"/>
        <map oid="{$oidHL7ObservationInterpretation}"      uri="http://hl7.org/fhir/v3/ObservationInterpretation" displayName="HL7 ObservationInterpretation"/>
        <map uri="http://hl7.org/fhir/v2/0078" displayName="HL7 Version 2 Table 0078 v2 Interpretation Codes"/>
        <map oid="{$oidHL7AcknowledgementDetailCode}"      uri="http://hl7.org/fhir/v3/AcknowledgementDetailCode" displayName="HL7 AcknowledgementDetailCode"/>
        <map oid="{$oidBurgerservicenummer}"               uri="http://fhir.nl/fhir/NamingSystem/bsn" displayName="BSN"/>
        <map oid="{$oidUZIPersons}"                        uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-pers" displayName="UZI Personen"/>
        <map oid="{$oidUZISystems}"                        uri="http://fhir.nl/fhir/NamingSystem/uzi-nr-sys" displayName="UZI Systemen"/>
        <map oid="{$oidURAOrganizations}"                  uri="http://fhir.nl/fhir/NamingSystem/ura" displayName="URA"/>
        <map oid="{$oidAGB}"                               uri="http://fhir.nl/fhir/NamingSystem/agb-z" displayName="AGB-Z"/>
        <map oid="{$oidSNOMEDCT}"                          uri="http://snomed.info/sct" displayName="SNOMED CT"/>
        <map oid="{$oidLOINC}"                             uri="http://loinc.org" displayName="LOINC"/>
        <map oid="{$oidUCUM}"                              uri="http://unitsofmeasure.org" displayName="UCUM"/>
        <map oid="{$oidICPC1NL}"                           uri="http://hl7.org/fhir/sid/icpc-1-nl" displayName="ICPC-1NL"/>
        <map oid="{$oidNHGTabel14Contactwijze}"            uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-14-contactwijze" displayName="NHG Tabel 14 Contactwijze"/>
        <map oid="{$oidNHGTabel15Verrichtingen}"           uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-15-verrichtingen" displayName="NHG Tabel 15 Verrichtingen"/>
        <map oid="{$oidNHGTabel25BCodesNumeriek}"          uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-25-gebruiksvoorschrift#aanvullend-numeriek" displayName="NHG Tabel 25 B Codes (numeriek)"/>
        <map oid="{$oidNHGTabel45DiagnBepal}"              uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-45-diagnostische-bepalingen" displayName="NHG Tabel 45 Diagnostische bepalingen"/>
        <map oid="{$oidNHGTabel56Profylaxe}"               uri="https://referentiemodel.nhg.org/tabellen/nhg-tabel-56-profylaxe-en-voorzorg" displayName="NHG Tabel 56 Profylaxe en voorzorg"/>
        <map oid="{$oidGStandaardHPK}"                         displayName="G-Standaard HPK"/>
        <map oid="{$oidGStandaardPRK}"                         displayName="G-Standaard PRK"/>
        <map oid="{$oidGStandaardGPK}"                         displayName="G-Standaard GPK"/>
        <map oid="{$oidGStandaardTH007Toedieningswegen}"       displayName="G-Standaard TH007 Toedieningswegen"/>
        <map oid="{$oidGStandaardTH040ContraIndicaties}"       displayName="G-Standaard TH040 Contraindicaties"/>
        <map oid="{$oidGStandaardBST361}"                      displayName="G-Standaard Bestand 361 a-tabel (eenheid gebruiksadvies)"/>
        <map oid="{$oidGStandaardBST902THES2}"                 displayName="G-Standaard Bestand 902 Thesaurus 2"/>
        <map oid="{$oidJournaalregeltypen}"               uri="http://fhir.nl/fhir/NamingSystem/journaalregeltypen" displayName="Journaalregeltypen"/>
    </xsl:variable>
</xsl:stylesheet>