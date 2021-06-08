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

<xsl:stylesheet 
    exclude-result-prefixes="#all" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:uuid="http://www.uuid.org" 
    xmlns:local="urn:fhir:stu3:functions" 
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    <xsl:import href="../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:param name="fhirVersion" select="'R4'"/>

    
    <!-- Here all overrules be placed -->

    <!-- Cherrypick referencing-integration -->
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
    
    <!--<xsl:stylesheet 
        exclude-result-prefixes="#all" 
        xmlns:f="http://hl7.org/fhir" 
        xmlns:nf="http://www.nictiz.nl/functions"
        xmlns:nm="http://www.nictiz.nl/mappings"
        xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="2.0">
        
        <xsl:import href="zib_latest_package.xsl"/>
        <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
        <xsl:strip-space elements="*"/>
        
        <xd:doc scope="stylesheet">
            <xd:desc>
                <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
                <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA transaction to HL7 FHIR R4 profiles.</xd:p>
            </xd:desc>
        </xd:doc>
        
        <xd:doc>
            <xd:desc>pass an appropriate macAddress to ensure uniqueness of the UUID. 02-00-00-00-00-00 may not be used in a production situation</xd:desc>
        </xd:doc>
        <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
        
        <xd:doc>
            <xd:desc>parameter to determine whether to refer by resource/id should be false when there is no FHIR server available to retrieve the resources </xd:desc>
        </xd:doc>
        <xsl:param name="referById" as="xs:boolean" select="false()"/>
        
        <xd:doc>
            <xd:desc>dateT may be given for relative dates, only applicable for test instances</xd:desc>
        </xd:doc>
        <xsl:param name="dateT" as="xs:date?" select="current-date()"/>
        <!-\-<xsl:param name="dateT" as="xs:date?"/>-\->
        
        <xd:doc>
            <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OIDs). When an ID is encountered with a root value in this list, then this ID will be masked in the output data. This is useful to prevent outputting Dutch bsns (<xd:ref name="oidBurgerservicenummer" type="variable"/>) for example. Default is to include any ID in the output as it occurs in the input.</xd:desc>
        </xd:doc>
        <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>
        
        <xd:doc>
            <xd:desc>Start conversion.</xd:desc>
        </xd:doc>
        <!-\- TODO: Had to silence this to make the driver work -\->
        <!-\-    <xsl:template match="/">
        <xsl:apply-templates select="adaxml/data"/>
    </xsl:template>
-\->    
        <xd:doc>
            <xd:desc>Build a FHIR Bundle of type collection.</xd:desc>
        </xd:doc>
        <xsl:template match="adaxml/data" name="Zib2020Conversion">
            <!-\- First we create all resources in a variable. These resources all have a uuid as resource.id, all (internal) references are to this uuid -\->
            <xsl:variable name="resources">
                <xsl:apply-templates select="*"/>
            </xsl:variable>
            <!-\- Then we can decide wat to do with these resources. Store them in a Bundle, and (optional) transform all resource.id and references to relative paths. The goal is to create some sort of toolkit that can be applied at this stage, for example templates like:
        - createSearchsetBundle
        - convertUuid2Relative
        - removeResourceId
        - addNarrative
        - etc.
        The most basic action would be just <xsl:copy-of select="$resources"/> if one resource is expected, but because we are dealing with a HealcareProvider with an Organization and a Location resource, I am making a collection Bundle.
        -\->
            <!-\-<xsl:copy-of select="$resources"/>-\->
            <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir">
                <type value="collection"/>
                <xsl:for-each select="$resources">
                    <entry>
                        <fullUrl value="TODO"/>
                        <xsl:copy-of select="."/>
                    </entry>
                </xsl:for-each>
            </Bundle>
        </xsl:template>
        
        <!-\- Special purpose overridden makeReference template that recognizes the Patient references by identifier which are unique for this project. -\->
        <xsl:template name="makeReference">
            <xsl:param name="in" as="element()?"/>
            <xsl:param name="elementName" as="xs:string"/>
            <xsl:param name="wrapIn" as="xs:string?"/>
            <xsl:param name="fhirMetadata" tunnel="yes" as="element()*"/>
            
            <xsl:variable name="reference">
                <xsl:choose>
                    <xsl:when test="$in">
                        <!-\- TODO: This doesn't work with named templates. No idea how we can fix this -\->
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$in"/>
                            <xsl:with-param name="elementName" select="$in"/>
                            <xsl:with-param name="wrapIn"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$elementName = 'patient' and onderwerp[patient-id]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="onderwerp/patient-id"/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            
            <xsl:if test="count($reference) &gt; 0">
                <xsl:choose>
                    <xsl:when test="$outputElement">
                        <xsl:element name="{$outputElement}">
                            <xsl:copy-of select="$reference"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="$reference"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:template>
    </xsl:stylesheet>-->
    

</xsl:stylesheet>
