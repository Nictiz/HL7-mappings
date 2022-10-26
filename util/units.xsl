<xsl:stylesheet xmlns:ucum="http://unitsofmeasure.org/ucum-essence" xmlns:util="urn:hl7:utilities" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">

    <xd:doc>
        <xd:desc>Functions for <xd:a href="http://unitsofmeasure.org/ucum.html">UCUM</xd:a> units based on the <xd:a href="http://www.unitsofmeasure.org/ucum-essence.xml">UCUM essence</xd:a> file. This is not a complete file but little is missing.</xd:desc>
    </xd:doc>

    <xsl:variable name="strUcumEssence">ucum-essence.xml</xsl:variable>
    <xsl:variable name="docUcumEssence" select="doc($strUcumEssence)/ucum:root" as="element(ucum:root)?"/>
    <!--
    <base-unit Code="m" CODE="M" dim="L">
      <name>meter</name>
      <printSymbol>m</printSymbol>
      <property>length</property>
    </base-unit>
    <unit Code="mol" CODE="MOL" isMetric="yes" class="si">
      <name>mole</name>
      <printSymbol>mol</printSymbol>
      <property>amount of substance</property>
      <value Unit="10*23" UNIT="10*23" value="6.0221367">6.0221367</value>
    </unit>
    -->
    <xsl:key name="unitcode" match="ucum:base-unit | ucum:unit" use="@Code"/>
    <!--
    <prefix Code="c" CODE="C">
        <name>centi</name>
        <printSymbol>c</printSymbol>
        <value value="1e-2">1 &#215; 10<sup>-2</sup>
        </value>
    </prefix>
    -->
    <xsl:key name="prefixcode" match="ucum:prefix" use="@Code"/>

    <xd:doc>
        <xd:desc>converts UCUM time to ada unit</xd:desc>
        <xd:param name="UCUM-time"/>
    </xd:doc>
    <xsl:function name="nf:convertTime_UCUM2ADA_unit" as="xs:string?">
        <xsl:param name="UCUM-time" as="xs:string?"/>
        <xsl:if test="$UCUM-time">
            <xsl:choose>
                <xsl:when test="$UCUM-time = 's'">
                    <xsl:value-of select="$ada-unit-second[1]"/>
                </xsl:when>
                <xsl:when test="$UCUM-time = 'min'">
                    <xsl:value-of select="$ada-unit-minute[1]"/>
                </xsl:when>
                <xsl:when test="$UCUM-time = 'h'">
                    <xsl:value-of select="$ada-unit-hour[1]"/>
                </xsl:when>
                <xsl:when test="$UCUM-time = 'd'">
                    <xsl:value-of select="$ada-unit-day[1]"/>
                </xsl:when>
                <xsl:when test="$UCUM-time = 'wk'">
                    <xsl:value-of select="$ada-unit-week[1]"/>
                </xsl:when>
                <xsl:when test="$UCUM-time = 'mo'">
                    <xsl:value-of select="$ada-unit-month[1]"/>
                </xsl:when>
                <xsl:when test="$UCUM-time = 'a'">
                    <xsl:value-of select="$ada-unit-year[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- If all else fails: log message but return the input value -->
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="msg">Onbekende ucum tijdseenheid ('<xsl:value-of select="$UCUM-time"/>') gevonden. Kan niet converteren naar ada eenheid: input = output.</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="$UCUM-time"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Converts an UCUM unit as used in FHIR to ada time unit</xd:desc>
        <xd:param name="UCUMFHIR">The UCUM unit string</xd:param>
    </xd:doc>
    <xsl:function name="nf:convertTime_UCUM_FHIR2ADA_unit" as="xs:string?">
        <xsl:param name="UCUMFHIR" as="xs:string?"/>
        <xsl:value-of select="nf:convertTime_UCUM2ADA_unit($UCUMFHIR)"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Return boolean true() or false() on whether or not a UCUM expression is valid expression.</xd:desc>
        <xd:param name="unit">Unit string. empty string will return false</xd:param>
    </xd:doc>
    <xsl:function name="nf:isValidUCUMUnit" as="xs:boolean">
        <xsl:param name="unit" as="xs:string?"/>

        <!-- §6 curly braces 
            1 The full range of characters 33–126 can be used within a pair of curly braces (‘{’ and ‘}’). The material enclosed in curly braces is called annotation.
            2 Annotations do not contribute to the semantics of the unit but are meaningless by definition. 
            
                Therefore, any fully conformant parser must discard all annotations. Parsers of limited conformace should not value annotations in comparison of units.
            
            3 Annotations do, however, signify the end of a unit symbol. 
            4 An annotation without a leading symbol implies the default unit 1 (the unity).
            5 Curly braces must not be nested. -->
        <xsl:variable name="prunedUnit" select="replace($unit, '\{[^\}]*\}', '')"/>

        <xsl:variable name="constituents" select="tokenize($prunedUnit, '/')[not(. = '')]" as="xs:string*"/>

        <xsl:variable name="validParts" as="element(part)*">
            <!-- 1 All expressions of The Unified Code for Units of Measure shall be built from characters of the 7-bit US-ASCII character set exclusively.  -->
            <xsl:choose>
                <xsl:when test="matches($unit, '^[&#x9;-&#x7f;]+$')">
                    <!--<part id="1" p="{$unit}">true</part>-->
                </xsl:when>
                <xsl:otherwise>
                    <part id="1" p="{$unit}">false</part>
                </xsl:otherwise>
            </xsl:choose>
            <!-- 2 Terminal unit symbols can consist of all ASCII characters in the range of 33–126 (0x21–0x7E) excluding double quotes (‘"’), 
                parentheses (‘(’ and ‘)’), plus sign (‘+’'), minus sign (‘-’'), period (‘.’'), solidus (‘/’'), equal sign (‘=’'), square 
                brackets (‘[’ and ‘]’), and curly braces (‘{’ and ‘}’), which have special meaning.  -->
            <xsl:choose>
                <xsl:when test="$prunedUnit = ''"/>
                <xsl:when test="empty($constituents[matches(., '^[&quot;''\(\)\[\]\.\*\^/=+-]+$')])"/>
                <xsl:otherwise>
                    <part id="2" p="{$unit}">false</part>
                </xsl:otherwise>
            </xsl:choose>
            <!-- 3 A terminal unit symbol can not consist of only digits (‘0’–‘9’) because those digit strings are interpreted as positive integer numbers. 
                However, a symbol “10*” is allowed because it ends with a non-digit allowed to be part of a symbol. -->
            <xsl:if test="matches($constituents[last()], '^\d+$')">
                <part id="3" p="{$unit}">false</part>
            </xsl:if>
            <!--<xsl:if test="string-length($unit) gt 0 and $prunedUnit = ''">
                <part id="4" p="{$unit}">true</part>
            </xsl:if>-->
            <!-- split mmol/l into constituents -->
            <xsl:for-each select="$constituents">
                <!-- current unit -->
                <xsl:variable name="cu" select="."/>
                <!-- current unit no parentheses -->
                <xsl:variable name="cu-np" select="replace($cu, '(^\()|(\)$)', '')"/>
                <!-- prefix (first char) -->
                <xsl:variable name="pu" select="substring($cu-np, 1, 1)"/>
                <!-- residual unit (after first char) -->
                <xsl:variable name="ru" select="substring($cu-np, 2)"/>
                <!-- prefix (first two chars) -->
                <xsl:variable name="pu2" select="substring($cu-np, 1, 2)"/>
                <!-- residual unit (after first two chars) -->
                <xsl:variable name="ru2" select="substring($cu-np, 3)"/>

                <xsl:choose>
                    <!--<xsl:when test="$docUcumEssence/key('unitcode', $cu)">
                        <part id="5a" p="{.}">true</part>
                    </xsl:when>-->
                    <xsl:when test="$docUcumEssence/key('unitcode', $cu-np)">
                        <!--<part id="5b" p="{.}">true</part>-->
                    </xsl:when>
                    <!-- §4 prefixes 
                        1 Metric units (cf. §11) may be combinations of a unit symbol with a prefix symbol. 
                        2 The unit symbol to be combined with the prefix must not itself contain a prefix. Such a prefix-less unit symbol is called unit atom.  -->
                    <xsl:when test="$docUcumEssence/key('prefixcode', $pu) and $docUcumEssence/key('unitcode', $ru)">
                        <!--<part id="6" p="{.}">true</part>-->
                    </xsl:when>
                    <xsl:when test="$docUcumEssence/key('prefixcode', $pu2) and $docUcumEssence/key('unitcode', $ru2)">
                        <!--<part id="7" p="{.}">true</part>-->
                    </xsl:when>
                    <!-- Numeric. Simple like 1.73 -->
                    <xsl:when test="matches($cu-np, '^\d+(\.\d)$')">
                        <!--<part id="8" p="{.}">true</part>-->
                    </xsl:when>
                    <!-- Numeric. Complex like 10*9 -->
                    <xsl:when test="matches($cu-np, '^10\*\d+$')">
                        <!--<part id="9" p="{.}">true</part>-->
                    </xsl:when>
                    <!-- Numeric. Complex like 10^9 -->
                    <xsl:when test="matches($cu-np, '^10\^\d+$')">
                        <!--<part id="10" p="{.}">true</part>-->
                    </xsl:when>
                    <xsl:when test="matches($cu-np, '[^\d][23]\)?$')">
                        <!-- current unit no leading digits -->
                        <xsl:variable name="cu-nd" select="replace($cu-np, '^\d+(\.\d*)?', '')"/>
                        <part id="11" p="{.}">
                            <xsl:value-of select="nf:isValidUCUMUnit(replace($cu-nd, '[23]$', ''))"/>
                        </part>
                    </xsl:when>
                    <xsl:when test="matches($cu-np, '\.')">
                        <!-- Check each part of the multiplication except decimals/integers -->
                        <xsl:variable name="npuvalid" select="
                                for $npuc in tokenize($cu-np, '\.')[not(matches(., '^\d+(\.\d)$'))]
                                return
                                    nf:isValidUCUMUnit($npuc)" as="xs:boolean*"/>
                        <part id="11" p="{.}">
                            <xsl:value-of select="$npuvalid = true()"/>
                        </part>
                    </xsl:when>
                    <xsl:otherwise>
                        <part id="99" p="{.}">false</part>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>

        <xsl:value-of select="empty($validParts[. = 'false'])"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Converts unit from G-Standaard to UCUM</xd:desc>
        <xd:param name="GstdBasiseenheid_code"/>
    </xd:doc>
    <xsl:function name="nf:convertGstdBasiseenheid2UCUM" as="xs:string*">
        <xsl:param name="GstdBasiseenheid_code" as="xs:string"/>

        <xsl:choose>
            <xsl:when test="$GstdBasiseenheid_code castable as xs:integer">
                <xsl:choose>
                    <!-- 201	AB	ABW	ANTITOXINE B.W.	ABW	ANTITOXINE BINDINGS WAARDE   (ZIE RIV VAD.'81, 16) -->
                    <!-- 202	AE	AE	ANTITOXISCHE EH	AE	ANTITOXISCHE EENHEID         (ZIE RIV VAD.'81, 16) -->
                    <xsl:when test="$GstdBasiseenheid_code = ('201', '202')">1</xsl:when>
                    <!-- 203	BQ	BECQ	BECQUEREL	Bq	BECQUEREL -->
                    <xsl:when test="$GstdBasiseenheid_code = '203'">Bq</xsl:when>
                    <!-- 205	CM	CM	CENTIMETER	cm	CENTIMETER -->
                    <xsl:when test="$GstdBasiseenheid_code = '205'">cm</xsl:when>
                    <!-- 206	C2	CM-2	VIERKANTE CM	cm2	VIERKANTE CENTIMETER -->
                    <xsl:when test="$GstdBasiseenheid_code = '206'">cm2</xsl:when>
                    <!-- 207	D	D	DECIM.POTENTIE	D	DECIMALE POTENTIE -->
                    <xsl:when test="$GstdBasiseenheid_code = '207'">[hp_X]</xsl:when>
                    <!-- 208	DO	DOSI	DOSIS	dosis	DOSIS -->
                    <!-- 211	E	EENH	EENHEID	E	EENHEID -->
                    <!-- 213	FE	FIPE	FIP EENHEID	FIP-E	FIP EENHEID                 (ZIE NED.PH.8.BLZ.836) -->
                    <xsl:when test="$GstdBasiseenheid_code = ('208', '211', '213')">1</xsl:when>
                    <!-- 215	G	GRAM	GRAM	g	GRAM -->
                    <xsl:when test="$GstdBasiseenheid_code = '215'">g</xsl:when>
                    <!-- 217	IE	IE	INTERNAT.EENH.	IE	INTERNATIONALE EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = '217'">[iU]</xsl:when>
                    <!-- 218	J	JOUL	JOULE	J	JOULE -->
                    <xsl:when test="$GstdBasiseenheid_code = '218'">J</xsl:when>
                    <!-- 219	KG	KG	KILOGRAM	kg	KILOGRAM -->
                    <xsl:when test="$GstdBasiseenheid_code = '219'">kg</xsl:when>
                    <!-- 221	KM	KIEM	KIEMEN	kiemen	KIEMEN -->
                    <xsl:when test="$GstdBasiseenheid_code = ('221')">1</xsl:when>
                    <!-- 222	L	L	LITER	l	LITER -->
                    <xsl:when test="$GstdBasiseenheid_code = ('222')">l</xsl:when>
                    <!-- 225	M	M	METER	m	METER -->
                    <xsl:when test="$GstdBasiseenheid_code = ('225')">m</xsl:when>
                    <!-- 229	MG	MG	MILLIGRAM	mg	MILLIGRAM -->
                    <xsl:when test="$GstdBasiseenheid_code = '229'">mg</xsl:when>
                    <!-- 231	MI	MMOL	MILLIMOL	mmol	MILLIMOL -->
                    <xsl:when test="$GstdBasiseenheid_code = '231'">mmol</xsl:when>
                    <!-- 233	ML	ML	MILLILITER	ml	MILLILITER -->
                    <xsl:when test="$GstdBasiseenheid_code = '233'">ml</xsl:when>
                    <!-- 234	MM	MM	MILLIMETER	mm	MILLIMETER -->
                    <xsl:when test="$GstdBasiseenheid_code = '234'">mm</xsl:when>
                    <!-- 235	MO	MOL	MOL	mol	MOL                   (ZIE MARTINDALE 28, BLZ XXI) -->
                    <xsl:when test="$GstdBasiseenheid_code = '235'">mol</xsl:when>
                    <!-- 236	M2	M-2	VIERKANTE METER	m2	VIERKANTE METER -->
                    <xsl:when test="$GstdBasiseenheid_code = '236'">m2</xsl:when>
                    <!-- 237	N	N	NORMAAL	N	NORMAAL -->
                    <xsl:when test="$GstdBasiseenheid_code = '237'">1</xsl:when>
                    <!-- 238	NE	NOOE	NOON EENHEID	Noon-E	NOON EENHEID                     (POLLENALLERGEEN) -->
                    <!-- 242	PE	PLOE	PLOUGH EENHEID	Plough-E	PLOUGH EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = ('238', '242')">1</xsl:when>
                    <!-- 244	PU	PFU	POCK FORM. UNIT	pfu	POCK/PLAQUE FORMING UNIT -->
                    <xsl:when test="$GstdBasiseenheid_code = '244'">[PFU]</xsl:when>
                    <!-- 245	ST	STUK	STUK	stuk	STUK -->
                    <xsl:when test="$GstdBasiseenheid_code = '245'">1</xsl:when>
                    <!-- 246	CC	CCID	CCID50	CCID50	CELL CULTURE INFECTIVE DOSE 50% (CCID50) -->
                    <xsl:when test="$GstdBasiseenheid_code = '246'">[CCID_50]</xsl:when>
                    <!-- 247	TE	TB-E	TUBERCULIN EENH	TB-E	TUBERCULINE EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = '247'">[tb'U]</xsl:when>
                    <!-- 252	UG	UG	MICROGRAM	ug	MICROGRAM -->
                    <xsl:when test="$GstdBasiseenheid_code = '252'">ug</xsl:when>
                    <!-- 253	UK	UKAT	MICROKATAL	uKat	MICROKATAL                  (ZIE NED.PH.8,BLZ 522) -->
                    <xsl:when test="$GstdBasiseenheid_code = '253'">ukat</xsl:when>
                    <!-- 254	UL	UL	MICROLITER	ul	MICROLITER -->
                    <xsl:when test="$GstdBasiseenheid_code = '254'">ul</xsl:when>
                    <!-- 255	UU	USPE	USP EENHEID	USP-E	USP EENHEID,INCL ANSON,ARMOUR,USNF,WALLACE,WAMPOLE -->
                    <xsl:when test="$GstdBasiseenheid_code = '255'">[USP'U]</xsl:when>
                    <!-- 257	WE	WILE	WILSTATTER EENH	Wilst-E	WILLSTATTER EENHEID -->
                    <!-- 290	AH	AHFE	ANTIHEMOF.FAC.E	AHF-E	ANTIHEMOFILIE FACTOR EENHEID -->
                    <!-- 292	BE	BP-E	BRITISH PH.EENH	BP-E	BRITISH PHARMACOPOEIA EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = ('257', '290', '292')">1</xsl:when>
                    <!-- 303	DR	DRUP	DRUPPEL	gt	DRUPPEL -->
                    <xsl:when test="$GstdBasiseenheid_code = '303'">[drp]</xsl:when>
                    <!-- 304	LE	LEVE	LEVY EENHEID	Levy-E	LEVY EENHEID          (ZIE MARTINDALE 28, BLZ 654) -->
                    <!-- 305	KE	KIE	KALLID.INACT.EH	KIE	KALLIDINOGENASE INACTIVERENDE EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = ('304', '305')">1</xsl:when>
                    <!-- 306	LF	LFEQ	LIMES FLOC.EQUI	Lf	LIMES FLOCCULATIE EQUIVALENT        (ZIE NED.PH.8) -->
                    <xsl:when test="$GstdBasiseenheid_code = '306'">[Lf]</xsl:when>
                    <!-- 308	MK	MK	MILJ.KIEMEN	milj.kiem	MILJOEN KIEMEN (ZIE RIV VADEM.'81 16) -->
                    <xsl:when test="$GstdBasiseenheid_code = '308'">1</xsl:when>
                    <!-- 310	MQ	MBEQ	MEGABECQUEREL	MBq	MEGABECQUEREL          (ZIE MARTINDALE 28,BLZ XXI) -->
                    <xsl:when test="$GstdBasiseenheid_code = '310'">MBq</xsl:when>
                    <!-- 316	NI	NIHE	NIH-EENHEID	NIH-E	NATIONAL INSTITUTE OF HEALTH EENHEID -->
                    <!-- 331	HE	HDBE	HDB-EENHEID	HDB-E	HEPARINOID BAYER EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = ('316', '331')">1</xsl:when>
                    <!-- 332	UM	UMOL	MICROMOL	umol	MICROMOL -->
                    <xsl:when test="$GstdBasiseenheid_code = '332'">umol</xsl:when>
                    <!-- 335	CH	CHRE	CRICK-H-R EENH.	CHR-E	CRICK-HARPER-RAPER EENHEID (ZIE INF.M.'84,BLZ 426) -->
                    <!-- 336	CU	CL-E	CLINISCHE EENH.	CL-E	CLINISCHE EENHEID         (ZIE INF.M.1984,BLZ 426) -->
                    <!-- 337	XX	XX	ONBEP. EENHEID	onbepaald	ONBEPAALDE EENHEID -->
                    <!-- 338	CB	CHBE	CHYMOT.BOURN-EH	CHB-E	CHYMOTRYPSINE BOURNONVILLE EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = ('335', '336', '337', '338')">1</xsl:when>
                    <!-- 339	QQ	MGML	MG/ML	mg/ml-g	MG/ML NB. ALLEEN TOEGESTAAN BIJ GEIMPR.DEPPER/GAAS -->
                    <xsl:when test="$GstdBasiseenheid_code = ('339')">1</xsl:when>
                    <!-- 340	NK	NKAT	NANOKATAL	nKat	NANOKATAL -->
                    <xsl:when test="$GstdBasiseenheid_code = '340'">nkat</xsl:when>
                    <!-- 341	DE	D-AE	D-ANTIGEEN EENH	DE	D-ANTIGEEN EENHEID  (ZIE RIV VAD.'81,POLIO VACCIN) -->
                    <xsl:when test="$GstdBasiseenheid_code = '341'">[D'ag'U]</xsl:when>
                    <!-- 342	OE	IOE	INT.OPACIT.EENH	IOE	INTERNATIONALE OPACITY EENHEID   (ZIE RIV VAD.'81) -->
                    <xsl:when test="$GstdBasiseenheid_code = '342'">1</xsl:when>
                    <!-- 343	VM	MM2	VIERKANTE MM	mm2	VIERKANTE MILLIMETER -->
                    <xsl:when test="$GstdBasiseenheid_code = '343'">mm2</xsl:when>
                    <!-- 344	ID	ID-E	IVY DOG EENHEID	Ivy dog-E	IVY DOG EENHEID (ZIE MARTINDALE 28 BLZ 521) -->
                    <xsl:when test="$GstdBasiseenheid_code = '344'">1</xsl:when>
                    <!-- 345	ME	ME	MILJ. IE	milj. IE	MILJOEN IE -->
                    <xsl:when test="$GstdBasiseenheid_code = '345'">M[iU]</xsl:when>
                    <!-- 346	AX	AXAE	ANTI-XA-E	AXa-E	ANTIFACTOR-XA-ACTIVITEIT EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = '346'">[anti'Xa'U]</xsl:when>
                    <!-- 347	KQ	KBEQ	KILOBECQUEREL	kBq	KILOBECQUEREL -->
                    <xsl:when test="$GstdBasiseenheid_code = '347'">kBq</xsl:when>
                    <!-- 348	GQ	GBQ	GIGABECQUEREL	GBq	GIGABECQUEREL -->
                    <xsl:when test="$GstdBasiseenheid_code = '348'">GBq</xsl:when>
                    <!-- 349	CE	CEL	CELLEN	cellen	CELLEN -->
                    <xsl:when test="$GstdBasiseenheid_code = '349'">1</xsl:when>
                    <!-- 350	IR	RE.I	REACT. INDEX	IR	REACTIVITEITSINDEX (STALLERGENES) -->
                    <xsl:when test="$GstdBasiseenheid_code = '350'">[IR]</xsl:when>
                    <!-- 351	GK	GENK	GEN.KOPIE	gen.k	GENOOMKOPIEËN -->
                    <!-- 352	TG	TGK	TERGENKOP	teragenoomkopieën	TERAGENOOMKOPIEËN -->
                    <xsl:when test="$GstdBasiseenheid_code = ('351', '352')">1</xsl:when>
                    <!-- 353	MU	MPFU	MILJ. PFU	milj. pfu	MILJOEN PLAQUE FORMING UNITS -->
                    <xsl:when test="$GstdBasiseenheid_code = '353'">M[PFU]</xsl:when>
                    <!-- 354	AU	AU	ANTIGEEN-EENH	AU	ANTIGEEN-EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = '354'">1</xsl:when>
                    <!-- 356	MD	MIE	MILLI-IE	mIE	MILLI-INTERNATIONALE EENHEID -->
                    <xsl:when test="$GstdBasiseenheid_code = '356'">m[iU]</xsl:when>
                    <!-- 490	VP	VERP	VERPAKKING	verp.	VERPAKKING -->
                    <xsl:when test="$GstdBasiseenheid_code = '490'">1</xsl:when>
                    <!-- 500	CH	CH	CHARRIERE	CHARRIERE	CHARRIERE -->
                    <xsl:when test="$GstdBasiseenheid_code = '500'">[Ch]</xsl:when>
                    <!-- 501	MQ	MBEQ	MEGABEQUEREL	MBq	MEGABEQUEREL -->
                    <xsl:when test="$GstdBasiseenheid_code = '501'">MBq</xsl:when>
                    <!-- 502	C2	CM-2	VIERKANTE CM	cm2	VIERKANTE CENTIMETER -->
                    <xsl:when test="$GstdBasiseenheid_code = '502'">cm2</xsl:when>
                    <!-- 504	FE	FIPE	FIP EENHEID	FIP-E	FIP EENHEID (ZIE NED.PH.8.BLZ.836) -->
                    <xsl:when test="$GstdBasiseenheid_code = '504'">1</xsl:when>
                    <xsl:otherwise>Unsupported G-standaard basiseenheid: <xsl:value-of select="$GstdBasiseenheid_code"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- geen integer meegekregen --> G-standaard code is not an integer. Unsupported G-standaard basiseenheid: "<xsl:value-of select="$GstdBasiseenheid_code"/>". </xsl:otherwise>
        </xsl:choose>
    </xsl:function>



    <xd:doc>
        <xd:desc>Converts ADA unit 2 UCUM</xd:desc>
        <xd:param name="ADAunit"/>
    </xd:doc>
    <xsl:function name="nf:convert_ADA_unit2UCUM" as="xs:string?">
        <xsl:param name="ADAunit" as="xs:string?"/>
        <xsl:if test="$ADAunit">
            <xsl:choose>
                <xsl:when test="$ADAunit = $ada-unit-kilo">kg</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-gram">g</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-cm">cm</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-m">m</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-liter">l</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-dl">dl</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-cl">cl</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-ml">ml</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-ul">ul</xsl:when>

                <xsl:when test="$ADAunit = $ada-unit-druppel">[drp]</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-degrees-celsius">Cel</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-pH">[pH]</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-mmol-l">mmol/L</xsl:when>

                <xsl:when test="not(contains(nf:convertTime_ADA_unit2UCUM($ADAunit), 'onbekend'))">
                    <xsl:value-of select="nf:convertTime_ADA_unit2UCUM($ADAunit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- let's assume it is a valid UCUM code -->
                    <xsl:value-of select="$ADAunit"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Converts an ada unit to the UCUM unit as used in FHIR</xd:desc>
        <xd:param name="ADAunit">The ada unit string</xd:param>
    </xd:doc>
    <xsl:function name="nf:convert_ADA_unit2UCUM_FHIR" as="xs:string?">
        <xsl:param name="ADAunit" as="xs:string?"/>
        <xsl:if test="$ADAunit">
            <xsl:choose>
                <xsl:when test="$ADAunit = $ada-unit-gram">g</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-kilo">kg</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-cm">cm</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-m">m</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-mmHg">mm[Hg]</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-diopter">[diop]</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-prism-diopter">[p'diop]</xsl:when>
                <xsl:when test="nf:isValidUCUMUnit($ADAunit)">
                    <xsl:value-of select="$ADAunit"/>
                </xsl:when>
                <xsl:when test="not(contains(nf:convertTime_ADA_unit2UCUM_FHIR($ADAunit), 'onbekend'))">
                    <xsl:value-of select="nf:convertTime_ADA_unit2UCUM_FHIR($ADAunit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- If all else fails: wrap in {} to make it an annotation -->
                    <xsl:value-of select="concat('{', $ADAunit, '}')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Converts ADA time unit 2 UCUM</xd:desc>
        <xd:param name="ADAtime"/>
    </xd:doc>
    <xsl:function name="nf:convertTime_ADA_unit2UCUM" as="xs:string?">
        <xsl:param name="ADAtime" as="xs:string?"/>
        <xsl:if test="$ADAtime">
            <xsl:choose>
                <xsl:when test="$ADAtime = $ada-unit-second">s</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-minute">min</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-hour">h</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-day">d</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-week">wk</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-month">mo</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-year">a</xsl:when>
                <xsl:otherwise>
                    <!-- If all else fails: simply return the ada value -->
                    <xsl:value-of select="$ADAtime"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Converts an ada time unit to the UCUM unit as used in FHIR</xd:desc>
        <xd:param name="ADAtime">The ada time unit string</xd:param>
    </xd:doc>
    <xsl:function name="nf:convertTime_ADA_unit2UCUM_FHIR" as="xs:string?">
        <xsl:param name="ADAtime" as="xs:string?"/>
        <xsl:if test="$ADAtime">
            <xsl:choose>
                <xsl:when test="$ADAtime = $ada-unit-second">s</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-minute">min</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-hour">h</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-day">d</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-week">wk</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-month">mo</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-year">a</xsl:when>
                <xsl:otherwise>
                    <!-- If all else fails: wrap in {} to make it an annotation -->
                    <xsl:value-of select="concat('{', $ADAtime, '}')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>


    <xd:doc>
        <xd:desc/>
        <xd:param name="UCUM"/>
    </xd:doc>
    <xsl:template name="UCUM2GstdBasiseenheid">
        <xsl:param name="UCUM"/>

        <xsl:variable name="gstd-code">
            <xsl:choose>
                <xsl:when test="string-length($UCUM) > 0">
                    <xsl:choose>
                        <xsl:when test="$UCUM = 'cm'">205</xsl:when>
                        <xsl:when test="$UCUM = 'g'">215</xsl:when>
                        <xsl:when test="$UCUM = '[iU]'">217</xsl:when>
                        <xsl:when test="$UCUM = 'kg'">219</xsl:when>
                        <xsl:when test="$UCUM = 'l'">222</xsl:when>
                        <xsl:when test="$UCUM = 'mg'">229</xsl:when>
                        <xsl:when test="$UCUM = 'ml'">233</xsl:when>
                        <xsl:when test="$UCUM = 'mm'">234</xsl:when>
                        <xsl:when test="$UCUM = '1'">245</xsl:when>
                        <xsl:when test="$UCUM = 'ug'">252</xsl:when>
                        <xsl:when test="$UCUM = 'ul'">254</xsl:when>
                        <xsl:when test="$UCUM = '[drp]'">303</xsl:when>
                        <xsl:otherwise>Not supported UCUM eenheid, cannot convert to G-standaard basiseenheid: <xsl:value-of select="$UCUM"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <!-- geen waarde meegekregen --> UCUM is an empty string. Not supported to convert to G-standaard basiseenheid. </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="gstd-displayname">
            <xsl:choose>
                <xsl:when test="string-length($UCUM) > 0">
                    <xsl:choose>
                        <xsl:when test="$UCUM = 'cm'">centimeter</xsl:when>
                        <xsl:when test="$UCUM = 'g'">gram</xsl:when>
                        <xsl:when test="$UCUM = '[iU]'">internationale eenheid</xsl:when>
                        <xsl:when test="$UCUM = 'kg'">kilogram</xsl:when>
                        <xsl:when test="$UCUM = 'l'">liter</xsl:when>
                        <xsl:when test="$UCUM = 'mg'">milligram</xsl:when>
                        <xsl:when test="$UCUM = 'ml'">milliliter</xsl:when>
                        <xsl:when test="$UCUM = 'mm'">millimeter</xsl:when>
                        <xsl:when test="$UCUM = '1'">stuk</xsl:when>
                        <xsl:when test="$UCUM = 'ug'">microgram</xsl:when>
                        <xsl:when test="$UCUM = 'ul'">microliter</xsl:when>
                        <xsl:when test="$UCUM = '[drp]'">druppel</xsl:when>
                        <xsl:otherwise>Not supported UCUM eenheid, cannot convert to G-standaard basiseenheid: <xsl:value-of select="$UCUM"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <!-- geen waarde meegekregen --> UCUM is an empty string. Not supported to convert to G-standaard basiseenheid. </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="code" select="$gstd-code"/>
        <xsl:attribute name="codeSystem" select="$oidGStandaardBST902THES2"/>
        <xsl:attribute name="codeSystemName">G-Standaard thesaurus basiseenheden</xsl:attribute>
        <xsl:attribute name="displayName" select="$gstd-displayname"/>
    </xsl:template>

    <!--<xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <xsl:variable name="term" as="element()*">
            <!-\- Via labterminologie.nl -\->
            <valueDomain type="quantity">
                <property unit="{{Z-score}}" name-en="{{Z-score}}" name-nl="{{Z-score}}"/>
                <property unit="[arb'U]/mL" name-en="arbitrairy units per milliliter" name-nl="arbitraire eenheden per milliliter"/>
                <property unit="[arb'U]/L" name-en="arbitrary units per liter" name-nl="arbitrary unit per liter"/>
                <property unit="[beth'U]" name-en="Bethesda unit" name-nl="Bethesda-unit"/>
                <property unit="10*9/mm3" name-en="billion per cubic millimeter" name-nl="miljard per kubieke millimeter"/>
                <property unit="10*9/L" name-en="billion per liter" name-nl="miljard per liter"/>
                <property unit="cm" name-en="centimeter" name-nl="centimeter"/>
                <property unit="cm[H2O]" name-en="centimeter H2O" name-nl="centimeter H2O"/>
                <property unit="mm3" name-en="cubic millimeter" name-nl="kubieke millimeter"/>
                <property unit="Cel" name-en="degree centigrade" name-nl="graden Celsius"/>
                <property unit="fL" name-en="femtoliter" name-nl="femtoliter"/>
                <property unit="fmol" name-en="femtomole" name-nl="femtomol"/>
                <property unit="g" name-en="gram" name-nl="gram"/>
                <property unit="g/24.h" name-en="gram per 24 hour" name-nl="gram per 24 uur"/>
                <property unit="g/5.h" name-en="gram per 5 hours" name-nl="gram per 5 uur"/>
                <property unit="g/d" name-en="gram per day" name-nl="gram per dag"/>
                <property unit="g/g" name-en="gram per gram" name-nl="gram per gram"/>
                <property unit="g/h" name-en="gram per hour" name-nl="gram per uur"/>
                <property unit="g/kg" name-en="gram per kilogram" name-nl="gram per kilogram"/>
                <property unit="g/L" name-en="gram per liter" name-nl="gram per liter"/>
                <property unit="g/ug" name-en="gram per microgram" name-nl="gram per microgram"/>
                <property unit="h" name-en="hour" name-nl="uur"/>
                <property unit="[iU]/d" name-en="international unit per day" name-nl="international unit per dag"/>
                <property unit="[iU]/h" name-en="international unit per hour" name-nl="international unit per uur"/>
                <property unit="[iU]/kg" name-en="international unit per kilogram" name-nl="international unit per kilogram"/>
                <property unit="[iU]/L" name-en="international unit per liter" name-nl="international unit per liter"/>
                <property unit="[iU]/mL" name-en="international unit per milliliter" name-nl="international unit per milliliter"/>
                <property unit="[IU]/g" name-en="international units per gram" name-nl="internationale eenheden per gram"/>
                <property unit="kat/L" name-en="katal per liter" name-nl="katal per liter"/>
                <property unit="k[arb'U]/L" name-en="kilo arbitrary unit per liter" name-nl="kiloarbitrary unit per liter"/>
                <property unit="k[IU]/L" name-en="kilo[international units] per liter" name-nl="kilo[internationale units] per liter"/>
                <property unit="kcal" name-en="kilocalorie" name-nl="kilocalorie"/>
                <property unit="kcal/d" name-en="kilocalorie per day" name-nl="kilocalorie per dag"/>
                <property unit="kg" name-en="kilogram" name-nl="kilogram"/>
                <property unit="kPa" name-en="kilopascal" name-nl="kilopascal"/>
                <property unit="L" name-en="liter" name-nl="liter"/>
                <property unit="L/d" name-en="liter per day" name-nl="liter per dag"/>
                <property unit="L/h" name-en="liter per hour" name-nl="liter per uur"/>
                <property unit="L/kg" name-en="liter per kilogram" name-nl="liter per kilogram"/>
                <property unit="L/L" name-en="Liter per Liter" name-nl="liter per liter"/>
                <property unit="L/min" name-en="liter per minute" name-nl="liter per minuut"/>
                <property unit="L/s" name-en="liter per second" name-nl="liter per seconde"/>
                <property unit="m/s" name-en="meter per second" name-nl="meter per seconde"/>
                <property unit="m/s2" name-en="meter per square second" name-nl="meter per vierkante seconde"/>
                <property unit="u[iU]" name-en="micro international unit" name-nl="micro international unit"/>
                <property unit="ug" name-en="microgram" name-nl="microgram"/>
                <property unit="ug/d" name-en="microgram per day" name-nl="microgram per dag"/>
                <property unit="ug/dL" name-en="microgram per deciliter" name-nl="microgram per deciliter"/>
                <property unit="ug/g" name-en="microgram per gram" name-nl="microgram per gram"/>
                <property unit="ug/kg" name-en="microgram per kilogram" name-nl="microgram per kilogram"/>
                <property unit="ug/(kg.d)" name-en="microgram per kilogram and day" name-nl="microgram per kilogram en dag"/>
                <property unit="ug/L" name-en="microgram per liter" name-nl="microgram per liter"/>
                <property unit="ug/L/h" name-en="microgram per liter per hour" name-nl="microgram per liter per uur"/>
                <property unit="ug/mL" name-en="microgram per milliliter" name-nl="microgram per milliliter"/>
                <property unit="ug/mmol" name-en="microgram per millimole" name-nl="milligram per millimol"/>
                <property unit="um" name-en="micrometer" name-nl="micrometer"/>
                <property unit="umol" name-en="micromole" name-nl="micromol"/>
                <property unit="umol/d" name-en="micromole per day" name-nl="micromol per dag"/>
                <property unit="umol/g" name-en="micromole per gram" name-nl="micromol per gram"/>
                <property unit="umol/h/g" name-en="micromole per hour per gram" name-nl="micromol per uur per gram"/>
                <property unit="umol/h/L" name-en="micromole per hour per liter" name-nl="micromol per uur per liter"/>
                <property unit="umol/h/mg" name-en="micromole per hour per milligram" name-nl="micromol per uur per milligram"/>
                <property unit="umol/L" name-en="micromole per liter" name-nl="micromol per liter"/>
                <property unit="umol/mmol" name-en="micromole per millimole" name-nl="micromol per millimol"/>
                <property unit="umol/min/g" name-en="micromole per minute per gram" name-nl="micromol per minute per gram"/>
                <property unit="umol/mol" name-en="micromole per mole" name-nl="micromol per mol"/>
                <property unit="umol/umol" name-en="micromole/micromole" name-nl="micromol/micromol"/>
                <property unit="mPa.s" name-en="milli Pascal second" name-nl="millipascal en seconde"/>
                <property unit="m[iU]/L" name-en="milli-international unit per liter" name-nl="milli international unit per liter"/>
                <property unit="m[iU]/mL" name-en="milli-international unit per milliliter" name-nl="milli international unit per milliliter"/>
                <property unit="mbar" name-en="millibar" name-nl="millibar"/>
                <property unit="mg/(24.h)" name-en="milligram per 24 hour" name-nl="milligram per 24 uur"/>
                <property unit="mg/g" name-en="milligram per gram" name-nl="milligram per gram"/>
                <property unit="mg/L" name-en="milligram per liter" name-nl="milligram per liter"/>
                <property unit="mg/mmol" name-en="milligram per millimole" name-nl="milligram per millimol"/>
                <property unit="mL" name-en="milliliter" name-nl="milliliter"/>
                <property unit="mL/24.h" name-en="milliliter per 24 hour" name-nl="milliliter per 24 uur"/>
                <property unit="mL/h" name-en="milliliter per hour" name-nl="milliliter per uur"/>
                <property unit="mL/kg" name-en="milliliter per kilogram" name-nl="milliliter per kilogram"/>
                <property unit="mL/min" name-en="milliliter per minute" name-nl="milliliter per minuut"/>
                <property unit="mL/min/1.73m2" name-en="milliliter per minute per 1.72 sq meter" name-nl="milliliter per minuut per 1.73 vierkante meter"/>
                <property unit="mm" name-en="millimeter" name-nl="millimeter"/>
                <property unit="mm/(2.h)" name-en="millimeter after the first 2 hours" name-nl="millimeter na de eerste 2 uur"/>
                <property unit="mm/h" name-en="millimeter hour" name-nl="millimeter per uur"/>
                <property unit="mm/(1.h)" name-en="millimeter in the first hour" name-nl="millimeter in het 1e uur"/>
                <property unit="mm[Hg]" name-en="millimeter Mercury column" name-nl="millimeter kwik"/>
                <property unit="mmol/(24.h)" name-en="millimole per 24 hours" name-nl="millimol per 24 uur"/>
                <property unit="mmol/h" name-en="millimole per hour" name-nl="millimol per uur"/>
                <property unit="mmol/h/mmol{{Hb}}" name-en="millimole per hour per millimole {{Hb}}" name-nl="millimol per uur per millimol {{Hb}}"/>
                <property unit="mmol/kg" name-en="millimole per kilogram" name-nl="millimol per kilogram"/>
                <property unit="mmol/(kg.d)" name-en="millimole per kilogram and day" name-nl="millimol per kilogram en dag"/>
                <property unit="mmol/L" name-en="millimole per liter" name-nl="millimol per liter"/>
                <property unit="mmol/mmol" name-en="millimole per millimole" name-nl="millimol per millimol"/>
                <property unit="mmol/mol" name-en="millimole per mole" name-nl="millimol per mol"/>
                <property unit="10*6/mm3" name-en="million per cubic millimeter" name-nl="miljoen per kubieke millimeter"/>
                <property unit="10*6/L" name-en="million per liter" name-nl="miljoen per liter"/>
                <property unit="mosm/kg" name-en="milliosmole per kilogram" name-nl="milli-osmol per kilogram"/>
                <property unit="mosm/L" name-en="milliosmole per liter" name-nl="milli-osmol per liter"/>
                <property unit="mU/g" name-en="milliunits per gram" name-nl="milli-eenheden per gram"/>
                <property unit="mU/L" name-en="milliunits per liter" name-nl="milli-eenheden per liter"/>
                <property unit="min" name-en="minutes" name-nl="minuten"/>
                <property unit="mol/h/mol{{Hb}}" name-en="mole per hour per mole {{Hb}}" name-nl="mol per uur per mol {{Hb}}"/>
                <property unit="mol/kg" name-en="mole per Kilogram" name-nl="mol per kilogram"/>
                <property unit="mol/L" name-en="mole per liter" name-nl="mol per liter"/>
                <property unit="mol/mol" name-en="mole per mole" name-nl="mol per mol"/>
                <property unit="mol/s" name-en="mole per second" name-nl="mol per seconde"/>
                <property unit="{{M.o.M.}}" name-en="Multiples of the Median" name-nl="veelvoud van de mediaan"/>
                <property unit="nmol/(24.h)" name-en="nanamole per 24 hours" name-nl="nanomol per 24 uur"/>
                <property unit="ng" name-en="nanogram" name-nl="nanogram"/>
                <property unit="ng/g" name-en="nanogram per gram" name-nl="nanogram per gram"/>
                <property unit="ng/L" name-en="nanogram per liter" name-nl="nanogram per liter"/>
                <property unit="ng/mL" name-en="nanogram per milliliter" name-nl="nanogram per milliliter"/>
                <property unit="nm" name-en="nanometer" name-nl="nanometer"/>
                <property unit="nmol/10*9{{platelets}}" name-en="nanomole per 10*9 platelets" name-nl="nanomol per 10*9 {{trombocyten}}"/>
                <property unit="nmol/g" name-en="nanomole per gram" name-nl="nanomol per gram"/>
                <property unit="nmol/h/L" name-en="nanomole per hour per liter" name-nl="nanomol per uur per liter"/>
                <property unit="nmol/h/mg" name-en="nanomole per hour per mg" name-nl="nanomol per uur per mg"/>
                <property unit="nmol/h/mL" name-en="nanomole per hour per milliliter" name-nl="nanomol per uur per milliliter"/>
                <property unit="nmol/L" name-en="nanomole per liter" name-nl="nanomol per liter"/>
                <property unit="nmol/mg" name-en="nanomole per milligram" name-nl="nanomol per milligram"/>
                <property unit="nmol/mmol" name-en="nanomole per millimole" name-nl="nanomol per millimol"/>
                <property unit="nmol/min/mg" name-en="nanomole per min per mg" name-nl="nanomol per min per mg"/>
                <property unit="nmol/mol" name-en="nanomole per mole" name-nl="nanomol per mol"/>
                <property unit="{{aantal}}" name-en="number" name-nl="aantal"/>
                <property unit="osm/kg" name-en="osmole per kilogram" name-nl="osmol per kilogram"/>
                <property unit="osm/L" name-en="osmole per liter" name-nl="osmol per liter"/>
                <property unit="[ppm]" name-en="parts per million" name-nl="delen per miljoen"/>
                <property unit="/[arb'U]" name-en="per arbitrary unit" name-nl="per arbitrary unit"/>
                <property unit="/g{{creat}}" name-en="per gram of creatinine" name-nl="per gram creatinine"/>
                <property unit="/g{{HGB}}" name-en="per gram of hemoglobin" name-nl="per gram hemoglobine"/>
                <property unit="/g{{tot'nit}}" name-en="per gram of total nitrogen" name-nl="per gram totaal stikstof"/>
                <property unit="/g{{tot'ptot}}" name-en="per gram of total protein" name-nl="per gram totaal eiwit"/>
                <property unit="/g{{wet'tis}}" name-en="per gram of wet tissue" name-nl="per gram nat weefsel"/>
                <property unit="/[HPF]" name-en="per high power field" name-nl="per gezichtsveld (400x)"/>
                <property unit="/[iU]" name-en="per international unit" name-nl="per international unit"/>
                <property unit="/kg" name-en="per kilogram" name-nl="per kilogram"/>
                <property unit="/kg{{body'wt}}" name-en="per kilogram body weight" name-nl="per kilogram lichaamsgewicht"/>
                <property unit="/L" name-en="per liter" name-nl="per liter"/>
                <property unit="/[LPF]" name-en="per low power field (100x)" name-nl="per gezichtsveld (100x)"/>
                <property unit="/uL" name-en="per microliter" name-nl="aantal per microliter"/>
                <property unit="/mL" name-en="per milliliter" name-nl="per milliliter"/>
                <property unit="/min" name-en="per minute" name-nl="per minuut"/>
                <property unit="/{{OIF}}" name-en="per oil immersion field" name-nl="per gezichtsveld met olie-immersieveld (1000x)"/>
                <property unit="/m3" name-en="per square meter" name-nl="per vierkante meter"/>
                <property unit="/{{tot}}" name-en="per total count" name-nl="per totale telling"/>
                <property unit="%" name-en="percent" name-nl="procent"/>
                <property unit="[pH]" name-en="pH" name-nl="pH"/>
                <property unit="pg" name-en="picogram" name-nl="picogram"/>
                <property unit="pg/L" name-en="picogram per liter" name-nl="picogram per liter"/>
                <property unit="pg/mL" name-en="picogram per milliliter" name-nl="picogram per milliliter"/>
                <property unit="pmol" name-en="picomole" name-nl="picomol"/>
                <property unit="pmol/(24.h)/mg{{protein}}" name-en="picomole per 24 hour/ per milligram" name-nl="picomol per 24 uur/ per milligram"/>
                <property unit="pmol/h/mg" name-en="picomole per hour per mg" name-nl="picomol per uur per mg"/>
                <property unit="pmol/h/mL" name-en="picomole per hour per milliliter" name-nl="picomol per uur per milliliter"/>
                <property unit="pmol/L" name-en="picomole per liter" name-nl="picomol per liter"/>
                <property unit="pmol/L.min" name-en="picomole per liter and minute" name-nl="picomol per liter en minuut"/>
                <property unit="pmol/10*6{{RBCs}}" name-en="picomole per million erythrocytes" name-nl="picomol per miljoen erytrocyten"/>
                <property unit="pmol/min/mg" name-en="picomole per minute per mg {{protein]" name-nl="picomol per minute per mg {{eiwit}}"/>
                <property unit="s" name-en="second" name-nl="seconde"/>
                <property unit="m2" name-en="square meter" name-nl="vierkante meter"/>
                <property unit="10*3.{{RBC}}" name-en="thousand red blood cells" name-nl="duizend erytrocyten"/>
                <property unit="10*3/uL" name-en="thousands per microliter" name-nl="duizend per microliter"/>
                <property unit="{{titer}}" name-en="titer" name-nl="titer"/>
                <property unit="10*12/L" name-en="trillion per liter" name-nl="biljoen per liter"/>
                <property unit="U/24.h" name-en="Units per 24 hour" name-nl="Units per 24 uur"/>
                <property unit="U/g" name-en="Units per gram" name-nl="Units per gram"/>
                <property unit="U/L" name-en="Units per Liter" name-nl="Units per liter"/>
                <property unit="U/mL" name-en="Units per milliliter" name-nl="eenheden per milliliter"/>
                <property unit="U/mmol" name-en="Units per millimole" name-nl="eenheden per millimol"/>
                <property unit="U/mol" name-en="Units per mole" name-nl="Units per mol"/>
                <property unit="weken" name-en="weeks" name-nl="weken"/>
                <property unit="jaar (leeftijd)" name-en="year (age)" name-nl="jaar (leeftijd)"/>
                <property unit="{{datum}} (dd/mm/jjjj)" name-en="{{date}} (dd/mm/jjjj)" name-nl="{{datum}} (dd/mm/jjjj)"/>
                <property unit="{{massa-ratio}}" name-en="{{mass ratio}}" name-nl="{{massa-ratio}}"/>
                <property unit="{{molaire ratio}}" name-en="{{molar ratio}}" name-nl="{{molaire ratio}}"/>
                <property unit="{{OD_unit}}" name-en="{{Optical density units}}" name-nl="{{optische dichtheid eenheden}}"/>
                <property unit="{{ratio}}" name-en="{{ratio}}" name-nl="{{ratio}}"/>
            </valueDomain>
            <valueDomain type="quantity">
                <property unit="mmol/l"/>
                <property unit="mm[Hg]"/>
            </valueDomain>
            <valueDomain type="quantity">
                <property unit="min"/>
                <property unit="h"/>
                <property unit="d"/>
                <property unit="wk"/>
                <property unit="a"/>
            </valueDomain>
            <valueDomain type="quantity">
                <property unit="eenheid"/>
                <property unit="g"/>
                <property unit="ug"/>
                <property unit="mg"/>
                <property unit="kg"/>
                <property unit="l"/>
                <property unit="ml"/>
                <property unit="dl"/>
                <property unit="cl"/>
                <property unit="[drp]"/>
                <property unit="[tsp_us]"/>
                <property unit="[tbs_us]"/>
                <property unit="[iU]"/>
            </valueDomain>
        </xsl:variable>
        <y>
        <xsl:for-each-group select="$term//@unit" group-by=".">
            <xsl:variable name="valid" select="nf:isValidUCUMUnit(current-group()[1])"/>
            <xsl:if test="not($valid)">
                <x u="{current-group()[1]}"><xsl:value-of select="$valid"/></x>
            </xsl:if>
        </xsl:for-each-group>
        </y>
    </xsl:template>-->
</xsl:stylesheet>
