<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc>
        <xd:desc/>
        <xd:param name="in">Nodes to consider. Defaults to context node</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-address-2.0" match="adresgegevens | address_information" mode="doAddressInformation" as="element(f:address)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value | .//@code]">
            <xsl:variable name="lineItems" as="element()*">
                <xsl:for-each select="straat/@value | street/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="huisnummer/@value | house_number/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="huisnummerletter/@value | huisnummertoevoeging/@value | house_number_letter/@value | house_number_addition/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="additionele_informatie/@value | additional_information/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="aanduiding_bij_nummer/@value | house_number_indication/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
            </xsl:variable>
            <address>
                <!-- adres_soort -->
                <xsl:for-each select="adres_soort[@codeSystem = '2.16.840.1.113883.5.1119'][@code] | address_type[@codeSystem = '2.16.840.1.113883.5.1119'][@code]">
                    <xsl:choose>
                        <!-- Postadres -->
                        <xsl:when test="@code = 'PST'">
                            <!-- AWE, no use to be outputted for postal address, see https://simplifier.net/NictizSTU3-Zib2017/AdresSoortCodelijst-to-AddressUse -->
                            <!--     <use>
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="PST"/>
                                </extension>
                            </use>-->
                            <type value="postal"/>
                        </xsl:when>
                        <!-- Officieel adres -->
                        <xsl:when test="@code = 'HP'">
                            <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-address-official">
                                <valueCode value="true"/>
                            </extension>
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HP"/>
                                </extension>
                            </use>
                            <type value="physical"/>
                        </xsl:when>
                        <!-- Woon-/verblijfadres -->
                        <xsl:when test="@code = 'PHYS'">
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="PHYS"/>
                                </extension>
                            </use>
                            <type value="physical"/>
                        </xsl:when>
                        <!-- Tijdelijk adres -->
                        <xsl:when test="@code = 'TMP'">
                            <use value="temp"/>
                        </xsl:when>
                        <!-- Werkadres -->
                        <xsl:when test="@code = 'WP'">
                            <use value="work"/>
                        </xsl:when>
                        <!-- Vakantie adres -->
                        <xsl:when test="@code = 'HV'">
                            <use value="temp">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HV"/>
                                </extension>
                            </use>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:if test="$lineItems">
                    <line>
                        <xsl:attribute name="value" select="string-join($lineItems//*:valueString/@value, ' ')"/>
                        <xsl:copy-of select="$lineItems"/>
                    </line>
                </xsl:if>
                <xsl:for-each select="woonplaats/@value | place_of_residence/@value">
                    <city value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="gemeente/@value | municipality/@value">
                    <district value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="postcode/@value">
                    <postalCode value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="land/@value | country/@value">
                    <country value="{.}"/>
                </xsl:for-each>
            </address>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>