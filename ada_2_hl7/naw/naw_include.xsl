<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
    <!--<xsl:include href="../hl7/hl7_include.xsl"/>-->

    <!-- Function addEnding is already defined in zib1bbr.xsl. If that source is not included in the project, uncomment this block.   
    <!-\- addEnding checks baseString if it ends in endString, and if not adds it at the end. -\->
    <xsl:function name="nf:addEnding">
        <xsl:param name="baseString"/>
        <xsl:param name="endString"/>        
        
        <xsl:choose>
            <xsl:when test="substring($baseString, string-length($baseString)-string-length($endString)+1, string-length($endString)) eq $endString">
                <xsl:value-of select="$baseString"/>                    
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($baseString, $endString)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
-->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
        <!-- name person NL - generic -->
        <xsl:param name="naamgegevens"/>
        <xsl:for-each select="$naamgegevens">
            <name>
                <xsl:for-each select="./voornamen[@value]">
                    <given qualifier="BR">
                        <xsl:value-of select="./@value"/>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="./initialen[@value]">
                    <given qualifier="IN">
                        <xsl:value-of select="nf:addEnding(./@value, '.')"/>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="./roepnaam[@value]">
                    <given qualifier="CL">
                        <xsl:value-of select="./@value"/>
                    </given>
                </xsl:for-each>

                <xsl:choose>
                    <xsl:when test="./naamgebruik/@code = 'NL1'">
                        <!-- Eigen geslachtsnaam -->
                        <xsl:for-each select="./geslachtsnaam/voorvoegsels[@value]">
                            <prefix qualifier="VV">
                                <xsl:value-of select="./@value"/>
                            </prefix>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam/achternaam[@value]">
                            <family qualifier="BR">
                                <xsl:value-of select="./@value"/>
                            </family>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="./naamgebruik/@code = 'NL2'">
                        <!-- 	Geslachtsnaam partner -->
                        <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels_partner[@value]">
                            <prefix qualifier="VV">
                                <xsl:value-of select="./@value"/>
                            </prefix>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam_partner/achternaam_partner[@value]">
                            <family qualifier="SP">
                                <xsl:value-of select="./@value"/>
                            </family>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="./naamgebruik/@code = 'NL3'">
                        <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                        <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels_partner[@value]">
                            <prefix qualifier="VV">
                                <xsl:value-of select="./@value"/>
                            </prefix>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam_partner/achternaam_partner[@value]">
                            <family qualifier="SP">
                                <xsl:value-of select="./@value"/>
                            </family>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam/voorvoegsels[@value]">
                            <prefix qualifier="VV">
                                <xsl:value-of select="./@value"/>
                            </prefix>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam/achternaam[@value]">
                            <family qualifier="BR">
                                <xsl:value-of select="./@value"/>
                            </family>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="./naamgebruik/@code = 'NL4'">
                        <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                        <xsl:for-each select="./geslachtsnaam/voorvoegsels[@value]">
                            <prefix qualifier="VV">
                                <xsl:value-of select="./@value"/>
                            </prefix>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam/achternaam[@value]">
                            <family qualifier="BR">
                                <xsl:value-of select="./@value"/>
                            </family>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels_partner[@value]">
                            <prefix qualifier="VV">
                                <xsl:value-of select="./@value"/>
                            </prefix>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam_partner/achternaam_partner[@value]">
                            <family qualifier="SP">
                                <xsl:value-of select="./@value"/>
                            </family>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- we nemen aan NL1 - alleen de eigen naam -->
                        <xsl:for-each select="./geslachtsnaam/voorvoegsels[@value]">
                            <prefix qualifier="VV">
                                <xsl:value-of select="./@value"/>
                            </prefix>
                        </xsl:for-each>
                        <xsl:for-each select="./geslachtsnaam/achternaam[@value]">
                            <family qualifier="BR">
                                <xsl:value-of select="./@value"/>
                            </family>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </name>
        </xsl:for-each>
        <!-- suffix (nog) niet in gebruik -->
        <!-- validTime (nog) niet in gebruik -->
    </xsl:template>

    <!-- Template verouderd: vervangen door ZIB template 2.16.840.1.113883.2.4.3.11.60.3.10.1.101 -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.2_20141106000000">
        <!--Adres-->
        <xsl:param name="adres"/>
        <xsl:for-each select="$adres/adresgegevens">
            <addr>
                <xsl:attribute name="use" select="./adres_soort[1]/@code"/>
                <xsl:for-each select="./straat">
                    <streetName>
                        <xsl:value-of select="./@value"/>
                    </streetName>
                </xsl:for-each>
                <xsl:for-each select="./huisnummer">
                    <houseNumber>
                        <xsl:value-of select="./@value"/>
                    </houseNumber>
                </xsl:for-each>
                <xsl:if test="./huisnummerletter or ./huisnummertoevoeging">
                    <buildingNumberSuffix>
                        <xsl:value-of select="./huisnummerletter/@value"/>
                        <!-- voeg scheidende spatie toe als beide aanwezig -->
                        <xsl:if test="./huisnummerletter and ./huisnummertoevoeging">
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="./huisnummertoevoeging/@value"/>
                    </buildingNumberSuffix>
                </xsl:if>
                <xsl:for-each select="./aanduiding_bij_nummer">
                    <additionalLocator>
                        <xsl:value-of select="./@code"/>
                    </additionalLocator>
                </xsl:for-each>
                <xsl:for-each select="./postcode">
                    <postalCode>
                        <xsl:value-of select="./@value"/>
                    </postalCode>
                </xsl:for-each>
                <xsl:for-each select="./woonplaats">
                    <city>
                        <xsl:value-of select="./@value"/>
                    </city>
                </xsl:for-each>
                <xsl:for-each select="./gemeente">
                    <county>
                        <xsl:value-of select="./@value"/>
                    </county>
                </xsl:for-each>
                <xsl:for-each select="./land">
                    <!--TODO:  <county code="0518" codeSystem="2.16.840.1.113883.2.4.6.14" codeSystemName="GBA-33">Den Haag</county> -->
                    <country>
                        <xsl:value-of select="./@value"/>
                    </country>
                </xsl:for-each>
                <!-- Additionele informatie wordt geschrapt uit de definitie
                    <xsl:for-each select="./additioneleinformatie">
                    <unitID><xsl:value-of select="./@value"/></unitID>
                </xsl:for-each>-->
            </addr>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
