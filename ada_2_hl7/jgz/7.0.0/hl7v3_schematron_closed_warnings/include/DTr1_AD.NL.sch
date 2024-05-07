<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   Implementatiehandleiding HL7v3 Basiscomponenten, v2.2 - Datatype 1.0 AD - Address NL
    Status: in behandeling
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="AD.NL">
   <extends rule="AD"/>
   <!-- Test formaat postcode -->
   <let name="postalCodeText" value="hl7:postalCode/text()"/>
   <let name="countryCode" value="hl7:country/@code"/>
   <let name="countryCodeSystem" value="hl7:country/@codeSystem"/>
   <let name="countryText" value="upper-case(normalize-space(hl7:country))"/>
   <let name="isDutchAddress"
        value="(not(hl7:country) or         ($countryCode='NL' and $countryCodeSystem=('2.16.1','1.3.6.1.4.1.1466.115.121.1.11','1.0.3166.1.2.2')) or         ($countryCode='NLD' and $countryCodeSystem='2.16.2') or         ($countryCode='528' and $countryCodeSystem='2.16.3') or         $countryText='NL' or         $countryText='NLD' or         $countryText='NEDERLAND'         )"/>
   <assert role="error"
           test="if (@codeSystem='2.16.840.1.113883.2.4.4.15') then (matches(@code,'^[0-9]{4}[A-Z]{2}$')) else ( true() )"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.NL">dtr1-1-AD.NL: postcodes onder codeSystem '2.16.840.1.113883.2.4.4.15' moeten voldoen aan '9999AA'</assert>
   <assert role="error"
           test="if (hl7:postalCode/text() and $isDutchAddress)             then ( matches($postalCodeText,'^[0-9]{4} [A-Z]{2}$'))            else ( true() )"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.NL">dtr1-2-AD.NL: Nederlandse postcodes in de text-nodes moeten voldoen aan '9999 AA'</assert>
   <let name="illegalAddressPart"
        value="*[not(self::hl7:delimiter|self::hl7:country|self::hl7:county|self::hl7:city|self::hl7:postalCode|self::hl7:houseNumber|self::hl7:buildingNumberSuffix|self::hl7:streetName|self::hl7:additionalLocator|self::hl7:unitID|self::hl7:useablePeriod)]/name()"/>
   <assert role="error"
           test="not($isDutchAddress) or empty($illegalAddressPart)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.NL">dtr1-3-AD.NL: binnen Nederland mogen alleen delimiter, country, county, city, postalCode, houseNumber, buildingNumberSuffix, streetName, additionalLocator, unitID en useablePeriod worden gebruikt. Gevonden '<value-of select="$illegalAddressPart"/>'.</assert>
   <let name="illegalCodedAddressPart"
        value="*[not(self::hl7:postalCode|self::hl7:country|self::hl7:county)][@code]/name()"/>
   <assert role="error"
           test="not($isDutchAddress) or empty($illegalCodedAddressPart)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.NL">dtr1-4-AD.NL: alleen postalCode, country en county kunnen gecodeerd worden. Gevonden '<value-of select="$illegalCodedAddressPart"/>'</assert>
</rule>
