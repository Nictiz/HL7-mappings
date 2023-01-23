<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:hl7="urn:hl7-org:v3"
    xmlns:exslt="http://exslt.org/common"
    exclude-result-prefixes="xs xd hl7 xsi exslt"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Alexander Henket, Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> Conversie van een valide Dossieroverdrachtbericht op basis van BDS 4.0.0 (REPC_IN902120NL03) naar een valide versie op basis van BDS 3.2.6 (REPC_IN902120NL). Regelt zelf het bijwerken van de weergavenamen bij rubrieken, groepen en elementen. Laat de weergavenamen van waarden ongemoeid.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
            </xd:p>
            <xd:ul>
                <xd:li>07-06-2020 - Eerste versie</xd:li>
            </xd:ul>
            <xd:p><xd:b>License:</xd:b> Copyright © Nictiz</xd:p>
            <xd:p>This program is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.</xd:p>

            <xd:p>This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. <br/>See the GNU Lesser General Public License for more details.</xd:p>

            <xd:p>The full text of the license is available at http://www.gnu.org/copyleft/lesser.html</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:variable name="W0639_HL7_W0646_HL7_W0647_HL7">
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.639" name="W0639_HL7" displayName="W0639 RubriekID (HL7) alle" effectiveDate="2012-05-21T01:26:54" statusCode="final" versionLabel="326">
            <desc language="nl-NL">RubriekID voor alle rubrieken</desc>
            <conceptList>
                <concept code="R002" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Dossierinformatie" level="0" type="L"/>
                <concept code="R003" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Persoonsgegevens" level="0" type="L"/>
                <concept code="R005" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Betrokken JGZ-organisaties" level="0" type="L"/>
                <concept code="R006" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Huisarts" level="0" type="L"/>
                <concept code="R007" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Andere betrokken organisaties/hulpverleners" level="0" type="L"/>
                <concept code="R008" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Voor- of buitenschoolse voorzieningen/school" level="0" type="L"/>
                <concept code="R009" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Externe documenten" level="0" type="L"/>
                <concept code="R010" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Informatie over werkwijze JGZ" level="0" type="L"/>
                <concept code="R011" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Gezinssamenstelling" level="0" type="L"/>
                <concept code="R012" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Erfelijke belasting en ouderkenmerken" level="0" type="L"/>
                <concept code="R013" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Bedreigingen uit de directe omgeving" level="0" type="L"/>
                <concept code="R014" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Zwangerschap" level="0" type="L"/>
                <concept code="R015" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Bevalling" level="0" type="L"/>
                <concept code="R016" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Pasgeborene en eerste levensweken" level="0" type="L"/>
                <concept code="R018" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Activiteit" level="0" type="L"/>
                <concept code="R019" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Terugkerende anamnese" level="0" type="L"/>
                <concept code="R020" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Algemene indruk" level="0" type="L"/>
                <concept code="R021" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Functioneren" level="0" type="L"/>
                <concept code="R022" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Huid/haar/nagels" level="0" type="L"/>
                <concept code="R023" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Hoofd/hals" level="0" type="L"/>
                <concept code="R024" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Romp" level="0" type="L"/>
                <concept code="R025" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Bewegingsapparaat" level="0" type="L"/>
                <concept code="R026" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Genitalia/puberteitsontwikkeling" level="0" type="L"/>
                <concept code="R027" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Groei" level="0" type="L"/>
                <concept code="R030" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Psychosociaal en cognitief functioneren" level="0" type="L"/>
                <concept code="R031" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Motorisch functioneren" level="0" type="L"/>
                <concept code="R032" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Spraak- en taalontwikkeling" level="0" type="L"/>
                <concept code="R034" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Inschatten verhouding draaglast-draagkracht" level="0" type="L"/>
                <concept code="R035" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Ontvangen zorg" level="0" type="L"/>
                <concept code="R036" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Voorlichting, advies, instructie en begeleiding" level="0" type="L"/>
                <concept code="R037" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Hielprik pasgeborene" level="0" type="L"/>
                <concept code="R038" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Visus- en oogonderzoek" level="0" type="L"/>
                <concept code="R039" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Hartonderzoek" level="0" type="L"/>
                <concept code="R040" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Gehooronderzoek" level="0" type="L"/>
                <concept code="R041" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Rijksvaccinatieprogramma en andere vaccinaties" level="0" type="L"/>
                <concept code="R042" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Van Wiechen ontwikkelingsonderzoek" level="0" type="L"/>
                <concept code="R043" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="BFMT" level="0" type="L"/>
                <concept code="R045" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="SDQ" level="0" type="L"/>
                <concept code="R047" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Conclusies en vervolgstappen" level="0" type="L"/>
                <concept code="R048" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Zorgplan" level="0" type="L"/>
                <concept code="R049" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Screening logopedie" level="0" type="L"/>
                <concept code="R050" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Zorggegevens" level="0" type="L"/>
                <concept code="R051" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Niet-gespecificeerde gegevens" level="0" type="L"/>
                <concept code="R052" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Meldingen" level="0" type="L"/>
                <concept code="R054" codeSystem="2.16.840.1.113883.2.4.4.40.391" displayName="Screening psychosociale problemen" level="0" type="L"/>
            </conceptList>
        </valueSet>
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.646" name="W0646_HL7" displayName="W0646 GroepID" effectiveDate="2012-05-21T01:26:54" statusCode="final" versionLabel="326">
            <desc language="nl-NL">GroepID</desc>
            <conceptList>
                <concept code="G001" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Adres cliënt" level="0" type="L"/>
                <concept code="G002" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Telefoonnummer cliënt" level="0" type="L"/>
                <concept code="G003" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="WID cliënt" level="0" type="L"/>
                <concept code="G004" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Contactpersoon cliënt" level="0" type="L"/>
                <concept code="G005" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Contactpersonen/hulpverleners" level="0" type="L"/>
                <concept code="G006" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Voor- of buitenschoolse voorzieningen" level="0" type="L"/>
                <concept code="G007" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="G008" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="School" level="0" type="L"/>
                <concept code="G009" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Contactpersoon school" level="0" type="L"/>
                <concept code="G010" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Bezwaar overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="G011" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="G012" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Toestemming info aan derden" level="0" type="L"/>
                <concept code="G014" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Ouder/verzorger" level="0" type="L"/>
                <concept code="G015" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Ouder/verzorger_WID" level="0" type="L"/>
                <concept code="G016" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Ouder/verzorger_adres" level="0" type="L"/>
                <concept code="G017" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Ouder/verzorger_telefoon" level="0" type="L"/>
                <concept code="G018" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Broer/zus" level="0" type="L"/>
                <concept code="G019" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Erfelijke factor(en) in de familie" level="0" type="L"/>
                <concept code="G020" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Kenmerken ouder/verzorger" level="0" type="L"/>
                <concept code="G022" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Huid/haar/nagels" level="0" type="D"/>
                <concept code="G023" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Hoofd" level="0" type="L"/>
                <concept code="G024" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Wervelkolom" level="0" type="L"/>
                <concept code="G026" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Heupen" level="0" type="L"/>
                <concept code="G027" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Bovenste extremiteiten" level="0" type="D"/>
                <concept code="G028" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Onderste extremiteiten" level="0" type="L"/>
                <concept code="G036" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Taal" level="0" type="L"/>
                <concept code="G041" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Ontvangen zorg" level="0" type="L"/>
                <concept code="G042" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Voorlichting" level="0" type="L"/>
                <concept code="G044" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Geruis intensiteit" level="0" type="L"/>
                <concept code="G045" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="VWO vraag 27" level="0" type="D"/>
                <concept code="G058" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Indicatie en interventie" level="0" type="L"/>
                <concept code="G071" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="G072" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Toegevoegd bestand" level="0" type="L"/>
                <concept code="G073" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Taalsignaleringsinstrument" level="0" type="L"/>
                <concept code="G074" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Melding Verwijsindex risicojongeren" level="0" type="L"/>
                <concept code="G075" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Melding Veilig Thuis" level="0" type="L"/>
                <concept code="G076" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Vaccinatie" level="0" type="L"/>
                <concept code="G077" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Woonverband" level="0" type="L"/>
                <concept code="G078" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Zoon/dochter" level="0" type="L"/>
                <concept code="G081" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Zorgplan" level="0" type="L"/>
                <concept code="G082" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Andere organisaties/hulpverleners" level="0" type="L"/>
                <concept code="G083" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Niet gespecificeerde gegevens" level="0" type="L"/>
                <concept code="G084" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Consultatie Veilig Thuis" level="0" type="L"/>
                <concept code="G085" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Uitvoerende JGZ-organisatie" level="0" type="L"/>
                <concept code="G086" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Huisarts" level="0" type="L"/>
                <concept code="G087" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Opname ziekenhuis" level="0" type="L"/>
                <concept code="G088" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Afschrift JGZ-dossier verstrekt" level="0" type="L"/>
                <concept code="G089" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Bezwaar wetenschappelijk onderzoek" level="0" type="L"/>
                <concept code="G090" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Hielprik" level="0" type="D"/>
                <concept code="G091" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Verantwoordelijke JGZ-organisatie obv de BRP" level="0" type="L"/>
                <concept code="G092" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Zorgbeëindiging" level="0" type="L"/>
                <concept code="G093" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Status in zorg" level="0" type="L"/>
                <concept code="G094" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Vaccinatieschema" level="0" type="L"/>
                <concept code="G095" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Geplande vaccinatie" level="0" type="L"/>
                <concept code="G096" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid adres cliënt" level="0" type="L"/>
                <concept code="G097" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid contactpersoon" level="0" type="L"/>
                <concept code="G098" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid uitvoerende JGZ-organisatie" level="0" type="L"/>
                <concept code="G099" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid verantwoordelijke JGZ-organisatie" level="0" type="L"/>
                <concept code="G100" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid huisarts" level="0" type="L"/>
                <concept code="G101" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid andere betrokken organisatie/hulpverlener" level="0" type="L"/>
                <concept code="G102" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid contactpersoon/hulpverlener" level="0" type="L"/>
                <concept code="G103" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode zorg" level="0" type="L"/>
                <concept code="G104" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid voor- of buitenschoolse voorzieningen" level="0" type="L"/>
                <concept code="G105" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="G106" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid school" level="0" type="L"/>
                <concept code="G107" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geldigheid contactpersoon school" level="0" type="L"/>
                <concept code="G108" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode geel zien" level="0" type="L"/>
                <concept code="G109" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode opname kinderafdeling" level="0" type="L"/>
                <concept code="G110" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode duur zorg op maat" level="0" type="L"/>
                <concept code="G111" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Periode reactie" level="0" type="L"/>
                <concept code="G112" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Bloeddruk" level="0" type="D"/>
                <concept code="G113" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Afkapwaarden bloeddruk systolisch" level="0" type="D"/>
                <concept code="G114" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Afkapwaarden bloeddruk diastolisch" level="0" type="D"/>
                <concept code="G115" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Toestemming gegevensuitwisseling RVP" level="0" type="L"/>
            </conceptList>
        </valueSet>
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.647" name="W0647_HL7" displayName="W0647 BDS Elementen" effectiveDate="2012-05-21T01:26:54" statusCode="final" versionLabel="326">
            <desc language="nl-NL">BDS Elementen</desc>
            <conceptList>
                <concept code="1" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorvoegsel achternaam" level="0" type="L"/>
                <concept code="2" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Achternaam" level="0" type="L"/>
                <concept code="3" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorvoegsel geslachtsnaam" level="0" type="L"/>
                <concept code="4" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geslachtsnaam" level="0" type="L"/>
                <concept code="5" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Roepnaam" level="0" type="L"/>
                <concept code="6" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voornaam" level="0" type="L"/>
                <concept code="7" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="BSN" level="0" type="L"/>
                <concept code="8" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort adres" level="0" type="L"/>
                <concept code="9" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gemeente" level="0" type="L"/>
                <concept code="10" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Woonplaats" level="0" type="L"/>
                <concept code="11" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Straatnaam" level="0" type="L"/>
                <concept code="12" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisnummer" level="0" type="L"/>
                <concept code="13" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisletter" level="0" type="L"/>
                <concept code="14" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisnummertoevoeging" level="0" type="L"/>
                <concept code="15" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanduiding bij huisnummer" level="0" type="L"/>
                <concept code="16" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Postcode" level="0" type="L"/>
                <concept code="17" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Locatiebeschrijving" level="0" type="L"/>
                <concept code="18" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Indicatie geheim" level="0" type="L"/>
                <concept code="19" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geslacht" level="0" type="L"/>
                <concept code="20" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboortedatum" level="0" type="L"/>
                <concept code="21" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum overlijden" level="0" type="L"/>
                <concept code="22" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboorteplaats" level="0" type="L"/>
                <concept code="23" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboorteland" level="0" type="L"/>
                <concept code="24" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Nationaliteit" level="0" type="L"/>
                <concept code="26" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Land vanwaar ingeschreven" level="0" type="L"/>
                <concept code="27" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum vestiging in Nederland" level="0" type="L"/>
                <concept code="28" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Asielzoekerkind" level="0" type="L"/>
                <concept code="29" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum vertrek uit Nederland" level="0" type="L"/>
                <concept code="31" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisarts/huisartsenpraktijk naam" level="0" type="L"/>
                <concept code="42" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken organisatie/hulpverlener naam" level="0" type="L"/>
                <concept code="53" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ziektekostenverzekering" level="0" type="L"/>
                <concept code="55" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aantal dagdelen voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="56" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="58" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort onderwijs" level="0" type="L"/>
                <concept code="61" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voornaam ouder/verzorger" level="0" type="L"/>
                <concept code="62" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Relatie tot jeugdige ouder/verzorger" level="0" type="L"/>
                <concept code="63" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboortedatum ouder/verzorger" level="0" type="L"/>
                <concept code="64" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Overleden" level="0" type="L"/>
                <concept code="65" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum overlijden ouder/verzorger" level="0" type="L"/>
                <concept code="66" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opleiding ouder/verzorger" level="0" type="L"/>
                <concept code="67" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Werk ouder/verzorger" level="0" type="L"/>
                <concept code="68" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Inhoud beroep" level="0" type="L"/>
                <concept code="69" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Levensovertuiging" level="0" type="L"/>
                <concept code="70" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kenmerken ouder/verzorger" level="0" type="L"/>
                <concept code="71" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboorteland ouder/verzorger" level="0" type="L"/>
                <concept code="72" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum vestiging in Nederland ouder/verzorger" level="0" type="L"/>
                <concept code="73" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voornaam broer/zus" level="0" type="L"/>
                <concept code="74" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Relatie tot jeugdige broer/zus" level="0" type="L"/>
                <concept code="75" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geslacht broer/zus" level="0" type="L"/>
                <concept code="76" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboortedatum broer/zus" level="0" type="L"/>
                <concept code="78" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden broer/zus" level="0" type="L"/>
                <concept code="79" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Erfelijke belasting en ouderkenmerken nagevraagd" level="0" type="L"/>
                <concept code="80" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Erfelijk bepaalde ziekte in de familie" level="0" type="L"/>
                <concept code="81" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Familielid" level="0" type="L"/>
                <concept code="82" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zwangerschapsduur" level="0" type="L"/>
                <concept code="88" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Medicijnen soort" level="0" type="L"/>
                <concept code="91" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Roken tijdens de zwangerschap" level="0" type="L"/>
                <concept code="92" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Alcohol gebruik tijdens de zwangerschap" level="0" type="L"/>
                <concept code="93" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drugsgebruik tijdens de zwangerschap" level="0" type="L"/>
                <concept code="97" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Duur bevalling" level="0" type="L"/>
                <concept code="98" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Duur uitdrijving" level="0" type="L"/>
                <concept code="100" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ligging bij geboorte" level="0" type="L"/>
                <concept code="103" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kleur vruchtwater" level="0" type="L"/>
                <concept code="105" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="3 Navelvaten" level="0" type="L"/>
                <concept code="106" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden bevalling" level="0" type="L"/>
                <concept code="107" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden kraamperiode/kraamverzorging" level="0" type="L"/>
                <concept code="108" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Meerling" level="0" type="L"/>
                <concept code="109" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Volgnummer bij meerling" level="0" type="L"/>
                <concept code="110" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboortegewicht" level="0" type="L"/>
                <concept code="111" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Laagste gewicht" level="0" type="L"/>
                <concept code="112" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboortelengte" level="0" type="L"/>
                <concept code="113" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hoofdomtrek bij geboorte" level="0" type="L"/>
                <concept code="114" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Prematuur/serotien" level="0" type="L"/>
                <concept code="115" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Dysmatuur" level="0" type="L"/>
                <concept code="129" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Apgar score na 1 min" level="0" type="L"/>
                <concept code="130" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Apgar score na 5 min" level="0" type="L"/>
                <concept code="131" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aangeboren afwijkingen" level="0" type="L"/>
                <concept code="133" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden temperatuurverloop" level="0" type="L"/>
                <concept code="134" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden ademhaling" level="0" type="L"/>
                <concept code="135" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden drinken" level="0" type="L"/>
                <concept code="137" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vitamine K toegediend/voorgeschreven" level="0" type="L"/>
                <concept code="138" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gammaglobuline toegediend tegen Hepatitis B" level="0" type="L"/>
                <concept code="139" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geel zien" level="0" type="D"/>
                <concept code="140" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Oorzaak geel zien" level="0" type="L"/>
                <concept code="142" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Therapie" level="0" type="L"/>
                <concept code="143" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opname kinderafdeling" level="0" type="D"/>
                <concept code="144" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Couveuse" level="0" type="L"/>
                <concept code="145" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden pasgeborene en eerste levensweken" level="0" type="L"/>
                <concept code="146" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="A. femoralis rechts" level="0" type="L"/>
                <concept code="148" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Anamnese nagevraagd" level="0" type="L"/>
                <concept code="149" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Duur opname ziekenhuis" level="0" type="L"/>
                <concept code="150" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden opname ziekenhuis" level="0" type="L"/>
                <concept code="152" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="(Kinder-)ziekten" level="0" type="L"/>
                <concept code="153" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Operaties" level="0" type="L"/>
                <concept code="154" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ongevallen" level="0" type="L"/>
                <concept code="155" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Medicijn gebruik" level="0" type="L"/>
                <concept code="161" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huid/haar/nagels onderzocht" level="0" type="L"/>
                <concept code="163" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden huid/haar/nagels" level="0" type="L"/>
                <concept code="164" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting bijzonderheden huid/haar/nagels" level="0" type="L"/>
                <concept code="167" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hoofd/hals onderzocht" level="0" type="L"/>
                <concept code="170" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden hoofd" level="0" type="L"/>
                <concept code="174" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden trommelvlies rechts" level="0" type="L"/>
                <concept code="175" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden trommelvlies links" level="0" type="L"/>
                <concept code="176" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden neus" level="0" type="L"/>
                <concept code="179" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden mondgedrag" level="0" type="L"/>
                <concept code="184" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden tonsillen" level="0" type="L"/>
                <concept code="188" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Poetsen gebit" level="0" type="L"/>
                <concept code="190" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Tandartsbezoek" level="0" type="L"/>
                <concept code="193" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden gebit/kaak" level="0" type="L"/>
                <concept code="196" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Romp onderzocht" level="0" type="L"/>
                <concept code="201" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden thorax" level="0" type="L"/>
                <concept code="202" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden longen" level="0" type="L"/>
                <concept code="206" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lever" level="0" type="L"/>
                <concept code="207" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Milt" level="0" type="L"/>
                <concept code="209" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden navel" level="0" type="L"/>
                <concept code="210" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden lies rechts" level="0" type="L"/>
                <concept code="211" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden lies links" level="0" type="L"/>
                <concept code="212" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bewegingsapparaat onderzocht" level="0" type="L"/>
                <concept code="217" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden wervelkolom" level="0" type="L"/>
                <concept code="218" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Scoliose hoekmeting" level="0" type="L"/>
                <concept code="219" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden heupen" level="0" type="L"/>
                <concept code="220" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant bijzonderheden heupen" level="0" type="L"/>
                <concept code="221" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden onderste extremiteiten" level="0" type="L"/>
                <concept code="222" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant bijzonderheden onderste extremiteiten" level="0" type="L"/>
                <concept code="223" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden voet rechts" level="0" type="L"/>
                <concept code="225" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Genitalia/puberteitsontwikkeling onderzocht" level="0" type="L"/>
                <concept code="228" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden genitalia/puberteitsontwikkeling" level="0" type="L"/>
                <concept code="230" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden vulva" level="0" type="L"/>
                <concept code="232" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden penis" level="0" type="L"/>
                <concept code="233" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden scrotum rechts" level="0" type="L"/>
                <concept code="234" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden groei" level="0" type="L"/>
                <concept code="235" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lengte" level="0" type="L"/>
                <concept code="236" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode lengtemeting" level="0" type="L"/>
                <concept code="237" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Groeicurve lengte naar leeftijd" level="0" type="L"/>
                <concept code="238" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lengte biologische moeder" level="0" type="L"/>
                <concept code="239" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode lengtemeting moeder" level="0" type="L"/>
                <concept code="240" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lengte biologische vader" level="0" type="L"/>
                <concept code="241" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode lengtemeting vader" level="0" type="L"/>
                <concept code="245" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gewicht" level="0" type="L"/>
                <concept code="246" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode gewichtsmeting" level="0" type="L"/>
                <concept code="247" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Indruk JGZ professional gewicht/lengte" level="0" type="L"/>
                <concept code="248" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="BMI" level="0" type="L"/>
                <concept code="252" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hoofdomtrek" level="0" type="L"/>
                <concept code="253" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Groeicurve hoofdomtrek naar leeftijd" level="0" type="L"/>
                <concept code="259" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Psychosociaal en cognitief functioneren onderzocht" level="0" type="L"/>
                <concept code="265" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden psychische en sociale ontwikkeling" level="0" type="L"/>
                <concept code="268" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Motorische ontwikkeling onderzocht" level="0" type="L"/>
                <concept code="269" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden tonus" level="0" type="L"/>
                <concept code="271" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden centraal zenuwstelsel" level="0" type="L"/>
                <concept code="276" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden motorische ontwikkeling" level="0" type="L"/>
                <concept code="294" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Spraak- en taalontwikkeling onderzocht" level="0" type="L"/>
                <concept code="301" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Meertaligheid" level="0" type="L"/>
                <concept code="302" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Taal" level="0" type="L"/>
                <concept code="307" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Eerste/tweede taal" level="0" type="L"/>
                <concept code="312" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum menarche" level="0" type="L"/>
                <concept code="313" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ontwikkeling genitalia jongen" level="0" type="L"/>
                <concept code="314" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode onderzoek ontwikkeling genitalia jongen" level="0" type="L"/>
                <concept code="315" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pubesbeharing jongen" level="0" type="L"/>
                <concept code="316" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode onderzoek pubesbeharing jongen" level="0" type="L"/>
                <concept code="317" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Borstontwikkeling meisje" level="0" type="L"/>
                <concept code="318" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode onderzoek borstontwikkeling meisje" level="0" type="L"/>
                <concept code="321" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichamelijk functioneren nagevraagd" level="0" type="L"/>
                <concept code="322" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden slapen/waken" level="0" type="L"/>
                <concept code="323" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden voeding/eetgedrag" level="0" type="L"/>
                <concept code="324" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zindelijkheid" level="0" type="L"/>
                <concept code="325" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden ontlasten/plassen/zindelijkheid" level="0" type="L"/>
                <concept code="328" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden gedrag/temperament" level="0" type="L"/>
                <concept code="330" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden lichaamsbeweging" level="0" type="L"/>
                <concept code="339" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verhouding draaglast-draagkracht onderzocht" level="0" type="L"/>
                <concept code="348" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Balans" level="0" type="L"/>
                <concept code="349" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden verhouding draaglast-draagkracht" level="0" type="L"/>
                <concept code="360" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zorg ontvangen in gezin" level="0" type="L"/>
                <concept code="361" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Type zorg" level="0" type="L"/>
                <concept code="362" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zorg voor" level="0" type="L"/>
                <concept code="363" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting zorg" level="0" type="L"/>
                <concept code="364" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode zorg" level="0" type="D"/>
                <concept code="365" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden" level="0" type="L"/>
                <concept code="368" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hielprik afgenomen" level="0" type="L"/>
                <concept code="370" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende instantie hielprik" level="0" type="L"/>
                <concept code="373" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Type hielprik" level="0" type="L"/>
                <concept code="374" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum hielprik" level="0" type="L"/>
                <concept code="379" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden herhaling/tweede hielprik" level="0" type="L"/>
                <concept code="380" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden niet afgenomen hielprik" level="0" type="L"/>
                <concept code="381" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag" level="0" type="L"/>
                <concept code="390" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reflexbeeldje rechts" level="0" type="L"/>
                <concept code="391" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reflexbeeldje links" level="0" type="L"/>
                <concept code="392" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afdektest: geen instel beweging rechts" level="0" type="L"/>
                <concept code="393" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afdektest: geen instel beweging links" level="0" type="L"/>
                <concept code="394" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afdektest: geen herstel beweging rechts" level="0" type="L"/>
                <concept code="395" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afdektest: geen herstel beweging links" level="0" type="L"/>
                <concept code="396" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Volgbeweging binoculair rechts" level="0" type="L"/>
                <concept code="397" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Volgbeweging binoculair links" level="0" type="L"/>
                <concept code="398" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Volgbeweging monoculair rechts" level="0" type="L"/>
                <concept code="399" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Volgbeweging monoculair links" level="0" type="L"/>
                <concept code="402" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pupil zwart rechts" level="0" type="L"/>
                <concept code="403" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pupil zwart links" level="0" type="L"/>
                <concept code="404" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pupil rond rechts" level="0" type="L"/>
                <concept code="405" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pupil rond links" level="0" type="L"/>
                <concept code="406" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pupilreactie rechts" level="0" type="L"/>
                <concept code="407" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pupilreactie links" level="0" type="L"/>
                <concept code="408" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Conclusie visusbepaling" level="0" type="L"/>
                <concept code="422" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden testis rechts" level="0" type="L"/>
                <concept code="428" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Overige bijzonderheden hartonderzoek" level="0" type="L"/>
                <concept code="438" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gehooronderzoek uitgevoerd" level="0" type="L"/>
                <concept code="439" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag 1e NGS rechts" level="0" type="L"/>
                <concept code="441" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag 1e NGS links" level="0" type="L"/>
                <concept code="442" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag 2e NGS rechts" level="0" type="L"/>
                <concept code="444" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag 2e NGS links" level="0" type="L"/>
                <concept code="445" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag 3e NGS rechts" level="0" type="L"/>
                <concept code="447" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag 3e NGS links" level="0" type="L"/>
                <concept code="458" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Audiogram" level="0" type="L"/>
                <concept code="461" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort vaccinatie" level="0" type="L"/>
                <concept code="469" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="472" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Partijnummer" level="0" type="L"/>
                <concept code="476" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Informatie verstrekt over werkwijze JGZ" level="0" type="L"/>
                <concept code="480" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gegeven voorlichting" level="0" type="L"/>
                <concept code="481" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bedreiging sociaal milieu" level="0" type="L"/>
                <concept code="482" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Conclusie" level="0" type="L"/>
                <concept code="483" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Interventie" level="0" type="L"/>
                <concept code="485" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Indicatie" level="0" type="L"/>
                <concept code="487" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zorgbeëindiging" level="0" type="L"/>
                <concept code="488" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum zorgbeëindiging" level="0" type="L"/>
                <concept code="492" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Samenvatting 0-4" level="0" type="L"/>
                <concept code="493" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Notitieblad" level="0" type="L"/>
                <concept code="494" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort activiteit" level="0" type="L"/>
                <concept code="495" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting niet verschenen" level="0" type="L"/>
                <concept code="496" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Melkvoeding op dit moment" level="0" type="L"/>
                <concept code="510" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Passief roken in huis" level="0" type="L"/>
                <concept code="514" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ervaren gezondheid" level="0" type="L"/>
                <concept code="603" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-organisatie URA" level="0" type="L"/>
                <concept code="604" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisarts UZI" level="0" type="D"/>
                <concept code="605" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="School/brinnummer" level="0" type="L"/>
                <concept code="606" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Leerling/onderwijsnummer" level="0" type="L"/>
                <concept code="607" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gezinssamenstelling woonverband" level="0" type="L"/>
                <concept code="608" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Type oproepkaart" level="0" type="L"/>
                <concept code="609" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Telefoonnummer" level="0" type="L"/>
                <concept code="610" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort telefoonnummer" level="0" type="L"/>
                <concept code="619" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden (vorige) zwangerschap" level="0" type="L"/>
                <concept code="626" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting Apgar score" level="0" type="L"/>
                <concept code="629" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vaccinatie tegen Hepatitis B" level="0" type="L"/>
                <concept code="630" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Land" level="0" type="L"/>
                <concept code="631" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Indicatie gezag minderjarige" level="0" type="L"/>
                <concept code="655" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="BSN ouder/verzorger" level="0" type="L"/>
                <concept code="656" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorvoegsel achternaam ouder/verzorger" level="0" type="L"/>
                <concept code="657" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Achternaam ouder/verzorger" level="0" type="L"/>
                <concept code="658" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort adres ouder/verzorger" level="0" type="L"/>
                <concept code="659" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gemeente ouder/verzorger" level="0" type="L"/>
                <concept code="660" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Woonplaats ouder/verzorger" level="0" type="L"/>
                <concept code="661" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Straatnaam ouder/verzorger" level="0" type="L"/>
                <concept code="662" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisnummer ouder/verzorger" level="0" type="L"/>
                <concept code="663" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisletter ouder/verzorger" level="0" type="L"/>
                <concept code="664" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisnummertoevoeging ouder/verzorger" level="0" type="L"/>
                <concept code="665" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanduiding bij huisnummer ouder/verzorger" level="0" type="L"/>
                <concept code="666" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Postcode ouder/verzorger" level="0" type="L"/>
                <concept code="667" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Locatiebeschrijving ouder/verzorger" level="0" type="L"/>
                <concept code="669" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Land ouder/verzorger" level="0" type="L"/>
                <concept code="670" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum vertrek uit Nederland ouder/verzorger" level="0" type="L"/>
                <concept code="671" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorvoegsel achternaam broer/zus" level="0" type="L"/>
                <concept code="672" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Achternaam broer/zus" level="0" type="L"/>
                <concept code="683" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bezwaar" level="0" type="L"/>
                <concept code="686" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden van enting" level="0" type="L"/>
                <concept code="688" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken hulpverlener UZI" level="0" type="D"/>
                <concept code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts" level="0" type="L"/>
                <concept code="695" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Dossiernummer" level="0" type="L"/>
                <concept code="696" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Dossier status" level="0" type="L"/>
                <concept code="697" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Adres is geheim" level="0" type="L"/>
                <concept code="698" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="E-mail cliënt" level="0" type="L"/>
                <concept code="700" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID controle uitgevoerd" level="0" type="L"/>
                <concept code="701" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID controle datum" level="0" type="L"/>
                <concept code="702" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID aard" level="0" type="L"/>
                <concept code="703" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID nummer" level="0" type="L"/>
                <concept code="704" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam contactpersoon" level="0" type="L"/>
                <concept code="705" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Telefoonnummer contactpersoon" level="0" type="L"/>
                <concept code="706" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="E-mail contactpersoon" level="0" type="L"/>
                <concept code="707" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Laag- of niet geletterde" level="0" type="L"/>
                <concept code="708" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-professional UZI" level="0" type="D"/>
                <concept code="709" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisartsenpraktijk URA" level="0" type="D"/>
                <concept code="710" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam contactpersoon/hulpverlener" level="0" type="L"/>
                <concept code="711" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Functie contactpersoon/hulpverlener" level="0" type="L"/>
                <concept code="712" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Telefoon contactpersoon/hulpverlener" level="0" type="L"/>
                <concept code="713" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="E-mail contactpersoon/hulpverlener" level="0" type="L"/>
                <concept code="714" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voor- of buitenschoolse voorzieningen" level="0" type="L"/>
                <concept code="715" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="716" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden geen deelname aan peuterspeelzaal" level="0" type="L"/>
                <concept code="717" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Groep/klas" level="0" type="L"/>
                <concept code="719" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam contactpersoon school" level="0" type="L"/>
                <concept code="720" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Functie contactpersoon school" level="0" type="L"/>
                <concept code="721" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Telefoon contactpersoon school" level="0" type="L"/>
                <concept code="722" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="E-mail contactpersoon school" level="0" type="L"/>
                <concept code="723" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken hulpverlenersorganisatie URA" level="0" type="D"/>
                <concept code="724" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum activiteit" level="0" type="L"/>
                <concept code="725" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Status activiteit" level="0" type="L"/>
                <concept code="730" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende activiteit UZI" level="0" type="D"/>
                <concept code="731" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Begeleider" level="0" type="L"/>
                <concept code="732" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID controle ouder/verzorger uitgevoerd" level="0" type="L"/>
                <concept code="733" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID controle datum ouder/verzorger" level="0" type="L"/>
                <concept code="734" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID aard ouder/verzorger" level="0" type="L"/>
                <concept code="735" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="WID nummer ouder/verzorger" level="0" type="L"/>
                <concept code="736" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Telefoonnummer ouder/verzorger" level="0" type="L"/>
                <concept code="737" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort telefoonnummer ouder/verzorger" level="0" type="L"/>
                <concept code="738" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="E-mail ouder/verzorger" level="0" type="L"/>
                <concept code="739" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Risico-inventarisatie VGV" level="0" type="L"/>
                <concept code="740" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Graviditeit" level="0" type="L"/>
                <concept code="741" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pariteit" level="0" type="L"/>
                <concept code="745" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Type drugsgebruik tijdens de zwangerschap" level="0" type="L"/>
                <concept code="746" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="A. femoralis links" level="0" type="L"/>
                <concept code="747" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Melkvoeding op geboortedag" level="0" type="L"/>
                <concept code="748" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Anamnese" level="0" type="L"/>
                <concept code="752" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden vrijetijdsbesteding" level="0" type="L"/>
                <concept code="753" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zwemdiploma" level="0" type="L"/>
                <concept code="754" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ontvangen (para)medische zorg" level="0" type="L"/>
                <concept code="755" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ingrijpende gebeurtenissen" level="0" type="L"/>
                <concept code="756" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Algemene indruk verkregen" level="0" type="L"/>
                <concept code="757" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Interactie ouder/kind" level="0" type="L"/>
                <concept code="758" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Interactie kind/JGZ-professional" level="0" type="L"/>
                <concept code="759" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gedrag" level="0" type="L"/>
                <concept code="760" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Stemming" level="0" type="L"/>
                <concept code="761" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verzorging/hygiëne" level="0" type="L"/>
                <concept code="762" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ziek" level="0" type="L"/>
                <concept code="763" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorkeurshouding" level="0" type="L"/>
                <concept code="764" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant voorkeurshouding" level="0" type="L"/>
                <concept code="765" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden kleur huid" level="0" type="L"/>
                <concept code="766" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Snel vermoeid" level="0" type="L"/>
                <concept code="767" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Snel transpireren" level="0" type="L"/>
                <concept code="768" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Anders" level="0" type="L"/>
                <concept code="770" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Seksueel actief" level="0" type="L"/>
                <concept code="771" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Anticonceptie" level="0" type="L"/>
                <concept code="772" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Adaptatie/persoonlijkheid/sociaal gedrag nagevraagd" level="0" type="L"/>
                <concept code="773" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden hechting" level="0" type="L"/>
                <concept code="774" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden ouder-kind relatie" level="0" type="L"/>
                <concept code="775" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden karakter/persoonlijkheid" level="0" type="L"/>
                <concept code="776" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden zelfbeeld" level="0" type="L"/>
                <concept code="777" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden stemming/angsten" level="0" type="L"/>
                <concept code="778" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden ontdekkingsdrang" level="0" type="L"/>
                <concept code="779" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden zelfstandigheid" level="0" type="L"/>
                <concept code="780" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden begrijpen" level="0" type="L"/>
                <concept code="781" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden wilsontwikkeling" level="0" type="L"/>
                <concept code="782" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden contact met volwassenen" level="0" type="L"/>
                <concept code="783" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden omgaan met nieuwe situaties" level="0" type="L"/>
                <concept code="784" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden geweld/delinquent gedrag" level="0" type="L"/>
                <concept code="785" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden verslavingsrisico" level="0" type="L"/>
                <concept code="786" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting verslavingsrisico" level="0" type="L"/>
                <concept code="787" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Functioneren op school nagevraagd" level="0" type="L"/>
                <concept code="790" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden functioneren in de klas" level="0" type="L"/>
                <concept code="791" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden indruk school" level="0" type="L"/>
                <concept code="792" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden schoolverzuim" level="0" type="L"/>
                <concept code="793" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant bijzonderheden hoofd" level="0" type="L"/>
                <concept code="794" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden uiterlijk oor rechts" level="0" type="L"/>
                <concept code="795" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden uiterlijk oor links" level="0" type="L"/>
                <concept code="796" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden mond/tong" level="0" type="L"/>
                <concept code="797" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden hals" level="0" type="L"/>
                <concept code="798" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden abdomen" level="0" type="L"/>
                <concept code="799" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant bijzonderheden wervelkolom" level="0" type="L"/>
                <concept code="800" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hoogteverschil gibbus bij scoliose" level="0" type="L"/>
                <concept code="801" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant scoliose hoekmeting" level="0" type="L"/>
                <concept code="802" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden bovenste extremiteiten" level="0" type="L"/>
                <concept code="803" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant bijzonderheden bovenste extremiteiten" level="0" type="D"/>
                <concept code="804" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Beenlengteverschil" level="0" type="L"/>
                <concept code="805" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden voet links" level="0" type="L"/>
                <concept code="806" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Scrotale testes" level="0" type="L"/>
                <concept code="807" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden anus" level="0" type="L"/>
                <concept code="808" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden lengte ouders" level="0" type="L"/>
                <concept code="809" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Target height" level="0" type="L"/>
                <concept code="810" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Target Height Range" level="0" type="L"/>
                <concept code="811" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Groeicurve gewicht naar leeftijd" level="0" type="L"/>
                <concept code="812" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Groeicurve gewicht naar lengte" level="0" type="L"/>
                <concept code="813" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="BMI-curve" level="0" type="L"/>
                <concept code="814" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden cognitieve ontwikkeling" level="0" type="L"/>
                <concept code="815" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lateralisatie" level="0" type="L"/>
                <concept code="816" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Taalomgeving stimulerend" level="0" type="L"/>
                <concept code="817" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Taalsignaleringsinstrument" level="0" type="L"/>
                <concept code="818" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Beoordeling taalontwikkeling" level="0" type="L"/>
                <concept code="819" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden taalsignaleringsinstrument" level="0" type="L"/>
                <concept code="820" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aard bijzonderheden spraak- en taalontwikkeling" level="0" type="L"/>
                <concept code="821" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting aard bijzonderheden" level="0" type="L"/>
                <concept code="822" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Totaalscore SLS" level="0" type="L"/>
                <concept code="823" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Beoordeling spraak- en taalontwikkeling Nederlands" level="0" type="L"/>
                <concept code="824" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden menstruatie" level="0" type="L"/>
                <concept code="825" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Pubesbeharing meisje" level="0" type="L"/>
                <concept code="826" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode onderzoek pubesbeharing meisje" level="0" type="L"/>
                <concept code="827" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bedreiging fysiek milieu" level="0" type="L"/>
                <concept code="829" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Doel" level="0" type="L"/>
                <concept code="831" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bril/lenzen dragend" level="0" type="L"/>
                <concept code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links" level="0" type="L"/>
                <concept code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts" level="0" type="L"/>
                <concept code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links" level="0" type="L"/>
                <concept code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts" level="0" type="L"/>
                <concept code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links" level="0" type="L"/>
                <concept code="837" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Landolt-C-kaart uitslag rechts" level="0" type="L"/>
                <concept code="838" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Landolt-C-kaart uitslag links" level="0" type="L"/>
                <concept code="839" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden visusbepaling" level="0" type="L"/>
                <concept code="840" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Fundusreflex rechts" level="0" type="L"/>
                <concept code="841" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Fundusreflex links" level="0" type="L"/>
                <concept code="842" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden VOV-onderzoek" level="0" type="L"/>
                <concept code="851" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden inspectie oog" level="0" type="L"/>
                <concept code="852" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Ishiharatest" level="0" type="L"/>
                <concept code="853" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Dieptezien" level="0" type="L"/>
                <concept code="854" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag oogarts/orthoptist" level="0" type="L"/>
                <concept code="855" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hartonderzoek uitgevoerd" level="0" type="L"/>
                <concept code="856" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geruis intensiteit" level="0" type="L"/>
                <concept code="858" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geruis timing" level="0" type="L"/>
                <concept code="859" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lokalisatie" level="0" type="L"/>
                <concept code="860" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voortgeleiding" level="0" type="L"/>
                <concept code="861" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden harttonen" level="0" type="L"/>
                <concept code="862" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden hartritme" level="0" type="L"/>
                <concept code="863" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden gehooronderzoek" level="0" type="L"/>
                <concept code="864" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon aangeboden" level="0" type="L"/>
                <concept code="865" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag gehoorscreening" level="0" type="L"/>
                <concept code="869" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag serologisch onderzoek Hepatitis B" level="0" type="L"/>
                <concept code="870" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden afwijkend schema" level="0" type="L"/>
                <concept code="871" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting afwijkend schema" level="0" type="L"/>
                <concept code="872" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting afwijkende plaats vaccinatie" level="0" type="L"/>
                <concept code="873" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode reactie" level="0" type="D"/>
                <concept code="874" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verschijnselen" level="0" type="L"/>
                <concept code="875" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reactie gemeld aan bevoegde instantie datum" level="0" type="L"/>
                <concept code="876" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reactie gemeld aan bevoegde instantie door UZI" level="0" type="D"/>
                <concept code="877" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gedragstoestand Van Wiechen" level="0" type="L"/>
                <concept code="878" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Interactie Van Wiechen" level="0" type="L"/>
                <concept code="879" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="1. Ogen fixeren" level="0" type="L"/>
                <concept code="880" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 1" level="0" type="L"/>
                <concept code="881" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="2. Volgt met ogen èn hoofd 30º-0º-30º rechts" level="0" type="L"/>
                <concept code="882" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 2" level="0" type="L"/>
                <concept code="883" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="2. Volgt met ogen èn hoofd 30º-0º-30º links" level="0" type="L"/>
                <concept code="884" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="3. Handen af en toe open rechts" level="0" type="L"/>
                <concept code="885" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="3. Handen af en toe open links" level="0" type="L"/>
                <concept code="886" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="4. Kijkt naar eigen handen" level="0" type="L"/>
                <concept code="887" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="5. Speelt met handen middenvoor" level="0" type="L"/>
                <concept code="888" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="6. Pakt in rugligging voorwerp binnen bereik rechts" level="0" type="L"/>
                <concept code="889" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="6. Pakt in rugligging voorwerp binnen bereik links" level="0" type="L"/>
                <concept code="890" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="7. Pakt blokje over" level="0" type="L"/>
                <concept code="891" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="8. Houdt blokje vast, pakt er nog een in andere hand" level="0" type="L"/>
                <concept code="892" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="9. Speelt met beide voeten rechts" level="0" type="L"/>
                <concept code="893" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="9. Speelt met beide voeten links" level="0" type="L"/>
                <concept code="894" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="10. Pakt propje met duim en wijsvinger rechts" level="0" type="L"/>
                <concept code="895" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 10" level="0" type="L"/>
                <concept code="896" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="10. Pakt propje met duim en wijsvinger links" level="0" type="L"/>
                <concept code="897" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="11. Doet blokje in/uit doos rechts" level="0" type="L"/>
                <concept code="898" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="11. Doet blokje in/uit doos links" level="0" type="L"/>
                <concept code="899" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 11" level="0" type="L"/>
                <concept code="900" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="12. Speelt &#34;geven en nemen&#34;" level="0" type="L"/>
                <concept code="901" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 12" level="0" type="L"/>
                <concept code="902" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="13. Stapelt 2 blokjes rechts" level="0" type="L"/>
                <concept code="903" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="13. Stapelt 2 blokjes links" level="0" type="L"/>
                <concept code="904" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 13" level="0" type="L"/>
                <concept code="905" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="14. Gaat op onderzoek uit" level="0" type="L"/>
                <concept code="906" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="15. Stapelt 3 blokjes rechts" level="0" type="L"/>
                <concept code="907" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="15. Stapelt 3 blokjes links" level="0" type="L"/>
                <concept code="908" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 15" level="0" type="L"/>
                <concept code="909" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="16. Doet anderen na" level="0" type="L"/>
                <concept code="910" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="17. Stapelt 6 blokjes" level="0" type="L"/>
                <concept code="911" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 17" level="0" type="L"/>
                <concept code="912" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="18. Plaatst ronde vorm in stoof" level="0" type="L"/>
                <concept code="913" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="19. Trekt kledingstuk uit" level="0" type="L"/>
                <concept code="914" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="20. Bouwt vrachtauto na" level="0" type="L"/>
                <concept code="915" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 20" level="0" type="L"/>
                <concept code="916" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="21. Plaatst 3 vormen in stoof" level="0" type="L"/>
                <concept code="917" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="22. Tekent verticale lijn na" level="0" type="L"/>
                <concept code="918" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="23. Bouwt brug na" level="0" type="L"/>
                <concept code="919" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 23" level="0" type="L"/>
                <concept code="920" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="24. Plaatst 4 vormen in stoof" level="0" type="L"/>
                <concept code="921" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="25. Trekt eigen kledingstuk aan" level="0" type="L"/>
                <concept code="922" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="26. Tekent cirkel na" level="0" type="L"/>
                <concept code="923" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="27. Houdt potlood met vingers vast" level="0" type="L"/>
                <concept code="924" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichaamskant VWO 27" level="0" type="L"/>
                <concept code="925" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 27" level="0" type="L"/>
                <concept code="926" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="28. Tekent kruis na" level="0" type="L"/>
                <concept code="927" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="29. Reageert op toespreken" level="0" type="L"/>
                <concept code="928" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="30. Lacht terug" level="0" type="L"/>
                <concept code="929" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lacht eerste keer terug" level="0" type="L"/>
                <concept code="930" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="31. Maakt geluiden terug" level="0" type="L"/>
                <concept code="931" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="32. Maakt gevarieerde geluiden" level="0" type="L"/>
                <concept code="932" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="33. Zegt &#34;dada-baba&#34; of &#34;gaga&#34;" level="0" type="L"/>
                <concept code="933" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="34. Brabbelt bij zijn spel" level="0" type="L"/>
                <concept code="934" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="35. Reageert op mondeling verzoek" level="0" type="L"/>
                <concept code="935" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="36. Zwaait &#34;dag&#34;, &#34;dag&#34;" level="0" type="L"/>
                <concept code="936" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="37. Zegt 2 &#34;geluidswoorden&#34; met begrip" level="0" type="L"/>
                <concept code="937" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="38. Begrijpt enkele dagelijks gebruikte zinnen" level="0" type="L"/>
                <concept code="938" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="39. Zegt 3 &#34;woorden&#34;" level="0" type="L"/>
                <concept code="939" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="40. Begrijpt fantasieopdrachtjes (M)" level="0" type="L"/>
                <concept code="940" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="41. Zegt &#34;zinnen&#34; van 2 woorden" level="0" type="L"/>
                <concept code="941" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="42. Wijst 6 lichaamsdelen aan bij pop" level="0" type="L"/>
                <concept code="942" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 42" level="0" type="L"/>
                <concept code="943" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="43. Noemt zichzelf &#34;mij&#34; en &#34;ik&#34;" level="0" type="L"/>
                <concept code="944" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 43" level="0" type="L"/>
                <concept code="945" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="44. Wijst 5 plaatjes aan in boek" level="0" type="L"/>
                <concept code="946" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 44" level="0" type="L"/>
                <concept code="947" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="45. Zegt &#34;zinnen&#34; van 3 of meer woorden" level="0" type="L"/>
                <concept code="948" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="46. Is verstaanbaar voor bekenden" level="0" type="L"/>
                <concept code="949" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="47. Praat spontaan over gebeurtenissen thuis/speelzaal" level="0" type="L"/>
                <concept code="950" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="48. Stelt vragen naar &#34;wie&#34;, &#34;wat&#34;, &#34;waar&#34;, &#34;hoe&#34;" level="0" type="L"/>
                <concept code="951" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="49. Is goed verstaanbaar voor onderzoeker" level="0" type="L"/>
                <concept code="952" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 49" level="0" type="L"/>
                <concept code="953" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="50. Stelt vragen naar &#34;hoeveel&#34;, &#34;wanneer&#34;, &#34;waarom&#34;" level="0" type="L"/>
                <concept code="954" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="51. Begrijpt analogieën en tegenstellingen" level="0" type="L"/>
                <concept code="955" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="52. Beweegt armen goed (R)" level="0" type="L"/>
                <concept code="956" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="52. Beweegt armen goed (L)" level="0" type="L"/>
                <concept code="957" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 52" level="0" type="L"/>
                <concept code="958" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="53. Beweegt benen goed (R)" level="0" type="L"/>
                <concept code="959" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="53. Beweegt benen goed (L)" level="0" type="L"/>
                <concept code="960" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 53" level="0" type="L"/>
                <concept code="961" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="54. Blijft hangen bij optillen onder de oksels" level="0" type="L"/>
                <concept code="962" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="55. Reacties bij optrekken tot zit" level="0" type="L"/>
                <concept code="963" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 55" level="0" type="L"/>
                <concept code="964" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="56. Heft kin even van onderlaag" level="0" type="L"/>
                <concept code="965" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 56" level="0" type="L"/>
                <concept code="966" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="57. Heft in buikligging hoofd tot 45º" level="0" type="L"/>
                <concept code="967" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 57" level="0" type="L"/>
                <concept code="968" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="58. Kijkt rond met 90º geheven hoofd" level="0" type="L"/>
                <concept code="969" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 58" level="0" type="L"/>
                <concept code="970" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="59. Benen gebogen of trappelen bij verticaal zwaaien rechts" level="0" type="L"/>
                <concept code="971" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="59. Benen gebogen of trappelen bij verticaal zwaaien links" level="0" type="L"/>
                <concept code="972" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 59" level="0" type="L"/>
                <concept code="973" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="60. Rolt zich om van rug naar buik en omgekeerd" level="0" type="L"/>
                <concept code="974" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 60" level="0" type="L"/>
                <concept code="975" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="61. Kan hoofd goed ophouden in zit" level="0" type="L"/>
                <concept code="976" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 61" level="0" type="L"/>
                <concept code="977" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="62. Zit op billen met gestrekte benen" level="0" type="L"/>
                <concept code="978" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="63. Zit stabiel los" level="0" type="L"/>
                <concept code="979" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 63" level="0" type="L"/>
                <concept code="980" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="64. Kruipt vooruit, buik op de grond" level="0" type="L"/>
                <concept code="981" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 64" level="0" type="L"/>
                <concept code="982" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="66. Kruipt vooruit" level="0" type="L"/>
                <concept code="983" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 66" level="0" type="L"/>
                <concept code="984" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="67. Loopt langs" level="0" type="L"/>
                <concept code="985" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 67" level="0" type="L"/>
                <concept code="986" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="68. Loopt los / loopt goed los / loopt soepel" level="0" type="L"/>
                <concept code="987" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 68" level="0" type="L"/>
                <concept code="988" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Eerste keer los lopen" level="0" type="L"/>
                <concept code="989" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="69. Gooit bal zonder om te vallen" level="0" type="L"/>
                <concept code="990" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 69" level="0" type="L"/>
                <concept code="991" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="70. Raapt vanuit hurkzit iets op" level="0" type="L"/>
                <concept code="992" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 70" level="0" type="L"/>
                <concept code="993" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="71. Schopt bal weg rechts" level="0" type="L"/>
                <concept code="994" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="71. Schopt bal weg links" level="0" type="L"/>
                <concept code="995" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 71" level="0" type="L"/>
                <concept code="996" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="72. Kan in zit soepel roteren" level="0" type="L"/>
                <concept code="997" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 72" level="0" type="L"/>
                <concept code="998" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="73. Fietst (op driewieler)" level="0" type="L"/>
                <concept code="999" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="74. Springt met beide voeten tegelijk" level="0" type="L"/>
                <concept code="1000" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 74" level="0" type="L"/>
                <concept code="1001" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="75. Kan minstens 5 seconden op één been staan rechts" level="0" type="L"/>
                <concept code="1002" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="75. Kan minstens 5 seconden op één been staan links" level="0" type="L"/>
                <concept code="1003" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 75" level="0" type="L"/>
                <concept code="1004" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden Van Wiechen onderzoek" level="0" type="L"/>
                <concept code="1005" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Observatie bij oefeningen" level="0" type="L"/>
                <concept code="1006" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Scan van oefeningenblad" level="0" type="L"/>
                <concept code="1007" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="1. Figuren natekenen - kwantiteit" level="0" type="L"/>
                <concept code="1008" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="2. Lijntrekken - kwantiteit" level="0" type="L"/>
                <concept code="1009" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="2. Lijntrekken - kwaliteit" level="0" type="L"/>
                <concept code="1010" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="3. Stippen zetten - kwantiteit" level="0" type="L"/>
                <concept code="1011" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="3. Pengreep - kwaliteit" level="0" type="L"/>
                <concept code="1012" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="4. Vinger-duim oppositie - kwantiteit rechts" level="0" type="L"/>
                <concept code="1013" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="4. Vinger-duim oppositie - kwantiteit links" level="0" type="L"/>
                <concept code="1014" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="4. Vinger-duim oppositie - kwaliteit" level="0" type="L"/>
                <concept code="1015" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="5. Oogbewegingen - kwantiteit" level="0" type="L"/>
                <concept code="1016" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="5. Oogbewegingen - kwaliteit" level="0" type="L"/>
                <concept code="1017" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="6. Top-neus proef - kwantiteit rechts" level="0" type="L"/>
                <concept code="1018" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="6. Top-neus proef - kwantiteit links" level="0" type="L"/>
                <concept code="1019" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="7. Diadochokinese - kwantiteit rechts" level="0" type="L"/>
                <concept code="1020" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="7. Diadochokinese - kwantiteit links" level="0" type="L"/>
                <concept code="1021" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="7. Diadochokinese - kwaliteit" level="0" type="L"/>
                <concept code="1022" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="8. Veter strikken - kwantiteit" level="0" type="L"/>
                <concept code="1023" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="9. Eén been staan - kwantiteit rechts" level="0" type="L"/>
                <concept code="1024" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="9. Eén been staan - kwantiteit links" level="0" type="L"/>
                <concept code="1025" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="9. Eén been staan - kwaliteit" level="0" type="L"/>
                <concept code="1026" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="10. Hielen lopen - kwantiteit" level="0" type="L"/>
                <concept code="1027" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="10. Hielen lopen - kwaliteit" level="0" type="L"/>
                <concept code="1028" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="11. Streeplopen - kwantiteit" level="0" type="L"/>
                <concept code="1029" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="11. Streeplopen - kwaliteit" level="0" type="L"/>
                <concept code="1030" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="12. Hinkelen - kwantiteit rechts" level="0" type="L"/>
                <concept code="1031" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="12. Hinkelen - kwantiteit links" level="0" type="L"/>
                <concept code="1032" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="12. Hinkelen - kwaliteit" level="0" type="L"/>
                <concept code="1033" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="13. Springen - kwantiteit" level="0" type="L"/>
                <concept code="1034" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="13. Springen - kwaliteit" level="0" type="L"/>
                <concept code="1035" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Is er sprake van fysieke belemmeringen" level="0" type="L"/>
                <concept code="1036" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden fysieke belemmeringen" level="0" type="L"/>
                <concept code="1037" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Is er sprake van negatieve kindfactoren" level="0" type="L"/>
                <concept code="1038" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden negatieve kindfactoren" level="0" type="L"/>
                <concept code="1039" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Is er sprake van negatieve omgevingsfactoren" level="0" type="L"/>
                <concept code="1040" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden negatieve omgevingsfactoren" level="0" type="L"/>
                <concept code="1041" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kwantiteitscore" level="0" type="L"/>
                <concept code="1042" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Percentiel" level="0" type="L"/>
                <concept code="1043" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kwaliteitscore fijne motoriek" level="0" type="L"/>
                <concept code="1044" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kwaliteitscore grove motoriek" level="0" type="L"/>
                <concept code="1045" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden BFMT" level="0" type="L"/>
                <concept code="1078" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="1. Houdt rekening met gevoelens van anderen" level="0" type="L"/>
                <concept code="1079" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="2. Is rusteloos" level="0" type="L"/>
                <concept code="1080" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="3. Klaagt vaak over hoofdpijn" level="0" type="L"/>
                <concept code="1081" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="4. Deelt makkelijk met andere jeugdigen" level="0" type="L"/>
                <concept code="1082" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="5. Heeft vaak driftbuien of woede-uitbarstingen" level="0" type="L"/>
                <concept code="1083" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="6. Is nogal op zichzelf" level="0" type="L"/>
                <concept code="1084" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="7. Is doorgaans gehoorzaam" level="0" type="L"/>
                <concept code="1085" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="8. Heeft veel zorgen" level="0" type="L"/>
                <concept code="1086" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="9. Is behulpzaam als iemand zich heeft bezeerd" level="0" type="L"/>
                <concept code="1087" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="10. Is constant aan het wiebelen of wriemelen" level="0" type="L"/>
                <concept code="1088" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="11. Heeft minstens één goede vriend of vriendin" level="0" type="L"/>
                <concept code="1089" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="12. Vecht vaak met andere jeugdigen of pest ze" level="0" type="L"/>
                <concept code="1090" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="13. Is vaak ongelukkig" level="0" type="L"/>
                <concept code="1091" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="14. Wordt over het algemeen aardig gevonden door andere jeugdigen" level="0" type="L"/>
                <concept code="1092" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="15. Is gemakkelijk afgeleid" level="0" type="L"/>
                <concept code="1093" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="16. Is zenuwachtig of zich vastklampend in nieuwe situaties" level="0" type="L"/>
                <concept code="1094" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="17. Is aardig tegen jongere kinderen" level="0" type="L"/>
                <concept code="1095" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="18. Liegt of bedriegt vaak" level="0" type="L"/>
                <concept code="1096" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="19. Wordt getreiterd of gepest door andere jeugdigen" level="0" type="L"/>
                <concept code="1097" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="20. Biedt vaak vrijwillig hulp aan anderen" level="0" type="L"/>
                <concept code="1098" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="21. Denkt na voor iets te doen" level="0" type="L"/>
                <concept code="1099" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="22. Pikt dingen thuis" level="0" type="L"/>
                <concept code="1100" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="23. Kan beter opschieten met volwassenen dan met andere jeugdigen" level="0" type="L"/>
                <concept code="1101" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="24. Is voor heel veel bang" level="0" type="L"/>
                <concept code="1102" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="25. Maakt opdrachten af" level="0" type="L"/>
                <concept code="1103" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Heeft u opmerkingen?" level="0" type="L"/>
                <concept code="1104" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Denkt u over het geheel genomen dat uw kind moeilijkheden heeft op één of meer van de volgende gebieden: emoties, concentratie, gedrag of vermogen om met andere mensen op te schieten?" level="0" type="L"/>
                <concept code="1105" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hoe lang bestaan deze moeilijkheden?" level="0" type="L"/>
                <concept code="1106" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Maken de moeilijkheden uw kind overstuur of van slag?" level="0" type="L"/>
                <concept code="1107" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Belemmering thuis" level="0" type="L"/>
                <concept code="1108" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Belemmering vriendschappen" level="0" type="L"/>
                <concept code="1109" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Belemmering leren in de klas" level="0" type="L"/>
                <concept code="1110" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Belemmering activiteiten in de vrije tijd" level="0" type="L"/>
                <concept code="1111" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Belasten de moeilijkheden u of het gezin als geheel?" level="0" type="L"/>
                <concept code="1112" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Score emotionele problemen" level="0" type="L"/>
                <concept code="1113" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Score gedragsproblemen" level="0" type="L"/>
                <concept code="1114" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Score problemen leeftijdsgenoten" level="0" type="L"/>
                <concept code="1115" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Score hyperactiviteit" level="0" type="L"/>
                <concept code="1116" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="SDQ totaal score" level="0" type="L"/>
                <concept code="1117" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Score pro-sociaal gedrag" level="0" type="L"/>
                <concept code="1150" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Duur zorg op maat" level="0" type="D"/>
                <concept code="1151" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Probleemomschrijving" level="0" type="L"/>
                <concept code="1152" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Oorzaak" level="0" type="L"/>
                <concept code="1153" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zich uitend in" level="0" type="L"/>
                <concept code="1154" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Doelen" level="0" type="L"/>
                <concept code="1155" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Interventies" level="0" type="L"/>
                <concept code="1156" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Evaluatie" level="0" type="L"/>
                <concept code="1157" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorlichtingsmateriaal" level="0" type="L"/>
                <concept code="1158" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Extra zorg/interventie" level="0" type="L"/>
                <concept code="1159" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Advies en verwijzing naar" level="0" type="L"/>
                <concept code="1163" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1164" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bron toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1165" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1166" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bron toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1167" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Papieren JGZ-dossier aanwezig" level="0" type="L"/>
                <concept code="1168" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Locatie papieren JGZ-dossier" level="0" type="L"/>
                <concept code="1169" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort toegevoegd bestand" level="0" type="L"/>
                <concept code="1171" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afzender bestand" level="0" type="L"/>
                <concept code="1172" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum bestand" level="0" type="L"/>
                <concept code="1173" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="0. Stoornis" level="0" type="L"/>
                <concept code="1174" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="1. Hoorstoornis" level="0" type="L"/>
                <concept code="1175" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="2. Stemstoornis" level="0" type="L"/>
                <concept code="1176" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="3. Taalstoornis" level="0" type="L"/>
                <concept code="1177" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="5. Articulatie" level="0" type="L"/>
                <concept code="1178" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="6. Nasaliteit" level="0" type="L"/>
                <concept code="1179" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="7. Stoornis in vloeiendheid" level="0" type="L"/>
                <concept code="1180" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="8. Afwijkend mondgedrag" level="0" type="L"/>
                <concept code="1181" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="9. Overig" level="0" type="L"/>
                <concept code="1182" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting aard bijzonderheden screening logopedie" level="0" type="L"/>
                <concept code="1183" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam groep/klas" level="0" type="L"/>
                <concept code="1185" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bestand" level="0" type="L"/>
                <concept code="1186" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="1187" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Functie contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="1188" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Telefoon contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="1189" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="E-mail contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="1190" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden woonverband" level="0" type="L"/>
                <concept code="1191" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Spreektaal ouder/verzorger" level="0" type="L"/>
                <concept code="1194" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder UZI Verwijsindex risicojongeren" level="0" type="D"/>
                <concept code="1195" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum aanmelding Verwijsindex risicojongeren" level="0" type="L"/>
                <concept code="1196" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum afmelding Verwijsindex risicojongeren" level="0" type="L"/>
                <concept code="1197" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Status in zorg" level="0" type="L"/>
                <concept code="1200" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vader/moeder" level="0" type="L"/>
                <concept code="1201" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afgesloten" level="0" type="L"/>
                <concept code="1202" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Methode meting" level="0" type="L"/>
                <concept code="1203" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 500 rechts" level="0" type="L"/>
                <concept code="1204" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 500 links" level="0" type="L"/>
                <concept code="1205" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 1000 rechts" level="0" type="L"/>
                <concept code="1206" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 1000 links" level="0" type="L"/>
                <concept code="1207" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 2000 rechts" level="0" type="L"/>
                <concept code="1208" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 2000 links" level="0" type="L"/>
                <concept code="1209" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 3000 rechts" level="0" type="L"/>
                <concept code="1210" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 3000 links" level="0" type="L"/>
                <concept code="1211" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 4000 rechts" level="0" type="L"/>
                <concept code="1212" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 4000 links" level="0" type="L"/>
                <concept code="1213" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 6000 rechts" level="0" type="L"/>
                <concept code="1214" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Testtoon 6000 links" level="0" type="L"/>
                <concept code="1216" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 500 rechts" level="0" type="L"/>
                <concept code="1218" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 500 links" level="0" type="L"/>
                <concept code="1220" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 1000 rechts" level="0" type="L"/>
                <concept code="1222" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 1000 links" level="0" type="L"/>
                <concept code="1224" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 2000 rechts" level="0" type="L"/>
                <concept code="1226" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 2000 links" level="0" type="L"/>
                <concept code="1228" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 3000 rechts" level="0" type="L"/>
                <concept code="1230" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 3000 links" level="0" type="L"/>
                <concept code="1232" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 4000 rechts" level="0" type="L"/>
                <concept code="1234" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 4000 links" level="0" type="L"/>
                <concept code="1236" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 6000 rechts" level="0" type="L"/>
                <concept code="1238" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Drempel 6000 links" level="0" type="L"/>
                <concept code="1239" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag drempelonderzoek" level="0" type="L"/>
                <concept code="1240" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 3" level="0" type="L"/>
                <concept code="1241" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 4" level="0" type="L"/>
                <concept code="1242" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 5" level="0" type="L"/>
                <concept code="1243" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 6" level="0" type="L"/>
                <concept code="1244" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 7" level="0" type="L"/>
                <concept code="1245" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 8" level="0" type="L"/>
                <concept code="1246" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 9" level="0" type="L"/>
                <concept code="1247" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 14" level="0" type="L"/>
                <concept code="1248" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 16" level="0" type="L"/>
                <concept code="1249" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 18" level="0" type="L"/>
                <concept code="1250" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 19" level="0" type="L"/>
                <concept code="1251" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 21" level="0" type="L"/>
                <concept code="1252" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 22" level="0" type="L"/>
                <concept code="1253" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 24" level="0" type="L"/>
                <concept code="1254" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 25" level="0" type="L"/>
                <concept code="1255" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 26" level="0" type="L"/>
                <concept code="1256" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 28" level="0" type="L"/>
                <concept code="1257" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 29" level="0" type="L"/>
                <concept code="1258" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 30" level="0" type="L"/>
                <concept code="1259" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 31" level="0" type="L"/>
                <concept code="1260" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 32" level="0" type="L"/>
                <concept code="1261" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 33" level="0" type="L"/>
                <concept code="1262" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 34" level="0" type="L"/>
                <concept code="1263" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 35" level="0" type="L"/>
                <concept code="1264" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 36" level="0" type="L"/>
                <concept code="1265" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 37" level="0" type="L"/>
                <concept code="1266" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 38" level="0" type="L"/>
                <concept code="1267" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 39" level="0" type="L"/>
                <concept code="1268" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 40" level="0" type="L"/>
                <concept code="1269" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 41" level="0" type="L"/>
                <concept code="1270" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 45" level="0" type="L"/>
                <concept code="1271" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 46" level="0" type="L"/>
                <concept code="1272" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 47" level="0" type="L"/>
                <concept code="1273" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 48" level="0" type="L"/>
                <concept code="1274" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 50" level="0" type="L"/>
                <concept code="1275" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 51" level="0" type="L"/>
                <concept code="1276" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 54" level="0" type="L"/>
                <concept code="1277" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 62" level="0" type="L"/>
                <concept code="1278" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="65. Trekt zich op tot staan" level="0" type="L"/>
                <concept code="1279" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 65" level="0" type="L"/>
                <concept code="1280" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Opmerking bij VWO 73" level="0" type="L"/>
                <concept code="1318" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Rol contactpersoon" level="0" type="L"/>
                <concept code="1322" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Doodsoorzaak ouder/verzorger" level="0" type="L"/>
                <concept code="1323" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Stuitligging laatste trimester" level="0" type="L"/>
                <concept code="1324" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Wijze van geboorte" level="0" type="L"/>
                <concept code="1325" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder UZI Veilig Thuis" level="0" type="D"/>
                <concept code="1326" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum melding Veilig Thuis" level="0" type="L"/>
                <concept code="1327" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum consultatie Veilig Thuis" level="0" type="L"/>
                <concept code="1328" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden consultatie Veilig Thuis" level="0" type="L"/>
                <concept code="1329" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Dialect" level="0" type="L"/>
                <concept code="1330" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum start zorg" level="0" type="L"/>
                <concept code="1331" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Screeningsinstrument NGS" level="0" type="L"/>
                <concept code="1332" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Element" level="0" type="L"/>
                <concept code="1333" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Waarde" level="0" type="L"/>
                <concept code="1334" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Activiteit ID" level="0" type="L"/>
                <concept code="1335" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Rubriek ID" level="0" type="L"/>
                <concept code="1336" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende instantie vaccinatie" level="0" type="L"/>
                <concept code="1337" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vitamine K" level="0" type="L"/>
                <concept code="1338" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vitamine D" level="0" type="L"/>
                <concept code="1339" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting vitamine" level="0" type="L"/>
                <concept code="1340" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Melkvoeding op 8e dag" level="0" type="L"/>
                <concept code="1341" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Screeningsinstrument psychosociale problematiek" level="0" type="L"/>
                <concept code="1342" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum afname SPP" level="0" type="L"/>
                <concept code="1343" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="SPP ingevuld door" level="0" type="L"/>
                <concept code="1344" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Plaats van afname SPP" level="0" type="L"/>
                <concept code="1345" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden SPP" level="0" type="L"/>
                <concept code="1346" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Conclusie SPP" level="0" type="L"/>
                <concept code="1349" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1350" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1351" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Contact met" level="0" type="L"/>
                <concept code="1352" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Woonverband ID" level="0" type="L"/>
                <concept code="1363" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Woonverband ID cliënt" level="0" type="L"/>
                <concept code="1364" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Woonverband ID ouder/verzorger" level="0" type="L"/>
                <concept code="1365" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Woonverband ID broer/zus" level="0" type="L"/>
                <concept code="1367" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden ouder/verzorger" level="0" type="L"/>
                <concept code="1368" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voornaam zoon/dochter" level="0" type="L"/>
                <concept code="1369" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorvoegsel achternaam zoon/dochter" level="0" type="L"/>
                <concept code="1370" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Achternaam zoon/dochter" level="0" type="L"/>
                <concept code="1371" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geslacht zoon/dochter" level="0" type="L"/>
                <concept code="1372" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Geboortedatum zoon/dochter" level="0" type="L"/>
                <concept code="1374" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden zoon/dochter" level="0" type="L"/>
                <concept code="1375" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Woonverband ID zoon/dochter" level="0" type="L"/>
                <concept code="1377" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Activiteit ID" level="0" type="L"/>
                <concept code="1378" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zwemles" level="0" type="D"/>
                <concept code="1379" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Oogonderzoek uitgevoerd" level="0" type="L"/>
                <concept code="1380" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden melding Veilig Thuis" level="0" type="L"/>
                <concept code="1381" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende UZI consultatie Veilig Thuis" level="0" type="D"/>
                <concept code="1382" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gebruikt hand" level="0" type="L"/>
                <concept code="1383" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="1384" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bedreigingen nagevraagd" level="0" type="L"/>
                <concept code="1385" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Arts UZI toestemming aan verpleegkundige om te vaccineren" level="0" type="D"/>
                <concept code="1386" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid adres cliënt" level="0" type="D"/>
                <!--concept code="1387" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid uitvoerende JGZ-organisatie" level="0" type="L"/-->
                <concept code="1388" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid huisarts" level="0" type="D"/>
                <concept code="1389" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid andere betrokken organisatie/hulpverlener" level="0" type="D"/>
                <concept code="1390" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid voor- of buitenschoolse voorzieningen" level="0" type="D"/>
                <concept code="1391" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid school" level="0" type="D"/>
                <concept code="1392" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden testis links" level="0" type="L"/>
                <concept code="1393" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden scrotum links" level="0" type="L"/>
                <concept code="1394" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vergewissen uitgevoerd" level="0" type="L"/>
                <concept code="1395" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bezwaar overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1396" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bron bezwaar overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1397" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum bezwaar overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1398" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1399" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bron toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1400" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1401" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afschrift JGZ-dossier verstrekt aan" level="0" type="L"/>
                <concept code="1402" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum verstrekking afschrift JGZ-dossier" level="0" type="L"/>
                <concept code="1403" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting verstrekking afschrift JGZ-dossier" level="0" type="L"/>
                <concept code="1404" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bezwaar wetenschappelijk onderzoek" level="0" type="L"/>
                <concept code="1405" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bron bezwaar wetenschappelijk onderzoek" level="0" type="L"/>
                <concept code="1406" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum bezwaar wetenschappelijk onderzoek" level="0" type="L"/>
                <concept code="1407" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1408" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden melding Verwijsindex risicojongeren" level="0" type="L"/>
                <concept code="1409" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum vaccinatie" level="0" type="L"/>
                <concept code="1410" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam uitvoerende persoon" level="0" type="L"/>
                <concept code="1411" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam uitvoerende persoon" level="0" type="L"/>
                <concept code="1412" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum opname ziekenhuis" level="0" type="L"/>
                <concept code="1413" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gescreend in NICU" level="0" type="L"/>
                <concept code="1414" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Risico-inschatting VGV op dit moment" level="0" type="L"/>
                <concept code="1415" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verklaring tegen VGV meegegeven" level="0" type="L"/>
                <concept code="1416" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden VGV" level="0" type="L"/>
                <concept code="1417" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Deelname VVE" level="0" type="L"/>
                <concept code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts" level="0" type="L"/>
                <concept code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links" level="0" type="L"/>
                <concept code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts" level="0" type="L"/>
                <concept code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links" level="0" type="L"/>
                <concept code="1422" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden omgaan met broer/zus/leeftijdgenoten" level="0" type="L"/>
                <concept code="1423" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verzoeker activiteit" level="0" type="L"/>
                <concept code="1424" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Indicatie activiteit" level="0" type="L"/>
                <concept code="1425" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden hand links" level="0" type="L"/>
                <concept code="1426" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden hand rechts" level="0" type="L"/>
                <concept code="1427" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid contactpersoon" level="0" type="D"/>
                <concept code="1428" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid contactpersoon/hulpverlener" level="0" type="D"/>
                <concept code="1429" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid contactpersoon school" level="0" type="D"/>
                <concept code="1430" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid contactpersoon voor- of buitenschoolse voorziening" level="0" type="D"/>
                <concept code="1431" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden hielprikafname" level="0" type="L"/>
                <concept code="1432" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Setnummer vorige hielprik" level="0" type="L"/>
                <concept code="1433" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Diagnose Audiologisch Centrum gehoor links" level="0" type="L"/>
                <concept code="1434" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Diagnose Audiologisch Centrum gehoor rechts" level="0" type="L"/>
                <concept code="1435" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Advies Audiologisch Centrum aan ouders" level="0" type="L"/>
                <concept code="1436" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting advies Audiologisch Centrum aan ouders" level="0" type="L"/>
                <concept code="1437" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden sensibiliteit" level="0" type="L"/>
                <concept code="1438" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Proef van Romberg" level="0" type="L"/>
                <concept code="1439" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kruis van Reitan" level="0" type="L"/>
                <concept code="1440" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Menstekening" level="0" type="L"/>
                <concept code="1441" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verantwoordelijke JGZ-organisatie URA" level="0" type="L"/>
                <concept code="1442" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verantwoordelijke JGZ-professional UZI" level="0" type="D"/>
                <!--concept code="1443" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Periode geldigheid verantwoordelijke JGZ-organisatie" level="0" type="L"/-->
                <concept code="1446" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting bijzonderheden heupen" level="0" type="L"/>
                <concept code="1447" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="SDQ impactscore" level="0" type="L"/>
                <concept code="1448" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum verkrijgen vaccinatieschema" level="0" type="L"/>
                <concept code="1449" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort geplande vaccinatie" level="0" type="L"/>
                <concept code="1450" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Minimale uitvoerdatum vaccinatie" level="0" type="L"/>
                <concept code="1451" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Streefdatum vaccinatie" level="0" type="L"/>
                <concept code="1452" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Locatie uitvoerende organisatie" level="0" type="L"/>
                <concept code="1453" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid adres cliënt" level="0" type="L"/>
                <concept code="1454" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid adres cliënt" level="0" type="L"/>
                <concept code="1455" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid contactpersoon" level="0" type="L"/>
                <concept code="1456" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid contactpersoon" level="0" type="L"/>
                <concept code="1457" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid uitvoerende JGZ-organisatie" level="0" type="L"/>
                <concept code="1458" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid uitvoerende JGZ-organisatie" level="0" type="L"/>
                <concept code="1459" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid verantwoordelijke JGZ-organisatie" level="0" type="L"/>
                <concept code="1460" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid verantwoordelijke JGZ-organisatie" level="0" type="L"/>
                <concept code="1461" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid huisarts" level="0" type="L"/>
                <concept code="1462" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid huisarts" level="0" type="L"/>
                <concept code="1463" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid andere betrokken organisatie/hulpverlener" level="0" type="L"/>
                <concept code="1464" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid andere betrokken organisatie/hulpverlener" level="0" type="L"/>
                <concept code="1465" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid contactpersoon/hulpverlener" level="0" type="L"/>
                <concept code="1466" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid contactpersoon/hulpverlener" level="0" type="L"/>
                <concept code="1467" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum zorg" level="0" type="L"/>
                <concept code="1468" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum zorg" level="0" type="L"/>
                <concept code="1469" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid voor- of buitenschoolse voorzieningen" level="0" type="L"/>
                <concept code="1470" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid voor- of buitenschoolse voorzieningen" level="0" type="L"/>
                <concept code="1471" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="1472" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid contactpersoon voor- of buitenschoolse voorziening" level="0" type="L"/>
                <concept code="1473" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid school" level="0" type="L"/>
                <concept code="1474" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid school" level="0" type="L"/>
                <concept code="1475" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid contactpersoon school" level="0" type="L"/>
                <concept code="1476" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid contactpersoon school" level="0" type="L"/>
                <concept code="1477" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geel zien" level="0" type="L"/>
                <concept code="1478" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geel zien" level="0" type="L"/>
                <concept code="1479" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum opname kinderafdeling" level="0" type="L"/>
                <concept code="1480" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum opname kinderafdeling" level="0" type="L"/>
                <concept code="1481" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum duur zorg op maat" level="0" type="L"/>
                <concept code="1482" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum duur zorg op maat" level="0" type="L"/>
                <concept code="1483" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum reactie" level="0" type="L"/>
                <concept code="1484" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum reactie" level="0" type="L"/>
                <concept code="1485" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Middelomtrek in millimeters" level="0" type="L"/>
                <concept code="1486" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bloeddruk systolisch" level="0" type="L"/>
                <concept code="1487" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bloeddruk diastolisch" level="0" type="L"/>
                <concept code="1488" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afkapwaarde ondergrens bloeddruk systolisch" level="0" type="D"/>
                <concept code="1489" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afkapwaarde bovengrens bloeddruk systolisch" level="0" type="D"/>
                <concept code="1490" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afkapwaarde ondergrens bloeddruk diastolisch" level="0" type="D"/>
                <concept code="1491" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afkapwaarde bovengrens bloeddruk diastolisch" level="0" type="D"/>
                <concept code="1492" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gewichtsklasse op basis van BMI" level="0" type="L"/>
                <concept code="1493" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden geen deelname aan VVE" level="0" type="L"/>
                <concept code="1494" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verwijsbrief" level="0" type="L"/>
                <concept code="1495" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Overall risicoinschatting SPARK" level="0" type="L"/>
                <concept code="1496" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Score taalsignaleringsinstrument" level="0" type="L"/>
                <concept code="1497" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bestandsnaam" level="0" type="L"/>
                <concept code="1498" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bestand mimetype" level="0" type="L"/>
                <concept code="1499" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zwemles" level="0" type="L"/>
                <concept code="1500" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Schoolzwemmen" level="0" type="L"/>
                <concept code="1501" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende activiteit naam" level="0" type="L"/>
                <!--<concept code="1502" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende instantie vaccinatie URA" level="0" type="L"/>-->
                <concept code="1503" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vreemdelingennummer" level="0" type="L"/>
                <concept code="1504" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Arts BIG toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="1505" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Arts naam toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="1506" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-organisatie naam" level="0" type="L"/>
                <concept code="1507" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verantwoordelijke JGZ-organisatie naam" level="0" type="L"/>
                <concept code="1508" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende activiteit BIG" level="0" type="L"/>
                <concept code="1509" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisarts AGB" level="0" type="L"/>
                <concept code="1510" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisartspraktijk AGB" level="0" type="L"/>
                <concept code="1511" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken hulpverlener AGB" level="0" type="L"/>
                <concept code="1512" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken hulpverlenersorganisatie AGB" level="0" type="L"/>
                <concept code="1513" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder BIG Verwijsindex risicojongeren" level="0" type="L"/>
                <concept code="1514" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder BIG Veilig Thuis" level="0" type="L"/>
                <concept code="1515" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende BIG consultatie Veilig Thuis" level="0" type="L"/>
                <concept code="1516" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende naam consultatie Veilig Thuis" level="0" type="L"/>
                <concept code="1517" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reactie gemeld aan bevoegde instantie door BIG" level="0" type="L"/>
                <concept code="1518" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reactie gemeld aan bevoegde instantie door naam" level="0" type="L"/>
                <concept code="1519" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder naam Verwijsindex risicojongeren" level="0" type="L"/>
                <concept code="1520" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder naam Veilig Thuis" level="0" type="L"/>
                <concept code="1521" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Arts AGB toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="1522" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder AGB Verwijsindex risicojongeren" level="0" type="L"/>
                <concept code="1523" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende activiteit AGB" level="0" type="L"/>
                <concept code="1524" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder AGB Veilig Thuis" level="0" type="L"/>
                <concept code="1525" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende AGB consultatie Veilig Thuis" level="0" type="L"/>
                <concept code="1526" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reactie gemeld aan bevoegde instantie door AGB" level="0" type="L"/>
                <concept code="1527" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisarts BIG" level="0" type="L"/>
                <concept code="1528" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken hulpverlener BIG" level="0" type="L"/>
                <concept code="1529" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-organisatie AGB" level="0" type="L"/>
                <concept code="1530" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verantwoordelijke JGZ-organisatie AGB" level="0" type="L"/>
                <concept code="1531" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kolom Van Wiechen onderzoek" level="0" type="L"/>
                <concept code="1532" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Schoolnaam" level="0" type="L"/>
                <concept code="1533" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1534" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam bron toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1535" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bron toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1536" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1537" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam JGZ-medewerker toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1538" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie URA toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1539" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie AGB toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1540" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie naam toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1541" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemmingswijze gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1542" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Berekende toestemming gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="1578" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="A terme datum" level="0" type="L"/>
                <concept code="1579" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Moeder heeft kinkhoest doorgemaakt na zwangerschapsduur 12w6d" level="0" type="L"/>
                <concept code="1580" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kinkhoest doorgemaakt na zwangerschapsduur 12w6d" level="0" type="L"/>
                <concept code="1581" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Moeder heeft kinkhoestvaccinatie gekregen na zwangerschapsduur 12w6d" level="0" type="L"/>
                <concept code="1582" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kinkhoestvaccinatie gekregen na zwangerschapsduur 12w6d" level="0" type="L"/>
                <concept code="1583" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Interval maternale kinkhoestvaccinatie en geboorte meer dan 2 weken" level="0" type="L"/>
                <concept code="1584" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vaccinatieschema DKTP" level="0" type="L"/>
                <concept code="1585" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Stollingsstoornis" level="0" type="L"/>
                <concept code="1586" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Chronisch drager Hepatitis-B" level="0" type="L"/>
                <concept code="1587" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum maternale kinkhoestvaccinatie" level="0" type="L"/>
                <concept code="1588" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Medicijngebruik tijdens zwangerschap" level="0" type="L"/>
                <concept code="1589" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vaccinatie door RIVM afgekeurd" level="0" type="L"/>
                <concept code="5063" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="BCG litteken" level="0" type="D"/>
            </conceptList>
        </valueSet>
    </xsl:variable>
    
    <xsl:variable name="W0188_HL7_Contactmomenten">
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1" name="W0188_HL7_Contactmomenten" displayName="W0188 Soort contactmoment (HL7)" effectiveDate="2012-05-21T01:26:54" statusCode="final" versionLabel="310">
            <desc language="nl-NL">Soort contactmoment. Inperking van de activiteiten tot activiteitcodes voor contactmomenten</desc>
            <conceptList>
                <concept code="01" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Huisbezoek 4-7 dagen" level="0" type="L"/>
                <concept code="35" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Neonatale gehoorscreening" level="0" type="L"/>
                <concept code="02" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Huisbezoek 2 weken" level="0" type="L"/>
                <concept code="03" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 4 weken" level="0" type="L"/>
                <concept code="04" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 8 weken" level="0" type="L"/>
                <concept code="05" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 3 maanden" level="0" type="L"/>
                <concept code="06" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 4 maanden" level="0" type="L"/>
                <concept code="07" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 6 maanden" level="0" type="L"/>
                <concept code="08" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 7,5 maand" level="0" type="L"/>
                <concept code="09" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 9 maanden" level="0" type="L"/>
                <concept code="10" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 11 maanden" level="0" type="L"/>
                <concept code="11" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 14 maanden" level="0" type="L"/>
                <concept code="12" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 18 maanden" level="0" type="L"/>
                <concept code="13" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 2 jaar" level="0" type="L"/>
                <concept code="14" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 3 jaar" level="0" type="L"/>
                <concept code="15" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment 3,9 jaar" level="0" type="L"/>
                <concept code="16" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment groep 2" level="0" type="L"/>
                <concept code="17" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment groep 7" level="0" type="L"/>
                <concept code="18" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Massavaccinatie" level="0" type="L"/>
                <concept code="19" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment klas 2" level="0" type="L"/>
                <concept code="20" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment speciaal onderwijs" level="0" type="L"/>
                <concept code="21" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Huisbezoek op indicatie" level="0" type="L"/>
                <concept code="22" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment op indicatie" level="0" type="L"/>
                <concept code="23" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Contactmoment op verzoek" level="0" type="L"/>
                <concept code="24" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Telefonisch contactmoment" level="0" type="L"/>
                <concept code="25" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Spreekuur (0-19)" level="0" type="L"/>
                <concept code="26" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Groepsbijeenkomst (of groepsvoorlichting)" level="0" type="L"/>
                <concept code="27" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Intake nieuwkomers" level="0" type="L"/>
                <exception code="OTH" codeSystem="2.16.840.1.113883.5.1008" displayName="other" level="0" type="L">
                    <desc language="nl-NL">Ander contactmoment</desc>
                </exception>
            </conceptList>
        </valueSet>
    </xsl:variable>
    <xsl:variable name="W0188_HL7_Activiteiten">
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.188.2" name="W0188_HL7_Activiteiten" displayName="W0188 Soort activiteit (HL7)" effectiveDate="2012-05-21T01:26:54" statusCode="final" versionLabel="310">
            <desc language="nl-NL">Soort activiteit. Inperking van de activiteiten tot activiteitcodes voor activiteiten</desc>
            <conceptList>
                <concept code="29" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Consultatie/inlichtingen vragen" level="0" type="L"/>
                <concept code="34" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Bespreking zorgstructuur" level="0" type="L"/>
                <concept code="31" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Terugkoppeling verwijzing" level="0" type="L"/>
                <concept code="32" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Zorgcoördinatie" level="0" type="L"/>
                <exception code="OTH" codeSystem="2.16.840.1.113883.5.1008" displayName="other" level="0" type="L">
                    <desc language="nl-NL">Andere activiteit</desc>
                </exception>
            </conceptList>
        </valueSet>
    </xsl:variable>
    <xsl:variable name="W0188_HL7_Registratie">
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.188.3" name="W0188_HL7_Registratie" displayName="W0188 Soort registratie (HL7)" effectiveDate="2012-05-21T01:26:54" statusCode="final" versionLabel="310">
            <desc language="nl-NL">Soort registratie. Inperking van de activiteiten tot activiteitcodes voor registraties/meldingen</desc>
            <conceptList>
                <concept code="30" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Melding" level="0" type="L"/>
                <concept code="33" codeSystem="2.16.840.1.113883.2.4.4.40.308" displayName="Uitvoering hielprik/vaccinatie buiten de organisatie" level="0" type="L"/>
            </conceptList>
        </valueSet>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Replace schematron with the right version</xd:desc>
    </xd:doc>
    <xsl:template match="processing-instruction()[contains(., 'jgz-versturenDossieroverdrachtbericht')]">
        <xsl:processing-instruction name="xml-stylesheet"> type="text/xsl" href="../../Zorgtoepassing/Jeugdgezondheidszorg/DECOR/jgz-runtime-20200219T121823/jgz-versturenDossieroverdrachtbericht-02.xsl</xsl:processing-instruction>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Update interactionId from REPC_IN902120NL03 to REPC_IN902120NL</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:REPC_IN902120NL03">
        <hl7:REPC_IN902120NL xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../schemas/REPC_IN902120NL.xsd" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="node()" mode="dob400"/>
        </hl7:REPC_IN902120NL>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Update interactionId from REPC_IN902120NL03 to REPC_IN902120NL</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:interactionId" mode="dob400">
        <interactionId extension="REPC_IN902120NL" root="2.16.840.1.113883.1.6" xmlns="urn:hl7-org:v3"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Voeg versiedatum aan templateId toe</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10000']" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@root" mode="dob400"/>
            <xsl:apply-templates select="node()" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Nationaliteit. Verplaatsen van subjectOf1/administrativeObservation naar patientPerson/asCitizen</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:subject/hl7:patient[hl7:patientPerson]" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob400"/>
            <xsl:apply-templates select="hl7:id" mode="dob400"/>
            <xsl:apply-templates select="hl7:addr" mode="dob400"/>
            <xsl:apply-templates select="hl7:telecom" mode="dob400"/>
            <xsl:apply-templates select="hl7:statusCode" mode="dob400"/>
            <xsl:apply-templates select="hl7:confidentialityCode" mode="dob400"/>
            <xsl:for-each select="hl7:patientPerson">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="dob400"/>
                    <xsl:apply-templates select="hl7:templateId" mode="dob400"/>
                    <xsl:apply-templates select="hl7:id" mode="dob400"/>
                    <xsl:apply-templates select="hl7:name" mode="dob400"/>
                    <xsl:apply-templates select="hl7:desc" mode="dob400"/>
                    <xsl:apply-templates select="hl7:telecom" mode="dob400"/>
                    <xsl:apply-templates select="hl7:administrativeGenderCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:birthTime" mode="dob400"/>
                    <xsl:apply-templates select="hl7:deceasedInd" mode="dob400"/>
                    <xsl:apply-templates select="hl7:deceasedTime" mode="dob400"/>
                    <xsl:apply-templates select="hl7:multipleBirthInd" mode="dob400"/>
                    <xsl:apply-templates select="hl7:multipleBirthOrderNumber" mode="dob400"/>
                    <xsl:apply-templates select="hl7:organDonorInd" mode="dob400"/>
                    <xsl:apply-templates select="hl7:addr" mode="dob400"/>
                    <xsl:apply-templates select="hl7:maritalStatusCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:educationLevelCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:disabilityCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:livingArrangementCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:religiousAffiliationCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:raceCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:ethnicGroupCode" mode="dob400"/>
                    <xsl:apply-templates select="hl7:asPatientOfOtherProvider" mode="dob400"/>
                    <xsl:apply-templates select="hl7:asEmployee" mode="dob400"/>
                    <xsl:for-each select="hl7:asCitizen">
                        <xsl:copy>
                            <xsl:choose>
                                <xsl:when test="hl7:code">
                                    <xsl:apply-templates select="hl7:code" mode="dob400"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <code code="CN" codeSystem="2.16.840.1.113883.5.111" displayName="national" xmlns="urn:hl7-org:v3"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:apply-templates select="hl7:politicalNation" mode="dob400"/>
                        </xsl:copy>
                    </xsl:for-each>
                    <xsl:choose>
                        <!-- Kan eigenlijk niet, maar beter voorkomen dan genezen -->
                        <xsl:when test="hl7:asCitizen[hl7:code[@code = 'CAS' or @code = 'CASM'][@codeSystem = '2.16.840.1.113883.5.111']]"/>
                        <xsl:when test="../hl7:subjectOf1/hl7:administrativeObservation[hl7:code[@code='28'][@codeSystem='2.16.840.1.113883.2.4.4.40.267']]/hl7:value[@value = 'true']">
                            <asCitizen xmlns="urn:hl7-org:v3">
                                <code code="CAS" codeSystem="2.16.840.1.113883.5.111" displayName="asylum seeker"/>
                                <politicalNation>
                                    <code code="0001" codeSystem="2.16.840.1.113883.2.4.4.16.32" displayName="Nederland"/>
                                </politicalNation>
                            </asCitizen>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="hl7:asStudent" mode="dob400"/>
                    <xsl:apply-templates select="hl7:asMember" mode="dob400"/>
                    <xsl:apply-templates select="hl7:asOtherIDs" mode="dob400"/>
                    <xsl:apply-templates select="hl7:contactParty" mode="dob400"/>
                    <xsl:apply-templates select="hl7:guardian" mode="dob400"/>
                    <xsl:apply-templates select="hl7:personalRelationship" mode="dob400"/>
                    <xsl:apply-templates select="hl7:careGiver" mode="dob400"/>
                    <xsl:apply-templates select="hl7:birthPlace" mode="dob400"/>
                    <xsl:apply-templates select="hl7:guarantorRole" mode="dob400"/>
                    <xsl:apply-templates select="hl7:languageCommunication" mode="dob400"/>
                </xsl:copy>
            </xsl:for-each>
            <xsl:apply-templates select="hl7:subjectOf1[not(hl7:administrativeObservation/hl7:code[@code='28'][@codeSystem='2.16.840.1.113883.2.4.4.40.267'])]" mode="dob400"/>
            <xsl:apply-templates select="hl7:subjectOf2" mode="dob400"/>
            <xsl:apply-templates select="hl7:coveredPartyOf" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Huisarts: R006 - templateId 2.16.840.1.113883.2.4.6.10.100.104 verwijderen, 
            Andere betrokken organisaties/hulpverleners: R007 - templateId 2.16.840.1.113883.2.4.6.10.100.107 verwijderen en code herschrijven naar @nullFlavor, 
            Voor‑ of buitenschoolse voorzieningen/school: R008 - templateId 2.16.840.1.113883.2.4.6.10.100.108 verwijderen</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:patientPerson/hl7:asPatientOfOtherProvider/hl7:subjectOf/hl7:careProvision" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:choose>
                <xsl:when test="hl7:code[@code = 'G082'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']">
                    <code nullFlavor="OTH" codeSystem="2.16.840.1.113883.5.4" xmlns="urn:hl7-org:v3">
                        <originalText>Andere betrokken organisaties/hulpverleners</originalText>
                    </code>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="hl7:code" mode="dob400"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="node()">
                <xsl:choose>
                    <xsl:when test="self::hl7:templateId | self::hl7:code"/>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="dob400"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Overschrijf @classCode=CON met @classCode=ECON</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:patientPerson/hl7:asStudent/hl7:schoolOrganization/hl7:contactParty" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:attribute name="classCode">ECON</xsl:attribute>
            <xsl:apply-templates select="node()" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Toestemmingen. Herschrijven van author/consultant/subjectOf. In DOB op basis van BDS 4.0.0 staat alles in author/responsibleParty en is er ook een consultant. In DOB op basis van BDS 3.2.7 staat dit meer verdeeld op basis van rol en type toestemming en bestaat consultant niet.</xd:desc>
    </xd:doc>
    <!--<xsl:template match="hl7:authorization/hl7:consentEvent[hl7:code[@code = '469'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]/hl7:author/hl7:responsibleParty" mode="dob400">
        <assignedEntity1 classCode="ASSIGNED" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="hl7:id" mode="dob400"/>
            <xsl:apply-templates select="hl7:code" mode="dob400"/>
            <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                <xsl:apply-templates select="hl7:agentPerson/hl7:name" mode="dob400"/>
            </assignedPerson>
        </assignedEntity1>
    </xsl:template>-->
    <xsl:template match="hl7:authorization/hl7:consentEvent" mode="dob400">
        <xsl:variable name="isBDS469" select="count(hl7:code[@code = '469'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']) = 1"/>
        <xsl:variable name="isRVP1533" select="count(hl7:code[@code = '1533'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']) = 1"/>
        <xsl:variable name="consultant" select="hl7:consultant"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="hl7:code" mode="dob400"/>
            <xsl:for-each select="hl7:author">
                <xsl:variable name="datumToestemming" select="hl7:time/@value"/>
                <xsl:variable name="eindeGeldigheid" select="../hl7:effectiveTime/hl7:high/@value"/>
                <author xmlns="urn:hl7-org:v3">
                    <!-- author/time -->
                    <xsl:choose>
                        <xsl:when test="$eindeGeldigheid">
                            <time>
                                <low value="{$datumToestemming}"/>
                                <high value="{$eindeGeldigheid}"/>
                            </time>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="hl7:time" mode="dob400"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- patient1, personalRelationship, assignedEntity1, responsibleParty -->
                    <xsl:for-each select="hl7:responsibleParty">
                        <xsl:choose>
                            <!-- patient1 als W0691 01 (Cliënt/Jeugdige), of W0088 01 (Cliënt/Jeugdige) -->
                            <xsl:when test="hl7:code[@code='01'][@codeSystem='2.16.840.1.113883.2.4.4.40.435'] | 
                                            hl7:code[@code='ONESELF'][@codeSystem='2.16.840.1.113883.5.111'] | 
                                            hl7:code[@code='CHILD'][@codeSystem='2.16.840.1.113883.5.111']">
                                <patient1 classCode="PAT">
                                    <!-- Noot: in BDS400 DOB staat hier een ongestructureerde naam terwijl in BDS327 DOB een gestructureerde naam wordt geëist. Daarom halen we 
                                        de naam van de patiënt zelf en niet van deze locatie. Gevolg is dat de 'nieuwste' naaminzichten worden gekopieerd. -->
                                    <xsl:if test="$isRVP1533">
                                        <patientPerson>
                                            <xsl:apply-templates select="ancestor::hl7:careProvisionEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:name[1]" mode="dob400"/>
                                        </patientPerson>
                                    </xsl:if>
                                    <xsl:if test="$isRVP1533 and $consultant">
                                        <providerOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <xsl:apply-templates select="$consultant/hl7:assignedEntity1/hl7:representedOrganization/hl7:id" mode="dob400"/>
                                            <xsl:apply-templates select="$consultant/hl7:assignedEntity1/hl7:representedOrganization/hl7:name" mode="dob400"/>
                                        </providerOrganization>
                                    </xsl:if>
                                </patient1>
                            </xsl:when>
                            <!-- personalRelationship als W0088 02 (Ouder) of OTH (Anders) -->
                            <xsl:when test="hl7:code[@codeSystem='2.16.840.1.113883.5.111'] | hl7:code[@nullFlavor='OTH']">
                                <personalRelationship classCode="PRS">
                                    <xsl:apply-templates select="hl7:code" mode="dob400"/>
                                    <relationshipHolder classCode="PSN" determinerCode="INSTANCE" nullFlavor="NI" xsi:nil="true"/>
                                </personalRelationship>
                            </xsl:when>
