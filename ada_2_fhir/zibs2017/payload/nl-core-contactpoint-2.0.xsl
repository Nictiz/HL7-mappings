<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- uncomment for development purposes -->
    <!--    <xsl:import href="all-zibs.xsl"/>-->

    <!-- This XSLT is for MedMij 2020.01, contactpoint has  backwards incompatible change in that release -->
    <!-- Unfortunately, in the past we have chosen to add the profile version in the template name, which we can't touch right now, because it would impact other code too much -->
    <!-- so the template name remains identical to that in the nl-core-contactpoint-1.0.xsl, that way we can leave practitioner, organization and patient XSLT's untouched -->
    <!-- we influence the correct template version by importing the correct xslt-file in the appropriactie package-x.x.x.xsl file -->

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
                    <xsl:for-each select="$telecomType/..">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-ContactInformation-TelecomType">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="treatNullFlavorAsCoding" select="true()"/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
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
                    </system>
                    <xsl:for-each select="(telefoonnummer | telephone_number)/@value">
                        <value value="{normalize-space(.)}"/>
                    </xsl:for-each>
                    <xsl:if test="$numberTypeValue">
                        <use value="{$numberTypeValue}"/>
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
                    <xsl:for-each select="(email_adres | email_address)/@value">
                        <value value="{normalize-space(.)}"/>
                    </xsl:for-each>
                    <xsl:if test="$emailTypeValue">
                        <use value="{$emailTypeValue}"/>
                    </xsl:if>
                </telecom>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
