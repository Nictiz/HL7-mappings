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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:file="http://expath.org/ns/file" xmlns:util="urn:hl7:utilities" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="utilities.xsl"/>
    
    <!-- merges SVRL output of various input files into a single aggregated result -->
    <!-- call with itself as input, no need for 'default-input.xml'. Example:
      
      <property name="xsl.validate.svrl" value="${build.dir}/../../../util/validate-svrl-output.xsl"/>
      
      <target name="schematronvalidate_fhir_300">

        <!-\- ... -\->

        <antcall target="schematronresults_fhir_300_sub">
            <param name="result.xml" value="${build.dir}/validate/fhir_${usecase.labsr}.xml"/>
            <param name="input.dir" value="${basedir}/../../${usecase.labsr}/validate_fhir_instance"/>
            <param name="input.fileset" value="*.xml"/>
        </antcall>

    </target>
      
      <target name="schematronresults_fhir_300_sub">
        
          <echo/>
          <echo>${echo.label} ${xsl.validate.svrl} make recap of validation in ${result.xml}</echo>
          <xslt force="true" style="${xsl.validate.svrl}" in="${xsl.validate.svrl}" out="${result.xml}">
              <factory name="${xsl.saxon.class}"/>
              <classpath location="${xsl.saxon}"/>
              <param name="inputDir" expression="${input.dir}"/>
              <param name="inputFileSet" expression="${input.fileset}"/>
          </xslt>
        
      </target>
    
    -->
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="#all"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="inputDir" as="xs:string">../sturen_medicatievoorschrift/validate_hl7_instance</xsl:param>
    <xsl:param name="inputFileSet" as="xs:string">*.xml</xsl:param>
    
    <!-- MP-1181 amended to work with absolute and relative paths on both apple and windows machines -->
    <xsl:variable name="cleanDir">
        <xsl:choose>
            <xsl:when test="matches($inputDir, '^[A-Za-z]:')">
                <!-- absolute path -->
                <xsl:value-of select="concat('file:/', replace($inputDir, '\\', '/'))"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- relative path -->
                <xsl:value-of select="replace($inputDir, '\\', '/')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="inputFiles" select="collection(concat($cleanDir, '/?select=', $inputFileSet))" as="document-node()*"/>
    
    <xsl:variable name="results" as="element(validate)">
        <validate>
            <xsl:for-each select="$inputFiles">
                <xsl:variable name="fails" select=".//(svrl:failed-assert | svrl:successful-report)[not(@role = ('info', 'information'))]" as="element()*"/>
                <file name="{resolve-uri(.//(svrl:active-pattern[@document])[1]/@document)}" firstPatternId="{.//(svrl:active-pattern[@id])[1]/@id}" firstPatternName="{.//(svrl:active-pattern[@name])[1]/@name}">
                    <xsl:choose>
                        <xsl:when test="$fails">
                            <fail>
                                <xsl:copy-of select="$fails" copy-namespaces="no"/>
                            </fail>
                        </xsl:when>
                        <xsl:otherwise>
                            <pass/>
                        </xsl:otherwise>
                    </xsl:choose>
                </file>
            </xsl:for-each>
        </validate>
    </xsl:variable>
    
    <xsl:template match="/">

        <!-- log error message in case there is any fail -->            
        <xsl:if test="$results//fail">
            <xsl:call-template name="util:logMessage">
                <xsl:with-param name="level" select="$logERROR"/>
                <xsl:with-param name="msg">Not all instances validated correctly in input directory: <xsl:value-of select="replace(resolve-uri($inputDir), '^file:', '')"/></xsl:with-param>
            </xsl:call-template>
            
            <xsl:for-each select="$results//file[fail]">
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logERROR"/>
                    <xsl:with-param name="msg"><xsl:text>       </xsl:text><xsl:value-of select="position()"/> FAILED: <xsl:value-of select="replace(resolve-uri(@name), '^file:', '')"/></xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>
        
        <xsl:comment>start</xsl:comment>
        <start inputDir="{resolve-uri($cleanDir)}"
            xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:saxon="http://saxon.sf.net/"
            xmlns:schold="http://www.ascc.net/xml/schematron"
            xmlns:iso="http://purl.oclc.org/dsdl/schematron"
            xmlns:xhtml="http://www.w3.org/1999/xhtml"
            xmlns:hl7="urn:hl7-org:v3"
            xmlns:cda="urn:hl7-org:v3"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:hl7v2="urn:hl7-org:v2xml"
            xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2"
            xmlns:ihe="urn:ihe:pcc:hl7v3"
            xmlns:sdtc="urn:hl7-org:sdtc"
            xmlns:nfu="urn:urn:nictiz-nl:v3/nfu"
            xmlns:pharm="urn:ihe:pharm:medication"
            xmlns:f="http://hl7.org/fhir"
            xmlns:hl7nl="urn:hl7-nl:v3"
            xmlns:h="http://www.w3.org/1999/xhtml">
            
            <xsl:copy-of select="$results"/>
            
        </start>
    </xsl:template>
</xsl:stylesheet>