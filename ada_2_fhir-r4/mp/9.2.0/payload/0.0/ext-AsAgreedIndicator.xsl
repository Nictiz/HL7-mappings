<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc>
        <xd:desc>Template for shared extension http://nictiz.nl/fhir/StructureDefinition/ext-AsAgreedIndicator</xd:desc>
        <xd:param name="in">Optional. Ada element containing the copy indicator. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="ext-AsAgreedIndicator" match="*" as="element()?" mode="ext-AsAgreedIndicator">
        <xsl:param name="in" as="element()?" select="."/>
        <!-- TODO: use correct extension, this is not an existing extension at the moment -->
        <extension url="{$urlExtAsAgreedIndicator}">
            <valueBoolean>
                <xsl:call-template name="boolean-to-boolean"/>
            </valueBoolean>
        </extension>
    </xsl:template>
</xsl:stylesheet>
