<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:f="http://hl7.org/fhir"
  xmlns:hl7v2="urn:hl7-org:v2xml"
  exclude-result-prefixes="#all"
  version="2.0">
  
  <xsl:output indent="yes" omit-xml-declaration="yes"/>
  <xsl:include href="hl7v2_2_xml.xsl"/>
  
  <xsl:param name="input">file:///Users/ahenket/Desktop/voorbeeld_philips.hl7</xsl:param>
  <xsl:param name="encoding">cp1252</xsl:param>
  
  <!--
    OUL^R22^OUL_R22 Unsolicited Specimen                      Chapter
                    Oriented Observation 
                    Message

    MSH             Message Header                            2
    [{SFT}]         Software Segment                          2
    [NTE]           Notes and Comments                        2
    [ === PATIENT begin
      PID           Patient Identification                    3
      [PD1]         Additional Demographics                   3
      [{NTE}]       Notes and Comments (for Patient ID)       2
    ] === PATIENT end
    [ === VISIT begin
      PV1           Patient Visit                             3
      [PV2]         Patient Visit – Additional Information    3
    ] === VISIT end
    { === SPECIMEN begin
      SPM           Specimen information                      7
      [{ OBX }]     Observation Result (for Specimen)         7
      [{ === CONTAINER begin
        SAC         Container information                     13
        [INV]       Detailed Substance information 
                    (e.g., id, lot, manufacturer, … of QC
                    specimen)                                 13
      }] === CONTAINER end
      { === ORDER begin
        OBR         Observation Order                         7
        [ORC]       Common Order                              4
        [{NTE}]     Notes and Comments (for Detail)           2
        [{ === TIMING_QTY begin
          TQ1       Timing/Quantity                           4
          [{TQ2}]   Timing/Quantity Order Sequence            4
        }] === TIMING_QTY end
        [{ === RESULT begin
          OBX       Observation Result                        7
          [TCD]     Test Code Detail                          13
          {[SID]}   Substance Identifier (e.g.,
                    reagents used for testing)                13
          [{NTE}] Notes and Comments                          2
        }] === RESULT end
        [{CTI}]     Clinical Trial Identification             7
      } === ORDER end
    } === SPECIMEN end
    [DSC]           Continuation Pointer                      2
  -->
  <xsl:template match="/">
    <xsl:variable name="theXMLmessage" as="element(message)">
      <xsl:call-template name="parseMessage">
        <xsl:with-param name="input" select="$input"/>
        <xsl:with-param name="encoding" select="$encoding"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="theOULR22message" as="element(message)">
      <message>
        <xsl:copy-of select="$theXMLmessage/MSH"/>
        <xsl:copy-of select="$theXMLmessage/SFT"/>
        <xsl:copy-of select="$theXMLmessage/NTE[not(preceding-sibling::PID | preceding-sibling::SPM)]"/>
        <xsl:if test="$theXMLmessage/PID">
          <OUL_R22.PATIENT>
            <xsl:copy-of select="$theXMLmessage/PID"/>
            <xsl:copy-of select="$theXMLmessage/PD1"/>
            <xsl:copy-of select="$theXMLmessage/NTE[preceding-sibling::PID][not(preceding-sibling::SPM)]"/>
          </OUL_R22.PATIENT>
        </xsl:if>
        <xsl:if test="$theXMLmessage/PV1">
          <OUL_R22.VISIT>
            <xsl:copy-of select="$theXMLmessage/PV1"/>
            <xsl:copy-of select="$theXMLmessage/PV2"/>
          </OUL_R22.VISIT>
        </xsl:if>
        <xsl:for-each select="$theXMLmessage/SPM">
          <xsl:variable name="currentpos" select="count(preceding-sibling::*) + 1"/>
          <xsl:variable name="nextpos" select="if (following-sibling::SPM) then following-sibling::SPM[1]/count(preceding-sibling::*) + 1 else count($theXMLmessage/*)"/>
          <xsl:variable name="spmGroup" select=". | following-sibling::*[count(preceding-sibling::*) lt $nextpos]" as="element()*"/>
          <OUL_R22.SPECIMEN>
            <xsl:copy-of select="."/>
            <xsl:copy-of select="$spmGroup[self::OBX][not(preceding-sibling::SAC | preceding-sibling::OBR)]"/>
            <xsl:if test="$spmGroup[self::SAC]">
              <OUL_R22.CONTAINER>
                <xsl:copy-of select="$spmGroup[self::SAC]"/>
                <xsl:copy-of select="$spmGroup[self::INV]"/>
              </OUL_R22.CONTAINER>
            </xsl:if>
            <xsl:for-each select="$spmGroup[self::OBR]">
              <xsl:variable name="currentpos" select="count(preceding-sibling::*) + 1"/>
              <xsl:variable name="nextpos" select="if (following-sibling::OBR) then following-sibling::OBR[1]/count(preceding-sibling::*) + 1 else count($spmGroup)"/>
              <xsl:variable name="obrGroup" select=". | following-sibling::*[position() lt $nextpos]" as="element()*"/>
              <OUL_R22.ORDER.CONTENT>
                <xsl:copy-of select="."/>
                <xsl:copy-of select="$obrGroup[self::ORC]"/>
                <xsl:copy-of select="$obrGroup[self::NTE][not(preceding-sibling::OBX)]"/>
                <xsl:for-each select="$obrGroup[self::TQ1]">
                  <xsl:variable name="currentpos" select="count(preceding-sibling::*) + 1"/>
                  <xsl:variable name="nextpos" select="if (following-sibling::TQ1) then following-sibling::TQ1[1]/count(preceding-sibling::*) + 1 else count($obrGroup)"/>
                  <xsl:variable name="tq1Group" select=". | following-sibling::*[count(preceding-sibling::*) lt $nextpos]" as="element()*"/>
                  <OUL_R22.TIMING_QTY>
                    <xsl:copy-of select="."/>
                    <xsl:copy-of select="$tq1Group[self::TQ2]"/>
                  </OUL_R22.TIMING_QTY>
                </xsl:for-each>
                <xsl:for-each select="$obrGroup[self::OBX]">
                  <xsl:variable name="currentpos" select="count(preceding-sibling::*) + 1"/>
                  <xsl:variable name="nextpos" select="if (following-sibling::OBX) then following-sibling::OBX[1]/count(preceding-sibling::*) + 1 else count($obrGroup)"/>
                  <xsl:variable name="obxGroup" select=". | following-sibling::*[count(preceding-sibling::*) lt $nextpos]" as="element()*"/>
                  <OUL_R22.RESULT>
                    <xsl:copy-of select="."/>
                    <xsl:copy-of select="$obxGroup[self::TCD]"/>
                    <xsl:copy-of select="$obxGroup[self::SID]"/>
                    <xsl:copy-of select="$obxGroup[self::NTE]"/>
                  </OUL_R22.RESULT>
                </xsl:for-each>
                <xsl:copy-of select="$spmGroup[self::CTI]"/>
              </OUL_R22.ORDER.CONTENT>
            </xsl:for-each>
          </OUL_R22.SPECIMEN>
          <xsl:copy-of select="$theXMLmessage/DSC"/>
        </xsl:for-each>
      </message>
    </xsl:variable>
    
    <!--<xsl:copy-of select="$theOULR22message"/>-->
    <xsl:variable name="thePatient" as="element()?">
      <xsl:call-template name="message_to_Patient">
        <xsl:with-param name="theXMLmessage" select="$theOULR22message"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:call-template name="message_to_Specimen">
      <xsl:with-param name="theXMLmessage" select="$theOULR22message"/>
      <xsl:with-param name="thePatient" select="$thePatient"/>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Maps PID, PV1 -->
  <xsl:template name="message_to_Patient">
    <xsl:param name="theXMLmessage" as="element(message)"/>
    
    <xsl:for-each select="$theXMLmessage/OUL_R22.PATIENT/PID">
      <Patient xmlns="http://hl7.org/fhir">
        <id value="{generate-id(.)}"/>
        <!-- PV1.19 IS to .extension-->
        <xsl:if test="$theXMLmessage/OUL_R22.VISIT/PV1.19[not(normalize-space() = '')]">
          <extension url="http://hl7.org/fhir/StructureDefinition/patient-importance">
            <valueCodeableConcept>
              <coding>
                <!--<system value=""/>-->
                <code value="{normalize-space(../PV1.19)}"/>
              </coding>
            </valueCodeableConcept>
          </extension>
        </xsl:if>
        <!-- PID.3 CX to .identifier -->
        <xsl:call-template name="CX-to-Identifier">
          <xsl:with-param name="in" select="PID.3"/>
          <xsl:with-param name="elementName">identifier</xsl:with-param>
        </xsl:call-template>
        <!--active-->
        <!-- PID.5 XPN, PID.6 XPN to .name -->
        <xsl:call-template name="XPN-to-HumanName">
          <xsl:with-param name="in" select="PID.5"/>
          <xsl:with-param name="elementName">name</xsl:with-param>
        </xsl:call-template>
        <!-- PID.14 XTN, PID.15 XTN to .telecom -->
        <xsl:call-template name="XTN-to-ContactPoint">
          <xsl:with-param name="in" select="PID.14 | PID.15"/>
          <xsl:with-param name="elementName">telecom</xsl:with-param>
        </xsl:call-template>
        <!-- PID.8 CWE to .gender -->
        <xsl:if test="PID.8[not(normalize-space(.) = '')]">
          <gender>
            <xsl:choose>
              <xsl:when test="PID.8 = 'M'">
                <xsl:attribute name="value">male</xsl:attribute>
              </xsl:when>
              <xsl:when test="PID.8 = ('F', 'V')">
                <xsl:attribute name="value">female</xsl:attribute>
              </xsl:when>
              <xsl:when test="PID.8 = 'UN'">
                <xsl:attribute name="value">other</xsl:attribute>
              </xsl:when>
              <xsl:when test="PID.8 = 'UNK'">
                <xsl:attribute name="value">unknown</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </gender>
        </xsl:if>
        <!-- PID.7 DTM to .birthDate -->
        <xsl:if test="PID.7[not(normalize-space(.) = '')]">
          <birthDate value="{hl7v2:TS-to-iso8601(PID.7)}"/>
        </xsl:if>
        <!-- PID.29 DTM, PID.30 30 ID to .deceased[x] -->
        <xsl:choose>
          <xsl:when test="PID.29[normalize-space(.) = 'true']">
            <deceasedDateTime value="{hl7v2:TS-to-iso8601(PID.29)}"/>
          </xsl:when>
          <xsl:when test="PID.30[normalize-space(.) = 'true']">
            <deceasedBoolean value="true"/>
          </xsl:when>
        </xsl:choose>
        <!-- PID.11 XAD to .address -->
        <xsl:call-template name="XAD-to-Address">
          <xsl:with-param name="in" select="PID.11"/>
          <xsl:with-param name="elementName">address</xsl:with-param>
        </xsl:call-template>
        <!-- PID.16 CWE to .maritalStatus -->
        <!--maritalStatus-->
        <!-- PID.24 ID, PID.25 INT to .multipleBirth[x] -->
        <xsl:choose>
          <xsl:when test="PID.29[normalize-space(.) = 'true']">
            <multipleBirthInteger value="{normalize-space(PID.30)}"/>
          </xsl:when>
          <xsl:when test="PID.30[normalize-space(.) = 'true']">
            <multipleBirthBoolean value="{normalize-space(PID.29)}"/>
          </xsl:when>
        </xsl:choose>
        <!--photo-->
        <!--contact-->
        <!--PID.15 CE to .communication-->
        <xsl:if test="PID.15[normalize-space(.) = 'true']">
          <communication>
            <language>
              <system value="urn:ietf:bcp:47"/>
              <code value="{normalize-space(PID.15)}"/>
            </language>
          </communication>
        </xsl:if>
        <!--generalPractitioner-->
        <!--managingOrganization-->
        <!--link-->
      </Patient>
    </xsl:for-each>
  </xsl:template>

  <!-- Maps SPM, SAC -->
  <xsl:template name="message_to_Specimen">
    <xsl:param name="theXMLmessage" as="element(message)"/>
    <xsl:param name="thePatient" as="element(f:Patient)?"/>
    
    <xsl:for-each select="$theXMLmessage/OUL_R22.SPECIMEN/SPM">
      <Specimen xmlns="http://hl7.org/fhir">
        <id value="{generate-id(.)}"/>
        <!--... identifier	Σ	0..*	Identifier	External Identifier-->
        <xsl:call-template name="EIP-to-Identifier">
          <xsl:with-param name="in" select="SPM.2"/>
          <xsl:with-param name="elementName">identifier</xsl:with-param>
        </xsl:call-template>
        <!--... accessionIdentifier	Σ	0..1	Identifier	Identifier assigned by the lab-->
        <!--... status	?!Σ	0..1	code	available | unavailable | unsatisfactory | entered-in-error SpecimenStatus (Required)-->
        <!--... type	Σ	0..1	CodeableConcept	Kind of material that forms the specimen v2 Specimen Type (Example)-->
        <xsl:call-template name="CWE-to-CodeableConcept">
          <xsl:with-param name="in" select="SPM.4"/>
          <xsl:with-param name="elementName">type</xsl:with-param>
        </xsl:call-template>
        <!--... subject	Σ	0..1	Reference(Patient | Group | Device | Substance | Location)	
                Where the specimen came from. This may be from patient(s), from a location (e.g., the 
                source of an environmental sample), or a sampling of a substance or a device-->
        <xsl:if test="$thePatient">
          <subject>
            <reference value="Patient/{$thePatient/f:id/@value}"/>
            <display value="Patient: {($thePatient/f:name/f:text/@value)[1]}"/>
          </subject>
        </xsl:if>
        <!--... receivedTime	Σ	0..1	dateTime	The time when specimen was received for processing-->
        <xsl:if test="SPM.18[not(normalize-space() = '')]">
          <receivedTime value="{hl7v2:TS-to-iso8601(SPM.18)}"/>
        </xsl:if>
        <!--... parent		0..*	Reference(Specimen)	Specimen from which this specimen originated-->
        <!--... request		0..*	Reference(ServiceRequest)	Why the specimen was collected-->
        <!--... collection		0..1	BackboneElement	Collection details
            .... collector	Σ	0..1	Reference(Practitioner | PractitionerRole)	Who collected the specimen
            .... collected[x]	Σ	0..1		Collection time
            ..... collectedDateTime			dateTime
            ..... collectedPeriod			Period
            .... duration	Σ	0..1	Duration	How long it took to collect specimen
            .... quantity		0..1	SimpleQuantity	The quantity of specimen collected
            .... method		0..1	CodeableConcept	Technique used to perform collection FHIR Specimen Collection Method (Example)
            .... bodySite		0..1	CodeableConcept	Anatomical collection site SNOMED CT Body Structures (Example)
            .... fastingStatus[x]	Σ	0..1		Whether or how long patient abstained from food and/or drink v2 Relevant Clincial Information (Extensible)
            ..... fastingStatusCodeableConcept			CodeableConcept
            ..... fastingStatusDuration			Duration	-->
        <xsl:if test="(SPM.7 | SPM.8 | SPM.12 | SPM.17)[not(normalize-space() = '')]">
          <collection>
            <xsl:if test="SPM.17[not(normalize-space() = '')]">
              <collectedDatTime value="{hl7v2:TS-to-iso8601(SPM.17)}"/>
            </xsl:if>
            <xsl:if test="SPM.12[not(normalize-space() = '')]">
              <xsl:call-template name="CQ-to-Quantity">
                <xsl:with-param name="in" select="SPM.12"/>
                <xsl:with-param name="elementName">quantity</xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="SPM.7[not(normalize-space() = '')]">
              <xsl:call-template name="CWE-to-CodeableConcept">
                <xsl:with-param name="in" select="SPM.7"/>
                <xsl:with-param name="elementName">method</xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="SPM.8[not(normalize-space() = '')]">
              <xsl:call-template name="CWE-to-CodeableConcept">
                <xsl:with-param name="in" select="SPM.8"/>
                <xsl:with-param name="elementName">method</xsl:with-param>
              </xsl:call-template>
            </xsl:if>
          </collection>
        </xsl:if>
        <!--... processing		0..*	BackboneElement	Processing and processing step details
            .... description		0..1	string	Textual description of procedure
            .... procedure		0..1	CodeableConcept	Indicates the treatment step applied to the specimen Specimen processing procedure (Example)
            .... additive		0..*	Reference(Substance)	Material used in the processing step
            .... time[x]		0..1		Date and time of specimen processing
            ..... timeDateTime			dateTime
            ..... timePeriod			Period-->	
        <!--... container		0..*	BackboneElement	Direct container of specimen (tube/slide, etc.)
            .... identifier	Σ	0..*	Identifier	Id for the container
            .... description		0..1	string	Textual description of the container
            .... type		0..1	CodeableConcept	Kind of container directly associated with specimen Specimen container (Example)
            .... capacity		0..1	SimpleQuantity	Container volume or size
            .... specimenQuantity		0..1	SimpleQuantity	Quantity of specimen within container
            .... additive[x]		0..1		Additive associated with container v2 Additive (Example)
            ..... additiveCodeableConcept			CodeableConcept
            ..... additiveReference			Reference(Substance)	-->
        <!--<xsl:for-each select="$theXMLmessage/SAC">
          <container>
            
          </container>
        </xsl:for-each>-->
        <!--... condition	Σ	0..*	CodeableConcept	State of the specimen v2 Specimen Condition (Extensible)-->
        <xsl:if test="SPM.24[not(normalize-space() = '')]">
          <xsl:call-template name="CWE-to-CodeableConcept">
            <xsl:with-param name="in" select="SPM.24"/>
            <xsl:with-param name="elementName">condition</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <!--... note		0..*	Annotation	Comments-->
      </Specimen>
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>