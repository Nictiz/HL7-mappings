<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:hl7v2="urn:hl7-org:v2xml"
  xmlns:f="http://hl7.org/fhir"
  exclude-result-prefixes="#all"
  version="2.0">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  
  <!--<xsl:template match="/">
    <xsl:call-template name="parseMessage">
      <xsl:with-param name="input">file:///Users/ahenket/Desktop/voorbeeld_philips.hl7</xsl:with-param>
      <xsl:with-param name="encoding">cp1252</xsl:with-param>
    </xsl:call-template>
  </xsl:template>-->
  
  <xsl:template name="parseMessage" as="element(message)">
    <xsl:param name="input" as="xs:anyURI"/>
    <xsl:param name="encoding" as="xs:string"/>
    
    <xsl:variable name="theHL7v2Message" as="xs:string">
      <xsl:choose>
        <xsl:when test="unparsed-text-available($input, $encoding)">
          <xsl:copy-of select="replace(replace(replace(unparsed-text($input, $encoding), '\n', '&#13;'), '&#13;+', '&#13;'), '(^\s+)|(\r$)', '')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message terminate="yes">Cannot read input "<xsl:value-of select="$input"/>" using enoding "<xsl:value-of select="$encoding"/>"</xsl:message>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <!-- Segment terminator \r -->
    <xsl:variable name="st" select="'\r'"/>
    <!-- Field Separator | - Separates two adjacent data fields within a segment. It also separates the segment ID from the first data field in each segment. -->
    <xsl:variable name="fs" select="substring($theHL7v2Message, 4, 1)"/>
    <!-- Component Separator ^ Separates adjacent components of data fields where allowed. -->
    <xsl:variable name="cs" select="substring($theHL7v2Message, 5, 1)"/>
    <!-- Repetition Separator ~ Separates multiple occurrences of a field where allowed. -->
    <xsl:variable name="rs" select="substring($theHL7v2Message, 6, 1)"/>
    <!-- Escape Character \ Escape character for use with any field, component, or sub-component represented by an ST, TX or FT data type. -->
    <xsl:variable name="esc" select="substring($theHL7v2Message, 7, 1)"/>
    <!-- Subcomponent Separator & Separates adjacent subcomponents of data fields where allowed. -->
    <xsl:variable name="scs" select="substring($theHL7v2Message, 8, 1)"/>
    <!-- Truncation character # Indicated character to be used for the truncation pattern - See 2.5.5.2, Truncation Pattern. -->
    <xsl:variable name="tc" select="if (substring($theHL7v2Message, 9, 1) = $fs) then () else substring($theHL7v2Message, 9, 1)"/>
    
    <xsl:if test="$theHL7v2Message">
      <message>
        <xsl:for-each select="tokenize($theHL7v2Message, '\r')">
          <xsl:variable name="segmentName" select="substring(., 1, 3)"/>
          <xsl:element name="{$segmentName}">
            <xsl:choose>
              <xsl:when test="$segmentName = ('FHS', 'BHS', 'MSH')">
                <xsl:attribute name="field" select="$fs"/>
                <xsl:attribute name="component" select="$cs"/>
                <xsl:attribute name="repetition" select="$rs"/>
                <xsl:attribute name="escape" select="$esc"/>
                <xsl:attribute name="subcomponent" select="$scs"/>
                <xsl:if test="$tc">
                  <xsl:attribute name="truncation" select="$tc"/>
                </xsl:if>
                <xsl:element name="{concat($segmentName, '.1')}">
                  <xsl:value-of select="$fs"/>
                </xsl:element>
                <xsl:element name="{concat($segmentName, '.2')}">
                  <xsl:value-of select="$cs || $rs || $esc || $scs || $tc"/>
                </xsl:element>
                <xsl:for-each select="tokenize(., '\' || $fs)[position() gt 2]">
                  <xsl:variable name="fpos" select="position() + 3"/>
                  <xsl:for-each select="tokenize(., $rs)">
                    <xsl:element name="{concat($segmentName, '.', $fpos)}">
                      <xsl:value-of select="."/>
                    </xsl:element>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="tokenize(., '\' || $fs)[position() gt 1]">
                  <xsl:variable name="fpos" select="position()"/>
                  <xsl:for-each select="tokenize(., $rs)">
                    <xsl:element name="{concat($segmentName, '.', $fpos)}">
                      <xsl:value-of select="."/>
                    </xsl:element>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:for-each>
      </message>
    </xsl:if>
  </xsl:template>
  
  <!-- https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-cwe-to-codeableconcept.html
        CQ:     <SPM.12>100^mL</SPM.12>
    Components: 
    1     <Quantity (ST)> ^ 
    2     <Units (CE)>
    
        Quantity:
    1   ... value	Σ	0..1	decimal	Numerical value (with implicit precision)
    2  ... comparator	?!Σ	0..1	code	< | <= | >= | > | ad - how to understand the value Binding: QuantityComparator (Required)
    3  ... unit	ΣT	0..1	string	Unit representation
    4  ... system	ΣC	0..1	uri	System that defines coded unit form
    5  ... code	ΣC	0..1	code	Coded form of the unit
  -->
  <xsl:template name="CQ-to-Quantity" as="element()*">
    <xsl:param name="in" as="element()*" select="."/>
    <xsl:param name="elementName">quantity</xsl:param>
    
    <xsl:variable name="cs" select="$in/../(preceding-sibling::MSH | self::MSH)/@component" as="xs:string"/>
    <xsl:variable name="scs" select="($in/../(preceding-sibling::MSH | self::MSH)/@subcomponent, '&amp;')[1]" as="xs:string"/>
    <xsl:for-each select="$in[not(starts-with(., '&quot;&quot;'))]">
      <xsl:variable name="parts" select="tokenize(., '\' || $cs)"/>
      <xsl:variable name="part2parts" select="tokenize($parts[2], '\' || $scs)"/>
      
      <xsl:element name="{$elementName}" namespace="http://hl7.org/fhir">
        <xsl:if test="$parts[1][not(normalize-space(.) = '')]">
          <value value="{hl7v2:getUri($parts[1])}"/>
        </xsl:if>
        <xsl:if test="$part2parts[1][not(normalize-space(.) = '')]">
          <unit value="{normalize-space($part2parts[1])}"/>
        </xsl:if>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  
  <!-- https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-cwe-to-codeableconcept.html
        CWE:     <PID.3>8000025^^^NWZ^PI</PID.3>
    Components: 
    1     <Identifier (ST)> ^ 
      2     <Text (ST)> ^ 
      3     <Name of Coding System (ID)> ^ 
    4     <Alternate Identifier (ST)> ^ 
      5     <Alternate Text (ST)> ^ 
      6     <Name of Alternate Coding System (ID)> ^ 
      7     <Coding System Version ID (ST)> ^ 
      8     <Alternate Coding System Version ID (ST)> ^ 
    9     <Original Text (ST)> ^ 
    10    <Second Alternate Identifier (ST)> ^ 
      11    <Second Alternate Text (ST)> ^ 
      12    <Name of Second Alternate Coding System (ID)> ^ 
      13    <Second Alternate Coding System Version ID (ST)> ^ 
    14    <Coding System OID (ST)> ^ 
    15    <Value Set OID (ST)> ^ 
    16    <Value Set Version ID (DTM)> ^ 
    17    <Alternate Coding System OID (ST)> ^ 
    18    <Alternate Value Set OID (ST)> ^ 
    19    <Alternate Value Set Version ID (DTM)> ^ 
    20    <Second Alternate Coding System OID (ST)> ^ 
    21    <Second Alternate Value Set OID (ST)> ^ 
    22    <Second Alternate Value Set Version ID (DTM)>
    
        CodeableConcept:
    1   .. coding	Σ	0..*	Coding	Code defined by a terminology system
        1 .. system	Σ	0..1	uri	Identity of the terminology system
        2 ... version	Σ	0..1	string	Version of the system - if relevant
        3 ... code	Σ	0..1	code	Symbol in syntax defined by the system
        4 ... display	Σ	0..1	string	Representation defined by the system
        5 ... userSelected	Σ	0..1	boolean	If this coding was chosen directly by the user
    2   ... text	 Σ	0..1	string	Plain text representation of the concept
  -->
  <xsl:template name="CWE-to-CodeableConcept" as="element()*">
    <xsl:param name="in" as="element()*" select="."/>
    <xsl:param name="elementName">code</xsl:param>
    
    <xsl:variable name="cs" select="$in/../(preceding::MSH | self::MSH)/@component" as="xs:string"/>
    <xsl:for-each select="$in[not(starts-with(., '&quot;&quot;'))]">
      <xsl:variable name="parts" select="tokenize(., '\' || $cs)"/>
      
      <xsl:element name="{$elementName}" namespace="http://hl7.org/fhir">
        <xsl:if test="$parts[1][not(normalize-space() = '')]">
          <coding xmlns="http://hl7.org/fhir">
            <xsl:if test="$parts[3][not(normalize-space(.) = '')]">
              <system value="{hl7v2:getUri($parts[3])}"/>
            </xsl:if>
            <xsl:if test="$parts[1][not(normalize-space(.) = '')]">
              <code value="{normalize-space($parts[1])}"/>
            </xsl:if>
            <xsl:if test="$parts[2][not(normalize-space(.) = '')]">
              <display value="{normalize-space($parts[2])}"/>
            </xsl:if>
          </coding>
        </xsl:if>
        <xsl:if test="$parts[5][not(normalize-space() = '')]">
          <coding xmlns="http://hl7.org/fhir">
            <xsl:if test="$parts[6][not(normalize-space(.) = '')]">
              <system value="{hl7v2:getUri($parts[6])}"/>
            </xsl:if>
            <xsl:if test="$parts[4][not(normalize-space(.) = '')]">
              <code value="{normalize-space($parts[4])}"/>
            </xsl:if>
            <xsl:if test="$parts[5][not(normalize-space(.) = '')]">
              <display value="{normalize-space($parts[5])}"/>
            </xsl:if>
          </coding>
        </xsl:if>
        <xsl:if test="$parts[9][not(normalize-space(.) = '')]">
          <text value="{normalize-space($parts[9])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  
  <!--  https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-cx-to-identifier.html
        CX:     <PID.3>8000025^^^NWZ^PI</PID.3>
    1   15      ST  R           ID Number
    2   1       ST  O           Check Digit
    3   3       ID  O   0061    Check Digit Scheme
    4   227     HD  O   0363    Assigning Authority
    5   5       ID  O   0203    Identifier Type Code
    6   227     HD  O           Assigning Facility
    7   8       DT  O           Effective Date
    8   8       DT  O           Expiration Date
    9   705     CWE O           Assigning Jurisdiction
    10  705     CWE O           Assigning Agency or Department
    
        Identifier:
    1   use	      ?!Σ	0..1	code	usual | official | temp | secondary | old (If known) IdentifierUse (Required)
    2   type	     Σ	  0..1	CodeableConcept	Description of identifier IdentifierType (Extensible)
    3   system	   Σ	  0..1	uri	The namespace for the identifier value
    4   value	    Σ	  0..1	string	The value that is unique
    5   period	   Σ	  0..1	Period	Time period when id is/was valid for use
    6   assigner   Σ	  0..1	Reference(Organization)	Organization that issued id (may be just text)
  -->
  <xsl:template name="CX-to-Identifier" as="element()*">
    <xsl:param name="in" as="element()*" select="."/>
    <xsl:param name="elementName">identifier</xsl:param>
    
    <xsl:variable name="cs" select="$in/../(preceding::MSH | self::MSH)/@component" as="xs:string"/>
    <xsl:for-each select="$in[not(starts-with(., '&quot;&quot;'))]">
      <xsl:variable name="parts" select="tokenize(., '\' || $cs)"/>
      
      <xsl:element name="{$elementName}" namespace="http://hl7.org/fhir">
        <!--<use/>-->
        <xsl:if test="$parts[5][not(normalize-space(.) = '')]">
          <type xmlns="http://hl7.org/fhir">
            <coding>
              <system value="http://terminology.hl7.org/CodeSystem/v2-0203"/>
              <code value="{normalize-space($parts[5])}"/>
            </coding>
          </type>
        </xsl:if>
        <xsl:if test="$parts[4][not(normalize-space(.) = '')]">
          <system value="{hl7v2:getUri($parts[4])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[1][not(normalize-space(.) = '')]">
          <value value="{normalize-space($parts[1])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[position() = (7, 8)][not(normalize-space(.) = '')]">
          <period xmlns="http://hl7.org/fhir">
            <xsl:if test="$parts[7][not(normalize-space(.) = '')]">
              <start value="{hl7v2:TS-to-iso8601($parts[7][not(normalize-space(.) = '')])}"/>
            </xsl:if>
            <xsl:if test="$parts[8][not(normalize-space(.) = '')]">
              <end value="{hl7v2:TS-to-iso8601($parts[8][not(normalize-space(.) = '')])}"/>
            </xsl:if>
          </period>
        </xsl:if>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  
  <!--  https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-eip-placerassignedidentifier-to-identifier.html
        EIP:    <SPM.3>B1913892200-001</SPM.3>
    1   427     EI  O           Placer Assigned Identifier
        1   199 ST  O           Entity Identifier
        2   20  IS  O 0363      Namespace ID
        3   199 ST  C           Universal ID
        4   6   ID  C 0301      Universal ID Type
    2   427     EI  O           Filler Assigned Identifier
    
        Identifier:
    1   use	      ?!Σ	0..1	code	usual | official | temp | secondary | old (If known) IdentifierUse (Required)
    2   type	     Σ	  0..1	CodeableConcept	Description of identifier IdentifierType (Extensible)
    3   system	   Σ	  0..1	uri	The namespace for the identifier value
    4   value	    Σ	  0..1	string	The value that is unique
    5   period	   Σ	  0..1	Period	Time period when id is/was valid for use
    6   assigner   Σ	  0..1	Reference(Organization)	Organization that issued id (may be just text)
  -->
  <xsl:template name="EIP-to-Identifier" as="element()*">
    <xsl:param name="in" as="element()*" select="."/>
    <xsl:param name="elementName">identifier</xsl:param>
    
    <xsl:variable name="cs" select="$in/../(preceding::MSH | self::MSH)/@component" as="xs:string"/>
    <xsl:variable name="scs" select="($in/../(preceding::MSH | self::MSH)/@subcomponent, '&amp;')[1]" as="xs:string"/>
    <xsl:for-each select="$in[not(starts-with(., '&quot;&quot;'))]">
      <xsl:variable name="parts" select="tokenize(., '\' || $cs)"/>
      
      <xsl:for-each select="$parts">
        <xsl:variable name="subparts" select="tokenize(., '\' || $cs)"/>
        
        <xsl:element name="{$elementName}" namespace="http://hl7.org/fhir">
          <!--<use/>-->
          <type xmlns="http://hl7.org/fhir">
            <coding>
              <system value="http://terminology.hl7.org/CodeSystem/v2-0203"/>
              <code value="{if (position() = 1) then 'PLAC' else 'FILL'}"/>
            </coding>
          </type>
          <xsl:if test="$subparts[2][not(normalize-space(.) = '')]">
            <system value="{hl7v2:getUri($subparts[2])}" xmlns="http://hl7.org/fhir"/>
          </xsl:if>
          <xsl:if test="$subparts[1][not(normalize-space(.) = '')]">
            <value value="{normalize-space($subparts[1])}" xmlns="http://hl7.org/fhir"/>
          </xsl:if>
        </xsl:element>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  
  <!--  https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-xad-to-address.html
        XAD:    <PID.3>8000025^^^NWZ^PI</PID.3>
    1   184     SAD O           Street Address
    2   120     ST  O           Other Designation
    3   50      ST  O           City
    4   50      ST  O           State or Province
    5   12      ST  O           Zip or Postal Code
    6   3       ID  O   0399    Country
    7   3       ID  O   0190    Address Type
    8   50      ST  O           Other Geographic Designation
    9   20      IS  O   0289    County/Parish Code
    10  20      IS  O   0288    Census Tract
    11  1       ID  O   0465    Address Representation Code
    12  53      DR  B           Address Validity Range
    13  26      TS  O           Effective Date
    14  26      TS  O           Expiration Date
    
        Address:
    1   use	        ?!Σ	  0..1	code	home | work | temp | old | billing - purpose of this address AddressUse (Required)
    2   type	       Σ	    0..1	code	postal | physical | both AddressType (Required)
    3   text	       Σ	    0..1	string	Text representation of the address
    4   line	       Σ	    0..*	string	Street name, number, direction & P.O. Box etc. This repeating element order: The order in which lines should appear in an address label
    5   city	       Σ	    0..1	string	Name of city, town etc.
    6   district     Σ      0..1	string	District name (aka county)
    7   state	      Σ	    0..1	string	Sub-unit of country (abbreviations ok)
    8   postalCode	 Σ	    0..1	string	Postal code for area
    9   country	    Σ	    0..1	string	Country (e.g. can be ISO 3166 2 or 3 letter code)
    10  period	     Σ	    0..1	Period	Time period when address was/is in use
  -->
  <xsl:template name="XAD-to-Address" as="element()*">
    <xsl:param name="in" as="element()*" select="."/>
    <xsl:param name="elementName">address</xsl:param>
    
    <xsl:variable name="cs" select="$in/../(preceding::MSH | self::MSH)/@component" as="xs:string"/>
    <xsl:variable name="scs" select="$in/../(preceding::MSH | self::MSH)/@subcomponent" as="xs:string"/>
    <xsl:for-each select="$in[not(starts-with(., '&quot;&quot;'))][not(. = '')]">
      <xsl:variable name="parts" select="tokenize(., '\' || $cs)"/>
      <xsl:variable name="part1parts" select="tokenize($parts[1], '&amp;')"/>
      
      <xsl:element name="{$elementName}" namespace="http://hl7.org/fhir">
        
        <xsl:if test="$parts[7][normalize-space(.) = ('L')]">
          <extension url="http://hl7.org/fhir/StructureDefinition/address-official" xmlns="http://hl7.org/fhir">
            <valueBoolean value="true"/>
          </extension>
          <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-address-official" xmlns="http://hl7.org/fhir">
            <valueBoolean value="true"/>
          </extension>
        </xsl:if>
        <xsl:if test="$parts[7][normalize-space(.) = ('HV')]">
          <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use" xmlns="http://hl7.org/fhir">
            <valueCode value="HV"/>
          </extension>
        </xsl:if>
        <xsl:if test="$parts[7][normalize-space(.) = ('HV', 'M', 'TMP', 'B', 'O', 'H')]">
          <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType" xmlns="http://hl7.org/fhir">
            <valueCodeableConcept>
              <coding>
                <system value="http://terminology.hl7.org/CodeSystem/v3-AddressUse"/>
                <xsl:choose>
                  <xsl:when test="$parts[7][normalize-space(.) = ('HV', 'TMP')]">
                    <code value="{normalize-space($parts[7])}"/>
                  </xsl:when>
                  <xsl:when test="$parts[7][normalize-space(.) = ('M')]">
                    <code value="PST"/>
                  </xsl:when>
                  <xsl:when test="$parts[7][normalize-space(.) = ('B', 'O')]">
                    <code value="WP"/>
                  </xsl:when>
                  <xsl:when test="$parts[7][normalize-space(.) = ('H')]">
                    <code value="HP"/>
                  </xsl:when>
                </xsl:choose>
              </coding>
            </valueCodeableConcept>
          </extension>
        </xsl:if>
        <xsl:if test="$parts[7][not(normalize-space(.) = '')]">
          <extension url="http://terminology.hl7.org/CodeSystem/v2-0190" xmlns="http://hl7.org/fhir">
            <valueCode value="{normalize-space($parts[7])}"/>
          </extension>
        </xsl:if>
        
        <!-- IF XAD.7 IN ("BA", "BI", "C", "B", "H", "O") -->
        <xsl:choose>
          <xsl:when test="$parts[7][normalize-space(.) = ('B', 'O', 'BI')]">
            <use value="work" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="$parts[7][normalize-space(.) = ('BA')]">
            <use value="old" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="$parts[7][normalize-space(.) = ('C')]">
            <use value="temp" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="$parts[7][normalize-space(.) = ('H')]">
            <use value="home" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
        </xsl:choose>
        <!-- IF XAD.7 IN ("M", "SH") -->
        <xsl:choose>
          <xsl:when test="$parts[7][normalize-space(.) = ('B', 'H', 'P')]">
            <type value="physical" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="$parts[7][normalize-space(.) = ('M')]">
            <type value="postal" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
        </xsl:choose>
        <text value="{normalize-space(string-join(($part1parts[1][not(normalize-space(.) = '')], $parts[5][not(normalize-space(.) = '')], $parts[3][not(normalize-space(.) = '')], $parts[4][not(normalize-space(.) = '')], $parts[6][not(normalize-space(.) = '')]), ', '))}" xmlns="http://hl7.org/fhir"/>
        <xsl:if test="$part1parts[1][not(normalize-space(.) = '')]">
          <line value="{normalize-space($part1parts[1])}" xmlns="http://hl7.org/fhir">
            <xsl:if test="$part1parts[2][not(normalize-space(.) = '')]">
              <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                <valueString value="{normalize-space($part1parts[2])}"/>
              </extension>
            </xsl:if>
            <xsl:if test="$part1parts[3][not(normalize-space(.) = '')]">
              <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                <valueString value="{normalize-space($part1parts[3])}"/>
              </extension>
            </xsl:if>
            <!--http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix
            http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator
            http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID-->
          </line>
        </xsl:if>
        <xsl:if test="$parts[3][not(normalize-space(.) = '')]">
          <city value="{normalize-space($parts[3])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[9][not(normalize-space(.) = '')]">
          <district value="{normalize-space($parts[9])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[4][not(normalize-space(.) = '')]">
          <state value="{normalize-space($parts[4])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[5][not(normalize-space(.) = '')]">
          <postalCode value="{normalize-space($parts[5])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[6][not(normalize-space(.) = '')]">
          <country value="{normalize-space($parts[6])}" xmlns="http://hl7.org/fhir">
            <xsl:if test="$parts[6][matches(upper-case(normalize-space()), '[A-Z]{2}')]">
              <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification">
                <valueCodeableConcept>
                  <coding>
                    <system value="urn:iso:std:iso:3166"/>
                    <code value="{upper-case(normalize-space($parts[6]))}"/>
                  </coding>
                </valueCodeableConcept>
              </extension>
            </xsl:if>
          </country>
        </xsl:if>
        <xsl:if test="$parts[position() = (13, 14)][not(normalize-space(.) = '')]">
          <period xmlns="http://hl7.org/fhir">
            <xsl:if test="$parts[13][not(normalize-space(.) = '')]">
              <start value="{hl7v2:TS-to-iso8601($parts[13][not(normalize-space(.) = '')])}"/>
            </xsl:if>
            <xsl:if test="$parts[14][not(normalize-space(.) = '')]">
              <end value="{hl7v2:TS-to-iso8601($parts[14][not(normalize-space(.) = '')])}"/>
            </xsl:if>
          </period>
        </xsl:if>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  
  <!--  https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-xpn-to-name.html
        XPN:    <PID.5>artner-Geboortenaampjes Test van&van&Geboortenaampjes Test&""&Partner^A^N K^^^^L</PID.5>
    1   194     FN  O           Family Name
    2   30      ST  O           Given Name
    3   30      ST  O           Second and Further Given Names or Initials Thereof
    4   20      ST  O           Suffix (e.g., JR or III)
    5   20      ST  O           Prefix (e.g., DR)
    6   6       IS  B   0360    Degree (e.g., MD)
    7   1       ID  O   0200    Name Type Code
    8   1       ID  O   0465    Name Representation Code
    9   483     CE  O   0448    Name Context
    10  53      DR  B           Name Validity Range
    11  1       ID  O   0444    Name Assembly Order
    12  26      TS  O           Effective Date
    13  26      TS  O           Expiration Date
    14  199     ST  O           Professional Suffix
    
        HumanName:
    1   use	    ?!Σ	0..1	code	  usual | official | temp | nickname | anonymous | old | maiden NameUse (Required)
    2   text	   Σ	  0..1	string	Text representation of the full name
    3   family	 Σ	  0..1	string	Family name (often called 'Surname')
    4   given	  Σ	  0..*	string	Given names (not always 'first'). Includes middle names This repeating element order: Given Names appear in the correct order for presenting the name
    5   prefix	 Σ	  0..*	string	Parts that come before the name This repeating element order: Prefixes appear in the correct order for presenting the name
    6   suffix	 Σ	  0..*	string	Parts that come after the name This repeating element order: Suffixes appear in the correct order for presenting the name
    7   period	 Σ	  0..1	Period	Time period when name was/is in use
  -->
  <xsl:template name="XPN-to-HumanName" as="element()*">
    <xsl:param name="in" as="element()*" select="."/>
    <xsl:param name="elementName">name</xsl:param>
    
    <xsl:variable name="cs" select="$in/../(preceding::MSH | self::MSH)/@component" as="xs:string"/>
    <xsl:variable name="scs" select="$in/../(preceding::MSH | self::MSH)/@subcomponent" as="xs:string"/>
    <xsl:for-each select="$in[not(starts-with(., '&quot;&quot;'))][not(. = '')]">
      <xsl:variable name="parts" select="tokenize(., '\' || $cs)"/>
      <xsl:variable name="part1parts" select="tokenize($parts[1], '&amp;')"/>
      
      <xsl:element name="{$elementName}" namespace="http://hl7.org/fhir">
        
        <xsl:if test="$parts[8][normalize-space(.) = ('L')]">
          <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order" xmlns="http://hl7.org/fhir">
            <valueCode value="{normalize-space($parts[8])}"/>
          </extension>
        </xsl:if>
        
        <xsl:if test="$parts[7][not(normalize-space(.) = '')]">
          <use value="{normalize-space($parts[7])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <text value="{normalize-space(string-join(($part1parts[1][not(normalize-space(.) = '')], $parts[2][not(normalize-space(.) = '')], $parts[3][not(normalize-space(.) = '')]), ', '))}" xmlns="http://hl7.org/fhir"/>
        <xsl:if test="$part1parts[1][not(normalize-space(.) = '')]">
          <family value="{normalize-space($part1parts[1])}" xmlns="http://hl7.org/fhir">
            <xsl:if test="$part1parts[2][not(normalize-space(.) = ('', '&quot;&quot;'))]">
              <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
                <valueString value="{normalize-space($part1parts[2])}"/>
              </extension>
            </xsl:if>
            <xsl:if test="$part1parts[3][not(normalize-space(.) = ('', '&quot;&quot;'))]">
              <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                <valueString value="{normalize-space($part1parts[3])}"/>
              </extension>
            </xsl:if>
            <xsl:if test="$part1parts[4][not(normalize-space(.) = ('', '&quot;&quot;'))]">
              <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix">
                <valueString value="{normalize-space($part1parts[4])}"/>
              </extension>
            </xsl:if>
            <xsl:if test="$part1parts[5][not(normalize-space(.) = ('', '&quot;&quot;'))]">
              <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                <valueString value="{normalize-space($part1parts[5])}"/>
              </extension>
            </xsl:if>
          </family>
        </xsl:if>
        <xsl:for-each select="tokenize(normalize-space($parts[2] || ' ' || $parts[3]), '\s')[not(. = '')]">
          <given value="{.}" xmlns="http://hl7.org/fhir">
            <xsl:if test="string-length(replace(., '\.', '')) = 1">
              <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                <valueCode value="IN"/>
              </extension>
            </xsl:if>
          </given>
        </xsl:for-each>
        <xsl:if test="$parts[5][not(normalize-space(.) = '')]">
          <prefix value="{normalize-space($parts[5])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[4][not(normalize-space(.) = '')]">
          <suffix value="{normalize-space($parts[4])}" xmlns="http://hl7.org/fhir"/>
        </xsl:if>
        <xsl:if test="$parts[position() = (12, 13)][not(normalize-space(.) = '')]">
          <period xmlns="http://hl7.org/fhir">
            <xsl:if test="$parts[12][not(normalize-space(.) = '')]">
              <start value="{hl7v2:TS-to-iso8601($parts[12][not(normalize-space(.) = '')])}"/>
            </xsl:if>
            <xsl:if test="$parts[13][not(normalize-space(.) = '')]">
              <end value="{hl7v2:TS-to-iso8601($parts[13][not(normalize-space(.) = '')])}"/>
            </xsl:if>
          </period>
        </xsl:if>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  
  <!--  https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-xtn-to-contactpoint.html
        XPN:    <PID.5>artner-Geboortenaampjes Test van&van&Geboortenaampjes Test&""&Partner^A^N K^^^^L</PID.5>
    Components: 
    [NNN] [(999)]999-9999 [X99999] [B99999] [C any text] ^ 
    <telecommunication use code (ID)> ^ 
    <telecommunication equipment type (ID)> ^ 
    <e-mail address (ST)> ^ 
    <country code (NM)> ^ 
    <area/city code (NM)> ^ 
    <phone number (NM)> ^ 
    <extension (NM)> ^ 
    <any text (ST)>
    
        ContactPoint:
    1   system	   ΣI	   0..1	code	phone | fax | email | pager | url | sms | other ContactPointSystem (Required)
    2   value	    Σ	    0..1	string	The actual contact point details
    3   use	      ?!Σ	  0..1	code	home | work | temp | old | mobile - purpose of this contact point ContactPointUse (Required)
    4   rank	     Σ	    0..1	positiveInt	Specify preferred order of use (1 = highest)
    5   period	   Σ	    0..1	Period	Time period when the contact point was/is in use
  -->
  <xsl:template name="XTN-to-ContactPoint" as="element()*">
    <xsl:param name="in" as="element()*" select="."/>
    <xsl:param name="elementName">telecom</xsl:param>
    
    <xsl:variable name="cs" select="$in/../(preceding::MSH | self::MSH)/@component" as="xs:string"/>
    <xsl:for-each select="$in[not(starts-with(., '&quot;&quot;'))][not(. = '')]">
      <xsl:variable name="parts" select="tokenize(., '\' || $cs)"/>
      
      <xsl:element name="{$elementName}" namespace="http://hl7.org/fhir">
        <xsl:if test="$parts[8][not(normalize-space() = '')]">
          <extension url="http://hl7.org/fhir/StructureDefinition/contactpoint-extension">
            <valueString value="{normalize-space($parts[8])}"/>
          </extension>
        </xsl:if>
        
        <!--phone | fax | email | pager | url | sms | other-->
        <xsl:choose>
          <xsl:when test="normalize-space($parts[3]) = ('PH', 'CP')">
            <system value="phone" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="normalize-space($parts[3]) = 'FX'">
            <system value="fax" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="normalize-space($parts[3]) = 'Internet'">
            <system value="email" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="normalize-space($parts[3]) = 'BPN'">
            <system value="pager" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:otherwise>
            <system value="other" xmlns="http://hl7.org/fhir"/>
          </xsl:otherwise>
        </xsl:choose>
        
        <value value="{normalize-space(($parts[1], $parts[4])[1])}" xmlns="http://hl7.org/fhir"/>
        
        <!-- home | work | temp | old | mobile -->
        <xsl:choose>
          <xsl:when test="normalize-space($parts[3]) = 'CP'">
            <use value="mobile" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="normalize-space($parts[3]) = ('PRN', 'ORN', 'VHN')">
            <use value="home" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
          <xsl:when test="normalize-space($parts[3]) = 'WPN'">
            <use value="work" xmlns="http://hl7.org/fhir"/>
          </xsl:when>
        </xsl:choose>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:variable name="Table0363AssigningAuthorityMap" as="element()+">
    <map mnemonic="NLMINBIZA" uri="http://fhir.nl/fhir/NamingSystem/bsn" displayName="BSN"/>
    <map mnemonic="SNM" uri="http://snomed.info/sct" displayName="SNOMED CT"/>
    <map mnemonic="LN" uri="http://loinc.org" displayName="LOINC"/>
    <map mnemonic="UCUM" uri="http://unitsofmeasure.org" displayName="UCUM"/>
  </xsl:variable>
  
  <xsl:function name="hl7v2:TS-to-iso8601">
    <xsl:param name="ts" as="xs:string?"/>
    
    <xsl:variable name="year" select="substring($ts, 1, 4)"/>
    <xsl:variable name="month" select="substring($ts, 5, 2)"/>
    <xsl:variable name="day" select="substring($ts, 7, 2)"/>
    
    <xsl:variable name="hour" select="substring($ts, 9, 2)"/>
    <xsl:variable name="minute" select="substring($ts, 11, 2)"/>
    <xsl:variable name="second" select="substring($ts, 13, 2)"/>
    
    <xsl:variable name="rest" select="substring($ts, 14)"/>
    
    <xsl:variable name="date" select="$year || '-' || $month || '-' || $day"/>
    <xsl:variable name="time" select="$hour || ':' || $minute || ':' || $second"/>
    
    <xsl:choose>
      <xsl:when test="$date castable as xs:date and $time castable as xs:time">
        <xsl:value-of select="$date || 'T' || $time || $rest"/>
      </xsl:when>
      <xsl:when test="$date castable as xs:date">
        <xsl:value-of select="$date"/>
      </xsl:when>
    </xsl:choose>
  </xsl:function>
  
  <xsl:function name="hl7v2:getUri">
    <xsl:param name="mnemonic" as="xs:string?"/>
    
    <xsl:variable name="uri" select="$Table0363AssigningAuthorityMap[@mnemonic = normalize-space($mnemonic)]/@uri"/>
    
    <xsl:choose>
      <xsl:when test="$uri">
        <xsl:value-of select="$uri"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>WARN: Missing uri for mnemonic "<xsl:value-of select="$mnemonic"/>". Using mnemonic as-is</xsl:message>
        <xsl:value-of select="normalize-space($mnemonic)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
</xsl:stylesheet>