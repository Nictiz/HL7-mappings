<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Datatype 1.0 AD - Address DE
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="AD.DE">
   <extends rule="AD"/>
   <!-- Test formaat postcode -->
   <let name="postalCodeText" value="hl7:postalCode/text()"/>
   <let name="countryCode" value="hl7:country/@code"/>
   <let name="countryCodeSystem" value="hl7:country/@codeSystem"/>
   <let name="countryText" value="upper-case(normalize-space(hl7:country))"/>
   <assert role="error"
           test="@nullFlavor or matches($postalCodeText,'^[0-9]{5}$')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.DE">dtr1-1-AD.DE: Deutsche Postleitzahlen in den Textknoten müssen im Format '99999' sein</assert>
   <let name="illegalAddressPart"
        value="*[local-name(.)!='delimiter' and local-name(.)!='buildingNumberSuffix' and         local-name(.)!='country' and local-name(.)!='county' and         local-name(.)!='city' and local-name(.)!='postalCode' and         local-name(.)!='houseNumber' and local-name(.)!='streetName' and         local-name(.)!='additionalLocator' and         local-name(.)!='useablePeriod'][1]/name()"/>
   <assert role="error"
           test="count(*)=0 or string-length($illegalAddressPart)=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.DE">dtr1-2-AD.DE: In Deutschland sind bei Adressen zugelassen: delimiter, country, county, city, postalCode, houseNumber, buildingNumberSuffix, streetName, additionalLocator und useablePeriod. Gefunden '<value-of select="$illegalAddressPart"/>'.</assert>
   <assert role="error"
           test="count(*)=0 or count(*[not(self::hl7:postalCode) and not(self::hl7:country) and not(self::hl7:county) and @code])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.DE">dtr1-3-AD.DE: Nur postalCode, country und county können codiert werden. Gefunden '<value-of select="*[not(self::hl7:postalCode) and not(self::hl7:country) and not(self::hl7:county) and @code][1]/name()"/>'</assert>
</rule>
