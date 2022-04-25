<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xalan="http://xml.apache.org/xslt" xmlns:xhtml="http://www.w3.org/1999/xhtml" version="2.0" exclude-result-prefixes="#all">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" xalan:indent-amount="4"/> 
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>