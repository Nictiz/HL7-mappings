<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- Without this import, all depending XSLs need to import it -->
    <xsl:import href="../../zib2017bbr/payload/ada2hl7_all-zibs.xsl"/>
    <xsl:import href="hl7-Contactpersoon-20210701.xsl"/>
    <xsl:import href="hl7-Lichaamsgewicht-20210701.xsl"/>
    <xsl:import href="hl7-patient-20210701.xsl"/>
    <xsl:import href="hl7-Zorgaanbieder-20210701.xsl"/>
    <xsl:import href="hl7-Zorgverlener-20210701.xsl"/>
    <xsl:import href="hl7-ProbleemObservatie-20210701.xsl"/>
    <xsl:import href="hl7-Lichaamslengte-20210701.xsl"/>
    <xsl:import href="hl7-toelichting-20210701.xsl"/>
       
 </xsl:stylesheet>