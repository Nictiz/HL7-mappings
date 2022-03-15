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
            <xd:p><xd:b>Purpose:</xd:b> Conversie van een valide Dossieroverdrachtbericht op basis van BDS 3.2.7 (REPC_IN902120NL) naar een valide versie op basis van BDS 4.0.0 (REPC_IN902120NL03). Regelt zelf het bijwerken van de weergavenamen bij rubrieken, groepen en elementen. Laat de weergavenamen van waarden ongemoeid.</xd:p>
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
    <xsl:variable name="dob400date" select="'2020-05-27T00:00:00'"/>
    
    <xsl:variable name="W0639_HL7_W0646_HL7_W0647_HL7">
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.639" name="W0639_HL7" displayName="W0639 RubriekID (HL7) alle" effectiveDate="2020-05-27T00:00:00" statusCode="draft" versionLabel="400">
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
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.646" name="W0646_HL7" displayName="W0646 GroepID" effectiveDate="2020-05-27T00:00:00" statusCode="draft" versionLabel="400">
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
                <!--<concept code="G116" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Gezagstatus ouder/verzorger" level="0" type="L"/>-->
                <concept code="G117" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Visus" level="0" type="L"/>
                <!--<concept code="G118" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Rota-vaccinatie" level="0" type="L"/>-->
            </conceptList>
        </valueSet>
        <valueSet id="2.16.840.1.113883.2.4.3.11.60.100.11.2.647" name="W0647_HL7" displayName="W0647 BDS Elementen" effectiveDate="2020-05-27T00:00:00" statusCode="draft" versionLabel="400">
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
                <concept code="140" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Oorzaak geel zien" level="0" type="L"/>
                <concept code="142" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Therapie" level="0" type="L"/>
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
                <concept code="365" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden" level="0" type="L"/>
                <concept code="368" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hielprik afgenomen" level="0" type="L"/>
                <concept code="370" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende instantie hielprik" level="0" type="L"/>
                <concept code="373" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Type hielprik" level="0" type="L"/>
                <concept code="374" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum hielprik" level="0" type="L"/>
                <concept code="379" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden herhaling/tweede hielprik" level="0" type="L"/>
                <concept code="380" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden niet afgenomen hielprik" level="0" type="L"/>
                <concept code="381" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag" level="0" type="L"/>
                <concept code="390" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Cornea lichtreflex rechts" level="0" type="L"/>
                <concept code="391" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Cornea lichtreflex links" level="0" type="L"/>
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
                <concept code="481" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bedreiging sociaal milieu" level="0" type="D"/>
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
                <concept code="604" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisarts UZI" level="0" type="L"/>
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
                <concept code="688" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken hulpverlener UZI" level="0" type="L"/>
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
                <concept code="709" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huisartsenpraktijk URA" level="0" type="L"/>
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
                <concept code="723" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Andere betrokken hulpverlenersorganisatie URA" level="0" type="L"/>
                <concept code="724" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum activiteit" level="0" type="L"/>
                <concept code="725" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Status activiteit" level="0" type="L"/>
                <concept code="730" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-professional activiteit UZI" level="0" type="L"/>
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
                <concept code="827" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bedreiging fysiek milieu" level="0" type="D"/>
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
                <concept code="840" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Rode fundusreflex rechts" level="0" type="L"/>
                <concept code="841" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Rode fundusreflex links" level="0" type="L"/>
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
                <concept code="874" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verschijnselen" level="0" type="L"/>
                <concept code="875" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reactie gemeld aan bevoegde instantie datum" level="0" type="L"/>
                <concept code="876" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reactie gemeld aan bevoegde instantie door UZI" level="0" type="L"/>
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
                <concept code="1151" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Probleemomschrijving" level="0" type="L"/>
                <concept code="1152" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Oorzaak" level="0" type="L"/>
                <concept code="1153" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zich uitend in" level="0" type="L"/>
                <concept code="1154" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Doelen" level="0" type="L"/>
                <concept code="1155" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Interventies" level="0" type="L"/>
                <concept code="1156" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Evaluatie" level="0" type="L"/>
                <concept code="1157" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Voorlichtingsmateriaal" level="0" type="L"/>
                <concept code="1158" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Extra zorg/interventie" level="0" type="L"/>
                <concept code="1159" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verwijzing naar" level="0" type="L"/>
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
                <concept code="1194" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder UZI Verwijsindex risicojongeren" level="0" type="L"/>
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
                <concept code="1325" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Aanmelder UZI Veilig Thuis" level="0" type="L"/>
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
                <concept code="1351" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Contact met" level="0" type="D"/>
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
                <concept code="1379" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Oogonderzoek uitgevoerd" level="0" type="L"/>
                <concept code="1380" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden melding Veilig Thuis" level="0" type="L"/>
                <concept code="1381" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende UZI consultatie Veilig Thuis" level="0" type="L"/>
                <concept code="1382" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gebruikt hand" level="0" type="L"/>
                <concept code="1383" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="1384" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bedreigingen nagevraagd" level="0" type="D"/>
                <concept code="1385" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Arts UZI toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
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
                <concept code="1492" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gewichtsklasse op basis van BMI" level="0" type="L"/>
                <concept code="1493" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden geen deelname aan VVE" level="0" type="L"/>
                <concept code="1494" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verwijsbrief" level="0" type="L"/>
                <concept code="1495" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Overall risicoinschatting SPARK" level="0" type="L"/>
                <concept code="1496" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Score taalsignaleringsinstrument" level="0" type="L"/>
                <concept code="1497" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bestandsnaam" level="0" type="L"/>
                <concept code="1498" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bestand mimetype" level="0" type="L"/>
                <concept code="1499" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Zwemles" level="0" type="L"/>
                <concept code="1500" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Schoolzwemmen" level="0" type="L"/>
                <concept code="1501" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-professional activiteit naam" level="0" type="L"/>
                <concept code="1503" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vreemdelingennummer" level="0" type="L"/>
                <concept code="1504" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Arts BIG toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="1505" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Arts naam toestemming aan verpleegkundige om te vaccineren" level="0" type="L"/>
                <concept code="1506" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-organisatie naam" level="0" type="L"/>
                <concept code="1507" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verantwoordelijke JGZ-organisatie naam" level="0" type="L"/>
                <concept code="1508" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-professional activiteit BIG" level="0" type="L"/>
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
                <concept code="1523" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende JGZ-professional activiteit AGB" level="0" type="L"/>
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
                <!--<concept code="1543" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam bron overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1547" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam JGZ-medewerker registratie toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1548" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie URA registratie toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1549" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie AGB registratie toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1550" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie naam registratie toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1551" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum registratie toestemming overdracht dossier binnen JGZ" level="0" type="L"/>
                <concept code="1552" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam bron toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1553" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam JGZ-medewerker registratie toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1554" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie URA registratie toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1555" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie AGB registratie toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1556" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie naam registratie toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1557" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum registratie toestemming aanmelding LSP" level="0" type="L"/>
                <concept code="1558" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam bron toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1559" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam JGZ-medewerker registratie verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1560" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie URA registratie toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1561" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie AGB registratie toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1562" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="JGZ-organisatie naam registratie toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1563" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Datum registratie toestemming verstrekking informatie aan derden" level="0" type="L"/>
                <concept code="1564" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Naam bron bezwaar tegen hergebruik van geanonimiseerde dossiergegevens" level="0" type="L"/>
                <concept code="1565" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gezag ouder/verzorger" level="0" type="L"/>
                <concept code="1566" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Startdatum geldigheid gezag ouder/verzorger" level="0" type="L"/>
                <concept code="1567" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Einddatum geldigheid gezag ouder/verzorger" level="0" type="L"/>
                <concept code="1568" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden sociale/fysieke milieu" level="0" type="L"/>-->
                <concept code="1569" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Er zijn (blijvende) zorgen dat de opvoed- en/of opgroeisituatie van de jeugdige een bedreiging voor de veiligheid van de jeugdige kunnen vormen" level="0" type="L"/>
                <concept code="1570" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="De (blijvende) zorgen zijn gedeeld met de jeugdige/ouder(s)/verzorger(s)" level="0" type="L"/>
                <concept code="1571" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Reden om (blijvende) zorgen niet te delen" level="0" type="L"/>
                <concept code="1572" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afwegingsvraag 1: Is er een vermoeden van (dreiging van) huiselijk geweld en/of kindermishandeling?" level="0" type="L"/>
                <concept code="1573" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afwegingsvraag 2: Is er sprake van acute onveiligheid en/of structurele onveiligheid?" level="0" type="L"/>
                <concept code="1574" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afwegingsvraag 3: Ben ik, als JGZ-professional, in staat effectieve hulp te bieden of te organiseren?" level="0" type="L"/>
                <concept code="1575" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afwegingsvraag 4: Aanvaarden de betrokkenen de hulp? Ben ik in staat de hulp te bieden of te organiseren?" level="0" type="L"/>
                <concept code="1576" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Afwegingsvraag 5: Leidt de hulp binnen de gewenste termijn tot duurzame veiligheid en/of het welzijn van alle betrokkenen?" level="0" type="L"/>
                <concept code="1577" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Vorm activiteit" level="0" type="L"/>
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
                <concept code="1590" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Soort visuskaart" level="0" type="L"/>
                <concept code="1591" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag visus rechts" level="0" type="L"/>
                <concept code="1592" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitslag visus links" level="0" type="L"/>
                <!--<concept code="1593" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Is er een absolute contra-indicatie voor rota-vaccinatie afgegeven?" level="0" type="L"/>
                <concept code="1594" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Absolute contra-indicatie rota-vaccinatie" level="0" type="L"/>
                <concept code="1595" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Is er een relatieve contra-indicatie voor rota-vaccinatie afgegeven?" level="0" type="L"/>
                <concept code="1596" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Relatieve contra-indicatie rota-vaccinatie" level="0" type="L"/>
                <concept code="1597" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Heeft de moeder tijdens de zwangerschap een biological gebruikt?" level="0" type="L"/>
                <concept code="1598" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Is er een detecteerbare bloedspiegel bij het kind met betrekking tot biological?" level="0" type="L"/>-->
                <concept code="1599" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Uitvoerende activiteit discipline" level="0" type="L"/>
                <concept code="1600" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Contact ivm meldcode met functie" level="0" type="L"/>
                <concept code="1601" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Schoolverzuim" level="0" type="L"/>
                <concept code="1602" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting schoolverzuim" level="0" type="L"/>
                <concept code="1603" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Advies met betrekking tot deelname aan lesprogramma" level="0" type="L"/>
                <concept code="1604" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toelichting advies met betrekking tot deelname lesprogramma" level="0" type="L"/>
                <concept code="1605" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Status activiteit" level="0" type="L"/>
                <concept code="1606" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Contact ivm meldcode met naam" level="0" type="L"/>
                <concept code="1607" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Toestemming einddatum gegevensuitwisseling RVP" level="0" type="L"/>
                <concept code="5063" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="BCG litteken" level="0" type="L"/>
            </conceptList>
        </valueSet>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc> Replace schematron with the right version </xd:desc>
    </xd:doc>
    <xsl:template match="processing-instruction()[contains(., 'jgz-versturenDossieroverdrachtbericht')]">
        <xsl:processing-instruction name="xml-stylesheet"> type="text/xsl" href="../../Zorgtoepassing/Jeugdgezondheidszorg/DECOR/jgz-runtime-20200219T121823/jgz-versturenDossieroverdrachtbericht-03.xsl</xsl:processing-instruction>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Update root element van REPC_IN902120NL naar REPC_IN902120NL03</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:REPC_IN902120NL">
        <REPC_IN902120NL03 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../schemas/REPC_IN902120NL03.xsd" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="node()" mode="dob327"/>
        </REPC_IN902120NL03>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Update interactionId/@extension van REPC_IN902120NL naar REPC_IN902120NL03</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:interactionId" mode="dob327">
        <interactionId extension="REPC_IN902120NL03" root="2.16.840.1.113883.1.6" xmlns="urn:hl7-org:v3"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Voeg versiedatum aan templateId toe, conform specificatie</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10000']" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:attribute name="extension"><xsl:value-of select="$dob400date"/></xsl:attribute>
            <xsl:apply-templates select="node()" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Een dossier auteur is een uitvoerende organisatie. Een careStatus/auteur ook. In BDS 3.2.7 DOB legden we nog niet veel relatie tussen die twee waardoor R050 Zorggegevens "auteurs" nog wel onder careStatus kunnen staan. Vanaf BDS 4.0.0 hebben op die plaats echter geen author element meer en zouden deze verloren gaan. Daarom herschrijven we de careStatus authors naar dossierauteurs als deze er nog niet staan.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:CareProvisionRequest/hl7:sequelTo/hl7:careProvisionEvent" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:id" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <xsl:apply-templates select="hl7:statusCode" mode="dob327"/>
            <xsl:apply-templates select="hl7:effectiveTime" mode="dob327"/>
            <xsl:apply-templates select="hl7:subject" mode="dob327"/>
            <xsl:apply-templates select="hl7:responsibleParty" mode="dob327"/>
            <xsl:variable name="authorAndLow">
                <authorAndLow>
                    <xsl:for-each select="hl7:author/hl7:assignedEntity">
                        <x>
                            <xsl:value-of select="concat(hl7:id[1]/@root, hl7:id[1]/@extension, ../hl7:time/hl7:low/@value)"/>
                        </x>
                    </xsl:for-each>
                </authorAndLow>
            </xsl:variable>
            <xsl:variable name="author">
                <author>
                    <xsl:for-each select="hl7:author/hl7:assignedEntity">
                        <x>
                            <xsl:value-of select="concat(hl7:id[1]/@root, hl7:id[1]/@extension)"/>
                        </x>
                    </xsl:for-each>
                </author>
            </xsl:variable>
            <!-- Een dossier auteur is een uitvoerende organisatie. Een careStatus/auteur ook
                In BDS 3.2.7 DOB legden we nog niet veel relatie tussen die twee waardoor R050 Zorggegevens "auteurs" nog wel onder careStatus kunnen staan.
                Vanaf BDS 4.0.0 hebben op die plaats echter geen author element meer en zouden deze verloren gaan. Daarom halen we de careStatus authors naar deze plaats.
            -->
            <xsl:variable name="authorsTotal">
                <xsl:apply-templates select="hl7:author" mode="dob327"/>
                <xsl:for-each select="hl7:subjectOf/hl7:careStatus/hl7:author[hl7:time/hl7:low/@value]">
                    <xsl:variable name="careStatusAuthorAndLow" select="concat(hl7:assignedEntity/hl7:id[1]/@root, hl7:assignedEntity/hl7:id[1]/@extension, hl7:time/hl7:low/@value)"/>
                    <xsl:choose>
                        <xsl:when test="exslt:node-set($authorAndLow)//x[. = $careStatusAuthorAndLow]"/>
                        <xsl:otherwise>
                            <xsl:copy>
                                <xsl:apply-templates select="@*" mode="dob327"/>
                                <xsl:apply-templates mode="dob327"/>
                            </xsl:copy>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="hl7:subjectOf/hl7:careStatus/hl7:author[not(hl7:time/hl7:low/@value)]">
                    <xsl:variable name="careStatusAuthor" select="concat(hl7:assignedEntity/hl7:id[1]/@root, hl7:assignedEntity/hl7:id[1]/@extension)"/>
                    <xsl:choose>
                        <xsl:when test="exslt:node-set($author)//x[. = $careStatusAuthor]"/>
                        <xsl:otherwise>
                            <xsl:copy>
                                <xsl:apply-templates select="@*" mode="dob327"/>
                                <xsl:apply-templates mode="dob327"/>
                            </xsl:copy>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable>
            <!-- Add authors in order of contribution. Oldest first -->
            <xsl:for-each select="exslt:node-set($authorsTotal)/*">
                <xsl:sort select="hl7:time/hl7:low/@value"/>
                <xsl:copy-of select="."/>
            </xsl:for-each>
            
            <xsl:apply-templates select="hl7:appendage" mode="dob327"/>
            <xsl:apply-templates select="hl7:authorization" mode="dob327"/>
            <xsl:apply-templates select="hl7:summary" mode="dob327"/>
            <xsl:apply-templates select="hl7:pertinentInformation" mode="dob327"/>
            <xsl:apply-templates select="hl7:component1" mode="dob327"/>
            <xsl:apply-templates select="hl7:component2" mode="dob327"/>
            <xsl:apply-templates select="hl7:component3" mode="dob327"/>
            <xsl:apply-templates select="hl7:component4" mode="dob327"/>
            <xsl:apply-templates select="hl7:component5" mode="dob327"/>
            <xsl:apply-templates select="hl7:component6" mode="dob327"/>
            <xsl:apply-templates select="hl7:component7" mode="dob327"/>
            <xsl:apply-templates select="hl7:subjectOf" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Nationaliteit. Verplaatsen van asCitizen naar subjectOf1/administrativeObservation</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:subject/hl7:patient[hl7:patientPerson]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:id" mode="dob327"/>
            <xsl:apply-templates select="hl7:addr" mode="dob327"/>
            <xsl:apply-templates select="hl7:telecom" mode="dob327"/>
            <xsl:apply-templates select="hl7:statusCode" mode="dob327"/>
            <xsl:apply-templates select="hl7:confidentialityCode" mode="dob327"/>
            <xsl:apply-templates select="hl7:patientPerson" mode="dob327"/>
            <xsl:apply-templates select="hl7:subjectOf1" mode="dob327"/>
            <xsl:choose>
                <!-- Kan eigenlijk niet, maar beter voorkomen dan genezen -->
                <xsl:when test="hl7:subjectOf1/hl7:administrativeObservation/hl7:code[@code='28'][@codeSystem='2.16.840.1.113883.2.4.4.40.267']"/>
                <xsl:when test="hl7:patientPerson/hl7:asCitizen[hl7:code[@code = 'CAS' or @code = 'CASM'][@codeSystem = '2.16.840.1.113883.5.111']]">
                    <subjectOf1 typeCode="SBJ" xmlns="urn:hl7-org:v3">
                        <administrativeObservation classCode="OBS" moodCode="EVN">
                            <code code="28" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Asielzoekerskind"/>
                            <value xsi:type="BL" value="true"/>
                        </administrativeObservation>
                    </subjectOf1>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="hl7:coveredPartyOf" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Huisarts: R006 - templateId 2.16.840.1.113883.2.4.6.10.100.104 toevoegen, Andere betrokken organisaties/hulpverleners: R007 - templateId 2.16.840.1.113883.2.4.6.10.100.107 toevoegen, Voor‑ of buitenschoolse voorzieningen/school: R008 - templateId 2.16.840.1.113883.2.4.6.10.100.108 toevoegen</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:patientPerson/hl7:asPatientOfOtherProvider/hl7:subjectOf/hl7:careProvision" mode="dob327">
        <xsl:choose>
            <!-- Huisarts -->
            <xsl:when test="hl7:code[@code][@codeSystem = '2.16.840.1.113883.5.4']">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="dob327"/>
                    <templateId root="2.16.840.1.113883.2.4.6.10.100.104" xmlns="urn:hl7-org:v3"/>
                    <xsl:apply-templates select="node()" mode="dob327"/>
                </xsl:copy>
            </xsl:when>
            <!-- Voor‑ of buitenschoolse voorzieningen/school: R008 -->
            <xsl:when test="hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.2']">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="dob327"/>
                    <templateId root="2.16.840.1.113883.2.4.6.10.100.108" xmlns="urn:hl7-org:v3"/>
                    <xsl:apply-templates select="node()" mode="dob327"/>
                </xsl:copy>
            </xsl:when>
            <!-- Andere betrokken organisaties/hulpverleners: R007 -->
            <xsl:when test="hl7:code[@nullFlavor]">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="dob327"/>
                    <templateId root="2.16.840.1.113883.2.4.6.10.100.107" xmlns="urn:hl7-org:v3"/>
                    <code code="G082" codeSystem="2.16.840.1.113883.2.4.4.40.393" displayName="Andere organisaties/hulpverleners" xmlns="urn:hl7-org:v3"/>
                    <xsl:for-each select="node()">
                        <xsl:choose>
                            <xsl:when test="self::hl7:code"/>
                            <xsl:otherwise>
                                <xsl:apply-templates select="." mode="dob327"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>Onbekende asPatientOfOtherProvider relatie aan patientPerson op basis van onderliggende careProvision/code. Verwacht: Huisarts, Andere betrokken organisaties/hulpverleners of Voor‑ of buitenschoolse voorzieningen/school</xsl:message>
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="dob327"/>
                    <xsl:apply-templates select="node()" mode="dob327"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Vervang @nullFlavor door het algemenere NI (no information). Deze is mogelijk UNK (onbekend) of NA (not applicable) op basis van historische specificaties.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:patientPerson/hl7:asPatientOfOtherProvider/hl7:subjectOf/hl7:careProvision/hl7:performer/hl7:assignedProvider/hl7:id[@nullFlavor] | 
                         hl7:patientPerson/hl7:asPatientOfOtherProvider/hl7:subjectOf/hl7:careProvision/hl7:performer/hl7:assignedProvider/hl7:representedOrganization/hl7:id[@nullFlavor]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:attribute name="nullFlavor">
                <xsl:value-of select="'NI'"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Nationaliteit. Zie voor Asielzoekerskind patient/subjectOf1/administrativeObservation</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:patientPerson/hl7:asCitizen" mode="dob327">
        <xsl:choose>
            <xsl:when test="hl7:code[not(@code = 'CN')][@codeSystem = '2.16.840.1.113883.5.111']"/>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="hl7:politicalNation" mode="dob327"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Vervang @classCode=ECON (contact bij noodgevallen) door @classCode=CON (contactpersoon, meer neutraal)</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:patientPerson/hl7:asStudent/hl7:schoolOrganization/hl7:contactParty" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:attribute name="classCode">CON</xsl:attribute>
            <xsl:apply-templates select="node()" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Kopieer einde geldigheid die op author/time/high staat, naar consentEvent/effectiveTime/high</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:authorization/hl7:consentEvent" mode="dob327">
        <xsl:variable name="bdselement1537" select="hl7:subjectOf/hl7:annotation[hl7:code[@code='1537-1541'][@codeSystem='2.16.840.1.113883.2.4.4.40.267']]/hl7:text"/>
        <xsl:variable name="jgzOrganization" select="hl7:author/hl7:patient1/hl7:providerOrganization | hl7:author/hl7:responsibleParty/hl7:representedOrganization"/>
        
        <consentEvent xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <xsl:if test="hl7:author/hl7:time/hl7:high">
                <effectiveTime>
                    <xsl:copy-of select="hl7:author/hl7:time/hl7:high"/>
                </effectiveTime>
            </xsl:if>
            <xsl:apply-templates select="hl7:author" mode="dob327"/>
            
            <xsl:if test="$bdselement1537 | $jgzOrganization">
                <xsl:variable name="theName" select="substring-after(substring-after($bdselement1537, '|'), '|')"/>
                
                <consultant typeCode="CON" xmlns="urn:hl7-org:v3">
                    <assignedEntity1 classCode="ASSIGNED">
                        <xsl:if test="string-length($theName) &gt; 0">
                            <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                <name><xsl:value-of select="$theName"/></name>
                            </assignedPerson>
                        </xsl:if>
                        <xsl:for-each select="$jgzOrganization">
                            <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                <xsl:apply-templates select="hl7:id" mode="dob327"/>
                                <xsl:apply-templates select="hl7:name" mode="dob327"/>
                            </representedOrganization>
                        </xsl:for-each>
                    </assignedEntity1>
                </consultant>
            </xsl:if>
            
            <!-- Dossierniveau rubriek 10 -->
            <xsl:apply-templates select="hl7:subjectOf" mode="dob327"/>
            <!-- Rijksvaccinatie CMET -->
            <xsl:apply-templates select="hl7:reasonOf" mode="dob327"/>
        </consentEvent>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Zorg dat author/time en TS is. Einde geldigheid moet eraf.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:authorization/hl7:consentEvent/hl7:author/hl7:time" mode="dob327">
        <time value="{(@value | hl7:low/@value)[1]}" xmlns="urn:hl7-org:v3"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>&lt;patient1 classCode="PAT"&gt;&lt;patientPerson&gt;&lt;name&gt;Persoonsnaam&lt;/name&gt;&lt;/patientPerson&gt;&lt;/patient1&gt; wordt responsibleParty met dezelfde naam. providerOrganization gaat samen met de JGZ-medewerkernaam in annotation naar consultant.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:authorization/hl7:consentEvent/hl7:author/hl7:patient1" mode="dob327">
        <responsibleParty classCode="CON" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="hl7:id" mode="dob327"/>
            <xsl:choose>
                <xsl:when test="../../hl7:code[@code = '1533'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']">
                    <code code="01" codeSystem="2.16.840.1.113883.2.4.4.40.435" displayName="Cliënt/jeugdige"/>
                </xsl:when>
                <xsl:otherwise>
                    <code code="ONESELF" codeSystem="2.16.840.1.113883.5.111" displayName="Self"/>
                </xsl:otherwise>
            </xsl:choose>
            <agentPerson>
                <xsl:call-template name="dtPNtoTN">
                    <xsl:with-param name="nm" select="(ancestor::hl7:careProvisionEvent[1]/hl7:subject/hl7:patient/hl7:patientPerson/hl7:name)[1]"/>
                </xsl:call-template>
            </agentPerson>
        </responsibleParty>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>&lt;personalRelationship classCode="PRS"&gt;&lt;code&gt;&lt;/code&gt;&lt;relationshipHolder classCode="PSN" determinerCode="INSTANCE"/&gt;&lt;/personalRelationship&gt; wordt responsibleParty met dezelfde naam</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:authorization/hl7:consentEvent/hl7:author/hl7:personalRelationship" mode="dob327">
        <responsibleParty classCode="CON" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="hl7:id" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <agentPerson>
                <xsl:choose>
                    <xsl:when test="hl7:relationshipHolder/hl7:name">
                        <xsl:for-each select="hl7:relationshipHolder/hl7:name">
                            <xsl:call-template name="dtPNtoTN">
                                <xsl:with-param name="nm" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <name nullFlavor="NI"/>
                    </xsl:otherwise>
                </xsl:choose>
            </agentPerson>
        </responsibleParty>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>&lt;assignedEntity1 classCode="ASSIGNED"&gt;&lt;code&gt;&lt;/code&gt;&lt;assignedPerson classCode="" determinerCode=""&gt;&lt;name&gt;&lt;/name&gt;&lt;/assignedPerson&gt;&lt;representedOrganization classCode="ORG" determinerCode="INSTANCE"&gt;&lt;id/&gt;&lt;/representedOrganization&gt;wordt responsibleParty met dezelfde naam</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:authorization/hl7:consentEvent/hl7:author/hl7:assignedEntity1" mode="dob327">
        <responsibleParty classCode="ASSIGNED" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="hl7:id" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <agentPerson>
                <xsl:choose>
                    <xsl:when test="hl7:assignedPerson/hl7:name">
                        <xsl:for-each select="hl7:assignedPerson/hl7:name">
                            <xsl:call-template name="dtPNtoTN">
                                <xsl:with-param name="nm" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <name nullFlavor="NI"/>
                    </xsl:otherwise>
                </xsl:choose>
            </agentPerson>
            <xsl:apply-templates select="hl7:representedOrganization" mode="dob327"/>
        </responsibleParty>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>responsibleParty was alleen gedefinieerd voor toestemmingen RVP en bevat onjuist, maar omdat er geen ander plek was in het schema, de JGZ organisatiegegevens. Deze laatste verplaatsen naar consultant samen met de JGZ-medewerkernaam uit annotation</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:authorization/hl7:consentEvent/hl7:author/hl7:responsibleParty" mode="dob327">
        <responsibleParty classCode="CON" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="hl7:id" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <agentPerson>
                <xsl:choose>
                    <xsl:when test="hl7:agentPerson/hl7:name">
                        <xsl:for-each select="hl7:agentPerson/hl7:name">
                            <xsl:call-template name="dtPNtoTN">
                                <xsl:with-param name="nm" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <name nullFlavor="NI"/>
                    </xsl:otherwise>
                </xsl:choose>
            </agentPerson>
        </responsibleParty>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Annotation was ACT, maar is nu OBS. Act.text (ST) is nu Act.value (ANY). Bij element 1541: value[@xsi:type=CV]. Alles wat niet expliciet hetzelfde is, wordt 03 Gezaghebbende (Geen toestemming van andere gezaghebbende vereist)</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:authorization/hl7:consentEvent/hl7:subjectOf/hl7:annotation[hl7:code[@code = '1537-1541']]/hl7:text" mode="dob327">
        <xsl:variable name="theCode" select="normalize-space(substring-before(., '|'))"/>
        <xsl:variable name="theCodeSystem" select="'2.16.840.1.113883.2.4.4.40.423'"/>
        <xsl:choose>
            <xsl:when test="$theCode = 'OTH'">
                <xsl:variable name="theOriginalText" select="substring-before(substring-after(., '|'), '|')"/>
                <value xsi:type="CV" nullFlavor="{$theCode}" xmlns="urn:hl7-org:v3">
                    <originalText><xsl:value-of select="$theOriginalText"/></originalText>
                </value>
            </xsl:when>
            <xsl:when test="$theCode = '01'">
                <value xsi:type="CV" code="{$theCode}" codeSystem="{$theCodeSystem}" displayName="Schriftelijk" xmlns="urn:hl7-org:v3"/>
            </xsl:when>
            <xsl:when test="$theCode = '02'">
                <value xsi:type="CV" code="{$theCode}" codeSystem="{$theCodeSystem}" displayName="Mondeling" xmlns="urn:hl7-org:v3"/>
            </xsl:when>
            <xsl:when test="$theCode = '03'">
                <value xsi:type="CV" code="{$theCode}" codeSystem="{$theCodeSystem}" displayName="Portaal" xmlns="urn:hl7-org:v3"/>
            </xsl:when>
            <xsl:otherwise>
                <value xsi:type="CV" code="{$theCode}" codeSystem="{$theCodeSystem}" xmlns="urn:hl7-org:v3"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Annotation was ACT, but now is OBS. Act.text (ST) is now Act.value (ANY). If ACT.text really is ST, then so is value[@xsi:type=ST]</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:careProvisionEvent/hl7:componentOf7/hl7:*/hl7:*/hl7:annotation/hl7:text | 
                         hl7:careProvisionEvent/hl7:componentOf7/hl7:*/hl7:*/hl7:conclusion/hl7:subjectOf/hl7:annotation/hl7:text" mode="dob327">
        <value xsi:type="ST" xmlns="urn:hl7-org:v3"><xsl:value-of select="."/></value>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:subjectOf1/hl7:conclusion/hl7:component/hl7:indication/hl7:reasonOf bevat alleen nog maar actIntent en referral. Referral blijft ongewijzigd, overige worden herschreven in actIntent element met zelfde inhoud</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:subjectOf1/hl7:conclusion/hl7:component/hl7:indication/hl7:reasonOf" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:choose>
                <xsl:when test="hl7:referral">
                    <xsl:apply-templates select="hl7:referral" mode="dob327"/>
                </xsl:when>
                <xsl:otherwise>
                    <actIntent classCode="ACT" moodCode="INT" xmlns="urn:hl7-org:v3">
                        <xsl:apply-templates select="*/hl7:*" mode="dob327"/>
                    </actIntent>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:component7/hl7:encounter heeft nieuwe pertinentInformation met rubricCluster18 nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component7/hl7:encounter" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:call-template name="rubricCluster18"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:component7/hl7:nonEncounterCareActivity wordt hl7:component7/hl7:encounter[@moodCode = 'EVN']</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component7/hl7:nonEncounterCareActivity" mode="dob327">
        <encounter moodCode="EVN" xmlns="urn:hl7-org:v3">
            <xsl:call-template name="rubricCluster18"/>
        </encounter>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:component7/hl7:registrationEvent wordt hl7:component7/hl7:encounter[@moodCode = 'EVN']</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component7/hl7:registrationEvent" mode="dob327">
        <encounter moodCode="EVN" xmlns="urn:hl7-org:v3">
            <xsl:call-template name="rubricCluster18"/>
        </encounter>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>hl7:component7/*/hl7:consultant/hl7:assignedEntity/hl7:code/hl7:originalText wordt ../../hl7:assignedPerson/hl7:name</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component7/*/hl7:consultant/hl7:assignedEntity" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <assignedPerson classCode="PSN" determinerCode="INSTANCE" xmlns="urn:hl7-org:v3">
                <name><xsl:value-of select="hl7:code/hl7:originalText"/></name>
            </assignedPerson>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Soort activiteit: 494, 1..1 (W0188, KL_AN, Soort activiteit) - waardelijst bijwerken</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.308']" mode="dob327">
        <xsl:copy>
            <xsl:choose>
                <!-- Huisbezoek 4-7 dagen: 01 Tekst: Contact 4-7 dagen -->
                <xsl:when test="@code = '01'">
                    <xsl:copy-of select="@code"/>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact 4-7 dagen'"/>
                    </xsl:attribute>
                </xsl:when>
                <!-- Huisbezoek 2 weken: 02, 02 Naar: Contact week 2 t/m 6 maanden -->
                <!-- Contactmoment 4 weken: 03, 03 Naar: Contact week 2 t/m 6 maanden -->
                <!-- Contactmoment 8 weken: 04, 04 Naar: Contact week 2 t/m 6 maanden -->
                <!-- Contactmoment 3 maanden: 05, 05 Naar: Contact week 2 t/m 6 maanden -->
                <!-- Contactmoment 4 maanden: 06, 06 Naar: Contact week 2 t/m 6 maanden -->
                <!-- Contactmoment 6 maanden: 07, 07 Naar: Contact week 2 t/m 6 maanden -->
                <!--<xsl:when test="@code = '02' or @code = '03' or @code = '04' or @code = '05' or @code = '06' or @code = '07'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'37'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact week 2 t/m 6 maanden'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Contactmoment 7,5 maand: 08, 08 Naar: Contact 7 t/m 12 maanden -->
                <!-- Contactmoment 9 maanden: 09, 09 Naar: Contact 7 t/m 12 maanden -->
                <!-- Contactmoment 11 maanden: 10, 10 Naar: Contact 7 t/m 12 maanden -->
                <!--<xsl:when test="@code = '08' or @code = '09' or @code = '10'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'38'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact 7-12 maanden'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Contactmoment 14 maanden: 11, 11 Naar: Contact 1 tot 4 jaar -->
                <!-- Contactmoment 18 maanden: 12, 12 Naar: Contact 1 tot 4 jaar -->
                <!-- Contactmoment 2 jaar: 13, 13 Naar: Contact 1 tot 4 jaar -->
                <!-- Contactmoment 3 jaar: 14, 14 Naar: Contact 1 tot 4 jaar -->
                <!-- Contactmoment 3,9 jaar: 15, 15 Naar: Contact 1 tot 4 jaar -->
                <!--<xsl:when test="@code = '11' or @code = '12' or @code = '13' or @code = '14' or @code = '15'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'39'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact 1 tot 4 jaar'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Contactmoment groep 2: 16, 16 Naar: Contact 4 tot 12 jaar -->
                <!-- Contactmoment groep 7: 17, 17 Naar: Contact 4 tot 12 jaar -->
                <!--<xsl:when test="@code = '16' or @code = '17'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'40'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact 4 tot 12 jaar'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Massavaccinatie: 18, 18 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '18'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Massavaccinatie</originalText>
                </xsl:when>-->
                <!-- Contactmoment klas 2: 19, 19 Naar: Contact 12 tot 18 jaar -->
                <!--<xsl:when test="@code = '19'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'41'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact 12 tot 18 jaar'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Contactmoment speciaal onderwijs: 20, 20 Naar: Contact Speciaal Onderwijs 0 tot 18 jaar -->
                <xsl:when test="@code = '20'">
                    <xsl:copy-of select="@code"/>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact Speciaal Onderwijs 0 tot 18 jaar'"/>
                    </xsl:attribute>
                </xsl:when>
                <!-- Huisbezoek op indicatie: 21, 21 Naar: Contact op indicatie -->
                <!-- Contactmoment op indicatie: 22, 22 Tekst: Contact op indicatie -->
                <!-- Contactmoment op verzoek: 23, 23 Naar: Contact op indicatie -->
                <!-- Intake nieuwkomers: 27, 27 Naar: Contact op indicatie -->
                <!--<xsl:when test="@code = '21' or @code = '22' or @code = '23' or @code = '27'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'22'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact op indicatie'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Telefonisch contactmoment: 24, 24 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '24'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Telefonisch contactmoment</originalText>
                </xsl:when>-->
                <!-- Spreekuur (0-19): 25, 25 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '25'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Spreekuur (0-19)</originalText>
                </xsl:when>-->
                <!-- Groepsbijeenkomst (of groepsvoorlichting): 26, 26 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '26'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Groepsbijeenkomst (of groepsvoorlichting)</originalText>
                </xsl:when>-->
                <!-- Consultatie/inlichtingen vragen: 29, 29 Naar: Contact met derden - bilateraal -->
                <!--<xsl:when test="@code = '29'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'43'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact met derden-bilateraal'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Bespreking zorgstructuur: 34, 34 Naar: Contact met derden - multidisciplinair -->
                <!--<xsl:when test="@code = '34'">
                    <xsl:attribute name="code">
                        <xsl:value-of select="'44'"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@codeSystem"/>
                    <xsl:attribute name="displayName">
                        <xsl:value-of select="'Contact met derden-multidisciplinair'"/>
                    </xsl:attribute>
                </xsl:when>-->
                <!-- Melding: 30, 30 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '30'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Melding</originalText>
                </xsl:when>-->
                <!-- Terugkoppeling verwijzing: 31, 31 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '31'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Terugkoppeling verwijzing</originalText>
                </xsl:when>-->
                <!-- Zorgcoördinatie: 32, 32 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '32'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Zorgcoördinatie</originalText>
                </xsl:when>-->
                <!-- Uitvoering hielprik/vaccinatie buiten de organisatie: 33, 33 Naar: Andere activiteit -->
                <!--<xsl:when test="@code = '33'">
                    <xsl:attribute name="nullFlavor">
                        <xsl:value-of select="'OTH'"/>
                    </xsl:attribute>
                    <originalText xmlns="urn:hl7-org:v3">Uitvoering hielprik/vaccinatie buiten de organisatie</originalText>
                </xsl:when>-->
                <xsl:otherwise>
                    <xsl:apply-templates select="@* | node()" mode="dob327"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Vaste waarde statusCode/@code = 'completed' </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:inFulfillmentOf/hl7:encounter/hl7:statusCode" mode="dob327">
        <xsl:copy>
            <xsl:attribute name="code">
                <xsl:value-of select="'completed'"/>
            </xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>BDS-element 1384 Bedreigingen nagevraagd is vervallen. Als dat het enige component is, dan hele rubriek overslaan</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:pertinentInformation[hl7:rubricCluster[count(hl7:groupCluster | hl7:component) = 1][hl7:component[hl7:observation[hl7:code[@code = '1384'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]]]" mode="dob327">
        <xsl:comment> rubricCluster: Rubriek 13 "Bedreigingen" met alleen element 1384 overgeslagen </xsl:comment>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Do not copy careStatus/author</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:careProvisionEvent/hl7:subjectOf/hl7:careStatus/hl7:author" mode="dob327"/>
    
    <!--<xd:doc>
        <xd:desc>
            <xd:p>Rubriek 19, element 148 'Anamnese nagevraagd' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:p>
            <xd:p>Rubriek 19, element 748 'Anamnese' is verplicht vanaf BDS 4.0.0 in de transactie. In DOB template was de verplichting al aanwezig en je kunt hier geen anamnese 'verzinnen'.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R019'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element juist te verwijderen in plaats van verplicht erin te laten -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '148'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40148"/>
                        <code code="148" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Anamnese nagevraagd"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>
            <xd:p>Rubriek 20, element 756 'Algemene indruk verkregen' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R020'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '756'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40756"/>
                        <code code="756" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Algemene indruk verkregen"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>
            <xd:p>Rubriek 21, element 321 'Lichamelijk functioneren nagevraagd' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:p>
            <xd:p>Rubriek 21, element 772 'Adaptatie/persoonlijkheid/sociaal gedrag nagevraagd' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:p>
            <xd:p>Rubriek 21, element 787 'Functioneren op school nagevraagd' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R021'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '321'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40321"/>
                        <code code="321" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Lichamelijk functioneren nagevraagd"/>
                        <!-\\- true als een van deze aanwezig is
                            Zindelijkheid: 324 0..* (W0209, KL_AN, Ontlasten/plassen/zindelijkheid)
                            Bijzonderheden ontlasten/plassen/zindelijkheid: 325 0..1 (W0082, AN, Alfanumeriek 4000)
                            Seksueel actief: 770 0..1 (W0004, BL, Ja Nee)
                            Anticonceptie: 771 0..* (W0211, KL_AN, Anticonceptie)
                        -\\->
                        <xsl:choose>
                            <xsl:when test="
                                    hl7:component[hl7:observation[hl7:code[@code = '324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                    hl7:component[hl7:observation[hl7:code[@code = '325'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                    hl7:component[hl7:observation[hl7:code[@code = '770'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                    hl7:component[hl7:observation[hl7:code[@code = '771'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]
                            ">
                                <value xsi:type="BL" value="true"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <value xsi:type="BL" value="false"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </observation>
                </component>
            </xsl:if>-\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '772'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40772"/>
                        <code code="772" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Adaptatie/persoonlijkheid/sociaal gedrag nagevraagd"/>
                        <!-\\- true als een van deze aanwezig is
                            Bijzonderheden hechting: 773 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden ouder-kind relatie: 774 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden gedrag/temperament: 328 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden karakter/persoonlijkheid: 775 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden zelfbeeld: 776 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden stemming/angsten: 777 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden ontdekkingsdrang: 778 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden zelfstandigheid: 779 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden begrijpen: 780 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden wilsontwikkeling: 781 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden omgaan met broer/zus/leeftijdgenoten: 1422 0..* (W0657, KL_AN, Bijzonderheden omgaan met broer/zus/leeftijdgenoten)
                            Bijzonderheden contact met volwassenen: 782 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden omgaan met nieuwe situaties: 783 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden geweld/delinquent gedrag: 784 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden verslavingsrisico: 785 0..* (W0214, KL_AN, Bijzonderheden verslavingsrisico)
                            Toelichting verslavingsrisico: 786 0..1 (W0082, AN, Alfanumeriek 4000)
                            Functioneren op school nagevraagd: 787 1..1 (W0004, BL, Ja Nee)
                        -\\->
                        <xsl:choose>
                            <xsl:when test="
                                hl7:component[hl7:observation[hl7:code[@code = '773'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '774'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '328'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '775'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '776'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '777'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '778'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '779'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '780'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '781'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '1422'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '782'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '783'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '784'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '785'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '786'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '787'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]
                                ">
                                <value xsi:type="BL" value="true"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <value xsi:type="BL" value="false"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </observation>
                </component>
            </xsl:if>-\->
            <!-\-<<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '787'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40787"/>
                        <code code="787" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Functioneren op school nagevraagd"/>
                        <!-\\- true als een van deze aanwezig is
                            Bijzonderheden functioneren in de klas: 790 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden indruk school: 791 0..1 (W0082, AN, Alfanumeriek 4000)
                            Bijzonderheden schoolverzuim: 792 0..1 (W0082, AN, Alfanumeriek 4000)
                        -\\->
                        <xsl:choose>
                            <xsl:when test="
                                hl7:component[hl7:observation[hl7:code[@code = '790'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '791'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] |
                                hl7:component[hl7:observation[hl7:code[@code = '792'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]
                                ">
                                <value xsi:type="BL" value="true"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <value xsi:type="BL" value="false"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 22, element 161 'Huid/haar/nagels onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R022'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '161'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40161"/>
                        <code code="161" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Huid/haar/nagels onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 23, element 167 'Hoofd/hals onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R023'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '167'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40167"/>
                        <code code="167" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hoofd/hals onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 24, element 196 'Romp onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '196'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40196"/>
                        <code code="196" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Romp onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 25, element 212 'Bewegingsapparaat onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R025'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '212'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40212"/>
                        <code code="212" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bewegingsapparaat onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 26, element 225 'Genitalia/puberteitsontwikkeling onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '225'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40225"/>
                        <code code="225" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Genitalia/puberteitsontwikkeling onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 30, element 259 'Psychosociaal en cognitief functioneren onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R030'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '259'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40259"/>
                        <code code="259" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Psychosociaal en cognitief functioneren onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 31, element 268 'Motorische ontwikkeling onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R031'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '268'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40268"/>
                        <code code="268" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Motorische ontwikkeling onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 32, element 294 'Spraak- en taalontwikkeling onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R032'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '294'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40294"/>
                        <code code="294" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Spraak- en taalontwikkeling onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 34, element 339 'Verhouding draaglast-draagkracht onderzocht' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R034'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '339'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40339"/>
                        <code code="339" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Verhouding draaglast-draagkracht onderzocht"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 38, element 1379 'Oogonderzoek uitgevoerd' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig. Pupil zwart, pupil rond, pupilreactie samenvoegen met Bijzonderheden inspectie oog</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R038'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <!-\- proberen zo kort mogelijk te blijven... we hebben tenslotte maar 500 tekens samen met oorspronkelijke bijzonderheden -\->
        <xsl:variable name="element851BijzonderhedenInspectieOog">
            <xsl:for-each select="hl7:component/hl7:observation[hl7:code[@code = '851'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
                <xsl:value-of select="hl7:value"/>
                <xsl:text> </xsl:text>
            </xsl:for-each>
            <xsl:if test="
                hl7:component/hl7:observation[hl7:code[@code = '402'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']] |
                hl7:component/hl7:observation[hl7:code[@code = '403'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
                <xsl:text>Pupil zwart R/L: </xsl:text>
                <xsl:call-template name="W0195DisplayName">
                    <xsl:with-param name="inR" select="hl7:component/hl7:observation[hl7:code[@code = '402'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                    <xsl:with-param name="inL" select="hl7:component/hl7:observation[hl7:code[@code = '403'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                </xsl:call-template>
                <xsl:text>. </xsl:text>
            </xsl:if>
            <xsl:if test="
                hl7:component/hl7:observation[hl7:code[@code = '404'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']] |
                hl7:component/hl7:observation[hl7:code[@code = '405'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
                <xsl:text>Pupil rond R/L: </xsl:text>
                <xsl:call-template name="W0195DisplayName">
                    <xsl:with-param name="inR" select="hl7:component/hl7:observation[hl7:code[@code = '404'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                    <xsl:with-param name="inL" select="hl7:component/hl7:observation[hl7:code[@code = '405'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                </xsl:call-template>
                <xsl:text>. </xsl:text>
            </xsl:if>
            <xsl:if test="
                hl7:component/hl7:observation[hl7:code[@code = '406'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']] |
                hl7:component/hl7:observation[hl7:code[@code = '407'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
                <xsl:text>Pupilreactie R/L: </xsl:text>
                <xsl:call-template name="W0195DisplayName">
                    <xsl:with-param name="inR" select="hl7:component/hl7:observation[hl7:code[@code = '406'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                    <xsl:with-param name="inL" select="hl7:component/hl7:observation[hl7:code[@code = '407'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]"/>
                </xsl:call-template>
                <xsl:text>. </xsl:text>
            </xsl:if>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '1379'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.41379"/>
                        <code code="1379" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Oogonderzoek uitgevoerd"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId' or hl7:observation[hl7:code[@code = '851'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']])]" mode="dob327"/>
            <xsl:if test="not($element851BijzonderhedenInspectieOog = '')">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40851"/>
                        <code code="851" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Bijzonderheden inspectie oog"/>
                        <value xsi:type="ST">
                            <xsl:value-of select="substring($element851BijzonderhedenInspectieOog, 1, 500)"/>
                        </value>
                    </observation>
                </component>
            </xsl:if>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 39, element 855 'Hartonderzoek uitgevoerd' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R039'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '855'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40855"/>
                        <code code="855" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Hartonderzoek uitgevoerd"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xd:doc>
        <xd:desc>Rubriek 40, element 438 'Gehooronderzoek uitgevoerd' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R040'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <!-\- 2020-06-12 Redactieraad besluit dit element om historische redenen toch optioneel te laten in de DOB en niet met terugwerkende kracht af te dwingen -\->
            <!-\-<xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '438'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.40438"/>
                        <code code="438" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Gehooronderzoek uitgevoerd"/>
                        <value xsi:type="BL" value="true"/>
                    </observation>
                </component>
            </xsl:if>-\->
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc>Rubriek 13: element 1384 vervallen</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component[hl7:observation[hl7:code[@code = '1384'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]" mode="dob327">
        <xsl:comment><xsl:text> element </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@code"/><xsl:text> </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@displayName"/><xsl:text> is vervallen </xsl:text></xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc>Rubriek 38: elementen 402-407, 842, 853-854 vervallen</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component[hl7:observation[hl7:code[@code = '394' or @code = '395' or @code = '402' or @code = '403' or @code = '404' or @code = '405' or @code = '406' or @code = '407' or @code = '842' or @code = '852' or @code = '853' or @code = '854'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]" mode="dob327">
        <xsl:comment><xsl:text> element </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@code"/><xsl:text> </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@displayName"/><xsl:text> is vervallen </xsl:text></xsl:comment>
    </xsl:template>
    <xd:doc>
        <xd:desc>Rubriek 21: elementen 792 vervallen</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component[hl7:observation[hl7:code[@code = '792'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]" mode="dob327">
        <xsl:comment><xsl:text> element </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@code"/><xsl:text> </xsl:text><xsl:value-of select="hl7:observation/hl7:code/@displayName"/><xsl:text> is vervallen </xsl:text></xsl:comment>
    </xsl:template>
    
    <!--<xd:doc>
        <xd:desc>Rubriek 42, element 1531 'Kolom Van Wiechen onderzoek' is verplicht vanaf BDS 4.0.0. Toevoegen indien nodig? Doen moet je gaan rekenen aan datums. Foutkans te groot...</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:rubricCluster[hl7:code[@code = 'R042'][@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <xsl:if test="not(hl7:component[hl7:observation[hl7:code[@code = '1531'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])">
                <component xmlns="urn:hl7-org:v3">
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.41531"/>
                        <code code="1384" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Kolom Van Wiechen onderzoek"/>
                        <value xsi:type="CV" code="????" codeSystem="" displayName=""/>
                    </observation>
                </component>
            </xsl:if>
            <xsl:apply-templates select="hl7:*[not(local-name() = 'code' or local-name() = 'templateId')]" mode="dob327"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc>BDS-rubrieknamen, BDS-groepnamen en BDS-elementnamen bijwerken. Element code 1537-1541 wordt element 1541. Element 476 wordt groep G088</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] | hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.393'] | hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.267']" mode="dob327">
        <xsl:variable name="theCode">
            <xsl:choose>
                <xsl:when test="@code = '1537-1541'">1541</xsl:when>
                <xsl:when test="@code = '476' and ancestor::hl7:informationControlActEvent">G088</xsl:when>
                <xsl:otherwise><xsl:value-of select="@code"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="theCodeSystem">
            <xsl:choose>
                <xsl:when test="$theCode = 'G088'">2.16.840.1.113883.2.4.4.40.393</xsl:when>
                <xsl:otherwise><xsl:value-of select="@codeSystem"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:attribute name="code"><xsl:value-of select="$theCode"/></xsl:attribute>
            <xsl:attribute name="codeSystem"><xsl:value-of select="$theCodeSystem"/></xsl:attribute>
            <xsl:copy-of select="exslt:node-set($W0639_HL7_W0646_HL7_W0647_HL7)//concept[@code = $theCode][@codeSystem = $theCodeSystem]/@displayName"/>
            <xsl:apply-templates select="node()" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Upgrade van CMET Rijksvaccinatie COCT_RM90091602 naar COCT_MT90091604. Versie 03: 
            <xd:ul>
                <xd:li>SubstanceAdministration.moodCode was “EVN”, is nu D:ActMood om “nog te geven vaccinaties” toe te staan. “EVN” was en is een werkelijke vaccinatie. “RMD” is de aanbeveling voor het geven van vaccinaties. Vanwege de naamconventies is hierdoor ook SubstanceAdministrationEvent veranderd in SubstanceAdministration</xd:li>
                <xd:li>SubstanceAdministration.effectiveTime gewijzigd in [0..1] O t.b.v. te-verwachten-vaccinaties</xd:li>
                <xd:li>SubstanceAdministration.limitation toegevoegd t.b.v. te-verwachten-vaccinaties</xd:li>
                <xd:li>SubstanceAdministration.location toegevoegd t.b.v. “Toedieningslocatie”</xd:li>
            </xd:ul>
                Versie 04
            <xd:ul>
                <xd:li>InformationControlActEvent.performer is nu CMET AssignedPerson zodat naam, functie, organisatie kunnen worden ondersteund</xd:li>
            </xd:ul>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component3/hl7:substanceAdministrationEvent" mode="dob327">
        <substanceAdministration moodCode="EVN" xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="@* | *" mode="dob327"/>
        </substanceAdministration>
    </xsl:template>
    <xsl:template match="hl7:component3/hl7:substanceAdministrationEvent/hl7:causeOf2/hl7:adverseReaction/hl7:subjectOf/hl7:informationControlActEvent/hl7:performer/hl7:assignedPerson" mode="dob327">
        <xsl:copy>
            <xsl:attribute name="classCode">ASSIGNED</xsl:attribute>
            <xsl:apply-templates select="@* | *" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Conversie van oude nonBDSData naar nieuwe nonBDSData</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:nonBDSData | hl7:metaData" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="dob327"/>
            <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
            <xsl:apply-templates select="hl7:code" mode="dob327"/>
            <text xmlns="urn:hl7-org:v3">
                <xsl:value-of select="hl7:value"/>
            </text>
            <xsl:apply-templates select="hl7:author" mode="dob327"/>
            <xsl:apply-templates select="hl7:pertainsTo" mode="dob327"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Skip lines consisting only of spaces</xd:desc>
    </xd:doc>
    <xsl:template match="text()[normalize-space() = '']" mode="dob327"/>
    
    <xd:doc>
        <xd:desc>Just copy as-is</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="dob327">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="dob327"/>
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
    </xd:doc>
    <xsl:template name="rubricCluster18">
        <xsl:apply-templates select="hl7:templateId" mode="dob327"/>
        <xsl:apply-templates select="hl7:id" mode="dob327"/>
        <xsl:apply-templates select="hl7:code" mode="dob327"/>
        <xsl:choose>
            <xsl:when test="hl7:statusCode">
                <xsl:apply-templates select="hl7:statusCode" mode="dob327"/>
            </xsl:when>
            <xsl:otherwise>
                <statusCode xmlns="urn:hl7-org:v3">
                    <xsl:attribute name="code">
                        <xsl:choose>
                            <!--<concept code="01" codeSystem="2.16.840.1.113883.2.4.4.40.309" displayName="Niet verschenen met bericht" level="0" type="L"/>-->
                            <xsl:when test=".//hl7:reasonCode[@code = '01'][@codeSystem = '2.16.840.1.113883.2.4.4.40.309']">
                                <xsl:text>cancelled</xsl:text>
                            </xsl:when>
                            <!--<concept code="02" codeSystem="2.16.840.1.113883.2.4.4.40.309" displayName="Niet verschenen zonder bericht" level="0" type="L"/>-->
                            <xsl:when test=".//hl7:reasonCode[@code = '02'][@codeSystem = '2.16.840.1.113883.2.4.4.40.309']">
                                <xsl:text>aborted</xsl:text>
                            </xsl:when>
                            <!--<concept code="03" codeSystem="2.16.840.1.113883.2.4.4.40.309" displayName="Afgezegd door JGZ" level="0" type="L"/>-->
                            <xsl:when test=".//hl7:reasonCode[@code = '03'][@codeSystem = '2.16.840.1.113883.2.4.4.40.309']">
                                <xsl:text>cancelled</xsl:text>
                            </xsl:when>
                            <!-- Open afspraak -->
                            <xsl:when test="@moodCode = 'INT'">
                                <xsl:text>active</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>completed</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </statusCode>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="hl7:effectiveTime" mode="dob327"/>
        <xsl:apply-templates select="hl7:reasonCode" mode="dob327"/>
        <xsl:apply-templates select="hl7:performer" mode="dob327"/>
        <xsl:apply-templates select="hl7:author" mode="dob327"/>
        <xsl:apply-templates select="hl7:consultant" mode="dob327"/>
        <xsl:apply-templates select="hl7:escort" mode="dob327"/>
        <xsl:apply-templates select="hl7:inFulfillmentOf" mode="dob327"/>
        <pertinentInformation xmlns="urn:hl7-org:v3">
            <rubricCluster>
                <templateId root="2.16.840.1.113883.2.4.6.10.100.11018"/>
                <code code="R018" displayName="Activiteit" codeSystem="2.16.840.1.113883.2.4.4.40.391"/>
                <component>
                    <observation negationInd="false">
                        <templateId root="2.16.840.1.113883.2.4.6.10.100.41605"/>
                        <code code="1605" codeSystem="2.16.840.1.113883.2.4.4.40.267" displayName="Status activiteit"/>
                        <xsl:choose>
                            <!--<concept code="01" codeSystem="2.16.840.1.113883.2.4.4.40.309" displayName="Niet verschenen met bericht" level="0" type="L"/>-->
                            <xsl:when test=".//hl7:reasonCode[@code = '01'][@codeSystem = '2.16.840.1.113883.2.4.4.40.309']">
                                <value xsi:type="CV" code="03" codeSystem="2.16.840.1.113883.2.4.4.40.434" displayName="Niet gerealiseerd met bericht"/>
                            </xsl:when>
                            <!--<concept code="02" codeSystem="2.16.840.1.113883.2.4.4.40.309" displayName="Niet verschenen zonder bericht" level="0" type="L"/>-->
                            <xsl:when test=".//hl7:reasonCode[@code = '02'][@codeSystem = '2.16.840.1.113883.2.4.4.40.309']">
                                <value xsi:type="CV" code="02" codeSystem="2.16.840.1.113883.2.4.4.40.434" displayName="Niet gerealiseerd zonder bericht"/>
                            </xsl:when>
                            <!--<concept code="03" codeSystem="2.16.840.1.113883.2.4.4.40.309" displayName="Afgezegd door JGZ" level="0" type="L"/>-->
                            <xsl:when test=".//hl7:reasonCode[@code = '03'][@codeSystem = '2.16.840.1.113883.2.4.4.40.309']">
                                <value xsi:type="CV" code="07" codeSystem="2.16.840.1.113883.2.4.4.40.434" displayName="Afgezegd door JGZ"/>
                            </xsl:when>
                            <xsl:when test="hl7:statusCode[@code = 'completed' or @code = 'active']">
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.434" displayName="Gerealiseerd"/>
                            </xsl:when>
                            <xsl:when test="self::hl7:registrationEvent | self::hl7:nonEncounterCareActivity">
                                <value xsi:type="CV" code="01" codeSystem="2.16.840.1.113883.2.4.4.40.434" displayName="Gerealiseerd"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <value xsi:type="CV" code="08" codeSystem="2.16.840.1.113883.2.4.4.40.434" displayName="Niet gerealiseerd, niet nader gespecificeerd"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </observation>
                </component>
            </rubricCluster>
        </pertinentInformation>
        <!-- Verwerk alle pertinentInformation behalve wat naar nonBDSdata moet -->
        <xsl:apply-templates select="hl7:pertinentInformation" mode="dob327"/>
        <!-- R013 vervallen elementen naar nonBDSdata -->
        <xsl:for-each select="hl7:pertinentInformation/hl7:rubricCluster/hl7:component/hl7:observation[hl7:code[@code = '1384'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
            <xsl:call-template name="maakNonBDSData">
                <xsl:with-param name="dt" select="'BL'"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- R021 vervallen elementen naar nonBDSdata -->
        <xsl:for-each select="hl7:pertinentInformation/hl7:rubricCluster/hl7:component/hl7:observation[hl7:code[@code = '792'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
            <xsl:call-template name="maakNonBDSData">
                <xsl:with-param name="dt" select="'ST'"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- R038 vervallen elementen naar nonBDSdata -->
        <xsl:for-each select="hl7:pertinentInformation/hl7:rubricCluster/hl7:component/hl7:observation[hl7:code[@code = '394' or @code = '395' or @code = '402' or @code = '403' or @code = '404' or @code = '405' or @code = '406' or @code = '407' or @code = '852'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
            <xsl:call-template name="maakNonBDSData">
                <xsl:with-param name="dt" select="'CV'"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- R038 vervallen elementen naar nonBDSdata -->
        <xsl:for-each select="hl7:pertinentInformation/hl7:rubricCluster/hl7:component/hl7:observation[hl7:code[@code = '842' or @code = '853'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']]">
            <xsl:call-template name="maakNonBDSData">
                <xsl:with-param name="dt" select="'ST'"/>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:apply-templates select="hl7:component1" mode="dob327"/>
        <xsl:apply-templates select="hl7:component2" mode="dob327"/>
        <xsl:apply-templates select="hl7:component3" mode="dob327"/>
        <xsl:apply-templates select="hl7:component4" mode="dob327"/>
        <xsl:apply-templates select="hl7:component5" mode="dob327"/>
        <!--Verwijder reden voor annulering (subjectOf) bij activiteit Contactmomentafspraak-->
        <xsl:if test="not(@moodCode = 'INT')">
            <xsl:apply-templates select="hl7:subjectOf" mode="dob327"/>
        </xsl:if>
        <xsl:apply-templates select="hl7:subjectOf1" mode="dob327"/>
        <xsl:apply-templates select="hl7:subjectOf2" mode="dob327"/>
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
    
    <xd:doc>
        <xd:desc>Weergavenaam bij W0195 Plus/Min</xd:desc>
        <xd:param name="inR">observation voor rechterkant</xd:param>
        <xd:param name="inL">observation voor linkerkant</xd:param>
    </xd:doc>
    <xsl:template name="W0195DisplayName">
        <xsl:param name="inR"/>
        <xsl:param name="inL"/>
        <xsl:choose>
            <xsl:when test="$inR/hl7:value[@displayName]">
                <xsl:value-of select="$inR/hl7:value/@displayName"/>
            </xsl:when>
            <xsl:when test="$inR/hl7:value[@code = '1'][@codeSystem = '2.16.840.1.113883.2.4.4.40.153']">+</xsl:when>
            <xsl:when test="$inR/hl7:value[@code = '2'][@codeSystem = '2.16.840.1.113883.2.4.4.40.153']">-</xsl:when>
            <xsl:otherwise>?</xsl:otherwise>
        </xsl:choose>
        <xsl:text>/</xsl:text>
        <xsl:choose>
            <xsl:when test="$inL/hl7:value[@displayName]">
                <xsl:value-of select="$inL/hl7:value/@displayName"/>
            </xsl:when>
            <xsl:when test="$inL/hl7:value[@code = '1'][@codeSystem = '2.16.840.1.113883.2.4.4.40.153']">+</xsl:when>
            <xsl:when test="$inL/hl7:value[@code = '2'][@codeSystem = '2.16.840.1.113883.2.4.4.40.153']">-</xsl:when>
            <xsl:otherwise>?</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Maak component1/nonBDSdata</xd:desc>
        <xd:param name="dt">Datatype voor value</xd:param>
    </xd:doc>
    <xsl:template name="maakNonBDSData">
        <xsl:param name="dt">
            <xsl:choose>
                <xsl:when test="@xsi:type">
                    <xsl:value-of select="@xsi:type"/>
                </xsl:when>
                <xsl:when test="@code | @codeSystem | @displayName | hl7:originalText">
                    <xsl:text>CV</xsl:text>
                </xsl:when>
                <xsl:when test="@root | @extension">
                    <xsl:text>II</xsl:text>
                </xsl:when>
                <xsl:when test="@unit">
                    <xsl:text>PQ</xsl:text>
                </xsl:when>
                <xsl:when test="@representation = 'B64'">
                    <xsl:text>ED</xsl:text>
                </xsl:when>
                <xsl:when test="@value = 'true' or @value = 'false'">
                    <xsl:text>BL</xsl:text>
                </xsl:when>
                <xsl:when test="string-length(@value) &gt;=8 and translate(@value, '1234567890', '') = ''">
                    <xsl:text>TS</xsl:text>
                </xsl:when>
                <xsl:when test="string-length(@value) &gt; 0 and (@use or starts-with(@value, 'tel:') or starts-with(@value, 'mailto:'))">
                    <xsl:text>TEL</xsl:text>
                </xsl:when>
                <xsl:when test="string-length(@value) &gt; 0 and translate(@value, '1234567890', '') = ''">
                    <xsl:text>INT</xsl:text>
                </xsl:when>
                <xsl:when test="hl7:low | hl7:high">
                    <xsl:text>IVL_TS</xsl:text>
                </xsl:when>
                <xsl:when test="string-length(.) &gt; 0">
                    <xsl:text>ST</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:param>
        <component1 typeCode="COMP" xmlns="urn:hl7-org:v3">
            <nonBDSData classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.100.10028"/>
                <xsl:apply-templates select="hl7:code" mode="dob327"/>
                <text>
                    <xsl:call-template name="DatatypeToString">
                        <xsl:with-param name="in" select="hl7:value"/>
                    </xsl:call-template>
                </text>
                <xsl:if test="string-length($dt) &gt; 0">
                    <xsl:for-each select="hl7:value">
                        <xsl:copy>
                            <xsl:apply-templates select="@*" mode="dob327"/>
                            <xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                <xsl:value-of select="$dt"/>
                            </xsl:attribute>
                            <xsl:apply-templates select="node()" mode="dob327"/>
                        </xsl:copy>
                    </xsl:for-each>
                </xsl:if>
                <pertainsTo>
                    <categoryInBDS>
                        <xsl:apply-templates select="ancestor::hl7:rubricCluster/hl7:code" mode="dob327"/>
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