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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    <!-- the param can be called from outside this stylesheet, if no value is provided it defaults to whatever is set in 'select' -->
    <xsl:param name="input_xml_payload" select="'../ada_instance/8ac56799-00d0-4bfc-98ad-0d6addedc5d3.xml'"/>
    <xsl:param name="input_xml_wrapper" select="'input_wrapper.xml'"/>
    <xsl:variable name="input_xml_payload_doc" select="document($input_xml_payload)"/>
    <xsl:variable name="input_xml_wrapper_doc" select="document($input_xml_wrapper)"/>

    <xsl:template match="/">
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/art_decor/branches/mp-qual-20180426T140905/schematron_closed_warnings/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
        <PVMV_IN932000NL01 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/art_decor/branches/mp-vzvz-20180209T133209/schemas/PVMV_IN932000NL01.xsd" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:pharm="urn:ihe:pharm:medication">
            <id extension="{format-dateTime(current-dateTime(), '[Y0001][M01][D01][H01][m01][s01][f001]')}" root="2.16.840.1.113883.2.4.6.6.9999.1"/>
            <creationTime value="{format-dateTime(current-dateTime(), '[Y0001][M01][D01][H01][m01][s01]')}"/>
            <versionCode code="NICTIZEd2005-Okt"/>
            <interactionId extension="PVMV_IN932000NL01" root="2.16.840.1.113883.1.6"/>
            <profileId root="2.16.840.1.113883.2.4.3.11.1" extension="810"/>
            <processingCode code="P"/>
            <processingModeCode code="T"/>
            <acceptAckCode code="AL"/>
            <receiver>
                <device>
                    <id extension="70000003" root="2.16.840.1.113883.2.4.6.6"/>
                    <name>Parasoft op de POC</name>
                </device>
            </receiver>
            <sender>
                <device>
                    <id extension="30" root="2.16.840.1.113883.2.4.6.6"/>
                    <name>Testsysteem van Arianne</name>
                </device>
            </sender>
            <ControlActProcess moodCode="EVN">
                <authorOrPerformer typeCode="AUT">
                    <participant>
                        <AssignedDevice>
                            <id extension="30" root="2.16.840.1.113883.2.4.6.6"/>
                            <id root="2.16.528.1.1007.3.2" extension="123412345"/>
                            <Organization>
                                <id root="2.16.528.1.1007.3.3" extension="00765332"/>
                                <name>Huisartspraktijk van Beek</name>
                            </Organization>
                        </AssignedDevice>
                    </participant>
                </authorOrPerformer>
                <overseer typeCode="RESP">
                    <AssignedPerson>
                        <id extension="123456798" root="2.16.528.1.1007.3.1"/>
                        <id extension="12365487" root="2.16.840.1.113883.2.4.6.1"/>
                        <code code="01.046" codeSystem="2.16.840.1.113883.2.4.15.111" displayName="Huisarts"/>
                        <assignedPrincipalChoiceList>
                            <assignedPerson>
                                <name>Peter van den Broek</name>
                            </assignedPerson>
                        </assignedPrincipalChoiceList>
                        <Organization>
                            <id extension="2BFilledWithRealValue" root="2.16.840.1.113883.2.4.3.11.21"/>
                            <id extension="12346548" root="2.16.528.1.1007.3.3"/>
                            <code code="V4" codeSystem="2.16.840.1.113883.2.4.15.1060" displayName="Ziekenhuis"/>
                            <name>Ziekenhuis X</name>
                            <addr>
                                <city>Lutjebroek</city>
                            </addr>
                        </Organization>
                    </AssignedPerson>
                </overseer>
                <subject>
                    <ClinicalDocument>
                        <xsl:apply-templates select="./*/*"/>
                    </ClinicalDocument>
                </subject>
            </ControlActProcess>
        </PVMV_IN932000NL01>
    </xsl:template>


    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
