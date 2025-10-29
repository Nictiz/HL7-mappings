<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:f="http://hl7.org/fhir"
  xmlns:local="urn:nictiz"
  exclude-result-prefixes="xs math"
  version="2.0">
  
  <xsl:param name="validator">FHIR Validation tool Version 6.6.5 (Git# 8696141c4acb). Built 2025-08-24T08:55:47.681Z (37 hours old)</xsl:param>
  <xsl:variable name="inputFiles" select="collection('../med_mij_kraam_beschikbaarstellen/fhir_instance?select=*.xml&amp;recurse=yes')/*"/>
  <xsl:variable name="outputBundle" select="/f:Bundle"/>
  <xsl:template match="/">
    <xsl:variable name="relevantIssues" select="local:getRelevantIssues($outputBundle//f:OperationOutcome)"/>
    <html>
      <head>
        <meta encoding="UTF-8">&#160;</meta>
        <title>Validation Results</title>
        <style>
          * { font-family: verdana; }
          tr.index-errors { background-color: #ffcccc; }
          tr.index-warnings { background-color: #efffef; }
          tr.row-errors { background-color: #ffcccc; }
          tr.row-warnings { background-color: #ffebcc; }
          tr.row-informations { background-color: #ffffe6; }
        </style>
      </head>
      <body>
        <h1>Validation Results</h1>
        <p>
          <xsl:value-of select="count($relevantIssues[f:severity/@value = 'error'])"/>
          <xsl:text> errors, </xsl:text>
          <xsl:value-of select="count($relevantIssues[f:severity/@value = 'warning'])"/>
          <xsl:text> warnings, </xsl:text>
          <xsl:value-of select="count($relevantIssues[f:severity/@value = 'information'])"/>
          <xsl:text> hints. Generated </xsl:text>
          <xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01] [H01]:[m01]:[s01]')"/>
          <xsl:text> by </xsl:text>
          <xsl:value-of select="normalize-space(replace($validator, '^.*FHIR', 'FHIR'))"/>
        </p>
        
        <xsl:call-template name="doIndex"/>
        
        <xsl:call-template name="doContents"/>
      </body>
    </html>
  </xsl:template>
  
  <!--
    <issue>
      <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-line">
        <valueInteger value="64"/>
      </extension>
      <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-col">
        <valueInteger value="21"/>
      </extension>
      <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-source">
        <valueString value="InstanceValidator"/>
      </extension>
      <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-message-id">
        <valueCode value="http://hl7.org/fhir/StructureDefinition/Period#per-1"/>
      </extension>
      <severity value="error"/>
      <code value="invariant"/>
      <details>
        <text value="Fout bij constraint: per-1: 'If present, start SHALL have a lower value than end'Invalid date/time format: &quot;${DATE, T, D, -146}&quot; (log: Invalid date/time format: &quot;${DATE, T, D, -146}&quot;)"/>
      </details>
      <expression value="Observation.effective.ofType(Period)"/>
    </issue>
  -->
  <xsl:template name="doIndex">
    <table>
      <tr>
        <th>Filename</th>
        <th>Errors</th>
        <th>Warnings</th>
        <th>Hints</th>
      </tr>
      <!--
        <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-file">
          <valueString value="./../med_mij_uitbreiding_verloskunde_beschikbaarstellen/fhir_instance/mm-gbz-zib-LaboratoryTestResult-Observation883-9-LabTestRes-Obs-mm-gbz-37e8130a-6b24-11ec-2112-020000000000.xml"/>
        </extension>
      -->
      <xsl:for-each select="$outputBundle//f:OperationOutcome">
        <xsl:sort select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/operationoutcome-file']/f:valueString/@value"/>
        <xsl:variable name="inputFile" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/operationoutcome-file']/f:valueString/@value"/>

        <xsl:variable name="issues" select="local:getRelevantIssues(.)"/>
        <xsl:variable name="errors" select="count($issues[f:severity[@value = 'error']])"/>
        <xsl:variable name="warnings" select="count($issues[f:severity[@value = 'warnings']])"/>
        <xsl:variable name="informations" select="count($issues[f:severity[@value = 'information']])"/>

        <xsl:variable name="tr-class">
          <xsl:choose>
            <xsl:when test="$errors gt 0">index-errors</xsl:when>
            <xsl:otherwise>index-warnings</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <tr class="{$tr-class}">
          <td>
            <a href="#{generate-id(.)}" alt=""><xsl:value-of select="$inputFile"/></a>
          </td>
          <td>
            <xsl:value-of select="$errors"/>
          </td>
          <td>
            <xsl:value-of select="$warnings"/>
          </td>
          <td>
            <xsl:value-of select="$informations"/>
          </td>
        </tr>
      </xsl:for-each>
    </table>

  </xsl:template>
  
  <xsl:template name="doContents">
    
    <xsl:for-each select="$outputBundle//f:OperationOutcome">
      <xsl:sort select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/operationoutcome-file']/f:valueString/@value"/>
      <xsl:variable name="inputFile" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/operationoutcome-file']/f:valueString/@value"/>

      <hr/>
      <p id="{generate-id(.)}">
        <a href="file:{$inputFile}">
          <xsl:value-of select="$inputFile"/>
        </a>
      </p>
      
      <!--
        <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-file">
          <valueString value="./../med_mij_uitbreiding_verloskunde_beschikbaarstellen/fhir_instance/mm-gbz-zib-LaboratoryTestResult-Observation883-9-LabTestRes-Obs-mm-gbz-37e8130a-6b24-11ec-2112-020000000000.xml"/>
        </extension>
      -->
      <xsl:variable name="issues" select="local:getRelevantIssues(.)"/>

      <xsl:choose>
        <xsl:when test="count($issues) = count($issues[f:code/@value = 'informational'])">
          <p>No Issues detected</p>
        </xsl:when>
        <xsl:otherwise>
          <table>
            <tr>
              <th>Path</th>
              <th>Severity</th>
              <th>Message</th>
            </tr>
            
            <!--
              <issue>
                <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-line">
                  <valueInteger value="32"/>
                </extension>
                <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-col">
                  <valueInteger value="10"/>
                </extension>
                <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-source">
                  <valueString value="TerminologyEngine"/>
                </extension>
                <extension url="http://hl7.org/fhir/StructureDefinition/operationoutcome-message-id">
                  <valueCode value="Display_Name_for__should_be_one_of__instead_of"/>
                </extension>
                <severity value="warning"/>
                <code value="invalid"/>
                <details>
                  <text value="Wrong Display Name 'wond van perineum (aandoening)' for http://snomed.info/sct#210484005. Valid display is one of 3 choices: 'open wond van perineum' (nl), 'open wond van perineum (aandoening)' (nl) or 'wond van perineum' (nl) (for the language(s) 'nl')"/>
                </details>
                <expression value="Condition.code.coding[0].display"/>
              </issue>
            -->
            <xsl:for-each select="$issues">
              <xsl:variable name="tr-class">
                <xsl:choose>
                  <xsl:when test="f:severity/@value = 'error'">row-errors</xsl:when>
                  <xsl:when test="f:severity/@value = 'warning'">row-warnings</xsl:when>
                  <xsl:otherwise>row-informations</xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              <tr class="{$tr-class}">
                <td>
                  <xsl:value-of select="f:expression/@value"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-line']/f:valueInteger/@value"/>
                  <xsl:text>:</xsl:text>
                  <xsl:value-of select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-col']/f:valueInteger/@value"/>
                  <xsl:text>)</xsl:text>
                </td>
                <td>
                  <xsl:value-of select="f:severity/@value"/>
                </td>
                <td>
                  <span title="{f:extension[@url= 'http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-source']/f:valueString/@value}: {f:extension[@url= 'http://hl7.org/fhir/StructureDefinition/operationoutcome-message-id']/f:valueCode/@value}"><xsl:value-of select="f:details/f:text/@value"/></span>
                </td>
              </tr>
            </xsl:for-each>

          </table>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:for-each>
    
  </xsl:template>
  
  <xsl:function name="local:getRelevantIssues" as="element(f:issue)*">
    <xsl:param name="context"/>
    
    <xsl:sequence select="$context/f:issue[not(f:details/f:text[contains(@value, '${DATE')])][not(f:details/f:text[contains(@value, 'hcim-pregnancy-2')])][not(f:details/f:text[contains(@value, 'BaseDateTimeType')])]"/>
  </xsl:function>
</xsl:stylesheet>