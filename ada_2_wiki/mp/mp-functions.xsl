<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:strip-space elements="*"/>
    
    <!-- uncomment if wanted during development and if the wiki-functions.xsl is not imported already from a calling xsl -->
<!--    <xsl:import href="../wiki/wiki-functions.xsl"></xsl:import>-->

    <xd:doc>
        <xd:desc>Function to create a nice dosering string based on the structured input.</xd:desc>
        <xd:param name="doseerinstructie">Input ada element doseerinstructie</xd:param>
        <xd:param name="amount-doseerinstructies">The number of doseerinstructies, this is needed to help create order in the doseringsstring</xd:param>
    </xd:doc>
    <xsl:function name="nf:dosering-string" as="xs:string">
        <xsl:param name="doseerinstructie" as="element()?"/>
        <xsl:param name="amount-doseerinstructies" as="xs:integer"/>
        <xsl:for-each select="$doseerinstructie">
            <xsl:variable name="doseerduur" select="./doseerduur"/>
            <xsl:variable name="doseerduur-string" as="xs:string*">
                <xsl:choose>
                    <xsl:when test="$amount-doseerinstructies gt 1">
                        <xsl:choose>
                            <xsl:when test="not(./volgnummer/@value)"/>
                            <xsl:when test="./volgnummer/@value = 1">eerst</xsl:when>
                            <xsl:otherwise>dan </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="./doseerduur[@value]">
                    <xsl:value-of select="concat('gedurende ', ./doseerduur/@value, ' ', nf:unit-string(./doseerduur/@value, ./doseerduur/@unit))"/>
                </xsl:if>
            </xsl:variable>

            <!-- todo: dosering kan herhalen voor use case 's ochtends 1 stuk, 's avonds 2 stuks... -->
            <xsl:variable name="zo-nodig" as="xs:string*">
                <xsl:value-of select="./dosering/zo_nodig/criterium/code/@displayName"/>
            </xsl:variable>
            <xsl:variable name="frequentie" select="./dosering/toedieningsschema/frequentie[.//(@value | @code)]"/>
            <xsl:variable name="frequentie-string" as="xs:string*">
                <xsl:choose>
                    <!-- vaste waarde -->
                    <xsl:when test="$frequentie/aantal/vaste_waarde[@value]">
                        <xsl:value-of select="$frequentie/aantal/vaste_waarde/@value"/>
                    </xsl:when>
                    <!-- min/max -->
                    <xsl:when test="$frequentie/aantal/min | max[@value]">
                        <xsl:if test="$frequentie/aantal/min/@value and not($frequentie/aantal/max/@value)">minimaal </xsl:if>
                        <xsl:if test="$frequentie/aantal/max/@value and not($frequentie/aantal/min/@value)">maximaal </xsl:if>
                        <xsl:if test="$frequentie/aantal/min/@value">
                            <xsl:value-of select="$frequentie/aantal/min/@value"/>
                        </xsl:if>
                        <xsl:if test="$frequentie/aantal/min/@value and $frequentie/aantal/max/@value"> à </xsl:if>
                        <xsl:if test="$frequentie/aantal/max/@value">
                            <xsl:value-of select="$frequentie/aantal/max/@value"/>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$frequentie">
                    <xsl:variable name="frequentie-value">
                        <xsl:choose>
                            <xsl:when test="xs:int($frequentie/tijdseenheid/@value) gt 1">
                                <xsl:value-of select="concat($frequentie/tijdseenheid/@value, ' ')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:value-of select="concat('maal per ', $frequentie-value, nf:unit-string($frequentie/tijdseenheid/@value, $frequentie/tijdseenheid/@unit))"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="interval" select="./dosering/toedieningsschema/interval[(@value | @unit)]"/>
            <xsl:variable name="interval-string" as="xs:string?">
                <xsl:if test="$interval">
                    <xsl:value-of select="concat('exact iedere ', $interval/@value, ' ', nf:unit-string($interval/@value,$interval/@unit))"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="toedientijd" select="./dosering/toedieningsschema/toedientijd[@value]"/>
            <xsl:variable name="toedientijd-string" as="xs:string*">
                <xsl:if test="$toedientijd">
                    <xsl:if test="not($frequentie)">elke dag</xsl:if>
                    <xsl:value-of select="'om'"/>
                    <xsl:value-of select="string-join($toedientijd[position() lt last()]/nf:datetime-2-timestring(@value), ', ')"/>
                    <xsl:if test="count($toedientijd) gt 1">
                        <xsl:value-of select="concat(' en ', $toedientijd[last()]/nf:datetime-2-timestring(@value))"/>
                    </xsl:if>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="toedieningssnelheid" select="./dosering/toedieningssnelheid[.//(@value | @code)]"/>
            <xsl:variable name="toedieningssnelheid-string" as="xs:string*">
                <xsl:choose>
                    <!-- vaste waarde -->
                    <xsl:when test="$toedieningssnelheid/waarde/vaste_waarde[@value]">
                        <xsl:value-of select="$toedieningssnelheid/waarde/vaste_waarde/@value"/>
                    </xsl:when>
                    <!-- min/max -->
                    <xsl:when test="$toedieningssnelheid/waarde/min | max[@value]">
                        <xsl:if test="$toedieningssnelheid/waarde/min/@value and not($toedieningssnelheid/waarde/max/@value)">minimaal </xsl:if>
                        <xsl:if test="$toedieningssnelheid/waarde/max/@value and not($toedieningssnelheid/waarde/min/@value)">maximaal </xsl:if>
                        <xsl:if test="$toedieningssnelheid/waarde/min/@value">
                            <xsl:value-of select="$toedieningssnelheid/waarde/min/@value"/>
                        </xsl:if>
                        <xsl:if test="$toedieningssnelheid/waarde/min/@value and $toedieningssnelheid/waarde/max/@value"> à </xsl:if>
                        <xsl:if test="$toedieningssnelheid/waarde/max/@value">
                            <xsl:value-of select="$toedieningssnelheid/waarde/max/@value"/>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$toedieningssnelheid">
                    <xsl:value-of select="
                            concat(nf:unit-string(1, $toedieningssnelheid/eenheid/@displayName), ' per ', if ($toedieningssnelheid/tijdseenheid/@value ne '1') then
                            concat($toedieningssnelheid/tijdseenheid/@value, ' ', nf:unit-string($toedieningssnelheid/tijdseenheid/@value, $toedieningssnelheid/tijdseenheid/@unit))
                            else
                            '', nf:unit-string($toedieningssnelheid/tijdseenheid/@value, $toedieningssnelheid/tijdseenheid/@unit))"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="toedieningsduur" select="./dosering/toedieningsduur[(@value | @unit)]"/>
            <xsl:variable name="toedieningsduur-string" as="xs:string?">
                <xsl:if test="$toedieningsduur">
                    <xsl:value-of select="concat('gedurende ', $toedieningsduur/@value, ' ', nf:unit-string($toedieningsduur/@value, $toedieningsduur/@unit))"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="weekdag" select="./dosering/toedieningsschema/weekdag[.//(@value | @code)]"/>
            <xsl:variable name="weekdag-string" as="xs:string*">
                <xsl:if test="$weekdag">op </xsl:if>
                <xsl:value-of select="string-join($weekdag[position() lt last()]/@displayName, ', ')"/>
                <xsl:if test="count($weekdag) gt 1">en </xsl:if>
                <xsl:value-of select="$weekdag[last()]/@displayName"/>

            </xsl:variable>
            <xsl:variable name="keerdosis" select="./dosering/keerdosis"/>
            <xsl:variable name="keerdosis-string" as="xs:string*">
                <xsl:choose>
                    <!-- vaste waarde -->
                    <xsl:when test="$keerdosis/aantal/vaste_waarde[@value]">
                        <xsl:value-of select="$keerdosis/aantal/vaste_waarde/@value"/>
                    </xsl:when>
                    <!-- min/max -->
                    <xsl:when test="$keerdosis/aantal/min | max[@value]">
                        <xsl:if test="$keerdosis/aantal/min/@value and not($keerdosis/aantal/max/@value)">minimaal</xsl:if>
                        <xsl:if test="$keerdosis/aantal/max/@value and not($keerdosis/aantal/min/@value)">maximaal</xsl:if>
                        <xsl:if test="$keerdosis/aantal/min/@value">
                            <xsl:value-of select="$keerdosis/aantal/min/@value"/>
                        </xsl:if>
                        <xsl:if test="$keerdosis/aantal/min/@value and $keerdosis/aantal/max/@value"> à </xsl:if>
                        <xsl:if test="$keerdosis/aantal/max/@value">
                            <xsl:value-of select="$keerdosis/aantal/max/@value"/>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>
                <xsl:variable name="max-aantal" select="max($keerdosis/aantal/(min | vaste_waarde | max)/@value)"/>
                <xsl:value-of select="nf:unit-string($max-aantal, $keerdosis/eenheid/@displayName)"/>
            </xsl:variable>
            <xsl:variable name="dagdeel" select="./dosering/toedieningsschema/dagdeel[.//(@value | @code)]"/>
            <xsl:variable name="dagdeel-string" as="xs:string*">
                <xsl:value-of select="string-join($dagdeel[position() lt last()]/@displayName, ', ')"/>
                <xsl:if test="count($dagdeel) gt 1">en </xsl:if>
                <xsl:value-of select="$dagdeel[last()]/@displayName"/>
            </xsl:variable>
            <xsl:variable name="maxdose" select="./dosering/zo_nodig/maximale_dosering[.//(@value | @code)]"/>
            <xsl:variable name="maxdose-string" as="xs:string*">
                <xsl:if test="$maxdose">
                    <xsl:value-of select="', maximaal'"/>
                    <xsl:value-of select="$maxdose/aantal/@value"/>
                    <xsl:value-of select="nf:unit-string($maxdose/aantal/@value, $maxdose/eenheid/@displayName)"/>
                    <xsl:value-of select="'per'"/>
                    <xsl:if test="$maxdose/tijdseenheid/@value ne '1'">
                        <xsl:value-of select="$maxdose/tijdseenheid/@value"/>
                    </xsl:if>
                    <xsl:value-of select="nf:unit-string($maxdose/tijdseenheid/@value, $maxdose/tijdseenheid/@unit)"/>
                </xsl:if>
            </xsl:variable>

            <xsl:value-of select="normalize-space(concat(string-join($doseerduur-string, ' '), string-join($zo-nodig, ' '), ' ', string-join($weekdag-string, ' '), ' ', string-join($frequentie-string, ' '), $interval-string, ' ', string-join($toedientijd-string, ' '), ' ', string-join($toedieningssnelheid-string, ' '), ' ', string-join($keerdosis-string, ' '), ' ', string-join($dagdeel-string, ' '), ' ', $toedieningsduur-string, string-join($maxdose-string, ' ')))"/>
        </xsl:for-each>
    </xsl:function>


</xsl:stylesheet>
