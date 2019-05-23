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
    <xsl:param name="adaReleaseFile" select="document('../../../../../projects/vragenlijsten/definitions/vl-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.56.4.255</xsl:param>

    <xsl:param name="do-ada-files" select="true()"/>


    <!-- donkerblauw -->
    <xsl:variable name="tabelkop-achtergrond-kleur">#1F497D;</xsl:variable>
    <xsl:variable name="tabelkop-font-kleur">white</xsl:variable>
    <!-- grijzig -->
    <xsl:variable name="element-achtergrond-kleur">#E3E3E3;</xsl:variable>
    <xsl:variable name="elementwaarde-achtergrond-kleur">white</xsl:variable>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:text>
__NUMBEREDHEADINGS__
[[Bestand:Nictiz_logo_PO_rechts_rgb.png |link=https://www.nictiz.nl/|rechts|Naar nictiz.nl]]
{{{IssueBox|Deze pagina is nog in bewerking}}

=Addenda voor inhoudelijke gegevens=</xsl:text>
        <xsl:apply-templates select="adaxml/data/*"/>
        <xsl:text>
[[Categorie:Kwalificatie]]</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc>Override of the adaxml/data template from the imported stylesheet ADA2test-wiki-table.xsl. Makes it a bit nicer for Vragenlijsten</xd:desc>
    </xd:doc>
       <xsl:template match="adaxml/data/*">
        <!-- Build a variable tabel which is tailored for output in documentation, such as wiki -->
        <xsl:variable name="tabel" as="element()">
            <xsl:variable name="quest" select=".//(questionnaire|vragenlijst)"/>
            <tabellen xmlns="">
                <!-- tabel voor questionnaire -->
                <xsl:apply-templates select="$quest" mode="maak-tabel"/>
                <!-- tabel voor item -->
                <xsl:apply-templates select="$quest/item" mode="maak-tabel"/>                
            </tabellen>
        </xsl:variable>
        <xsl:text>
==Scenario </xsl:text>
        <xsl:value-of select="./@title"/>       
        <xsl:text> - Questionnaire==
</xsl:text>
           <xsl:for-each select="$tabel/tabel[@type='questionnaire']">
               <xsl:apply-templates select="."/>
           </xsl:for-each>
           
        <xsl:for-each select="$tabel/tabel[not(@type='questionnaire')]">
            <xsl:text>
=== </xsl:text>
            <xsl:value-of select="./@title"/>
            <xsl:text> ===
</xsl:text>
            <xsl:apply-templates select="."/>
         </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates a 'tabel' from which it is easy to generate wiki or other documentation</xd:desc>
        <xd:param name="in">The ada questionnaire/item which contents are rendered in the nested 'tabel'</xd:param>
    </xd:doc>
    <xsl:template name="tabel-quest-item" match="(questionnaire|vragenlijst)/item" mode="maak-tabel">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <tabel xmlns="" type="{./local-name()}" title="{concat('item ', ./text/value/@value)}">
                <xsl:apply-templates select="./link_id" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="xs:int(1)"/>
                </xsl:apply-templates>
                <xsl:apply-templates select="./*[not(local-name(.)='link_id')]" mode="maak-tabel-rij">
                    <xsl:with-param name="level" select="xs:int(1)"/>
                </xsl:apply-templates>
                
            </tabel>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>we make a table of each top level item, so let's not also include it in tabel-rij</xd:desc>
    </xd:doc>
    <xsl:template match="(questionnaire|vragenlijst)/item" mode="maak-tabel-rij"/>
    
    <xd:doc>
        <xd:desc>Let's always put link_id as the first item, since it identifies the item and is crucial for referring back to the item</xd:desc>
        <xd:param name="level">the indent level in the table</xd:param>
        <xd:param name="element-name">Optional param to override the default element name</xd:param>
    </xd:doc>
    <xsl:template match="item/item" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)" as="xs:int"/>
        <xsl:param name="element-name" select="nf:element-name(.)" as="xs:string?"/>
        
        <groep xmlns="" level="{$level}" naam="{$element-name}">
            <xsl:apply-templates select="./link_id" mode="maak-tabel-rij">
                <xsl:with-param name="level" select="xs:int($level + 1)"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="./*[not(local-name(.)='link_id')]" mode="maak-tabel-rij">
                <xsl:with-param name="level" select="xs:int($level + 1)"/>
            </xsl:apply-templates>
        </groep>
    </xsl:template> 
    
    
    


    <xd:doc>
        <xd:desc>title/value is the string value, let's make that more clear</xd:desc>
        <xd:param name="level">the indent level in the table</xd:param>
    </xd:doc>
    <xsl:template match="(title|text)/value" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:variable name="value-domain" select="nf:get-concept-value-domain(.)"/>
        <gegevenselement xmlns="" level="{$level}" naam="waarde (string)" waarde="{nf:maak-waarde-basedon-valuedomain(., $value-domain)}"/>
   </xsl:template>
    
    <xd:doc>
        <xd:desc>subjectType - betere term</xd:desc>
        <xd:param name="level">the indent level in the table</xd:param>
    </xd:doc>
    <xsl:template match="(questionnaire|vragenlijst)/subject_type" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:variable name="value-domain" select="nf:get-concept-value-domain(.)"/>
        <gegevenselement xmlns="" level="{$level}" naam="Onderwerp" waarde="{nf:maak-waarde-basedon-valuedomain(., $value-domain)}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates a string for zorgaanbieder</xd:desc>
        <xd:param name="in">The input ada element</xd:param>
    </xd:doc>
    <xsl:function name="nf:zorgaanbieder-string" as="xs:string*">
        <xsl:param name="in" as="element()?"/>
        <xsl:value-of select="string-join($in/zorgaanbieder/zorgaanbieder_identificatie_nummer//concat(@root, ' - ', @value), ' ')"/>
        <xsl:value-of select="string-join($in/zorgaanbieder/organisatie_naam//@value, ' ')"/>
        <xsl:if test="$in//afdeling_specialisme/@displayName">
            <xsl:value-of select="concat(' - ', $in//specialisme/@displayName, '. ')"/>
        </xsl:if>
        <xsl:value-of select="string-join($in/zorgaanbieder/adres//string-join(@value | @displayName, ' - '), ' ')"/>
        <xsl:value-of select="string-join($in/zorgaanbieder/telefoon_email//string-join(@value | @displayName, ' - '), ' ')"/>
    </xsl:function>
    <xd:doc>
        <xd:desc>Creates a string for zorgverlener</xd:desc>
        <xd:param name="in">The input ada element</xd:param>
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
        <xd:desc>Creates a string for a person</xd:desc>
        <xd:param name="in">The input ada element</xd:param>
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
