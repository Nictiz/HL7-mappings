<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
			<xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA xml to wiki table(s) <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
			<xd:p>
				<xd:b>History:</xd:b>
				<xd:ul>
					<xd:li>2018-06-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
				</xd:ul>
			</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:output method="text" encoding="UTF-16"/>
	<xsl:import href="./../wiki/ADA2test-wiki-table.xsl"/>
	<!-- override ada release file and transaction to be handled -->
	<xsl:param name="adaReleaseFile" select="document('../../../projects/mp-mp9/definitions/mp-mp9-ada-release.xml')"/>
	<xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.102</xsl:param>
	
	<xsl:param name="date-conversion-xml" select="document('./date_conversion.xml')"/>

	<xsl:variable name="tabel" as="element()">
		<tabellen xmlns="">
			<!-- tabel voor patiënt -->
			<xsl:for-each select="$patient">
				<tabel xmlns="" type="{./local-name()}" title="Patiënt">
					<xsl:for-each select="./naamgegevens[.//@value]">
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{normalize-space(string-join(.//*[not(local-name() eq 'naamgebruik')]/@value, ' '))}"/>
					</xsl:for-each>
					<xsl:for-each select="./(adresgegevens | contactgegevens)[.//@value]">
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="normalize-space(string-join(.//@value, ' '))"/>
					</xsl:for-each>
					<xsl:for-each select="./patient_identificatienummer">
						<xsl:variable name="waarde" as="xs:string">
							<xsl:choose>
								<xsl:when test="./@root eq $oid-BSN">
									<xsl:value-of select="concat(./@value, ' [BSN]')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(./@value, ' met root OID ''', ./@root, '''')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{normalize-space($waarde)}"/>
					</xsl:for-each>
					<xsl:apply-templates select="./(geboortedatum | meerling_indicator | overlijdens_indicator | datum_overlijden)[@value] | ./geslacht[@code]" mode="maak-tabel-rij"/>
				</tabel>
			</xsl:for-each>
			<!-- tabel voor iedere therapeutische bouwsteen -->
			<xsl:for-each select="adaxml/data//(medicatieafspraak | toedieningsafspraak | medicatie_gebruik)">
				<xsl:variable name="level" select="xs:int(1)"/>
				<tabel xmlns="" type="{./local-name()}" title="{nf:element-name(.)}">
					<xsl:apply-templates select="./identificatie" mode="maak-tabel-rij"/>
					<xsl:for-each select="./(afspraakdatum | registratiedatum)">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:configurable-T-date(./.., ., false())}"/>
					</xsl:for-each>
					<xsl:apply-templates select="./(gebruik_indicator | volgens_afspraak_indicator)[@value | @nullFlavor]" mode="maak-tabel-rij"/>
					<xsl:variable name="gebruiksperiode-waarde" select="nf:periode-string(., gebruiksperiode_start, gebruiksperiode, gebruiksperiode_eind)"/>
					<xsl:if test="./(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value | @nullFlavor]">
						<gegevenselement xmlns="" level="{$level}" naam="Gebruiksperiode" waarde="{$gebruiksperiode-waarde}"/>
					</xsl:if>
					<xsl:apply-templates select="./(geannuleerd_indicator | stoptype)" mode="maak-tabel-rij"/>
					<xsl:for-each select="./relatie_naar_afspraak_of_gebruik/*">
						<xsl:variable name="element-name" as="xs:string*">
							<xsl:value-of select="nf:element-name(./..)"/>
							<xsl:choose>
								<xsl:when test="./local-name() eq 'identificatie'">
									<xsl:value-of select="': MA'"/>
								</xsl:when>
								<xsl:when test="./local-name() eq 'identificatie_23288'">
									<xsl:value-of select="': TA'"/>
								</xsl:when>
								<xsl:when test="./local-name() eq 'identificatie_23289'">
									<xsl:value-of select="': MGB'"/>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<gegevenselement xmlns="" level="{$level}" naam="{string-join($element-name)}" waarde="{./@value}"/>
					</xsl:for-each>
					<xsl:for-each select="./(voorschrijver | verstrekker)">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:zorgverlener-string(.))}"/>
					</xsl:for-each>
					<xsl:for-each select="./reden_afspraak">
						<xsl:choose>
							<xsl:when test="./../local-name() eq 'medicatieafspraak'">
								<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:element-code-waarde(.)}"/>
							</xsl:when>
							<xsl:otherwise>
								<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{./@value}"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<xsl:for-each select="./reden_van_voorschrijven/probleem/probleem_naam[@code]">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(./../..)}" waarde="{nf:element-code-waarde(.)}"/>
					</xsl:for-each>
					<xsl:for-each select=".//product[.//(@code | @value)]">
						<xsl:call-template name="product-tabel"/>
					</xsl:for-each>
					<xsl:for-each select="./gebruiksinstructie">
						<groep xmlns="" level="{$level}" naam="{nf:element-name(.)}">
							<xsl:variable name="level" select="xs:int($level + 1)"/>
							<xsl:for-each select="./omschrijving[.//(@value | @code)]">
								<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{concat($gebruiksperiode-waarde, ', ' ,nf:configurable-T-date(./../.., ., false()))}"/>
							</xsl:for-each>
							<xsl:apply-templates select="./(toedieningsweg | aanvullende_instructie)" mode="maak-tabel-rij">
								<xsl:with-param name="level" select="$level"/>
							</xsl:apply-templates>
							<xsl:variable name="amount-doseerinstructies" select="count(./doseerinstructie[.//(@value | @code)])" as="xs:integer"/>
							<xsl:for-each select="./doseerinstructie[.//(@value | @code)]">
								<!-- todo expliciet sorteren op volgnummer -->
								<xsl:variable name="element-name" as="xs:string*">
									<xsl:value-of select="nf:element-name(.)"/>
									<xsl:if test="$amount-doseerinstructies gt 1">
										<xsl:value-of select="./volgnummer/@value"/>
									</xsl:if>
								</xsl:variable>
								<xsl:variable name="doseerduur" select="./doseerduur"/>
								<xsl:variable name="doseerduur-string" as="xs:string*">
									<xsl:choose>
										<xsl:when test="$amount-doseerinstructies gt 1">
											<xsl:choose>
												<xsl:when test="./volgnummer/@value = 1">eerst</xsl:when>
												<xsl:otherwise>dan</xsl:otherwise>
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
										<xsl:value-of select="concat('maal per ', $frequentie/tijdseenheid/@unit)"/>
									</xsl:if>
								</xsl:variable>
								<xsl:variable name="interval" select="./dosering/toedieningsschema/interval[(@value | @unit)]"/>
								<xsl:variable name="interval-string" as="xs:string?">
									<xsl:if test="$interval">
										<xsl:value-of select="concat('exact iedere ', $interval/@value, ' ', $interval/@unit)"/>
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
													concat($toedieningssnelheid/tijdseenheid/@value, ' ')
												else
													'', $toedieningssnelheid/tijdseenheid/@unit)"/>
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
								<gegevenselement xmlns="" level="{$level}" naam="{$element-name}" waarde="{normalize-space(concat(string-join($doseerduur-string, ' '), string-join($zo-nodig, ' '), ' ', string-join($weekdag-string, ' '), ' ', string-join($frequentie-string, ' '), $interval-string, ' ', string-join($toedientijd-string, ' '), ' ', string-join($toedieningssnelheid-string, ' '), ' ', string-join($keerdosis-string, ' '), ' ', string-join($dagdeel-string, ' '), ' ', $toedieningsduur-string))}"/>
							</xsl:for-each>
							<!-- herhaalperiode cyclisch schema -->
							<xsl:apply-templates select="./herhaalperiode_cyclisch_schema" mode="maak-tabel-rij">
								<xsl:with-param name="level" select="$level"/>
							</xsl:apply-templates>
						</groep>
					</xsl:for-each>

					<xsl:for-each select="./gerelateerde_afspraak/*">
						<xsl:variable name="element-name" as="xs:string*">
							<xsl:value-of select="nf:element-name(./..)"/>
							<xsl:choose>
								<xsl:when test="./local-name() eq 'identificatie_medicatieafspraak'">
									<xsl:value-of select="': MA'"/>
								</xsl:when>
								<xsl:when test="./local-name() eq 'identificatie_toedieningsafspraak'">
									<xsl:value-of select="': TA'"/>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<gegevenselement xmlns="" level="1" naam="{$element-name}" waarde="{./@value}"/>
					</xsl:for-each>
					<xsl:for-each select="./gerelateerde_verstrekking/*">
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(./..)}" waarde="{./@value}"/>
					</xsl:for-each>
					<!-- informant -->
					<xsl:for-each select="./informant[.//(@value | @code)]">
						<xsl:variable name="waarde" as="xs:string*">
							<xsl:choose>
								<xsl:when test="./persoon">Persoon: <xsl:value-of select="nf:persoon-string(./persoon)"/></xsl:when>
								<xsl:when test="./informant_is_patient/@value = 'true'">Patiënt</xsl:when>
								<xsl:when test="./informant_is_zorgverlener[.//(@value | @code)]">Zorgverlener: <xsl:value-of select="nf:zorgverlener-string(./informant_is_zorgverlener)"/></xsl:when>
							</xsl:choose>
						</xsl:variable>
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{$waarde}"/>
					</xsl:for-each>
					<!-- auteur -->
					<xsl:for-each select="./auteur[.//(@value | @code)]">
						<xsl:variable name="waarde" as="xs:string*">
							<xsl:choose>
								<xsl:when test="./auteur_is_patient/@value = 'true'">Patiënt</xsl:when>
								<xsl:when test="./auteur_is_zorgverlener[.//(@value | @code)]">Zorgverlener: <xsl:value-of select="nf:zorgverlener-string(./auteur_is_zorgverlener)"/></xsl:when>
							</xsl:choose>
						</xsl:variable>
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{$waarde}"/>
					</xsl:for-each>
					<!-- reden gebruik -->
					<xsl:apply-templates select="./(reden_gebruik | reden_wijzigen_of_stoppen_gebruik)" mode="maak-tabel-rij">
						<xsl:with-param name="level" select="$level"/>
					</xsl:apply-templates>
					<!-- gewicht en lengte -->
					<xsl:for-each select="./(lichaamslengte/lengte_waarde | lichaamsgewicht/gewicht_waarde)[@value]">
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(./..)}" waarde="{./@value}"/>
					</xsl:for-each>
					<xsl:apply-templates select="./(kopie_indicator | toelichting | aanvullende_informatie)" mode="maak-tabel-rij">
						<xsl:with-param name="level" select="$level"/>
					</xsl:apply-templates>
					<xsl:for-each select="./relatie_naar_medicatieafspraak[.//@value]">
						<gegevenselement xmlns="" level="1" naam="{nf:element-name(.)}" waarde="{./identificatie/@value}"/>
					</xsl:for-each>
					<!-- MBH identificatie -->
					<xsl:for-each select="./../identificatie[.//(@value | @code)]">
						<gegevenselement xmlns="" level="1" naam="MBH identificatie" waarde="{./@value}"/>
					</xsl:for-each>
				</tabel>
			</xsl:for-each>
			<!-- tabelrijen voor iedere logistieke bouwsteen -->
			<xsl:for-each select="adaxml/data//(verstrekkingsverzoek | verstrekking)">
				<xsl:variable name="level" select="xs:int(1)"/>
				<tabel xmlns="" type="{./local-name()}" title="{nf:element-name(.)}">
					<xsl:apply-templates select="./identificatie" mode="maak-tabel-rij"/>
					<xsl:for-each select="./(datum | aanschrijfdatum)[@value]">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:configurable-T-date(./.., ., false())}"/>
					</xsl:for-each>
					<!-- auteur -->
					<xsl:for-each select="./(auteur | verstrekker)[.//(@value | @code)]">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:zorgverlener-string(.))}"/>
					</xsl:for-each>
					<xsl:for-each select="./(te_verstrekken_hoeveelheid | verstrekte_hoeveelheid)[.//@value]">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:element-waarde(./aantal/@value, ./eenheid/@displayName)}"/>
					</xsl:for-each>
					<xsl:apply-templates select="./aantal_herhalingen" mode="maak-tabel-rij"/>
					<xsl:for-each select=".//product[.//(@code | @value)]">
						<xsl:call-template name="product-tabel"/>
					</xsl:for-each>
					<xsl:for-each select="./verbruiksperiode[.//(@value)]">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{nf:periode-string(., gebruiksperiode_start, gebruiksperiode, gebruiksperiode_eind)}"/>
					</xsl:for-each>
					<xsl:apply-templates select="./verbruiksduur" mode="maak-tabel-rij"/>
					<!-- beoogd verstrekker -->
					<xsl:for-each select="./beoogd_verstrekker[.//(@value | @code)]">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{string-join(nf:zorgverlener-string(.))}"/>
					</xsl:for-each>
					<xsl:apply-templates select="./(distributievorm | aanvullende_wensen | aanvullende_informatie | afleverlocatie | toelichting)" mode="maak-tabel-rij"/>
					<xsl:for-each select="./(relatie_naar_medicatieafspraak | relatie_naar_verstrekkingsverzoek)[.//@value]">
						<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{./identificatie/@value}"/>
					</xsl:for-each>
					<!-- MBH identificatie -->
					<xsl:for-each select="./../identificatie[.//(@value | @code)]">
						<gegevenselement xmlns="" level="{$level}" naam="MBH identificatie" waarde="{./@value}"/>
					</xsl:for-each>
				</tabel>
			</xsl:for-each>
		</tabellen>
	</xsl:variable>
	<xsl:variable name="aantal-kolommen-tabel" select="max($tabel//*[not(*)]/count(ancestor-or-self::*))"/>


	<!-- donkerblauw -->
	<xsl:variable name="tabelkop-achtergrond-kleur">#1F497D;</xsl:variable>
	<xsl:variable name="tabelkop-font-kleur">white</xsl:variable>
	<!-- grijzig -->
	<xsl:variable name="element-achtergrond-kleur">#E3E3E3;</xsl:variable>
	<xsl:variable name="elementwaarde-achtergrond-kleur">white</xsl:variable>

	<xsl:variable name="oid-nullFlavor">2.16.840.1.113883.5.1008</xsl:variable>
	<xsl:variable name="oid-BSN">2.16.840.1.113883.2.4.6.3</xsl:variable>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="/">
		<xsl:text>
{{IssueBox|Deze pagina is nog in bewerking}}
[[Bestand:Nictiz_logo_PO_rechts_rgb.png |link=https://www.nictiz.nl/|rechts|Naar nictiz.nl]]

=Addenda voor inhoudelijke gegevens=</xsl:text>
		<xsl:apply-templates select="adaxml/data/*"/>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="adaxml/data/*">
		<xsl:variable name="patient" select="./patient"/>
		<xsl:variable name="patient-achternaam" select="$patient/naamgegevens/geslachtsnaam/achternaam/@value"/>
		<xsl:text>
==Patiënt </xsl:text>
		<xsl:value-of select="normalize-space(string-join($patient/naamgegevens//*[not(local-name() eq 'naamgebruik')]/@value, ' '))"/>
		<xsl:text>==
</xsl:text>
		<xsl:value-of select="concat('&lt;section begin=', $patient-achternaam, ' /&gt;')"/>
		<xsl:apply-templates select="$tabel/tabel[@type eq 'patient']"/>
		<xsl:value-of select="concat('&lt;section end=', $patient-achternaam, ' /&gt;')"/>
		<xsl:if test=".//medicatieafspraak">

			<xsl:text>
===Medicatieafspraken </xsl:text>
			<xsl:value-of select="$patient-achternaam"/>
			<xsl:text> ===
</xsl:text>
			<xsl:value-of select="concat('&lt;section begin=MA_', $patient-achternaam, ' /&gt;')"/>
			<xsl:apply-templates select="$tabel/tabel[@type eq 'medicatieafspraak']"/>
			<xsl:value-of select="concat('&lt;section end=MA_', $patient-achternaam, ' /&gt;')"/>
		</xsl:if>
		<xsl:if test=".//verstrekkingsverzoek">

			<xsl:text>
===Verstrekkingsverzoeken </xsl:text>
			<xsl:value-of select="$patient-achternaam"/>
			<xsl:text> ===
</xsl:text>
			<xsl:value-of select="concat('&lt;section begin=VV_', $patient-achternaam, ' /&gt;')"/>
			<xsl:apply-templates select="$tabel/tabel[@type eq 'verstrekkingsverzoek']"/>
			<xsl:value-of select="concat('&lt;section end=VV_', $patient-achternaam, ' /&gt;')"/>
		</xsl:if>
		<xsl:if test=".//toedieningsafspraak">
			<xsl:text>
===Toedieningsafspraken </xsl:text>
			<xsl:value-of select="$patient-achternaam"/>
			<xsl:text> ===
		</xsl:text>
			<xsl:value-of select="concat('&lt;section begin=TA_', $patient-achternaam, ' /&gt;')"/>
			<xsl:apply-templates select="$tabel/tabel[@type eq 'toedieningsafspraak']"/>
			<xsl:value-of select="concat('&lt;section end=TA_', $patient-achternaam, ' /&gt;')"/>
		</xsl:if>
		<xsl:if test=".//verstrekking">
			<xsl:text>
===Verstrekkingen </xsl:text>
			<xsl:value-of select="$patient-achternaam"/>
			<xsl:text> ===
</xsl:text>
			<xsl:value-of select="concat('&lt;section begin=MVE_', $patient-achternaam, ' /&gt;')"/>
			<xsl:apply-templates select="$tabel/tabel[@type eq 'verstrekking']"/>
			<xsl:value-of select="concat('&lt;section end=MVE_', $patient-achternaam, ' /&gt;')"/>
		</xsl:if>
		<xsl:if test=".//medicatie_gebruik">
			<xsl:text>
===Medicatiegebruik </xsl:text>
			<xsl:value-of select="$patient-achternaam"/>
			<xsl:text> ===
</xsl:text>
			<xsl:value-of select="concat('&lt;section begin=MGB_', $patient-achternaam, ' /&gt;')"/>
			<xsl:apply-templates select="$tabel/tabel[@type eq 'medicatie_gebruik']"/>
			<xsl:value-of select="concat('&lt;section end=MGB_', $patient-achternaam, ' /&gt;')"/>
		</xsl:if>
	</xsl:template>
	
	<xd:doc>
		<xd:desc/>
		<xd:param name="level"/>
	</xd:doc>
	<xsl:template name="product-tabel">
		<xsl:param name="level" select="xs:int(1)"/>
		<xsl:choose>
			<!-- gecodeerd geneesmiddel -->
			<xsl:when test=".[not(product_specificatie)]">
				<gegevenselement xmlns="" level="{$level}" naam="Geneesmiddel" waarde="{nf:element-code-waarde(./product_code)}"/>
			</xsl:when>
			<!-- 'magistraal' -->
			<xsl:when test="./product_specificatie">
				<xsl:for-each select="./product_specificatie">
					<groep xmlns="" level="{$level}" naam="{concat('Geneesmiddel - ', nf:element-name(.))}">
						<xsl:variable name="level" select="xs:int($level + 1)"/>
						<xsl:apply-templates select="./(product_naam | omschrijving | farmaceutische_vorm | ingredient)[.//(@value | @code)]" mode="maak-tabel-rij">
							<xsl:with-param name="level" select="$level"/>
						</xsl:apply-templates>
						<!--
						<xsl:for-each select="./ingredient">
							<groep xmlns="" level="{$level}" naam="{nf:element-name(.)}">
								<xsl:variable name="level" select="xs:int($level + 1)"/>
								<xsl:apply-templates select="./(ingredient_code)[.//(@value | @code)]" mode="maak-tabel-rij">
									<xsl:with-param name="level" select="$level"/>
								</xsl:apply-templates>
							
							</groep>
						</xsl:for-each>-->
					</groep>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="level"/>
	</xd:doc>
	<xsl:template match="sterkte" mode="maak-tabel-rij">
		<xsl:param name="level" select="xs:int(3)"/>
		<xsl:variable name="numerator" select="./hoeveelheid_ingredient"/>
		<xsl:variable name="denominator" select="./hoeveelheid_product"/>
		<xsl:variable name="sterkte-string" as="xs:string*">
			<xsl:value-of select="concat($numerator/waarde/@value, ' ', nf:unit-string($numerator/waarde/@value, $numerator/eenheid/@displayName), ' per ')"/>
			<xsl:value-of select="concat($denominator/waarde/@value, ' ', nf:unit-string($denominator/waarde/@value, $denominator/eenheid/@displayName))"/>
		</xsl:variable>
		<xsl:for-each select=".[.//(@value | @code)]">
			<gegevenselement xmlns="" level="{$level}" naam="{nf:element-name(.)}" waarde="{$sterkte-string}"/>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="level"/>
	</xd:doc>
	<xsl:template match="ingredient" mode="maak-tabel-rij">
		<xsl:param name="level" select="xs:int(2)"/>
		<!-- change the sequence so that ingredient code is first row -->
		<groep xmlns="" level="{$level}" naam="{nf:element-name(.)}">
			<xsl:apply-templates select="./ingredient_code" mode="maak-tabel-rij">
				<xsl:with-param name="level" select="xs:int($level + 1)"/>
			</xsl:apply-templates>
			<xsl:apply-templates select="./*[local-name() ne 'ingredient_code']" mode="maak-tabel-rij">
				<xsl:with-param name="level" select="xs:int($level + 1)"/>
			</xsl:apply-templates>
		</groep>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="current-bouwsteen"/>
		<xd:param name="current-element"/>
		<xd:param name="output0time"/>
	</xd:doc>
	<xsl:function name="nf:configurable-T-date" as="xs:string">
		<xsl:param name="current-bouwsteen" as="element()?"/>
		<xsl:param name="current-element" as="element()?"/>
		<xsl:param name="output0time" as="xs:boolean?"/>
		<xsl:variable name="conversion_element" select="$date-conversion-xml//medicamenteuze_behandeling/*[@id eq $current-bouwsteen/identificatie/@value][@root eq $current-bouwsteen/identificatie/@root]//*[local-name() eq $current-element/local-name()]"/>
		<xsl:variable name="string-output" as="xs:string*">
			<xsl:choose>
				<xsl:when test="$conversion_element">
					<xsl:variable name="days" select="translate($conversion_element/@dayTimeDuration, 'PD', '')"/>
					<xsl:value-of select="$conversion_element/@base"/>
					<xsl:if test="$days castable as xs:int and xs:int($days) gt 0">
						<xsl:value-of select="concat($conversion_element/@sign, ' ', $days, ' ', nf:unit-string(xs:double($days), 'dag'))"/>
					</xsl:if>
					<xsl:if test="$current-element/@value castable as xs:dateTime">
						<xsl:variable name="time" select="nf:formatTime(nf:getTime($current-element/@value), $output0time)"/>
						<xsl:value-of select="
								if ($time) then
									concat(', om ', $time)
								else
									()"/>
					</xsl:if>
					<xsl:value-of select="$conversion_element/@value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="$current-element/@value castable as xs:date">
							<xsl:value-of select="concat(nf:formatDate($current-element/@value), ', om ', nf:formatTime(nf:getTime($current-element/@value), false()))"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$current-element/@value"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="normalize-space(string-join($string-output))"/>
	</xsl:function>

	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
	</xd:doc>
	<xsl:function name="nf:zorgverlener-string" as="xs:string*">
		<xsl:param name="in" as="element()?"/>
		<xsl:value-of select="string-join($in/zorgverlener/zorgverlener_naam//@value, ' ')"/>
		<xsl:if test="$in//specialisme/@displayName">
			<xsl:value-of select="concat(' - ', $in//specialisme/@displayName, '. ')"/>
		</xsl:if>
		<xsl:value-of select="string-join($in//zorgaanbieder/organisatie_naam/@value, ' ')"/>
	</xsl:function>

	<xd:doc>
		<xd:desc>Outputs a human readable string for a period with a possible start, duration, end date. The actual dates may be replaced by a configurable "T"-date with an addition of subtraction of a given number of days..</xd:desc>
		<xd:param name="current-bouwsteen">The current MP building block, for example: medicatieafspraak or toedieningsafspraak.</xd:param>
		<xd:param name="start-date">start date of the period</xd:param>
		<xd:param name="periode">duration of the period</xd:param>
		<xd:param name="end-date">end date of the period</xd:param>
	</xd:doc>
	<xsl:function name="nf:periode-string" as="xs:string?">
		<xsl:param name="current-bouwsteen"/>
		<xsl:param name="start-date"/>
		<xsl:param name="periode"/>
		<xsl:param name="end-date"/>

		<xsl:for-each select="$current-bouwsteen">
			<xsl:variable name="waarde" as="xs:string*">
				<xsl:if test="$start-date[@value]">Vanaf <xsl:value-of select="nf:configurable-T-date(., $start-date, false())"/></xsl:if>
				<xsl:if test="$start-date[@value] and ($periode[@value] | $end-date[@value])">
					<xsl:value-of select="', '"/>
				</xsl:if>
				<xsl:if test="$periode/@value">gedurende <xsl:value-of select="concat($periode/@value, ' ', nf:unit-string($periode/@value, $periode/@unit))"/></xsl:if>
				<xsl:if test="$end-date[@value]"> tot en met <xsl:value-of select="nf:configurable-T-date(., $end-date, true())"/>
				</xsl:if>
				<xsl:if test="not($periode[@value]) and not($end-date[@value])"><xsl:if test="$start-date[@value]">, </xsl:if>tot nader order</xsl:if>
			</xsl:variable>
			<xsl:value-of select="normalize-space(string-join($waarde))"/>
		</xsl:for-each>
	</xsl:function>

	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
	</xd:doc>
	<xsl:function name="nf:persoon-string" as="xs:string*">
		<xsl:param name="in" as="element(persoon)?"/>
		<xsl:value-of select="string-join($in/naamgegevens//@value, ' ')"/>
		<xsl:if test="$in/rol_of_functie/@displayName">
			<xsl:value-of select="concat(' - ', $in/rol_of_functie/@displayName, '. ')"/>
		</xsl:if>
		<xsl:value-of select="string-join($in/adresgegevens//@value, ' ')"/>
	</xsl:function>

</xsl:stylesheet>
