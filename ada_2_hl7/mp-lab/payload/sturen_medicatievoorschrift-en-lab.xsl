<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:import href="../../mp/9.3.0/sturen_medicatievoorschrift/payload/sturen_medicatievoorschrift_org.xsl"/>
  <xsl:import href="../../lab/3.0.0/sturen_laboratoriumresultaten/payload/sturen_laboratoriumresultaten_org.xsl"/>

  <!-- schema location without hl7-namespace -->
  <xsl:param name="schemaLocation" as="xs:string?">../hl7_schemas_flat/master_organizer.xsd</xsl:param>

  <xsl:template match="/">
    <organizer xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <xsl:if test="string-length($schemaLocation) gt 0">
        <xsl:attribute name="xsi:schemaLocation" select="'urn:hl7-org:v3', $schemaLocation"/>
      </xsl:if>
      <xsl:call-template name="mp-mp93_vos"/>
      <xsl:call-template name="lu-sturenLaboratoriumresultaten"/>
    </organizer>
  </xsl:template>
</xsl:stylesheet>
