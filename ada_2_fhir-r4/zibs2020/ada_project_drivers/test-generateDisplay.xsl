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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:import href="_driverInclude.xsl"/>
    
    <!-- Creates Composition resource with a reference to each nl-core-*.xml instance available. -->
    
    <xsl:template match="/">
        <xsl:result-document href="../fhir_instance/test-generateDisplay.xml">
            <Composition>
                <id value="test-generateDisplay"/>
                <status value="final"/>
                <type>
                    <coding>
                        <system value="http://loinc.org"/>
                        <code value="11503-0"/>
                        <display value="Medical records"/>
                    </coding>
                </type>
                <date>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="xs:string(current-dateTime())"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </date>
                <author>
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="document('../ada_instance/nl-core-Patient-01.xml')//patient[1]"/>
                    </xsl:call-template>
                </author>
                <title value="Test all _generateDisplay templates"/>
                <xsl:for-each select="collection('../ada_instance/')[starts-with(substring-after(document-uri(),'/ada_instance/'),'nl-core-')]">
                    <xsl:variable name="in" select="(.//*[starts-with(@conceptId, $zib2020Oid) and matches(@conceptId, '(\.1|9\.\d+\.\d+)$')])[1]"/>
                    <xsl:variable name="groupKey">
                        <xsl:choose>
                            <xsl:when test="$in[@datatype = 'reference' and @value]">
                                <xsl:value-of select="nf:getGroupingKeyDefault(nf:resolveAdaInstance($in,/))"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="nf:getGroupingKeyDefault($in)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:for-each select="$fhirMetadata[nm:group-key = $groupKey]">
                        <section>
                            <entry>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="$in"/>
                                    <xsl:with-param name="profile" select="@profile"/>
                                </xsl:call-template>
                            </entry>
                        </section>
                    </xsl:for-each>
                </xsl:for-each>
            </Composition>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>