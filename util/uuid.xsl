<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:uuid="http://www.uuid.org" version="2.0">
	<xsl:output method="xml" encoding="UTF-8"/>
	<!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
	<!-- Functions in the uuid: namespace are used to calculate a UUID The method used is a derived timestamp method, which 
		is explained here: http://www.famkruithof.net/guid-uuid-timebased.html and here: http://www.ietf.org/rfc/rfc4122.txt -->
    <!-- Returns the UUID in lower-case (http://hl7.org/fhir/datatypes.html#uri)  -->
	<xd:doc>
	    <xd:desc>generates uuid</xd:desc>
	    <xd:param name="node">xml node to generate uuid for</xd:param>
	</xd:doc>
    <xsl:function name="uuid:get-uuid" as="xs:string*">
		<xsl:param name="node"/>
		<xsl:variable name="ts" select="uuid:ts-to-hex(uuid:generate-timestamp($node))"/>
	    <xsl:value-of separator="-" select="lower-case(substring($ts, 8, 8)), lower-case(substring($ts, 4, 4)), lower-case(string-join((uuid:get-uuid-version(), substring($ts, 1, 3)), '')), lower-case(uuid:generate-clock-id()), lower-case(uuid:get-network-node())"/>
	</xsl:function>
	
    <xd:doc>
        <xd:desc> internal aux. fu with saxon, this creates a more-unique result with generate-id then when just using a variable containing 
            a node </xd:desc>
    </xd:doc>
    <xsl:function name="uuid:_get-node">
		<xsl:comment/>
	</xsl:function>
	
    <xd:doc>
        <xd:desc> should return the next nr in sequence, but this can't be done in xslt. Instead, it returns a guaranteed unique number </xd:desc>
        <xd:param name="node"/>
    </xd:doc>
    <xsl:function name="uuid:next-nr" as="xs:integer">
		<xsl:param name="node"/>
		<xsl:sequence select="xs:integer(replace(generate-id($node), '\D', ''))"/>
	</xsl:function>
	
    <xd:doc>
        <xd:desc> internal fu for returning hex digits only </xd:desc>
        <xd:param name="string"/>
        <xd:param name="count"/>
    </xd:doc>
    <xsl:function name="uuid:_hex-only" as="xs:string">
		<xsl:param name="string"/>
		<xsl:param name="count"/>
		<xsl:sequence select="substring(replace($string, '[^0-9a-fA-F]', ''), 1, $count)"/>
	</xsl:function>
	<!-- may as well be defined as returning the same seq each time -->
	<xsl:variable name="_clock" select="generate-id(uuid:_get-node())"/>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:function name="uuid:generate-clock-id" as="xs:string">
		<xsl:sequence select="uuid:_hex-only($_clock, 4)"/>
	</xsl:function>
	
    <xd:doc>
        <xd:desc> returns the network node, this one is 'random', but must be the same within calls. The least-significant bit must be 
            '1' when it is not a real MAC address (in this case it is set to '1') </xd:desc>
    </xd:doc>
    <xsl:function name="uuid:get-network-node" as="xs:string">
		<xsl:sequence select="uuid:_hex-only($macAddress, 12)"/>
	</xsl:function>
	
    <xd:doc>
        <xd:desc> returns version, for timestamp uuids, this is "1" </xd:desc>
    </xd:doc>
    <xsl:function name="uuid:get-uuid-version" as="xs:string">
		<xsl:sequence select="'1'"/>
	</xsl:function>
	
    <xd:doc>
        <xd:desc> Generates a timestamp of the amount of 100 nanosecond intervals from 15 October 1582, in UTC time. </xd:desc>
        <xd:param name="node"/>
    </xd:doc>
    <xsl:function name="uuid:generate-timestamp">
		<xsl:param name="node"/>
		<!-- date calculation automatically goes correct when you add the timezone information, in this case that is UTC. -->
		<xsl:variable name="duration-from-1582" as="xs:dayTimeDuration">
			<xsl:sequence select="current-dateTime() - xs:dateTime('1582-10-15T00:00:00.000Z')"/>
		</xsl:variable>
		<xsl:variable name="random-offset" as="xs:integer">
			<xsl:sequence select="uuid:next-nr($node) mod 10000"/>
		</xsl:variable>
		<!-- do the math to get the 100 nano second intervals -->
		<xsl:sequence select="(days-from-duration($duration-from-1582) * 24 * 60 * 60 + hours-from-duration($duration-from-1582) * 60 * 60 + minutes-from-duration($duration-from-1582) * 60 + seconds-from-duration($duration-from-1582)) * 1000 * 10000 + $random-offset"/>
	</xsl:function>
	
    <xd:doc>
        <xd:desc> simple non-generalized function to convert from timestamp to hex </xd:desc>
        <xd:param name="dec-val"/>
    </xd:doc>
    <xsl:function name="uuid:ts-to-hex">
		<xsl:param name="dec-val"/>
		<xsl:value-of separator="" select="
				for $i in 1 to 15
				return
					(0 to 9, tokenize('A B C D E F', ' '))[$dec-val idiv xs:integer(math:power(16, 15 - $i)) mod 16 + 1]"/>
	</xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="base"/>
        <xd:param name="power"/>
    </xd:doc>
    <xsl:function name="math:power">
		<xsl:param name="base"/>
		<xsl:param name="power"/>
		<xsl:choose>
			<xsl:when test="$power lt 0 or contains(string($power), '.')">
				<xsl:message terminate="yes">
				
				The XSLT template math:power doesn't support negative or
				
				fractional arguments.
				
			</xsl:message>
				<xsl:text>NaN</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="math:_power">
					<xsl:with-param name="base" select="$base"/>
					<xsl:with-param name="power" select="$power"/>
					<xsl:with-param name="result" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<xsl:template name="math:_power">
		<xsl:param name="base"/>
		<xsl:param name="power"/>
		<xsl:param name="result"/>
		<xsl:choose>
			<xsl:when test="$power = 0">
				<xsl:value-of select="$result"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="math:_power">
					<xsl:with-param name="base" select="$base"/>
					<xsl:with-param name="power" select="$power - 1"/>
					<xsl:with-param name="result" select="$result * $base"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