<!--                            <!-\- personalRelationship als W0691 03 (Gezaghebbende (Geen toestemming van andere gezaghebbende vereist)) 04 Gezaghebbende (Toestemming van andere gezaghebbende vereist) of 05 (Wettelijk vertegenwoordiger namens jeugdige) -\->
                            <xsl:when test="hl7:code[@codeSystem='2.16.840.1.113883.2.4.4.40.435']">
                                <personalRelationship classCode="PRS">
                                    <xsl:apply-templates select="hl7:code" mode="dob400"/>
                                    <relationshipHolder classCode="PSN" determinerCode="INSTANCE" nullFlavor="NI" xsi:nil="true"/>
                                </personalRelationship>
                            </xsl:when>-->
                            <!-- assignedEntity1 als toestemming verpleegkundige vaccinaties -->
                            <xsl:when test="$isBDS469">
                                <assignedEntity1 classCode="ASSIGNED" xmlns="urn:hl7-org:v3">
                                    <xsl:apply-templates select="hl7:id" mode="dob400"/>
                                    <xsl:apply-templates select="hl7:code" mode="dob400"/>
                                    <xsl:for-each select="hl7:agentPerson[hl7:name[not(@nullFlavor)]]">
                                        <assignedPerson>
                                            <xsl:apply-templates select="@*" mode="dob400"/>
                                            <xsl:attribute name="classCode">PSN</xsl:attribute>
                                            <xsl:attribute name="determinerCode">INSTANCE</xsl:attribute>
                                            <xsl:apply-templates select="node()" mode="dob400"/>
                                        </assignedPerson>
                                    </xsl:for-each>
                                </assignedEntity1>
                            </xsl:when>
                            <!-- responsibleParty als RVP en niet W0691 01 (Cliënt/Jeugdige) -->
                            <xsl:when test="$isRVP1533">
                                <responsibleParty classCode="CON">
                                    <xsl:apply-templates select="hl7:code" mode="dob400"/>
                                    <xsl:for-each select="hl7:agentPerson[hl7:name[not(@nullFlavor)]]">
                                        <agentPerson>
                                            <xsl:apply-templates select="@*" mode="dob400"/>
                                            <xsl:attribute name="classCode">PSN</xsl:attribute>
                                            <xsl:attribute name="determinerCode">INSTANCE</xsl:attribute>
                                            <xsl:apply-templates select="node()" mode="dob400"/>
                                        </agentPerson>
                                    </xsl:for-each>
                                    <xsl:if test="$consultant">
                                        <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <xsl:apply-templates select="$consultant/hl7:assignedEntity1/hl7:representedOrganization/hl7:id" mode="dob400"/>
                                            <xsl:apply-templates select="$consultant/hl7:assignedEntity1/hl7:representedOrganization/hl7:name" mode="dob400"/>
                                        </representedOrganization>
                                    </xsl:if>
                                </responsibleParty>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:message>careProvisionEvent/authorization/consentEvent heeft niet-verwachte waarde voor author/responsibleParty/code. Gevonden: <xsl:value-of select="concat(hl7:code[1]/@code, ' ', hl7:code[1]/@nullFlavor, ' ', hl7:code[1]/@codeSystem, ' ', hl7:code[1]/@displayName)"/></xsl:message>
                                <xsl:apply-templates select="." mode="dob400"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:if test="count(hl7:responsibleParty) = 0">
                        <xsl:message>careProvisionEvent/authorization/consentEvent heeft niet-verwachte waarde voor author. Verwacht: hl7:responsibleParty. Gevonden: <xsl:value-of select="name(hl7:*[not(local-name() = 'time')])"/></xsl:message>
                        <xsl:apply-templates select="." mode="dob400"/>
                    </xsl:if>
                </author>
            </xsl:for-each>
            <!-- subjectOf -->
            <xsl:choose>
                <xsl:when test="hl7:subjectOf/hl7:annotation/hl7:code[@code='1407'][@codeSystem='2.16.840.1.113883.2.4.4.40.267']">
                    <subjectOf xmlns="urn:hl7-org:v3">
                        <annotation>
                            <xsl:apply-templates select="hl7:code" mode="dob400"/>
                            <text>
                                <xsl:value-of select="hl7:value"/>
                            </text>
                        </annotation>
                    </subjectOf>
                </xsl:when>
                <xsl:when test="hl7:subjectOf/hl7:annotation/hl7:code[@code='1541'][@codeSystem='2.16.840.1.113883.2.4.4.40.267'] | hl7:consultant">
                    <xsl:variable name="theCode" select="hl7:subjectOf/hl7:annotation/hl7:value/@code | hl7:subjectOf/hl7:annotation/hl7:value/@nullFlavor"/>
                    <xsl:variable name="theCodeSystem" select="hl7:subjectOf/hl7:annotation/hl7:value/@codeSystem"/>
                    <xsl:variable name="theOriginalText" select="hl7:subjectOf/hl7:annotation/hl7:value/hl7:originalText"/>
                    <xsl:variable name="theName" select="hl7:consultant/hl7:assignedEntity1/hl7:assignedPerson/hl7:name"/>
                    <subjectOf xmlns="urn:hl7-org:v3">
                        <annotation>
                            <code code="1537-1541" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemmingswijze + Naam JGZ-medewerker toestemming gegevensuitwisseling RVP"/>
                            <text>
                                <xsl:value-of select="concat(normalize-space($theCode[1]),'|',normalize-space($theOriginalText[1]),'|',normalize-space($theName[1]))"/>
                            </text>
                        </annotation>
                    </subjectOf>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="hl7:reasonOf" mode="dob400"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:subjectOf1/hl7:conclusion/hl7:component/hl7:indication/hl7:reasonOf bevat van actIntent | referral naar actIntent | referral | registrationIntent | observationIntent</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:subjectOf1/hl7:conclusion/hl7:component/hl7:indication/hl7:reasonOf" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:choose>
                <xsl:when test="hl7:referral">
                    <xsl:apply-templates select="hl7:referral" mode="dob400"/>
                </xsl:when>
                <xsl:when test="*[hl7:code[@code = '4'][@codeSystem = '2.16.840.1.113883.2.4.4.40.9']]">
                    <observationIntent xmlns="urn:hl7-org:v3">
                        <xsl:apply-templates select="*/hl7:code" mode="dob400"/>
                    </observationIntent>
                </xsl:when>
                <xsl:when test="*[hl7:code[@code = '5'][@codeSystem = '2.16.840.1.113883.2.4.4.40.9']]">
                    <registrationIntent xmlns="urn:hl7-org:v3">
                        <xsl:apply-templates select="*/hl7:code" mode="dob400"/>
                    </registrationIntent>
                </xsl:when>
                <xsl:when test="*[hl7:code[(@code='1' or @code='2' or @code='3') and @codeSystem='2.16.840.1.113883.2.4.4.40.9']]">
                    <informIntent xmlns="urn:hl7-org:v3">
                        <xsl:apply-templates select="*/hl7:code" mode="dob400"/>
                    </informIntent>
                </xsl:when>
                <xsl:otherwise>
                    <actIntent xmlns="urn:hl7-org:v3">
                        <xsl:apply-templates select="*/hl7:code" mode="dob400"/>
                    </actIntent>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:component7/hl7:encounter heeft nieuwe pertinentInformation met rubricCluster18 nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component7/hl7:encounter" mode="dob400">
        <xsl:variable name="encounterCode" select="hl7:code/@code"/>
        <xsl:variable name="encounterOriginalText" select="hl7:code/hl7:originalText"/>
        
        <xsl:choose>
            <xsl:when test="@moodCode = 'INT' or $encounterCode = exslt:node-set($W0188_HL7_Contactmomenten)//@code or $encounterOriginalText = exslt:node-set($W0188_HL7_Contactmomenten)//@displayName">
                <encounter xmlns="urn:hl7-org:v3">
                    <xsl:apply-templates select="@moodCode" mode="dob400"/>
                    <xsl:call-template name="rubricCluster18">
                        <xsl:with-param name="parentElement" select="'encounter'"/>
                    </xsl:call-template>
                </encounter>
            </xsl:when>
            <xsl:when test="$encounterCode = exslt:node-set($W0188_HL7_Activiteiten)//@code or $encounterOriginalText = exslt:node-set($W0188_HL7_Activiteiten)//@displayName">
                <nonEncounterCareActivity xmlns="urn:hl7-org:v3">
                    <xsl:call-template name="rubricCluster18">
                        <xsl:with-param name="parentElement" select="'encounter'"/>
                    </xsl:call-template>
                </nonEncounterCareActivity>
            </xsl:when>
            <xsl:when test="$encounterCode = exslt:node-set($W0188_HL7_Registratie)//@code or $encounterOriginalText = exslt:node-set($W0188_HL7_Registratie)//@displayName">
                <registrationEvent xmlns="urn:hl7-org:v3">
                    <xsl:call-template name="rubricCluster18">
                        <xsl:with-param name="parentElement" select="'encounter'"/>
                    </xsl:call-template>
                </registrationEvent>
            </xsl:when>
            <xsl:otherwise>
                <encounter xmlns="urn:hl7-org:v3">
                    <xsl:apply-templates select="@moodCode" mode="dob400"/>
                    <xsl:call-template name="rubricCluster18">
                        <xsl:with-param name="parentElement" select="'encounter'"/>
                    </xsl:call-template>
                </encounter>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Soort activiteit: 494, 1..1 (W0188, KL_AN, Soort activiteit) - waardelijst bijwerken</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.308']" mode="dob400">
        <xsl:variable name="theCode" select="@code"/>
        <xsl:variable name="theNullFlavor" select="@nullFlavor"/>
        <xsl:variable name="activiteitSoort1" select="exslt:node-set($W0188_HL7_Activiteiten)//concept[@code = $theCode] | exslt:node-set($W0188_HL7_Contactmomenten)//concept[@code = $theCode] | exslt:node-set($W0188_HL7_Registratie)//concept[@code = $theCode]"/>
        <xsl:variable name="activiteitSoort2" select="exslt:node-set($W0188_HL7_Activiteiten)//exception[@code = $theNullFlavor] | exslt:node-set($W0188_HL7_Contactmomenten)//exception[@code = $theNullFlavor] | exslt:node-set($W0188_HL7_Registratie)//exception[@code = $theNullFlavor]"/>
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="$activiteitSoort1">
                    <xsl:apply-templates select="@*" mode="dob400"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="$activiteitSoort1/@displayName"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="*" mode="dob400"/>
                </xsl:when>
                <xsl:when test="$activiteitSoort2">
                    <xsl:apply-templates select="@* | *" mode="dob400"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">
                        <xsl:choose>
                            <xsl:when test="@displayName">
                                <xsl:value-of select="@displayName"/>
                            </xsl:when>
                            <xsl:when test="hl7:originalText">
                                <xsl:value-of select="hl7:originalText"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@code"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </originalText>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Verzoeker activiteit: 1423, 0..* (W0659, KL_AN, Verzoeker activiteit) - waardelijst bijwerken</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.411']" mode="dob400">
        <xsl:variable name="theCode" select="@code"/>
        <xsl:variable name="theNullFlavor" select="@nullFlavor"/>
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="$theCode = '07'">
                    <xsl:attribute name="nullFlavor">OTH</xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">JGZ</originalText>
                </xsl:when>
                <xsl:when test="$theCode = '08'">
                    <xsl:attribute name="nullFlavor">OTH</xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Veilig Thuis / Raad voor de Kinderbescherming</originalText>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="@* | *" mode="dob400"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Indicatie activiteit: 1424, 0..* (W0619, KL_AN, Indicatie) - waardelijst bijwerken</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:reasonCode[@codeSystem = '2.16.840.1.113883.2.4.4.40.373']" mode="dob400">
        <xsl:variable name="theCode" select="@code"/>
        <xsl:variable name="theNullFlavor" select="@nullFlavor"/>
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="$theCode = '01' or $theCode = '02' or $theCode = '03' or
                                $theCode = '04' or $theCode = '05' or $theCode = '06' or
                                $theCode = '07' or $theCode = '08' or $theCode = '09' or
                                $theCode = '10' or $theCode = '11' or $theCode = '12' or
                                $theCode = '13' or $theCode = '14' or $theCode = '15' or
                                $theCode = '16' or $theCode = '17' or $theCode = '18' or
                                $theCode = '19' or $theCode = '20' or $theCode = '21' or
                                $theCode = '22' or $theCode = '23' or $theCode = '22' or
                                $theCode = '25' or $theCode = '26' or $theCode = '27' or
                                $theCode = '28' or $theCode = '29' or $theCode = '30' or
                                $theCode = '31' or $theCode = '32'">
                    <xsl:apply-templates select="@* | *" mode="dob400"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor">OTH</xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">
                        <xsl:choose>
                            <xsl:when test="@displayName">
                                <xsl:value-of select="@displayName"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@code"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </originalText>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:component7/*/hl7:consultant/hl7:assignedEntity/hl7:assignedPerson/hl7:name wordt ../../hl7:code/hl7:originalText</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component7/*/hl7:consultant/hl7:assignedEntity" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <code nullFlavor="OTH" xmlns="urn:hl7-org:v3">
                <originalText>
                    <xsl:value-of select="hl7:assignedPerson/hl7:name"/>
                </originalText>
            </code>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Vaste waarde statusCode/@code = 'completed' </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:inFulfillmentOf/hl7:encounter/hl7:statusCode" mode="dob400">
        <xsl:copy>
            <xsl:attribute name="code">
                <xsl:value-of select="'completed'"/>
            </xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>effectiveTime is niet toegestaan in 3.2.7, dus overslaan</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:inFulfillmentOf/hl7:encounter/hl7:effectiveTime" mode="dob400">
        <!--Do nothing-->
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Rubriek 13. BDS-element 1384 Bedreigingen nagevraagd is vervallen van 326 naar 400. Herstellen met true indien afwezig, anders was de rubriek er niet.</xd:p> 
            <xd:p>Rubriek 13 heeft nieuwe elementen in BDS 4.0.0. Deze hier overslaan richting 3.2.6. Potentieel nonBDSdata herstellen van elementen die wel in 3.2.6 horen</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R013'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob400"/>
            <xsl:apply-templates select="hl7:code" mode="dob400"/>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '1384'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.41384"/>
                        <code code="1384" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bedreigingen nagevraagd"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- TODO proberen gegevens uit nonBDSdata te herstellen? Lijkt niet heel nuttig, maar het zou wel kunnen gaan om elementen 
        die in BDS 4.0.0 nu net vervallen waren verklaard maar dat in 3.2.6 nog niet waren... -->
    <!--<xd:doc>
        <xd:desc>
            <xd:p>Rubriek 38. Elementen 692, 832, 1418, 1419, 1420, 1421, 833, 834, 835, 836, 394, 395, 402, 403, 404, 405, 406, 407, 842, 852, 853, 854</xd:p> 
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R038'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:apply-templates select="hl7:code" mode="dob400"/>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '692'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '692'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '5/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40692"/>
                                <code code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40692"/>
                                <code code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40692"/>
                                <code code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40692"/>
                                <code code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40692"/>
                                <code code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40692"/>
                                <code code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40692"/>
                                <code code="692" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag rechts"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '832'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '832'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '5/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40832"/>
                                <code code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40832"/>
                                <code code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40832"/>
                                <code code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40832"/>
                                <code code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40832"/>
                                <code code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40832"/>
                                <code code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40832"/>
                                <code code="832" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-kaart uitslag links"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '1418'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '1418'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '5/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/4') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/4"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/3') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/3"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41418"/>
                                <code code="1418" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag rechts"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '1419'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '1419'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '5/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/4') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/4"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '5/3') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="5/3"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41419"/>
                                <code code="1419" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 5 meter uitslag links"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '1420'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '1420'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '4/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/4') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/4"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/3') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/3"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41420"/>
                                <code code="1420" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag rechts"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '1421'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '1421'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '4/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/4') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/4"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/3') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="4/3"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.41421"/>
                                <code code="1421" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 4 meter uitslag links"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '833'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '833'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '4/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/4') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/4"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/3') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/3"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40833"/>
                                <code code="833" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag rechts"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '834'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '834'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '4/30') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/30"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/20') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/20"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/15') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/15"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/10') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/6') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/6"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/5') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/5"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/4') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/4"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '4/3') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="3/3"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40834"/>
                                <code code="834" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="APK-TOV-kaart 3 meter uitslag links"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '835'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '835'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '0,10') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,16') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,16"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,25') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,25"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,40') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,40"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,50') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,50"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,63') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,63"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,80') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,80"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '1,00') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="1,00"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40835"/>
                                <code code="835" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag rechts"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '836'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <xsl:variable name="elm" select="ancestor::component7[1]/*/component1/hl7:nonBDSData[hl7:code[@code = '836'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                <xsl:choose>
                    <xsl:when test="$elm/hl7:value[contains(., '0,10') or starts-with(., '01')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,10"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,16') or starts-with(., '02')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,16"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,25') or starts-with(., '03')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,25"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,40') or starts-with(., '04')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="04" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,40"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,50') or starts-with(., '05')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="05" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,50"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,63') or starts-with(., '06')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="06" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,63"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '0,80') or starts-with(., '07')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="0,80"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., '1,00') or starts-with(., '08')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.329" displayName="1,00"/>
                            </observation>
                        </component>
                    </xsl:when>
                    <xsl:when test="$elm/hl7:value[contains(., 'niet gelukt') or contains('onbekend')]">
                        <component xmlns="urn:hl7-org:v3">
                            <observation negationInd="false">
                                <templateId root="2.16.840.1.113883.2.4.6.10.100.40836"/>
                                <code code="836" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="LH-kaart uitslag links"/>
                                <value xsi:type="CV" nullFlavor="NAV"/>
                            </observation>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob400"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc>Rubriek 13, elementen 1569-1576 en 1600 bestonden niet in 3.2.6</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component[hl7:observation[hl7:code[@code = '1569' or @code = '1570' or @code = '1571' or @code = '1572' or @code = '1573' or @code = '1574' or @code = '1575' or @code = '1576' or @code = '1600'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]" mode="dob400">
        <xsl:comment><xsl:text> element </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@code"/><xsl:text> </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@displayName"/><xsl:text> is overgeslagen </xsl:text></xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc>Rubriek 18, elementen 1577 en 1605 bestonden niet in 3.2.6</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component[hl7:observation[hl7:code[@code = '1577' or @code = '1605' or @code = '1599'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]" mode="dob400">
        <xsl:comment><xsl:text> element </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@code"/><xsl:text> </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@displayName"/><xsl:text> is overgeslagen </xsl:text></xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc>Rubriek 18, element 1599 bestond niet in 3.2.6</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.431']" mode="dob400">
        <xsl:comment><xsl:text> element 1599 met code '</xsl:text><xsl:value-of select="./@code"/><xsl:text>' </xsl:text><xsl:value-of select="./@displayName"/><xsl:text> is overgeslagen </xsl:text></xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc>Rubriek 21, elementen 1601, 1603, 1604 bestonden niet in 3.2.6.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component[hl7:observation[hl7:code[@code = '1601' or @code = '1603' or @code = '1604'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]" mode="dob400">
        <xsl:comment><xsl:text> element </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@code"/><xsl:text> </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@displayName"/><xsl:text> is overgeslagen </xsl:text></xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc>Rubriek 21, template voor element 1602 komt van element 792.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:templateId[@root='2.16.840.1.113883.2.4.6.10.100.41602']" mode="dob400">
        <xsl:copy>
            <xsl:attribute name="root">2.16.840.1.113883.2.4.6.10.100.40792</xsl:attribute>
            <xsl:apply-templates select="node()" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    <xd:doc>
        <xd:desc>Rubriek 38, groep G117 bestond niet in 3.2.6</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component[hl7:groupCluster[hl7:code[@code = 'G117'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]" mode="dob400">
        <xsl:comment><xsl:text> element </xsl:text><xsl:value-of select="hl7:groupCluster/hl7:code/@code"/><xsl:text> </xsl:text><xsl:value-of select="hl7:groupCluster/hl7:code/@displayName"/><xsl:text> is overgeslagen </xsl:text></xsl:comment>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Downgrade van CMET Rijksvaccinatie COCT_RM900916NL04 naar COCT_MT900916NL02. In versie 02 werd geen @moodCode='RMD' ondersteund, geen location, geen limitation en geen gegevens in causeOf2/adverseReaction/subjectOf/informationControlActEvent/performer/assignedPerson behalve id
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component3/hl7:substanceAdministration[@moodCode='RMD']" mode="dob400"/>
    <xsl:template match="hl7:component3/hl7:substanceAdministration" mode="dob400">
        <substanceAdministrationEvent moodCode="EVN" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob400"/>
            <xsl:apply-templates select="hl7:code" mode="dob400"/>
            <xsl:apply-templates select="hl7:effectiveTime" mode="dob400"/>
            <xsl:apply-templates select="hl7:consumable" mode="dob400"/>
            <xsl:apply-templates select="hl7:performer" mode="dob400"/>
            <!--<xsl:apply-templates select="hl7:location" mode="dob400"/>-->
            <xsl:apply-templates select="hl7:reason" mode="dob400"/>
            <xsl:apply-templates select="hl7:causeOf1" mode="dob400"/>
            <xsl:apply-templates select="hl7:causeOf2" mode="dob400"/>
            <xsl:apply-templates select="hl7:authorization" mode="dob400"/>
            <!--<xsl:apply-templates select="hl7:limitation" mode="dob400"/>-->
            <xsl:apply-templates select="hl7:component" mode="dob400"/>
            <xsl:apply-templates select="hl7:subjectOf" mode="dob400"/>
        </substanceAdministrationEvent>
    </xsl:template>
    <xsl:template match="hl7:component3/hl7:substanceAdministration/hl7:causeOf2/hl7:adverseReaction/hl7:subjectOf/hl7:informationControlActEvent/hl7:performer" mode="dob400">
        <xsl:copy>
            <xsl:attribute name="typeCode">PRF</xsl:attribute>
            <xsl:for-each select="hl7:assignedPerson">
                <!--In 3.2.7 is slechts één id toegestaan; bij conversie van 4.0.0 naar 3.2.7 wordt de prioritering BIG -> AGB -> UZI gehanteerd-->
                <xsl:choose>
                    <xsl:when test="hl7:id[@root='2.16.528.1.1007.5.1']">
                        <xsl:copy>
                            <xsl:apply-templates select="hl7:id[@root='2.16.528.1.1007.5.1']" mode="dob400"/>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when test="not(hl7:id[@root='2.16.528.1.1007.5.1']) and hl7:id[@root='2.16.840.1.113883.2.4.6.1']">
                        <xsl:copy>
                            <xsl:apply-templates select="hl7:id[@root='2.16.840.1.113883.2.4.6.1']" mode="dob400"/>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when test="not(hl7:id[@root='2.16.528.1.1007.5.1']) and not(hl7:id[@root='2.16.840.1.113883.2.4.6.1']) and hl7:id[@root='2.16.528.1.1007.3.1']">
                        <xsl:copy>
                            <xsl:apply-templates select="hl7:id[@root='2.16.528.1.1007.3.1']" mode="dob400"/>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:apply-templates select="hl7:id" mode="dob400"/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>BDS-rubrieknamen, BDS-groepnamen en BDS-elementnamen bijwerken conform 3.2.6</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] | hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.393'] | hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.267']" mode="dob400">
        <xsl:variable name="theCode">
            <xsl:choose>
                <xsl:when test="@code = 'G088' and ancestor::hl7:informationControlActEvent">476</xsl:when>
                <xsl:when test="@code = '1602'">792</xsl:when>
                <xsl:otherwise><xsl:value-of select="@code"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="theCodeSystem">
            <xsl:choose>
                <xsl:when test="$theCode = '476'">2.16.840.1.113883.2.4.4.40.267</xsl:when>
                <xsl:otherwise><xsl:value-of select="@codeSystem"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:attribute name="code"><xsl:value-of select="$theCode"/></xsl:attribute>
            <xsl:attribute name="codeSystem"><xsl:value-of select="$theCodeSystem"/></xsl:attribute>
            <xsl:copy-of select="exslt:node-set($W0639_HL7_W0646_HL7_W0647_HL7)//concept[@code = $theCode][@codeSystem = $theCodeSystem]/@displayName"/>
            <xsl:apply-templates select="node()" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Conversie van nieuwe nonBDSData naar oude nonBDSData</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:nonBDSData" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob400"/>
            <xsl:apply-templates select="hl7:code" mode="dob400"/>
            <value  xmlns="urn:hl7-org:v3">
                <xsl:value-of select="hl7:text"/>
            </value>
            <xsl:apply-templates select="hl7:author" mode="dob400"/>
            <xsl:apply-templates select="hl7:pertainsTo" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Conversie van nieuwe metaData naar oude metaData</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:metaData" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob400"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob400"/>
            <xsl:apply-templates select="hl7:code" mode="dob400"/>
            <xsl:choose>
                <xsl:when test="hl7:value">
                    <xsl:apply-templates select="hl7:value" mode="dob400"/>
                </xsl:when>
                <xsl:otherwise>
                    <value xmlns="urn:hl7-org:v3" xsi:type="ST">
                        <xsl:apply-templates select="hl7:text/@*" mode="dob400"/>
                        <xsl:value-of select="hl7:text"/>
                    </value>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="hl7:author" mode="dob400"/>
            <xsl:apply-templates select="hl7:pertainsTo" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Conversie van careStatus door author (minimalistisch) toe te voegen.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:careStatus" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@* | *" mode="dob400"/>
            <author xmlns="urn:hl7-org:v3">
                <time nullFlavor="UNK"/>
                <assignedEntity classCode="ASSIGNED">
                    <templateId root="2.16.840.1.113883.2.4.6.10.100.122"/>
                    <id nullFlavor="NI"/>
                </assignedEntity>
            </author>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Skip lines consisting only of spaces</xd:desc>
    </xd:doc>
    <xsl:template match="text()[normalize-space() = '']" mode="dob400"/>
    
    <xd:doc>
        <xd:desc>Just copy as-is</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="dob400">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="dob400"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Just copy as-is</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Rubriek 18 Status activiteit invoegen op de juiste plaats </xd:desc>
        <xd:param name="parentElement">Naam van wrappend element voor opvangen van verschillen tussen de elementen (encounter, registrationEvent, nonEncounterActivity)</xd:param>
    </xd:doc>
    <xsl:template name="rubricCluster18">
        <xsl:param name="parentElement"/>
        
        <xsl:apply-templates select="hl7:templateId" mode="dob400"/>
        <xsl:apply-templates select="hl7:id" mode="dob400"/>
        <xsl:apply-templates select="hl7:code" mode="dob400"/>
        <xsl:choose>
            <xsl:when test="@moodCode = 'EVN' and hl7:statusCode[@code = 'aborted']">
                <statusCode code="cancelled" xmlns="urn:hl7-org:v3"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="hl7:statusCode" mode="dob400"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="hl7:effectiveTime" mode="dob400"/>
        <xsl:apply-templates select="hl7:reasonCode" mode="dob400"/>
        <xsl:apply-templates select="hl7:performer" mode="dob400"/>
        <xsl:apply-templates select="hl7:author" mode="dob400"/>
        <xsl:apply-templates select="hl7:consultant" mode="dob400"/>
        <xsl:apply-templates select="hl7:escort" mode="dob400"/>
        <xsl:apply-templates select="hl7:inFulfillmentOf" mode="dob400"/>
        <xsl:apply-templates select="hl7:pertinentInformation[not(hl7:rubricCluster/hl7:code[@code = 'R018'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391'])]" mode="dob400"/>
        <xsl:apply-templates select="hl7:component1" mode="dob400"/>
        <xsl:apply-templates select="hl7:component2" mode="dob400"/>
        <!-- Zonder 'uitvoerende' wordt de groep G076 overgeslagen -->
        <xsl:apply-templates select="hl7:component3[hl7:component3/hl7:substanceAdministration/hl7:performer]" mode="dob400"/>
        <xsl:apply-templates select="hl7:component4" mode="dob400"/>
        <xsl:apply-templates select="hl7:component5" mode="dob400"/>
        <xsl:apply-templates select="hl7:subjectOf" mode="dob400"/>
        <xsl:apply-templates select="hl7:subjectOf1" mode="dob400"/>
        <xsl:apply-templates select="hl7:subjectOf2" mode="dob400"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Person met eventueel gestructureerde naam naar een Trivial Name = ongestructureerde naam</xd:desc>
        <xd:param name="nm"/>
    </xd:doc>
    <xsl:template name="dtPNtoTN">
        <xsl:param name="nm"/>
        <name xmlns="urn:hl7-org:v3">
            <xsl:choose>
                <xsl:when test="$nm/*">
                    <xsl:for-each select="$nm/*">
                        <xsl:if test="not(self::hl7:validTime)">
                            <xsl:value-of select="."/>
                            <xsl:if test="position() != last() and not(self::hl7:prefix[contains(@qualifie, 'VV')]) and not(substring(., string-length(.), 1) = ' ')">
                                <xsl:text> </xsl:text>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$nm"/>
                </xsl:otherwise>
            </xsl:choose>
        </name>
    </xsl:template>
    
    <!--<xsl:template name="toLowerCase">
        <xsl:param name="in"/>
        
        <xsl:value-of select="translate($in, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc>Maak component1/nonBDSdata</xd:desc>
    </xd:doc>
    <xsl:template name="maakNonBDSData">
        <component1 typeCode="COMP" xmlns="urn:hl7-org:v3">
            <nonBDSData classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.100.10028"/>
                <xsl:apply-templates select="hl7:code" mode="dob400"/>
                <value>
                    <xsl:value-of select="hl7:text"/>
                </value>
                <pertainsTo>
                    <categoryInBDS>
                        <xsl:apply-templates select="ancestor::hl7:rubricCluster/hl7:code" mode="dob400"/>
                    </categoryInBDS>
                </pertainsTo>
            </nonBDSData>
        </component1>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Maakt een string van de oorspronkelijke waarde ten behoeve van nonBDSdata</xd:desc>
        <xd:param name="in">het element met de gegevens</xd:param>
    </xd:doc>
    <xsl:template name="DatatypeToString">
        <xsl:param name="in"/>
        
        <xsl:choose>
            <xsl:when test="$in[@displayName]">
                <xsl:value-of select="$in/@displayName"/>
            </xsl:when>
            <xsl:when test="$in[@code]">
                <xsl:value-of select="concat($in/@code, ' (', $in/@codeSystem, ')')"/>
            </xsl:when>
            <xsl:when test="$in[hl7:originalText]">
                <xsl:value-of select="$in/hl7:originalText"/>
            </xsl:when>
            <xsl:when test="$in[@root | @extension]">
                <xsl:value-of select="concat($in/@extension, ' (', $in/@root, ')')"/>
            </xsl:when>
            <xsl:when test="$in[string(@value) = 'true']">
                <xsl:value-of select="'ja'"/>
            </xsl:when>
            <xsl:when test="$in[string(@value) = 'false']">
                <xsl:value-of select="'nee'"/>
            </xsl:when>
            <xsl:when test="$in[@value]">
                <xsl:value-of select="normalize-space(concat($in/@value, ' ', $in/@unit))"/>
            </xsl:when>
            <xsl:when test="$in[@nullFlavor]">
                <xsl:value-of select="'onbekend'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>