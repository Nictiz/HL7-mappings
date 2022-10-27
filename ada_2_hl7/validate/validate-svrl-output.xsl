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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:file="http://expath.org/ns/file" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="inputDir" as="xs:string">../sturen_medicatievoorschrift/validate_hl7_instance</xsl:param>
    <xsl:param name="inputFileSet" as="xs:string">*.xml</xsl:param>

    <xsl:variable name="inputFiles" select="collection(concat($inputDir, '/?select=', $inputFileSet))" as="document-node()*"/>

    <xsl:template match="/">
        <xsl:comment>start</xsl:comment>
        <start inputDir="{$inputDir}">
            <xsl:variable name="results" as="element()">
                <validate>
                    <xsl:for-each select="$inputFiles">
                        <file name="{.//svrl:active-pattern[1]/@document}">
                            <xsl:choose>
                                <xsl:when test=".//svrl:failed-assert">
                                    <fail>
                                        <xsl:for-each select=".//svrl:failed-assert">
                                            <xsl:copy-of select="."/>
                                        </xsl:for-each>
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

            <xsl:copy-of select="$results"/>

            <!-- log error message in case there is any fail -->            
            <xsl:if test="$results//fail">
                <xsl:message terminate="no">ERROR: Not all instances validated correctly in input directory: <xsl:value-of select="$inputDir"/></xsl:message>
            </xsl:if>
        </start>
    </xsl:template>
</xsl:stylesheet>
