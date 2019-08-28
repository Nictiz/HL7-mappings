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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/zib2017.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xsl:variable name="prescribe-reasons" as="element()*">
        <!-- redenen -->
        <xsl:for-each-group select="//reden_van_voorschrijven/probleem[.//@code]" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-reden xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                        <resource>
                            <xsl:apply-templates select="." mode="doConditionForProbleem">
                                <xsl:with-param name="condition-id">
                                    <xsl:choose>
                                        <xsl:when test="$referById">
                                            <xsl:variable name="ada-patient" select="./ancestor::*[ancestor::data]/patient"/>
                                            <xsl:variable name="patient-reference" select="nf:getResourceInfo('Patient',nf:getGroupingKeyDefault(.), false(), 'FullUrlOrId')"/>
                                            <xsl:value-of select="concat('redenvanvoorschrijven', $patient-reference, (upper-case(nf:removeSpecialCharacters(string-join(.//(@value | @code), '')))))"/>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:apply-templates>
                        </resource>
                    </entry>
                </xsl:for-each>
            </unieke-reden>
        </xsl:for-each-group>
    </xsl:variable>



    <xsl:variable name="bouwstenen-icavertaling" as="element(f:entry)*">
        <!-- toedieningsafspraken -->
        <xsl:for-each select="//allergie_intolerantie">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="AllergieIntolerantie">
                        <xsl:with-param name="logicalId" select="
                                if ($referById) then
                                    (if (string-length(nf:removeSpecialCharacters(./identificatie/@value)) gt 0) then
                                        nf:removeSpecialCharacters(./identificatie/@value)
                                    else
                                        uuid:get-uuid(.))
                                else
                                    ()"> </xsl:with-param>
                        <xsl:with-param name="ada-patient" select="../patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
       </xsl:variable>


    <xd:doc>
        <xd:desc>Helper template to create FHIR RelatedPerson reference, context should be ada persoon element</xd:desc>
    </xd:doc>
    <xsl:template name="relatedperson-reference" match="persoon" mode="doRelatedPersonReference">
        <reference value="{nf:getResourceInfo('RelatedPerson',nf:getGroupingKeyDefault(.), false(), 'FullUrlOrId')}"/>        
        <xsl:for-each select="./naamgegevens[1][.//@value]">
            <display value="{normalize-space(string-join(.//*[not(name()='naamgebruik')]/@value,' '))}"/>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR Practitioner reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="practitioner-reference" match="zorgverlener" mode="doPractitionerReference">
        <reference value=" {nf:getResourceInfo('Practitioner',nf:getGroupingKeyDefault(.), false(), 'FullUrlOrId')}"/>
        <xsl:for-each select=".//naamgegevens[not(naamgegevens)][.//@value]">
            <display value="{normalize-space(string-join(.//@value, ' '))}"/>
        </xsl:for-each>
    </xsl:template>

     <xd:doc>
        <xd:desc>Helper template to create extension with FHIR PractitionerRole reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="reference-practitionerrole" match="zorgverlener" mode="doPractitionerRoleReference-907">
        <xsl:variable name="display" as="xs:string?" select="normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value | .//specialisme/@displayName, ' || ')))"/>
        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
            <valueReference>
                <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
            </valueReference>
        </extension>
        <display value="{nf:get-practitioner-role-display(.)}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create FHIR PractitionerRole reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="practitioner-role-reference" match="zorgverlener" mode="doPractitionerRoleReference">
         <reference value=" {nf:getResourceInfo('PRACTITIONERROLE',nf:getGroupingKeyDefault(.), false(), 'FullUrlOrId')}"/>
        <display value="{nf:get-practitioner-role-display(.)}"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR performer.actor, context should be ada verstrekker element</xd:desc>
    </xd:doc>
    <xsl:template name="verstrekker-performer-actor" match="verstrekker" mode="doPerformerActor">
        <!-- verstrekker -->
        <performer>
            <!-- in dataset toedieningsafspraak 9.0.6 staat zorgaanbieder (onnodig) een keer extra genest -->
            <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)]">
                <actor>
                    <xsl:apply-templates select="." mode="doOrganizationReference"/>
                </actor>
            </xsl:for-each>
        </performer>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR requestor.agent, input or context should be ada zorgverlener element</xd:desc>
        <xd:param name="zorgverlener">ada element zorgverlener, is derived from context when not set</xd:param>
    </xd:doc>
    <xsl:template name="zorgverlener-requester" match="zorgverlener" mode="doRequesterAgent">
        <xsl:param name="zorgverlener" select="."/>
        <requester>
            <xsl:for-each select="$zorgverlener">
                <agent>
                    <xsl:apply-templates select="." mode="doPractitionerReference"/>
                </agent>
                <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value]">
                    <onBehalfOf>
                        <xsl:apply-templates select="." mode="doOrganizationReference"/>
                    </onBehalfOf>
                </xsl:for-each>
            </xsl:for-each>
        </requester>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR requester.extension (with PractitionerRoleReference) and .agent, context should be ada voorschrijver or auteur element</xd:desc>
    </xd:doc>
    <xsl:template name="zorgverlener-requester-ext" match="voorschrijver | auteur" mode="doRequesterExtension">
        <xsl:for-each select="./zorgverlener[.//(@value | @code)]">
            <requester>
                <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-RequesterRole">
                    <valueReference>
                        <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
                    </valueReference>
                </extension>
                <!-- agent is verplicht in FHIR, dit is eigenlijk dubbelop omdat de practitionerRole hier ook al naar verwijst -->
                <agent>
                    <xsl:apply-templates select="." mode="doPractitionerReference"/>
                </agent>
            </requester>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create FHIR requester.agent (with missing type extension), context should be ada voorschrijver element</xd:desc>
    </xd:doc>
    <xsl:template name="zorgverlener-requester-ext-907" match="voorschrijver | auteur" mode="doRequesterExtension-907">
        <xsl:for-each select="./zorgverlener[.//(@value | @code)]">
            <requester>
                <agent>
                    <xsl:apply-templates select="." mode="doPractitionerRoleReference-907"/>
                </agent>
            </requester>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR datatype ContactPoint, context should be ada contactgegevens element</xd:desc>
    </xd:doc>
    <xsl:template name="fhir-contact-point" match="contactgegevens" mode="doContactPoint">
        <xsl:for-each select="telefoonnummers[.//(@value | @code)]">
            <telecom>
                <system value="phone"/>
                <value value="{telefoonnummer/@value}"/>
                <!-- todo telecomtype, is not part of an MP transaction up until now -->
                <use>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="nummer_soort/@code = 'WP'">work</xsl:when>
                            <xsl:when test="nummer_soort/@code = 'HP'">home</xsl:when>
                            <xsl:when test="nummer_soort/@code = 'TMP'">temp</xsl:when>
                            <xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="nummer_soort/@code"/>'.</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </use>
            </telecom>
        </xsl:for-each>
        <xsl:for-each select="email_adressen[.//(@value | @code)]">
            <telecom>
                <system value="email"/>
                <value value="{email_adres/@value}"/>
                <!-- todo telecomtype, is not part of an MP transaction up until now -->
                <use>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="email_soort/@code = 'WP'">work</xsl:when>
                            <xsl:when test="email_soort/@code = 'HP'">home</xsl:when>
                            <xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="nummer_soort/@code"/>'.</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </use>
            </telecom>
        </xsl:for-each>

    </xsl:template>
       
     <xd:doc>
        <xd:desc/>
        <xd:param name="condition-id"/>
    </xd:doc>
    <xsl:template name="zib-problem-2.0" match="probleem" mode="doConditionForProbleem">
        <xsl:param name="condition-id" as="xs:string?"/>
        <Condition>
            <xsl:if test="string-length($condition-id) gt 0">
                <id value="{$condition-id}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Problem"/>
            </meta>
            <!-- probleem status -->
            <xsl:choose>
                <xsl:when test="./probleem_status[@code]">
                    <clinicalStatus>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="./@code = '73425007'">inactive</xsl:when>
                                <xsl:when test="./@code = '55561003'">active</xsl:when>
                                <xsl:otherwise>active</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </clinicalStatus>
                </xsl:when>
                <xsl:otherwise>
                    <!-- 1..1, so let's assume active if  -->
                    <clinicalStatus value="active"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- probleem naam -->
            <xsl:for-each select="./probleem_naam[@code]">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </code>
            </xsl:for-each>
            <subject>
                <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
            </subject>
        </Condition>
    </xsl:template>

</xsl:stylesheet>
