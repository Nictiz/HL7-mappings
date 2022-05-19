<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>Template for Bundle.entry.request</xd:desc>
    </xd:doc>

    <xsl:param name="searchMode" as="xs:string?">match</xsl:param>

    <xd:doc>
        <xd:desc>Add Bundle.entry.request</xd:desc>
    </xd:doc>
    <xsl:template match="f:resource" mode="addBundleEntrySearchOrRequest">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
        <xsl:if test="string-length($searchMode) gt 0">
            <search>
                <mode value="{$searchMode}"/>
            </search>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
