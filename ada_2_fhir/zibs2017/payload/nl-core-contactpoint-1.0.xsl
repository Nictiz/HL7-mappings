<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc>
        <xd:param name="in">Nodes to consider. Defaults to context node</xd:param>
        <xd:param name="filterprivate">Should private information be filtered. Default false.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-contactpoint-1.0" match="contactgegevens | contact_information" mode="doContactInformation" as="element(f:telecom)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="filterprivate" select="false()" as="xs:boolean"/>
        
        <xsl:variable name="filterValues" select="('HP', 'EC')" as="xs:string*"/>
        
        <xsl:for-each select="$in[.//@value | .//@code]">
            <xsl:for-each select="telefoonnummers[telefoonnummer/@value] | telephone_numbers[telephone_number/@value]">
                <xsl:variable name="telecomType" select="telecom_type/@code"/>
                <xsl:variable name="telecomTypeValue" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="empty($telecomType)">phone</xsl:when>
                        <xsl:when test="$telecomType = 'LL'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'FAX'">fax</xsl:when>
                        <xsl:when test="$telecomType = 'MC'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'PG'">pager</xsl:when>
                        <!-- MM-2563 ContactPoint.system SHALL have a value and since we are in the telephone_numbers section ... -->
                        <xsl:otherwise>phone</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="numberType" select="nummer_soort/@code | number_type/@code"/>
                <xsl:variable name="numberTypeValue" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$telecomType = 'MC'">mobile</xsl:when>
                        <xsl:when test="$numberType = 'WP'">work</xsl:when>
                        <xsl:when test="$numberType = 'HP'">home</xsl:when>
                        <xsl:when test="$numberType = 'TMP'">temp</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="doContactDetails" select="if ($filterprivate) then not($numberType[. = $filterValues]) else true()" as="xs:boolean"/>
                <xsl:if test="$doContactDetails">
                    <telecom>
                        <!-- MM-2563 ContactPoint.system SHALL have a value -->
                        <system value="{$telecomTypeValue}">
                            <xsl:if test="$telecomType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                <xsl:call-template name="ext-code-specification-1.0">
                                    <xsl:with-param name="in" select="$telecomType/parent::*"/>
                                </xsl:call-template>
                            </xsl:if>
                        </system>
                        <xsl:for-each select="telefoonnummer/@value | telephone_number/@value">
                            <value value="{normalize-space(.)}"/>
                        </xsl:for-each>
                        <xsl:if test="$numberTypeValue">
                            <use value="{$numberTypeValue}">
                                <xsl:choose>
                                    <xsl:when test="$numberType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                        <xsl:call-template name="ext-code-specification-1.0">
                                            <xsl:with-param name="in" select="$numberType/parent::*"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                            </use>
                        </xsl:if>
                    </telecom>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="email_adressen[email_adres/@value] | email_addresses[email_address/@value]">
                <xsl:variable name="emailType" select="email_soort/@code | email_address_type/@code"/>
                <xsl:variable name="emailTypeValue" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$emailType = 'WP'">work</xsl:when>
                        <xsl:when test="$emailType = 'HP'">home</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="doContactDetails" select="if ($filterprivate) then not($emailType[. = $filterValues]) else true()" as="xs:boolean"/>
                <xsl:if test="$doContactDetails">
                    <telecom>
                        <system value="email"/>
                        <xsl:for-each select="email_adres/@value | email_address/@value">
                            <value value="{normalize-space(.)}"/>
                        </xsl:for-each>
                        <xsl:if test="$emailTypeValue">
                            <use value="{$emailTypeValue}">
                                <xsl:choose>
                                    <xsl:when test="$emailType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                        <xsl:call-template name="ext-code-specification-1.0">
                                            <xsl:with-param name="in" select="$emailType/parent::*"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                            </use>
                        </xsl:if>
                    </telecom>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>