<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<!-- Templates of the form 'make<datatype/flavor>Value' correspond to ART-DECOR supported datatypes / HL7 V3 Datatypes R1 -->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress -->
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:import href="../../util/uuid.xsl"/>
    <xsl:import href="../fhir/nl-core-patient-2.1.xsl"/>
    <xsl:import href="../fhir/nl-core-relatedperson-2.0.xsl"/>
    <xsl:import href="../fhir/nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="../fhir/nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="../fhir/nl-core-organization-2.0.xsl"/>
    <xsl:import href="../../util/constants.xsl"/>
    <xsl:import href="../../util/datetime.xsl"/>
    <xsl:import href="../../util/units.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xd:doc>
        <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OIDs). When an ID is encountered with a root value in this list, then this ID will be masked in the output data. This is useful to prevent outputting Dutch bsns (<xd:ref name="oidBurgerservicenummer" type="variable"/>) for example. Default is to include any ID in the output as it occurs in the input.</xd:desc>
    </xd:doc>
    <xsl:param name="mask-ids" as="xs:string?"/>
    <xsl:variable name="mask-ids-var" select="tokenize($mask-ids, ',')" as="xs:string*"/>

    <xsl:variable name="patients" as="element()*">
        <!-- Patiënten -->
        <xsl:for-each-group select="//patient[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
                string-join(for $att in nf:ada-pat-id(identificatienummer | patient_identificatie_nummer | patient_identification_number)/(@root, @value)
                return
                    $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-patient xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="current-group()[1]/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPatientEntry-2.1">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-patient>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="relatedPersons" as="element()*">
        <!-- related-persons -->
        <xsl:for-each-group select="//(informant/persoon[not(persoon)] | contactpersoon[not(contactpersoon)] | contact_person[not(contact_person)])[not(@datatype = 'reference')][*//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-persoon xmlns="">
                <group-key>
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="current-group()[1]/normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doRelatedPersonEntry-2.0">
                    <xsl:with-param name="uuid" select="$uuid"/>
                </xsl:apply-templates>
            </unieke-persoon>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="organizations" as="element()*">
        <!-- Zorgaanbieders -->
        <xsl:for-each-group select="//(zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
                string-join(for $att in nf:ada-za-id(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)/(@root, @value)
                return
                    $att, '')">
            <xsl:variable name="cp" select="current-group()"/>
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgaanbieder xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:variable name="organizationName" select="(organisatie_naam | organization_name)/@value[not(. = '')]"/>
                        <xsl:variable name="organizationLocation" select="(organisatie_locatie | organization_location)/@value[not(. = '')]"/>
                        <xsl:variable name="organizationIdentifier" select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer | healthcare_provider_identification_number)[@value[not(. = '')]]"/>

                        <xsl:choose>
                            <xsl:when test="$organizationName or $organizationLocation">
                                <xsl:value-of select="current-group()[1]/normalize-space(string-join($organizationName[1] | $organizationLocation[1], ' - '))"/>
                            </xsl:when>
                            <xsl:when test="$organizationIdentifier">Organisatie met id '<xsl:value-of select="$organizationIdentifier/@value"/>' in identificerend systeem '<xsl:value-of select="$organizationIdentifier/@root"/>'.</xsl:when>
                            <xsl:otherwise>Organisatie informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
                        </xsl:choose>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doOrganizationEntry-2.0">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-zorgaanbieder>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitioners" as="element()*">
        <!-- Zorgverleners in Practitioners -->
        <xsl:for-each-group select="//(zorgverlener[not(zorgverlener)][not(@datatype = 'reference')] | health_professional[not(health_professional)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
                string-join(for $att in nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)/(@root, @value)
                return
                    $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitioner(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgverlener xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <!--<xsl:value-of select="current-group()[1]/normalize-space(string-join(zorgverleners_rol/(@displayName, @code)[1] | health_professional_role/(@displayName, @code)[1] | naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' || '))"/>-->
                        <xsl:value-of select="nf:get-practitioner-display(current-group()[1])"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPractitionerEntry-2.0">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-zorgverlener>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitionerRoles" as="element()*">
        <!-- Zorgverleners in PractitionerRoles -->
        <xsl:for-each-group select="//(zorgverlener[not(zorgverlener)][not(@datatype = 'reference')] | health_professional[not(health_professional)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
                string-join(for $att in nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)/(@root, @value)
                return
                    $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitionerRole(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="true()"/>
                <unieke-practitionerRole xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <!--<xsl:value-of select="current-group()[1]/normalize-space(string-join(zorgverleners_rol/(@displayName, @code)[1] | health_professional_role/(@displayName, @code)[1] | naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' || '))"/>-->
                        <xsl:value-of select="nf:get-practitioner-role-display(current-group()[1])"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPractitionerRoleEntry-2.0">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-practitionerRole>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Returns an array of FHIR elements based on an array of ADA that a @datatype attribute to determine the type with. 
            <xd:p>After the type is determined, the element is handed off for further processing. Failure to determine type is a fatal error.</xd:p>
            <xd:p>Supported values for @datatype are ADA/DECOR datatypes boolean, code, identifier, quantity, string, text, blob, date, datetime</xd:p>
            <xd:p>FIXME: ‘ordinal’, ‘ratio' support</xd:p>
        </xd:desc>
        <xd:param name="in">Optional. Array of elements to process. If empty array, then no output is created.</xd:param>
        <xd:param name="elemName">Required. Base name of the FHIR element to produce. Gets postfixed with datatype, e.g. valueBoolean</xd:param>
    </xd:doc>
    <xsl:template name="any-to-value">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>

        <xsl:for-each select="$in">
            <xsl:variable name="theDatatype" select="@datatype"/>

            <xsl:choose>
                <xsl:when test="$theDatatype = 'code' or @code">
                    <xsl:element name="{concat($elemName, 'CodeableConcept')}" namespace="http://hl7.org/fhir">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$theDatatype = 'identifier' or @root">
                    <xsl:element name="{concat($elemName, 'Identifier')}" namespace="http://hl7.org/fhir">
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:when>
                <!-- Observation//value does not do valueDecimal, hence quantity without unit -->
                <xsl:when test="$theDatatype = ('quantity', 'duration', 'currency', 'decimal') or @unit">
                    <xsl:element name="{concat($elemName, 'Quantity')}" namespace="http://hl7.org/fhir">
                        <xsl:call-template name="hoeveelheid-to-Quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$theDatatype = 'boolean' or @value castable as xs:boolean">
                    <xsl:element name="{concat($elemName, 'Boolean')}" namespace="http://hl7.org/fhir">
                        <xsl:call-template name="boolean-to-boolean">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$theDatatype = ('date', 'datetime') or @value castable as xs:date or @value castable as xs:dateTime">
                    <xsl:element name="{concat($elemName, 'DateTime')}" namespace="http://hl7.org/fhir">
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$theDatatype = 'blob' and (not(@value) or @value castable as xs:base64Binary)">
                    <xsl:element name="{concat($elemName, 'Attachment')}" namespace="http://hl7.org/fhir">
                        <xsl:call-template name="blob-to-attachment">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$theDatatype = ('string', 'text') or not($theDatatype)">
                    <xsl:element name="{concat($elemName, 'String')}" namespace="http://hl7.org/fhir">
                        <xsl:call-template name="string-to-string">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">Cannot determine the datatype based on @datatype, or value not supported: <xsl:value-of select="$theDatatype"/></xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Transforms ada boolean element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#boolean">@value</xd:a></xd:desc>
        <xd:param name="in">the ada boolean element, may have any name but should have ada datatype boolean</xd:param>
    </xd:doc>
    <xsl:template name="boolean-to-boolean" as="item()?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:choose>
            <xsl:when test="$in/@value">
                <xsl:attribute name="value" select="$in/@value"/>
            </xsl:when>
            <xsl:when test="$in/@nullFlavor">
                <extension url="{$urlExtHL7NullFlavor}">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada string element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#string">@value</xd:a></xd:desc>
        <xd:param name="in">the ada string element, may have any name but should have ada datatype string</xd:param>
    </xd:doc>
    <xsl:template name="string-to-string" as="item()?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:choose>
            <xsl:when test="$in/@value">
                <xsl:attribute name="value" select="$in/@value"/>
            </xsl:when>
            <xsl:when test="$in/@nullFlavor">
                <extension url="{$urlExtHL7NullFlavor}">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada string element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#datetime">@value</xd:a></xd:desc>
        <xd:param name="in">the ada date(time) element, may have any name but should have ada datatype date(time)</xd:param>
    </xd:doc>
    <xsl:template name="date-to-datetime" as="item()?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:choose>
            <xsl:when test="$in/@value">
                <xsl:attribute name="value" select="$in/@value"/>
            </xsl:when>
            <xsl:when test="$in/@nullFlavor">
                <extension url="{$oidHL7NullFlavor}">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada blob element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#Attachment">data/@value</xd:a></xd:desc>
        <xd:param name="in">the ada blob element, may have any name but should have ada datatype blob</xd:param>
    </xd:doc>
    <xsl:template name="blob-to-attachment" as="item()?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:choose>
            <xsl:when test="$in/@value">
                <data value="{$in/@value}"/>
            </xsl:when>
            <xsl:when test="$in/@nullFlavor">
                <extension url="{$urlExtHL7NullFlavor}">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada code element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#code">@value</xd:a></xd:desc>
        <xd:param name="in">the ada code element, may have any name but should have ada datatype code</xd:param>
        <xd:param name="codeMap">Array of map elements to be used to map input HL7v3 codes to output ADA codes if those differ. See handleCV for more documentation.
            
            <xd:p>Example. if you only want to translate ActStatus completed into a FHIR ObservationStatus final, this would suffice:</xd:p>
            <xd:p><code>&lt;map inCode="completed" inCodeSystem="$codeSystem" code="final"/&gt;</code>
                <div>to produce</div>
                <code>&lt;$elemName value="final"/&gt;</code></xd:p>
        </xd:param>
    </xd:doc>
    <xsl:template name="code-to-code" as="attribute(value)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="codeMap" as="element()*"/>

        <xsl:for-each select="$in">
            <xsl:variable name="theCode">
                <xsl:choose>
                    <xsl:when test="@code">
                        <xsl:value-of select="@code"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@nullFlavor"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="theCodeSystem">
                <xsl:choose>
                    <xsl:when test="@code">
                        <xsl:value-of select="@codeSystem"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$oidHL7NullFlavor"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="out" as="element()">
                <xsl:choose>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:attribute name="value">
                <xsl:value-of select="$out/@code"/>
                <!-- In the case where codeMap if only used to add a @value for ADA, this saves having to repeat the @inCode and @inCodeSystem as @code resp. @codeSystem -->
                <xsl:if test="not($out/@code) and not(empty($theCode))">
                    <xsl:value-of select="$theCode"/>
                </xsl:if>
            </xsl:attribute>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada code element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#CodeableConcept">CodeableConcept contents</xd:a></xd:desc>
        <xd:param name="in">the ada code element, may have any name but should have ada datatype code</xd:param>
        <xd:param name="element-name">Optionally provide the element name, default = coding. In extensions it is valueCoding.</xd:param>
        <xd:param name="user-selected">Optionally provide a user selected boolean.</xd:param>
    </xd:doc>
    <xsl:template name="code-to-CodeableConcept" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="element-name" as="xs:string?">coding</xsl:param>
        <xsl:param name="user-selected" as="xs:boolean?"/>
        <xsl:choose>
            <xsl:when test="$in[@codeSystem = $oidHL7NullFlavor]">
                <extension url="{$urlExtHL7NullFlavor}">
                    <valueCode value="{$in/@code}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[not(@codeSystem = $oidHL7NullFlavor)]">
                <xsl:element name="{$element-name}">
                    <xsl:call-template name="code-to-Coding">
                        <xsl:with-param name="in" select="$in"/>
                        <xsl:with-param name="user-selected" select="$user-selected"/>
                    </xsl:call-template>
                </xsl:element>
                <!--<xsl:if test="$in/@displayName">
                    <text value="{$in/@displayName}"/>
                </xsl:if>-->
                <!-- ADA heeft geen ondersteuning voor vertalingen, dus onderstaande is theoretisch -->
                <xsl:for-each select="$in/translation">
                    <xsl:element name="{$element-name}">
                        <xsl:call-template name="code-to-Coding">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="$in[@originalText]">
            <text value="{$in/@originalText}"/>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada code element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#Coding">Coding contents</xd:a></xd:desc>
        <xd:param name="in">the ada code element, may have any name but should have ada datatype code</xd:param>
        <xd:param name="user-selected">Optionally provide a user selected boolean.</xd:param>
    </xd:doc>
    <xsl:template name="code-to-Coding" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="user-selected" as="xs:boolean?"/>
        <xsl:choose>
            <xsl:when test="$in[@codeSystem = $oidHL7NullFlavor]">
                <extension url="{$urlExtHL7NullFlavor}">
                    <valueCode value="{$in/@code}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[not(@codeSystem = $oidHL7NullFlavor)]">
                <system value="{local:getUri($in/@codeSystem)}"/>
                <code value="{$in/@code}"/>
                <xsl:if test="$in/@displayName">
                    <display value="{$in/@displayName}"/>
                </xsl:if>
                <xsl:if test="exists($user-selected)">
                    <userSelected value="{$user-selected}"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada 'hoeveelheid' element to FHIR Duration</xd:desc>
        <xd:param name="in">the ada 'hoeveelheid' element, may have any name but should have ada datatype hoeveelheid (quantity)</xd:param>
    </xd:doc>
    <xsl:template name="hoeveelheid-to-Duration" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:variable name="unit-UCUM" select="$in/nf:convertTime_ADA_unit2UCUM_FHIR(@unit)"/>
        <xsl:choose>
            <xsl:when test="$in[@value]">
                <value value="{$in/@value}"/>
                <xsl:if test="$unit-UCUM">
                    <unit value="{$in/@unit}"/>
                    <system value="{local:getUri($oidUCUM)}"/>
                    <code value="{$unit-UCUM}"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="{$urlExtHL7NullFlavor}">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada numerator and denominator elements to FHIR Ratio</xd:desc>
        <xd:param name="numerator">ada numerator element, may have any name but should have sub elements eenheid with datatype code and waarde with datatype aantal (count)</xd:param>
        <xd:param name="denominator">ada denominator element, may have any name but should have sub elements eenheid with datatype code and waarde with datatype aantal (count)</xd:param>
    </xd:doc>
    <xsl:template name="hoeveelheid-complex-to-Ratio" as="element()*">
        <xsl:param name="numerator" as="element()?"/>
        <xsl:param name="denominator" as="element()?"/>

        <xsl:for-each select="$numerator">
            <numerator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="./eenheid"/>
                    <xsl:with-param name="waarde" select="./waarde"/>
                </xsl:call-template>
            </numerator>
        </xsl:for-each>
        <xsl:for-each select="$denominator">
            <denominator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="./eenheid"/>
                    <xsl:with-param name="waarde" select="./waarde"/>
                </xsl:call-template>
            </denominator>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada element of type hoeveelheid to FHIR Quantity</xd:desc>
        <xd:param name="in">ada element may have any name but should have datatype aantal (count)</xd:param>
    </xd:doc>
    <xsl:template name="hoeveelheid-to-Quantity" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[not(@value) or @nullFlavor]">
                <extension url="{$urlExtHL7NullFlavor}">
                    <xsl:variable name="valueCode" as="xs:string">
                        <xsl:choose>
                            <xsl:when test="$in[@nullFlavor]">
                                <xsl:value-of select="$in/@nullFlavor"/>
                            </xsl:when>
                            <xsl:otherwise>NI</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <valueCode value="{$valueCode}"/>
                </extension>
            </xsl:when>
            <xsl:otherwise>
                <value value="{$in/@value}"/>
                <xsl:for-each select="$in[@unit]">
                    <!-- UCUM -->
                    <unit value="{./@unit}"/>
                    <xsl:choose>
                        <xsl:when test="$in[@datatype = 'currency']">
                            <system value="urn:iso:std:iso:4217"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <system value="{local:getUri($oidUCUM)}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <code value="{nf:convert_ADA_unit2UCUM_FHIR(./@unit)}"/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada waarde and eenheid elements to FHIR Quantity</xd:desc>
        <xd:param name="waarde">ada element may have any name but should have datatype aantal (count)</xd:param>
        <xd:param name="eenheid">ada element may have any name but should have datatype code</xd:param>
    </xd:doc>
    <xsl:template name="hoeveelheid-complex-to-Quantity" as="element()*">
        <xsl:param name="waarde" as="element()?"/>
        <xsl:param name="eenheid" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$waarde[not(@value) or @nullFlavor]">
                <extension url="{$urlExtHL7NullFlavor}">
                    <xsl:variable name="valueCode" select="
                            if ($waarde[@nullFlavor]) then
                                ($waarde/@nullFlavor)
                            else
                                ('NI')"/>
                    <valueCode value="{$valueCode}"/>
                </extension>
            </xsl:when>
            <xsl:otherwise>
                <value value="{$waarde/@value}"/>
                <xsl:for-each select="$eenheid[@code]">
                    <xsl:for-each select="./@displayName">
                        <unit value="{.}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./@codeSystem">
                        <system value="{local:getUri(.)}"/>
                    </xsl:for-each>
                    <code value="{if (@codeSystem = $oidUCUM) then nf:convert_ADA_unit2UCUM_FHIR($eenheid/@code) else $eenheid/@code}"/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada element to FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#Identifier">Identifier contents</xd:a>. Masks ids, e.g. Burgerservicenummers, if their @root occurs in <xd:ref name="mask-ids" type="parameter"/></xd:desc>
        <xd:param name="in">ada element with datatype identifier</xd:param>
    </xd:doc>
    <xsl:template name="id-to-Identifier" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="{$urlExtHL7NullFlavor}">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[string-length(@root) gt 0][@root = $mask-ids-var]">
                <system value="{local:getUri($in/@root)}"/>
                <value>
                    <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                        <valueCode value="masked"/>
                    </extension>
                </value>
            </xsl:when>
            <xsl:when test="$in[@value | @root]">
                <xsl:for-each select="$in/@root">
                    <system value="{local:getUri(.)}"/>
                </xsl:for-each>
                <xsl:for-each select="$in/@value">
                    <value value="{.}"/>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada element with zib type interval and only start and end date to FHIR Period</xd:desc>
        <xd:param name="in">ada element with sub ada elements start and end date (both with datatype dateTime)</xd:param>
    </xd:doc>
    <xsl:template name="startend-to-Period" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:for-each select="$in">
            <xsl:choose>
                <xsl:when test="start_datum_tijd[@nullFlavor]">
                    <start>
                        <extension url="{$urlExtHL7NullFlavor}">
                            <valueCode value="{start_datum_tijd/@nullFlavor}"/>
                        </extension>
                    </start>
                </xsl:when>
                <xsl:when test="start_datum_tijd[@value]">
                    <start value="{nf:add-Amsterdam-timezone(start_datum_tijd/@value)}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="eind_datum_tijd[@nullFlavor]">
                    <end>
                        <extension url="{$urlExtHL7NullFlavor}">
                            <valueCode value="{eind_datum_tijd/@nullFlavor}"/>
                        </extension>
                    </end>
                </xsl:when>
                <xsl:when test="eind_datum_tijd[@value]">
                    <end value="{nf:add-Amsterdam-timezone(eind_datum_tijd/@value)}"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in">Nodes to consider. Defaults to context node</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-address-2.0" match="adresgegevens | address_information" mode="doAddressInformation" as="element(f:address)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value | .//@code]">
            <xsl:variable name="lineItems" as="element()*">
                <xsl:for-each select="straat/@value | street/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="huisnummer/@value | house_number/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="huisnummerletter/@value | huisnummertoevoeging/@value | house_number_letter/@value | house_number_addition/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="additionele_informatie/@value | additional_information/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="aanduiding_bij_nummer/@value | house_number_indication/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
            </xsl:variable>
            <address>
                <!-- adres_soort -->
                <xsl:for-each select="adres_soort[@codeSystem = '2.16.840.1.113883.5.1119'][@code] | address_type[@codeSystem = '2.16.840.1.113883.5.1119'][@code]">
                    <xsl:choose>
                        <!-- Postadres -->
                        <xsl:when test="@code = 'PST'">
                            <use>
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="PST"/>
                                </extension>
                            </use>
                            <type value="postal"/>
                        </xsl:when>
                        <!-- Officieel adres -->
                        <xsl:when test="@code = 'HP'">
                            <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-address-official">
                                <valueCode value="true"/>
                            </extension>
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HP"/>
                                </extension>
                            </use>
                            <type value="physical"/>
                        </xsl:when>
                        <!-- Woon-/verblijfadres -->
                        <xsl:when test="@code = 'PHYS'">
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="PHYS"/>
                                </extension>
                            </use>
                            <type value="physical"/>
                        </xsl:when>
                        <!-- Tijdelijk adres -->
                        <xsl:when test="@code = 'TMP'">
                            <use value="temp"/>
                        </xsl:when>
                        <!-- Werkadres -->
                        <xsl:when test="@code = 'WP'">
                            <use value="work"/>
                        </xsl:when>
                        <!-- Vakantie adres -->
                        <xsl:when test="@code = 'HV'">
                            <use value="temp">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HV"/>
                                </extension>
                            </use>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:if test="$lineItems">
                    <line>
                        <xsl:attribute name="value" select="string-join($lineItems//*:valueString/@value, ' ')"/>
                        <xsl:copy-of select="$lineItems"/>
                    </line>
                </xsl:if>
                <xsl:for-each select="woonplaats/@value | place_of_residence/@value">
                    <city value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="gemeente/@value | municipality/@value">
                    <district value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="postcode/@value">
                    <postalCode value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="land/@value | country/@value">
                    <country value="{.}"/>
                </xsl:for-each>
            </address>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:param name="in">Nodes to consider. Defaults to context node</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-contactpoint-1.0" match="contactgegevens | contact_information" mode="doContactInformation" as="element(f:telecom)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value | .//@code]">
            <xsl:for-each select="telefoonnummers[telefoonnummer/@value] | telephone_numbers[telephone_number/@value]">
                <xsl:variable name="telecomType" select="telecom_type/@code"/>
                <xsl:variable name="telecomTypeValue" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="empty($telecomType)">phone</xsl:when>
                        <xsl:when test="$telecomType = 'LL'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'FAX'">fax</xsl:when>
                        <xsl:when test="$telecomType = 'MC'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'PG'">pager</xsl:when>
                        <xsl:when test="not($telecomType = 'UNK')">other</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="numberType" select="nummer_soort/@code | number_type/@code"/>
                <xsl:variable name="numberTypeValue" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$telecomType = 'MC'">mobile</xsl:when>
                        <xsl:when test="$numberType = 'WP'">work</xsl:when>
                        <xsl:when test="$numberType = 'HP'">home</xsl:when>
                        <xsl:when test="$numberType = 'TMP'">temp</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <telecom>
                    <system>
                        <xsl:choose>
                            <xsl:when test="empty($telecomTypeValue) and $telecomType/../@codeSystem = $oidHL7NullFlavor">
                                <xsl:call-template name="NullFlavor-to-DataAbsentReason">
                                    <xsl:with-param name="in" select="$telecomType/parent::*"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="empty($telecomTypeValue)">
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="value" select="$telecomTypeValue"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="$telecomType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                <extension url="{$urlExtNLCodeSpecification}">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="$telecomType/parent::*"/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:when>
                        </xsl:choose>
                    </system>
                    <value value="{telefoonnummer/@value | telephone_number/@value}"/>
                    <xsl:if test="$numberTypeValue">
                        <use value="{$numberTypeValue}">
                            <xsl:choose>
                                <xsl:when test="$numberType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                    <extension url="{$urlExtNLCodeSpecification}">
                                        <valueCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="$numberType/parent::*"/>
                                            </xsl:call-template>
                                        </valueCodeableConcept>
                                    </extension>
                                </xsl:when>
                            </xsl:choose>
                        </use>
                    </xsl:if>
                </telecom>
            </xsl:for-each>
            <xsl:for-each select="email_adressen[email_adres/@value] | email_addresses[email_address/@value]">
                <xsl:variable name="emailType" select="email_soort/@code | email_address_type/@code"/>
                <xsl:variable name="emailTypeValue" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$emailType = 'WP'">work</xsl:when>
                        <xsl:when test="$emailType = 'HP'">home</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <telecom>
                    <system value="email"/>
                    <value value="{email_adres/@value | email_address/@value}"/>
                    <xsl:if test="$emailTypeValue">
                        <use value="{$emailTypeValue}">
                            <xsl:choose>
                                <xsl:when test="$emailType[not(../@codeSystem = $oidHL7NullFlavor)]">
                                    <extension url="{$urlExtNLCodeSpecification}">
                                        <valueCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="$emailType/parent::*"/>
                                            </xsl:call-template>
                                        </valueCodeableConcept>
                                    </extension>
                                </xsl:when>
                            </xsl:choose>
                        </use>
                    </xsl:if>
                </telecom>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in">Nodes to consider. Defaults to context node</xd:param>
        <xd:param name="unstructured-name">Node to consider for an unstructured name which is part of <xd:ref name="in" type="parameter"/></xd:param>
    </xd:doc>
    <xsl:template name="nl-core-humanname-2.0" match="naamgegevens | name_information" mode="doNameInformation" as="element(f:name)*">
        <xsl:param name="in" select="." as="element()*"/>
        <!-- unstructured-name, not supported in zib datamodel, may be customized per transaction, therefore parameterized in this template -->
        <xsl:param name="unstructured-name" select="ongestructureerde_naam | unstructured_name" as="element()?"/>
        <xsl:for-each select="$in[.//@value]">
            <name>
                <xsl:for-each select="naamgebruik[@code] | name_usage[@code]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                        <valueCode value="{@code}"/>
                    </extension>
                </xsl:for-each>
                <xsl:if test="string-length($unstructured-name/@value) gt 0">
                    <text>
                        <xsl:copy-of select="$unstructured-name/@value"/>
                    </text>
                </xsl:if>
                <xsl:if test="geslachtsnaam[.//@value] | geslachtsnaam_partner[.//@value] | last_name[.//@value] | last_name_partner[.//@value]">
                    <xsl:variable name="lastName" select="normalize-space(string-join((.//geslachtsnaam/voorvoegsels/@value, .//geslachtsnaam/achternaam/@value, ./last_name/prefix/@value, ./last_name/last_name/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="lastNamePartner" select="normalize-space(string-join((.//voorvoegsels_partner/@value, .//achternaam_partner/@value, .//partner_prefix/@value, .//partner_last_name/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="nameUsage" select="naamgebruik/@code | name_usage/@code"/>
                    <family>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <!-- Eigen geslachtsnaam -->
                                <xsl:when test="$nameUsage = 'NL1'">
                                    <xsl:value-of select="$lastName"/>
                                </xsl:when>
                                <!--     Geslachtsnaam partner -->
                                <xsl:when test="$nameUsage = 'NL2'">
                                    <xsl:value-of select="$lastNamePartner"/>
                                </xsl:when>
                                <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                                <xsl:when test="$nameUsage = 'NL3'">
                                    <xsl:value-of select="string-join(($lastNamePartner, $lastName), '-')"/>
                                </xsl:when>
                                <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                                <xsl:when test="$nameUsage = 'NL4'">
                                    <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                                </xsl:when>
                                <!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
                                <xsl:otherwise>
                                    <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:for-each select=".//geslachtsnaam/voorvoegsels/@value | ./last_name/prefix/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//geslachtsnaam/achternaam/@value | ./last_name/last_name/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                                <valueString value="{normalize-space(.)}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//voorvoegsels_partner/@value | .//partner_prefix/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//achternaam_partner/@value | .//partner_last_name/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                                <valueString value="{normalize-space(.)}"/>
                            </extension>
                        </xsl:for-each>
                    </family>
                </xsl:if>
                <xsl:for-each select="voornamen/@value | first_names/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="BR"/>
                        </extension>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="initialen/@value | initials/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="IN"/>
                        </extension>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="roepnaam/@value | given_name/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="CL"/>
                        </extension>
                    </given>
                </xsl:for-each>
            </name>
        </xsl:for-each>
        <xsl:if test="$in[not(.//@value)] and string-length($unstructured-name/@value) gt 0">
            <name>
                <text>
                    <xsl:copy-of select="$unstructured-name/@value"/>
                </text>
            </name>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Transforms ada element to FHIR Range</xd:desc>
        <xd:param name="in">ada element with sub ada elements min and max (both with datatype aantal/count) and a sibling ada element eenheid (datatype code)</xd:param>
    </xd:doc>
    <xsl:template name="minmax-to-Range" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in/min[@nullFlavor]">
                <low>
                    <extension url="{$urlExtHL7NullFlavor}">
                        <valueCode value="{$in/min/@nullFlavor}"/>
                    </extension>
                </low>
            </xsl:when>
            <xsl:when test="$in/min[@value]">
                <low>
                    <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                        <xsl:with-param name="eenheid" select="$in/../eenheid"/>
                        <xsl:with-param name="waarde" select="$in/min"/>
                    </xsl:call-template>
                </low>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$in/max[@nullFlavor]">
                <high>
                    <extension url="{$urlExtHL7NullFlavor}">
                        <valueCode value="{$in/max/@nullFlavor}"/>
                    </extension>
                </high>
            </xsl:when>
            <xsl:when test="$in/max[@value]">
                <high>
                    <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                        <xsl:with-param name="eenheid" select="$in/../eenheid"/>
                        <xsl:with-param name="waarde" select="$in/max"/>
                    </xsl:call-template>
                </high>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Transforms ada element numerator-aantal, -eenheid and denominator to FHIR Ratio</xd:desc>
        <xd:param name="numerator-aantal">ada element of datatype aantal (count)</xd:param>
        <xd:param name="numerator-eenheid">ada element of datatype code</xd:param>
        <xd:param name="denominator">ada element of datatype hoeveelheid (quantity)</xd:param>
    </xd:doc>
    <xsl:template name="quotient-to-Ratio" as="element()*">
        <xsl:param name="numerator-aantal" as="element()?"/>
        <xsl:param name="numerator-eenheid" as="element()?"/>
        <xsl:param name="denominator" as="element()?"/>
        <xsl:if test="$numerator-aantal | $numerator-eenheid">
            <numerator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="$numerator-eenheid"/>
                    <xsl:with-param name="waarde" select="$numerator-aantal"/>
                </xsl:call-template>
            </numerator>
        </xsl:if>
        <xsl:for-each select="$denominator">
            <denominator>
                <xsl:call-template name="hoeveelheid-to-Duration">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </denominator>
        </xsl:for-each>
    </xsl:template>
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
                <xsl:when test="nf:isValidUCUMUnit($ADAunit)">
                    <xsl:value-of select="$ADAunit"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- If all else fails: wrap in {} to make it an annotation -->
                    <xsl:value-of select="concat('{', $ADAunit, '}')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    <xd:doc>
        <xd:desc>Get the FHIR System URI based on an input OID from ada or HL7. xs:anyURI if possible, urn:oid:.. otherwise</xd:desc>
        <xd:param name="oid">input OID from ada or HL7</xd:param>
    </xd:doc>
    <xsl:function name="local:getUri" as="xs:string?">
        <xsl:param name="oid" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$oidMap[@oid = $oid][@uri]">
                <xsl:value-of select="$oidMap[@oid = $oid]/@uri"/>
            </xsl:when>
            <xsl:when test="matches($oid, $OIDpattern)">
                <xsl:value-of select="concat('urn:oid:', $oid)"/>
            </xsl:when>
            <xsl:when test="matches($oid, $UUIDpattern)">
                <xsl:value-of select="concat('urn:uuid:', $oid)"/>
            </xsl:when>
            <xsl:when test="matches($oid, '^https?:')">
                <xsl:value-of select="$oid"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$oid"/>
                <xsl:message>WARNING: local:getUri() expects an OID, but got "<xsl:value-of select="$oid"/>"</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc>Returns a UUID with urn:uuid: preconcatenated</xd:desc>
        <xd:param name="in">xml element to be used to generate uuid</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-fhir-uuid" as="xs:string">
        <xsl:param name="in" as="element()"/>
        <xsl:value-of select="concat('urn:uuid:', uuid:get-uuid($in))"/>
    </xsl:function>
    <xd:doc>
        <xd:desc>Returns a UUID</xd:desc>
        <xd:param name="in">xml element to be used to generate uuid</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-uuid" as="xs:string">
        <xsl:param name="in" as="element()"/>
        <xsl:value-of select="uuid:get-uuid($in)"/>
    </xsl:function>
    <xd:doc>
        <xd:desc>If possible generates an uri based on oid or uuid from input. If not possible generates an uri based on gerenated uuid making use of input element</xd:desc>
        <xd:param name="ada-identificatie">input element for which uri is needed</xd:param>
    </xd:doc>
    <xsl:function name="nf:getUriFromAdaId" as="xs:string">
        <xsl:param name="ada-identificatie" as="element()"/>

        <xsl:choose>
            <!-- root = oid and extension = numeric -->
            <xsl:when test="$ada-identificatie[matches(@root, $OIDpattern)][matches(@value, '^\d+$')]">
                <xsl:variable name="ii" select="$ada-identificatie[matches(@root, $OIDpattern)][matches(@value, '^\d+$')][1]"/>
                <xsl:value-of select="concat('urn:oid:', $ii/string-join((@root, replace(@value, '^0+', '')[not(. = '')]), '.'))"/>
            </xsl:when>
            <!-- root = oid and no extension -->
            <xsl:when test="$ada-identificatie[matches(@root, $OIDpattern)][not(@value)]">
                <xsl:variable name="ii" select="$ada-identificatie[matches(@root, $OIDpattern)][not(@value)][1]"/>
                <xsl:value-of select="concat('urn:oid:', $ii/string-join((@root, replace(@value, '^0+', '')[not(. = '')]), '.'))"/>
            </xsl:when>
            <!-- root = 'not important' and extension = uuid -->
            <xsl:when test="$ada-identificatie[matches(@value, $UUIDpattern)]">
                <xsl:variable name="ii" select="$ada-identificatie[matches(@value, $UUIDpattern)][1]"/>
                <xsl:value-of select="concat('urn:uuid:', $ii/@value)"/>
            </xsl:when>
            <!-- root = uuid and extension = 'not important' -->
            <xsl:when test="$ada-identificatie[matches(@root, $UUIDpattern)]">
                <xsl:variable name="ii" select="$ada-identificatie[matches(@root, $UUIDpattern)][1]"/>
                <xsl:value-of select="concat('urn:uuid:', $ii/@root)"/>
            </xsl:when>
            <!-- give up and do new uuid -->
            <xsl:otherwise>
                <xsl:value-of select="nf:get-fhir-uuid($ada-identificatie[1])"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:removeSpecialCharacters" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:value-of select="replace(translate($in, '_.', '--'), '[^a-zA-Z0-9-]', '')"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Generates FHIR uri based on input ada code element. OID if possible, otherwise generates uri based on generated uuid using input element.</xd:desc>
        <xd:param name="ada-code">Input element for which uri is needed</xd:param>
    </xd:doc>
    <xsl:function name="nf:getUriFromAdaCode" as="xs:string?">
        <xsl:param name="ada-code" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$ada-code[matches(@codeSystem, $OIDpattern)][matches(@code, '^\d+$')]">
                <!-- No leading zeroes -->
                <xsl:value-of select="concat('urn:oid:', $ada-code/string-join((@codeSystem, replace(@code, '^0+', '')), '.'))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="nf:get-fhir-uuid($ada-code)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Try to interpret the value of complex type in ADA as a quantity string with value and unit</xd:desc>
        <xd:param name="value_string">The input text (like 12 mmol/l). Any comma in the value will be replaced with a dot, e.g. 1,05 will be returned as 1.05</xd:param>
        <xd:return>
            <xd:p>A collection of 'value' and possibly 'unit' tags if the string could be interpreted as a quantity string, or an empty collection.</xd:p>
            <xd:p><xd:b>NOTE:</xd:b> even if the string is interpreted as a quantity, only the textual 'unit' tag is included in the result, not a formal system/code pair.</xd:p>
        </xd:return>
    </xd:doc>
    <xsl:function name="nf:try-complex-as-Quantity" as="element()*">
        <xsl:param name="value_string" as="xs:string?"/>
        <xsl:analyze-string select="normalize-space($value_string)" regex="^([\d\.,]+)\s*(.*)$">
            <xsl:matching-substring>
                <value value="{replace(regex-group(1), ',', '.')}"/>
                <xsl:if test="regex-group(2)">
                    <unit value="{regex-group(2)}"/>
                </xsl:if>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xd:doc>
        <xd:desc>Formats ada or HL7 dateTime to FHIR date(Time) based on input precision</xd:desc>
        <xd:param name="dateTime">Input ada or HL7 date(Time)</xd:param>
        <xd:param name="precision">Determines the precision of the output. Precision of minutes outputs seconds as '00'</xd:param>
    </xd:doc>
    <xsl:template name="format2FHIRDate">
        <xsl:param name="dateTime"/>
        <!-- precision determines the picture of the date format, currently only use case for day, minute or second. Seconds is the default. -->
        <xsl:param name="precision">second</xsl:param>
        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('DAY', 'DAG', 'DAYS', 'DAGEN', 'D')">[Y0001]-[M01]-[D01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001]-[M01]-[D01]T[H01]:[m01]:00Z</xsl:when>
                <xsl:otherwise>[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]Z</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="normalize-space($dateTime) castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($dateTime), $picture)"/>
            </xsl:when>
            <xsl:when test="normalize-space($dateTime) castable as xs:date">
                <xsl:value-of select="format-date(xs:date($dateTime), '[Y0001]-[M01]-[D01]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="newDateTime" select="replace(concat(normalize-space($dateTime), '00000000000000'), '^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})', '$1-$2-$3T$4:$5:$6')"/>
                <xsl:variable name="newDate" select="replace(normalize-space($dateTime), '^(\d{4})(\d{2})(\d{2})', '$1-$2-$3')"/>
                <xsl:choose>
                    <xsl:when test="$newDateTime castable as xs:dateTime">
                        <xsl:value-of select="format-dateTime(xs:dateTime($newDateTime), $picture)"/>
                    </xsl:when>
                    <xsl:when test="$newDate castable as xs:date">
                        <xsl:value-of select="format-date(xs:date($newDateTime), $picture)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$dateTime"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Based on http://hl7.org/fhir/STU3/cm-data-absent-reason-v3.html</xd:desc>
        <xd:param name="in">Input node with @codeSystem = <xd:ref name="$oidHL7NullFlavor" type="variable"/></xd:param>
    </xd:doc>
    <xsl:template name="NullFlavor-to-DataAbsentReason" as="element()?">
        <xsl:param name="in" select="." as="element()?"/>

        <xsl:for-each select="$in[@codeSystem = $oidHL7NullFlavor]">
            <extension url="{$urlExtHL7DataAbsentReason}">
                <valueCode>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="@code = 'UNK'">unknown</xsl:when>
                            <xsl:when test="@code = 'ASKU'">asked</xsl:when>
                            <xsl:when test="@code = 'NAV'">temp</xsl:when>
                            <xsl:when test="@code = 'NASK'">not-asked</xsl:when>
                            <xsl:when test="@code = 'MSK'">masked</xsl:when>
                            <xsl:when test="@code = 'NA'">unsupported</xsl:when>
                            <xsl:otherwise>unknown</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </valueCode>
            </extension>
        </xsl:for-each>
    </xsl:template>

    <!-- FHIR Utility Functions -->

    <xd:doc>
        <xd:desc/>
        <xd:param name="entry"/>
    </xd:doc>
    <xsl:function name="nf:getFullUrlOrId" as="xs:string?">
        <xsl:param name="entry" as="element(f:entry)?"/>

        <xsl:choose>
            <xsl:when test="$referById">
                <xsl:value-of select="$entry/f:resource/*/concat(local-name(), '/', f:id[1]/@value)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$entry/f:fullUrl/@value"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>If <xd:ref name="in" type="parameter"/> holds a value, return the upper-cased combined string of @value/@root/@code/@codeSystem/@nullFlavor. Else return empty</xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyDefault" as="xs:string?">
        <xsl:param name="in" as="element()?"/>
        <xsl:if test="$in">
            <xsl:value-of select="upper-case(string-join(($in//@value, $in//@root, $in//@unit, $in//@code[not(../@codeSystem = $oidHL7NullFlavor)], $in//@codeSystem[not(. = $oidHL7NullFlavor)])/normalize-space(), ''))"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>If <xd:ref name="patient" type="parameter"/> holds a value, return the upper-cased combined string of @value/@root/@code/@codeSystem/@nullFlavor on the patient_identification_number/name_information/address_information/contact_information. Else return empty</xd:desc>
        <xd:param name="patient"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyPatient" as="xs:string?">
        <xsl:param name="patient" as="element()?"/>
        <xsl:if test="$patient">
            <xsl:value-of select="concat(nf:getGroupingKeyDefault($patient/identificatienummer[not(@root = $oidBurgerservicenummer)] | $patient/patient_identificatie_nummer[not(@root = $oidBurgerservicenummer)] | $patient/patient_identification_number[not(@root = $oidBurgerservicenummer)]), nf:getGroupingKeyDefault($patient/patient_naam | $patient/name_information), nf:getGroupingKeyDefault($patient/adres | $patient/address_information), nf:getGroupingKeyDefault($patient/telefoon_email | $patient/contact_information))"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>If <xd:ref name="zorgverlener" type="parameter"/> holds a value, return the upper-cased combined string of @value/@root/@code/@codeSystem/@nullFlavor on the health_professional_identification_number/name_information/address_information/contact_information. Else return empty</xd:desc>
        <xd:param name="zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyPractitioner" as="xs:string?">
        <xsl:param name="zorgverlener" as="element()?"/>
        <xsl:variable name="personIdentifier" select="nf:getGroupingKeyDefault($zorgverlener/zorgverlener_identificatienummer | $zorgverlener/zorgverlener_identificatie_nummer | $zorgverlener/health_professional_identification_number)"/>
        <xsl:variable name="personName" select="nf:getGroupingKeyDefault($zorgverlener/zorgverlener_naam | $zorgverlener/naamgegevens | $zorgverlener/name_information)"/>
        <xsl:variable name="personAddress" select="nf:getGroupingKeyDefault($zorgverlener/adres | $zorgverlener/adresgegevens | $zorgverlener/address_information)"/>
        <xsl:variable name="contactInformation" select="nf:getGroupingKeyDefault($zorgverlener/telefoon_email | $zorgverlener/contactgegevens | $zorgverlener/contact_information)"/>

        <xsl:value-of select="concat($personIdentifier, $personName, $personAddress, $contactInformation)"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>If <xd:ref name="zorgverlener" type="parameter"/> holds a value, return the upper-cased combined string of @value/@root/@code/@codeSystem/@nullFlavor on the health_professional_identification_number/name_information/address_information/contact_information. Else return empty</xd:desc>
        <xd:param name="zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyPractitionerRole" as="xs:string?">
        <xsl:param name="zorgverlener" as="element()?"/>
        <xsl:variable name="personIdentifier" select="nf:getGroupingKeyDefault(nf:ada-zvl-id($zorgverlener/zorgverlener_identificatienummer | $zorgverlener/zorgverlener_identificatie_nummer | $zorgverlener/health_professional_identification_number))"/>
        <xsl:variable name="specialism" select="nf:getGroupingKeyDefault($zorgverlener/specialisme | $zorgverlener/specialty)"/>
        <xsl:variable name="organizationId" select="nf:getGroupingKeyDefault(nf:ada-za-id($zorgverlener//zorgaanbieder_identificatienummer | $zorgverlener//healthcare_provider_identification_number))"/>

        <xsl:value-of select="concat($personIdentifier, $specialism, $organizationId)"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:get-practitioner-display" as="xs:string?">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:for-each select="$ada-zorgverlener">
            <xsl:variable name="personIdentifier" select="nf:ada-zvl-id(.//zorgverlener_identificatienummer[1] | .//zorgverlener_identificatie_nummer[1] | .//health_professional_identification_number[1])/@value"/>
            <xsl:variable name="personName" select=".//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | .//name_information[1]//*[not(name() = 'name_usage')]/@value"/>
            <xsl:variable name="organizationName" select=".//organisatie_naam[1]/@value | .//organization_name[1]/@value"/>
            <xsl:variable name="specialty" select=".//specialisme/@displayName | .//specialty/@displayName"/>
            <xsl:variable name="role" select=".//zorgverleners_rol/(@displayName, @code)[1] | .//health_professional_role/(@displayName, @code)[1]"/>

            <xsl:choose>
                <xsl:when test="$personName">
                    <xsl:value-of select="normalize-space(string-join($personName, ' '))"/>
                </xsl:when>
                <xsl:when test="$role">
                    <xsl:value-of select="normalize-space($role)"/>
                </xsl:when>
                <xsl:when test="$personIdentifier">
                    <xsl:value-of select="normalize-space($personIdentifier)"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:get-practitioner-role-display" as="xs:string?">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:for-each select="$ada-zorgverlener">
            <xsl:variable name="personIdentifier" select="nf:ada-zvl-id(.//zorgverlener_identificatie_nummer[1] | .//health_professional_identification_number[1])/@value"/>
            <xsl:variable name="personName" select=".//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | .//name_information[1]//*[not(name() = 'name_usage')]/@value"/>
            <xsl:variable name="organizationName" select=".//organisatie_naam[1]/@value | .//organization_name[1]/@value"/>
            <xsl:variable name="specialty" select=".//specialisme/@displayName | .//specialty/@displayName"/>
            <xsl:variable name="role" select=".//zorgverleners_rol/(@displayName, @code)[1] | .//health_professional_role/(@displayName, @code)[1]"/>

            <xsl:choose>
                <xsl:when test="$personName | $specialty | $organizationName">
                    <xsl:value-of select="normalize-space(string-join((string-join($personName, ' ')[not(. = '')], $specialty, $organizationName), ' || '))"/>
                </xsl:when>
                <xsl:when test="$role">
                    <xsl:value-of select="normalize-space($role)"/>
                </xsl:when>
                <xsl:when test="$personIdentifier">
                    <xsl:value-of select="normalize-space($personIdentifier)"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgaanbieder-identificatie-nummer"/>
    </xd:doc>
    <xsl:function name="nf:ada-za-id" as="element()?">
        <xsl:param name="zorgaanbieder-identificatie-nummer" as="element()*"/>
        <xsl:choose>
            <xsl:when test="$zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations]">
                <xsl:copy-of select="$zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations][1]"/>
            </xsl:when>
            <xsl:when test="$zorgaanbieder-identificatie-nummer[@root = $oidAGB]">
                <xsl:copy-of select="$zorgaanbieder-identificatie-nummer[@root = $oidAGB][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$zorgaanbieder-identificatie-nummer[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgverlener-identificatie-nummer"/>
    </xd:doc>
    <xsl:function name="nf:ada-zvl-id" as="element()?">
        <xsl:param name="zorgverlener-identificatie-nummer" as="element()*"/>
        <xsl:choose>
            <xsl:when test="$zorgverlener-identificatie-nummer[@root = $oidUZIPersons]">
                <xsl:copy-of select="$zorgverlener-identificatie-nummer[@root = $oidUZIPersons][1]"/>
            </xsl:when>
            <xsl:when test="$zorgverlener-identificatie-nummer[@root = $oidAGB]">
                <xsl:copy-of select="$zorgverlener-identificatie-nummer[@root = $oidAGB][1]"/>
            </xsl:when>
            <xsl:when test="$zorgverlener-identificatie-nummer[@root = $oidBIGregister]">
                <xsl:copy-of select="$zorgverlener-identificatie-nummer[@root = $oidBIGregister][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$zorgverlener-identificatie-nummer[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="patient-identificatie-nummer"/>
    </xd:doc>
    <xsl:function name="nf:ada-pat-id" as="element()?">
        <xsl:param name="patient-identificatie-nummer" as="element()*"/>
        <xsl:choose>
            <xsl:when test="$patient-identificatie-nummer[@root = $oidBurgerservicenummer]">
                <xsl:copy-of select="$patient-identificatie-nummer[@root = $oidBurgerservicenummer][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$patient-identificatie-nummer[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Resolves the reference in an ada-transaction. Outputs a sequence with the resolved element.</xd:desc>
        <xd:param name="ada-element">The ada element which may need resolving, if not return the element, else the resolved element</xd:param>
    </xd:doc>
    <xsl:function name="nf:ada-resolve-reference" as="element()*">
        <xsl:param name="ada-element" as="element()"/>
        <!-- The current ada-transaction element -->
        <xsl:variable name="currentAdaTransaction" select="$ada-element/ancestor::*[ancestor::data[ancestor::adaxml]]"/>
        <!-- resolve the reference -->
        <xsl:choose>
            <xsl:when test="$ada-element[not(@datatype = 'reference')]">
                <xsl:sequence select="$ada-element"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$currentAdaTransaction//*[@id = $ada-element/@value]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc> copy an element with all of it's contents in comments </xd:desc>
        <xd:param name="element"/>
    </xd:doc>
    <xsl:template name="copyElementInComment">
        <xsl:param name="element"/>
        <xsl:text disable-output-escaping="yes">
                       &lt;!--</xsl:text>
        <xsl:for-each select="$element">
            <xsl:call-template name="copyWithoutComments"/>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes">--&gt;
</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc> copy without comments </xd:desc>
    </xd:doc>
    <xsl:template name="copyWithoutComments">
        <xsl:copy>
            <xsl:for-each select="@* | *">
                <xsl:call-template name="copyWithoutComments"/>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
