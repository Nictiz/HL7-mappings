<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../../_payload/ada_907_to_930.xsl"/>

    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- the macAddress for uuid generation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xsl:param name="schemaFileString" as="xs:string?">../mp/9.3.0/beschikbaarstellen_medicatiegegevens/ada_schemas/beschikbaarstellen_medicatiegegevens.xsd</xsl:param>

</xsl:stylesheet>
