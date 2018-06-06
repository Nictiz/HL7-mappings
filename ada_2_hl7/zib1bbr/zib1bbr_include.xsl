<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
    <!--<xsl:include href="../hl7/hl7_include.xsl"/>-->
    
    <!-- addEnding checks baseString if it ends in endString, and if not adds it at the end. -->
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
    
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
        <!-- name person NL - generic -->
        <xsl:param name="naamgegevens"/>
        
        <xsl:for-each select="$naamgegevens">
            <xsl:for-each select="./voornamen">
                <given qualifier="BR">
                    <xsl:value-of select="./@value"/>
                </given>
            </xsl:for-each>
            <xsl:for-each select="./initialen">
                <given qualifier="IN">
                    <xsl:value-of select="nf:addEnding(./@value, '.')"/>
                </given>
            </xsl:for-each>
            <xsl:for-each select="./roepnaam">
                <given qualifier="CL">
                    <xsl:value-of select="./@value"/>
                </given>
            </xsl:for-each>

            <xsl:choose>
                <xsl:when test="./naamgebruik/@code = 'NL1'">
                    <!-- Eigen geslachtsnaam -->
                    <xsl:for-each select="./geslachtsnaam/voorvoegsels">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam/achternaam">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="./naamgebruik/@code = 'NL2'">
                    <!-- 	Geslachtsnaam partner -->
                    <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels_partner">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam_partner/achternaam_partner">
                        <family qualifier="SP">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="./naamgebruik/@code = 'NL3'">
                    <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                    <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels_partner">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam_partner/achternaam_partner">
                        <family qualifier="SP">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam/voorvoegsels">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam/achternaam">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="./naamgebruik/@code = 'NL4'">
                    <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                    <xsl:for-each select="./geslachtsnaam/voorvoegsels">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam/achternaam">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels_partner">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam_partner/achternaam_partner">
                        <family qualifier="SP">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we nemen aan NL1 - alleen de eigen naam -->
                    <xsl:for-each select="./geslachtsnaam/voorvoegsels">
                        <prefix qualifier="VV">
                            <xsl:value-of select="./@value"/>
                        </prefix>
                    </xsl:for-each>
                    <xsl:for-each select="./geslachtsnaam/achternaam">
                        <family qualifier="BR">
                            <xsl:value-of select="./@value"/>
                        </family>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!-- suffix (nog) niet in gebruik -->
        <!-- validTime (nog) niet in gebruik -->
    </xsl:template>
    
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20170602000000">
        <!-- address NL - generic  (van repository: zib2015bbr-) -->
        <xsl:param name="adres"/>
        
        <addr>
            <xsl:attribute name="use" select="./adres_soort[1]/@code"/>
            <xsl:for-each select="./straat">
                <streetName><xsl:value-of select="./@value"/></streetName> 
            </xsl:for-each>
            <xsl:for-each select="./huisnummer">
                <houseNumber><xsl:value-of select="./@value"/></houseNumber>
            </xsl:for-each>
            <xsl:if test="./huisnummerletter or ./huisnummertoevoeging">
                <buildingNumberSuffix>
                    <xsl:value-of select="./huisnummerletter/@value"/>
                    <!-- voeg scheidende spatie toe als beide aanwezig -->
                    <xsl:if test="./huisnummerletter and ./huisnummertoevoeging"><xsl:text> </xsl:text></xsl:if>  
                    <xsl:value-of select="./huisnummertoevoeging/@value"/>
                </buildingNumberSuffix>
            </xsl:if>
            <xsl:for-each select="./aanduiding_bij_nummer">
                <additionalLocator><xsl:value-of select="./@code"/></additionalLocator>
            </xsl:for-each>
            <xsl:for-each select="./postcode">
                <postalCode><xsl:value-of select="./@value"/></postalCode>
            </xsl:for-each>
            <xsl:for-each select="./gemeente">
                <county><xsl:value-of select="./@value"/></county>
            </xsl:for-each>
            <xsl:for-each select="./woonplaats">
                <city><xsl:value-of select="./@value"/></city>
            </xsl:for-each>
            <xsl:for-each select="./land">
                <country><xsl:value-of select="./@value"/></country>
            </xsl:for-each>
            <!-- Additionele informatie wordt geschrapt uit de definitie
                <xsl:for-each select="./additioneleinformatie">
                <unitID><xsl:value-of select="./@value"/></unitID>
            </xsl:for-each>-->
            <!-- UseablePeriod nog niet geimplementeerd - kan niet in ADA forms opgegeven worden. -->
        </addr>
    </xsl:template>
    
    
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
        <!-- CDA recordTarget SDTC NL BSN Contactible -->
        <xsl:param name="patient"/>
        <xsl:for-each select="$patient">
            <recordTarget>
                <patientRole>
                    <xsl:for-each select="./patient_identificatienummer">
                        <xsl:call-template name="makeIIValue">
                            <xsl:with-param name="root" select="./@root"/>
                            <xsl:with-param name="elemName">id</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- Adres -->
                    <xsl:for-each select="./adresgegevens">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20170602000000">
                            <xsl:with-param name="adres" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!--Telecom gegevens-->
                    <xsl:for-each select=".//telefoonnummers">
                        <telecom>
                            <xsl:attribute name="use" select="./nummer_soort/@code"/>
                            <xsl:attribute name="value">
                                <xsl:text>tel:</xsl:text>
                                <xsl:value-of select="./telefoonnummer/@value"/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each>
                    
                    <xsl:for-each select=".//email_adressen">
                        <telecom>
                            <xsl:attribute name="use" select="./email_soort/@code"/>
                            <xsl:attribute name="value">
                                <xsl:text>mailto:</xsl:text>
                                <xsl:value-of select="./email_adres/@value"/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each>
                    
                    
                    <patient>
                        <xsl:for-each select="./naamgegevens">
                            <name>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                                    <xsl:with-param name="naamgegevens" select="."/>
                                </xsl:call-template>
                            </name>
                        </xsl:for-each>
                        <xsl:for-each select="./geslacht">
                            <administrativeGenderCode>
                                <xsl:call-template name="makeCodeAttribs"/>
                            </administrativeGenderCode>
                        </xsl:for-each>
                        <xsl:for-each select="./geboortedatum">
                            <birthTime value="19840512">
                                <xsl:call-template name="makeTSValueAttr"/>
                            </birthTime>
                        </xsl:for-each>
                        <!-- meerlingindicator -->
                        <xsl:for-each select="./meerling_indicator">
                            <multipleBirthInd xmlns="urn:hl7-org:sdtc">
                                <xsl:call-template name="makeBLAttribute">
                                    <xsl:with-param name="inputValue" select="./@value"/>
                                </xsl:call-template>
                            </multipleBirthInd>
                        </xsl:for-each>
                    </patient>
                </patientRole>
            </recordTarget>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
