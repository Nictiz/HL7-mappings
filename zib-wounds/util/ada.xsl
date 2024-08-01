<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:naf="http://www.nictiz.nl/ada-functions" xmlns:nwf="http://www.nictiz.nl/wiki-functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <!-- shared stuff for ada handling -->

    <xd:doc>
        <xd:desc>Resolves an ada reference element (an element without subelements) to the element with contents it references to</xd:desc>
        <xd:param name="in">The ada reference element</xd:param>
    </xd:doc>
    <xsl:function name="naf:resolve-ada-reference" as="element()?">
        <xsl:param name="in" as="element()?"/>
        <xsl:for-each select="$in">
            <xsl:choose>
                <xsl:when test="./*">
                    <!-- this is not a reference let's return the input -->
                    <xsl:sequence select="."/>
                </xsl:when>
                <xsl:when test=".[not(@datatype) or @datatype = 'reference'][@value]">
                    <xsl:sequence select="(ancestor::*[parent::data]//*[local-name() = local-name($in)][@id = $in/@value])[1]"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

</xsl:stylesheet>
