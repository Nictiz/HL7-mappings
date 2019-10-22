<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc>
        <xd:param name="in">Nodes to consider. Defaults to context node</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-contactpoint-1.0" match="contactgegevens | contact_information" mode="doContactInformation" as="element(f:telecom)*">
        <xsl:param name="in" select="." as="element()*"/>
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
                        <xsl:when test="not($telecomType = 'UNK')">other</xsl:when>
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
                <telecom>
                    <system>
                        <xsl:choose>
                            <xsl:when test="empty($telecomTypeValue) and $telecomType/../@codeSystem = $oidHL7NullFlavor">
                                <xsl:call-template name="NullFlavor-to-DataAbsentReason">
                                    <xsl:with-param name="in" select="$telecomType/parent::*"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="empty($telecomTypeValue)">
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="value" select="$telecomTypeValue"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="$telecomType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                <extension url="{$urlExtNLCodeSpecification}">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="$telecomType/parent::*"/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:when>
                        </xsl:choose>
                    </system>
                    <value value="{telefoonnummer/@value | telephone_number/@value}"/>
                    <xsl:if test="$numberTypeValue">
                        <use value="{$numberTypeValue}">
                            <xsl:choose>
                                <xsl:when test="$numberType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                    <extension url="{$urlExtNLCodeSpecification}">
                                        <valueCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="$numberType/parent::*"/>
                                            </xsl:call-template>
                                        </valueCodeableConcept>
                                    </extension>
                                </xsl:when>
                            </xsl:choose>
                        </use>
                    </xsl:if>
                </telecom>
            </xsl:for-each>
            <xsl:for-each select="email_adressen[email_adres/@value] | email_addresses[email_address/@value]">
                <xsl:variable name="emailType" select="email_soort/@code | email_address_type/@code"/>
                <xsl:variable name="emailTypeValue" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$emailType = 'WP'">work</xsl:when>
                        <xsl:when test="$emailType = 'HP'">home</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <telecom>
                    <system value="email"/>
                    <value value="{email_adres/@value | email_address/@value}"/>
                    <xsl:if test="$emailTypeValue">
                        <use value="{$emailTypeValue}">
                            <xsl:choose>
                                <xsl:when test="$emailType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                    <extension url="{$urlExtNLCodeSpecification}">
                                        <valueCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="$emailType/parent::*"/>
                                            </xsl:call-template>
                                        </valueCodeableConcept>
                                    </extension>
                                </xsl:when>
                            </xsl:choose>
                        </use>
                    </xsl:if>
                </telecom>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>