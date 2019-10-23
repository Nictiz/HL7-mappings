<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc>
        <xd:desc/>
        <xd:param name="in">Nodes to consider. Defaults to context node</xd:param>
        <xd:param name="unstructuredName">Node to consider for an unstructured name which is part of <xd:ref name="in" type="parameter"/></xd:param>
    </xd:doc>
    <xsl:template name="nl-core-humanname-2.0" match="naamgegevens | name_information" mode="doNameInformation" as="element(f:name)*">
        <xsl:param name="in" select="." as="element()*"/>
        <!-- unstructured-name, not supported in zib datamodel, may be customized per transaction, therefore parameterized in this template -->
        <xsl:param name="unstructuredName" select="ongestructureerde_naam | unstructured_name" as="element()?"/>
        <xsl:for-each select="$in[.//@value]">
            <name>
                <xsl:for-each select="naamgebruik[@code] | name_usage[@code]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                        <valueCode value="{@code}"/>
                    </extension>
                </xsl:for-each>
                <xsl:if test="string-length($unstructuredName/@value) gt 0">
                    <text>
                        <xsl:copy-of select="$unstructuredName/@value"/>
                    </text>
                </xsl:if>
                <xsl:if test="geslachtsnaam[.//@value] | geslachtsnaam_partner[.//@value] | last_name[.//@value] | last_name_partner[.//@value]">
                    <xsl:variable name="lastName" select="normalize-space(string-join((.//geslachtsnaam/voorvoegsels/@value, .//geslachtsnaam/achternaam/@value, ./last_name/prefix/@value, ./last_name/last_name/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="lastNamePartner" select="normalize-space(string-join((.//voorvoegsels_partner/@value, .//achternaam_partner/@value, .//partner_prefix/@value, .//partner_last_name/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="nameUsage" select="naamgebruik/@code | name_usage/@code"/>
                    <family>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <!-- Eigen geslachtsnaam -->
                                <xsl:when test="$nameUsage = 'NL1'">
                                    <xsl:value-of select="$lastName"/>
                                </xsl:when>
                                <!--     Geslachtsnaam partner -->
                                <xsl:when test="$nameUsage = 'NL2'">
                                    <xsl:value-of select="$lastNamePartner"/>
                                </xsl:when>
                                <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                                <xsl:when test="$nameUsage = 'NL3'">
                                    <xsl:value-of select="string-join(($lastNamePartner, $lastName), '-')"/>
                                </xsl:when>
                                <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                                <xsl:when test="$nameUsage = 'NL4'">
                                    <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                                </xsl:when>
                                <!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
                                <xsl:otherwise>
                                    <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:for-each select=".//geslachtsnaam/voorvoegsels/@value | ./last_name/prefix/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//geslachtsnaam/achternaam/@value | ./last_name/last_name/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                                <valueString value="{normalize-space(.)}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//voorvoegsels_partner/@value | .//partner_prefix/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//achternaam_partner/@value | .//partner_last_name/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                                <valueString value="{normalize-space(.)}"/>
                            </extension>
                        </xsl:for-each>
                    </family>
                </xsl:if>
                <xsl:for-each select="voornamen/@value | first_names/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="BR"/>
                        </extension>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="initialen/@value | initials/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="IN"/>
                        </extension>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="roepnaam/@value | given_name/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="CL"/>
                        </extension>
                    </given>
                </xsl:for-each>
            </name>
        </xsl:for-each>
        <xsl:if test="$in[not(.//@value)] and string-length($unstructuredName/@value) gt 0">
            <name>
                <text>
                    <xsl:copy-of select="$unstructuredName/@value"/>
                </text>
            </name>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>