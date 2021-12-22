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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">

    <xsl:variable name="nlcoreContactPerson">http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson</xsl:variable>

    <xd:doc>
        <xd:desc>Template to convert f:RelatedPerson to ADA contactpersoon, currently only support for elements that are part of MP9 2.0 transactions</xd:desc>
    </xd:doc>
    <xsl:template match="f:RelatedPerson" mode="nl-core-ContactPerson">
        <contactpersoon>
            <xsl:if test="../../f:fullUrl[@value]">
                <xsl:attribute name="id">
                    <xsl:value-of select="nf:convert2NCName(../../f:fullUrl/@value)"/>
                </xsl:attribute>
            </xsl:if>
            
            <!-- naamgegevens -->
            <xsl:apply-templates select="f:name" mode="nl-core-NameInformation"/>
            
            <!-- contactgegevens -->
            <xsl:if test="f:telephoneNumbers | f:emailAddresses">
                <contactgegevens>
                    <xsl:apply-templates select="f:telephoneNumbers" mode="nl-core-ContactInformation-TelephoneNumbers"/>
                    <xsl:apply-templates select="f:emailAddresses" mode="nl-core-ContactInformation-EmailAddresses"/>
                </contactgegevens>
            </xsl:if>
            
            <!-- adresgegevens -->
            <xsl:apply-templates select="f:address" mode="nl-core-AddressInformation"/>
            
            <!-- rol -->
            <xsl:apply-templates select="f:role" mode="#current"/>
            
            <!-- relatie -->
            <xsl:apply-templates select="f:relationship" mode="#current"/> 
            
        </contactpersoon>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:role to ADA contactpersoon/rol</xd:desc>
    </xd:doc>
    <xsl:template match="f:relationship" mode="nl-core-ContactPerson">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="adaElementName">relatie</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:role to ADA contactpersoon/rol</xd:desc>
    </xd:doc>
    <xsl:template match="f:role" mode="nl-core-ContactPerson">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="adaElementName">rol</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
