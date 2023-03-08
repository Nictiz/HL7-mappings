<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xd nf xsl uuid" xmlns:uuid="http://www.uuid.org" xmlns="urn:hl7-org:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../util/uuid.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- param to influence whether to output schema references, typically only needed for test instances -->
    <xsl:param name="schematronRef" as="xs:boolean" select="false()"/>
    
    <!-- https://nictiznl.sharepoint.com/sites/KHSI/Kwaliteitshandboek%20Standaardisatie/XML.aspx -->
    <xsl:variable name="cdaIdRoot">2.16.840.1.113883.2.4.3.11.999.25.1</xsl:variable>
    <xsl:variable name="cdaSetIdRoot">2.16.840.1.113883.2.4.3.11.999.25.2</xsl:variable>
    
    <xd:doc>
        <xd:desc>Start template when called from outside</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@* | node()" mode="organizer2CDA" />
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> Transforms HL7 organizer example message into CDA version of the same thing. From publication 9.0.6 </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:organizer[not(ancestor::hl7:organizer)]" mode="organizer2CDA">
        <ClinicalDocument 
            xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" 
            xmlns:hl7nl="urn:hl7-nl:v3" 
            xmlns:pharm="urn:ihe:pharm:medication" 
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="urn:hl7-org:v3 ../hl7_schemas/CDANL_extended.xsd">
            <xsl:if test="$schematronRef">
                <xsl:attribute name="xsi:schemaLocation">urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/CDANL_extended.xsd</xsl:attribute>
            </xsl:if>
            <realmCode code="NL"/>
            <typeId extension="POCD_HD000040" root="2.16.840.1.113883.1.3"/>
            
            <!-- Laboratoriumresultaten -->
            <xsl:if test="./hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.66.10.77']">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.25.10.51"/>
                <templateId root="1.3.6.1.4.1.19376.1.3.3"/>
                <templateId root="2.16.840.1.113883.2.4.6.10.100001"/>
            </xsl:if>
            <!-- Use the template id to make a unique root for document id -->
            <id extension="{uuid:get-uuid(.)}" root="{$cdaIdRoot}"/>
            <xsl:if test="./hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.66.10.77']">
                <code code="11502-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="LABORATORY REPORT.TOTAL"/>
            </xsl:if>
            <!-- parameterize the title based on input or 'today', this is not perfect -->
            <xsl:variable name="allEffectiveTimes" as="xs:string*">
                <xsl:for-each select=".//hl7:effectiveTime/@value | .//hl7:time/@value">
                    <xsl:value-of select="substring(concat(tokenize(., '[\.+-]')[1], '000000'), 1, 14)"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="hl7DocDate" select="(max($allEffectiveTimes), format-dateTime(current-dateTime(), '[Y0001][M01][D01][H01][m01][s01]'))[1]" as="xs:string?"/>
            <xsl:variable name="docdatum">
                <xsl:choose>
                    <xsl:when test="not($hl7DocDate castable as xs:integer)">
                        <!-- not a HL7-date, simply output the input -->
                        <xsl:value-of select="$hl7DocDate"/>
                    </xsl:when>
                    <xsl:when test="string-length($hl7DocDate) gt 0">
                        <xsl:variable name="docdate" select="nf:formatHL72XMLDate($hl7DocDate, 'second')"/>
                        <xsl:value-of select="nf:formatDate($docdate)"/>
                    </xsl:when>
                    <xsl:otherwise>onbekende datum</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <title>
                <xsl:variable name="naamPatient">
                    <xsl:value-of select="./hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:name[1]/hl7:given[1]"/>
                    <xsl:value-of select="concat(' ', ./hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:name[1]/hl7:prefix[1])"/>
                    <xsl:value-of select="concat(' ', ./hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:name[1]/hl7:family[1])"/>
                </xsl:variable>
                <xsl:variable name="transactienaam" select="./hl7:code/@displayName"/>
                <xsl:variable name="docDate" select="replace(replace($docdatum, '\[Y0001\]\[M01\]\[D01\]', '[D01] [Mn,*-3] [Y0001]'), '(.*\}).*', '$1')"/>
                <xsl:value-of select="concat($transactienaam, ' ', normalize-space($naamPatient), ' op ', $docDate)"/>
            </title>
            <!-- time is mandatory in CDA, so we take the time appended variable here -->
            <effectiveTime value="{$hl7DocDate}"/>
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" displayName="normal"/>
            <languageCode code="nl-NL"/>
            <!-- Use the template id to make a unique root for document setId -->
            <setId extension="{uuid:get-uuid(.)}" root="{$cdaSetIdRoot}"/>
            <xsl:apply-templates select="hl7:recordTarget" mode="organizer2CDA"/>
            <xsl:apply-templates select="hl7:participant[@typeCode = 'CST']" mode="cdaAuthor"/>
            <!-- custodian, the organization of the author -->
            <custodian>
                <assignedCustodian>
                    <representedCustodianOrganization>
                        <!-- id is required for representedCustodianOrganization, let's check if we have one -->
                        <xsl:choose>
                            <xsl:when test="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:scopingEntity/hl7:id">
                                <xsl:copy-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:scopingEntity/hl7:id" copy-namespaces="no"/>
                                <xsl:if test="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:scopingEntity/hl7:desc">
                                    <name>
                                        <xsl:value-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:scopingEntity/hl7:desc"/>
                                    </name>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:telecom[1]" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:telecom)">
                                    <telecom nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:addr[1]" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:addr)">
                                    <addr nullFlavor="UNK"/>
                                </xsl:if>
                                
                            </xsl:when>
                            <xsl:when test="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:id">
                                <xsl:copy-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:id" copy-namespaces="no"/>
                                <xsl:copy-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:playingEntity/hl7:name" copy-namespaces="no"/>
                                <xsl:copy-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:telecom[1]" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:telecom)">
                                    <telecom nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:addr[1]" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participant[@typeCode = 'CST']/hl7:participantRole/hl7:addr)">
                                    <addr nullFlavor="UNK"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- ouch, lets add an id element with a nullFlavor, even though the schematron does not like that either... -->
                                <id nullFlavor="NI"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </representedCustodianOrganization>
                </assignedCustodian>
            </custodian>
            <xsl:apply-templates select="hl7:participant[not(@typeCode = 'CST')]" mode="organizer2CDA"/>
            <component>
                <structuredBody>
                    <xsl:for-each select="hl7:component[hl7:templateId[@root='2.16.840.1.113883.2.4.3.11.60.25.10.53']]">
                        <component>
                            <xsl:comment> Laboratory Specialty Section NL </xsl:comment>
                            <section>
                                <templateId root="2.16.840.1.113883.2.4.3.11.60.25.10.52"/>
                                <templateId root="1.3.6.1.4.1.19376.1.3.3.2.1"/>
                                <code code="26436-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="LABORATORY STUDIES"/>
                                <title>Laboratoriumonderzoek</title>
                                <component>
                                    <xsl:comment> Laboratory Report Item Section NL </xsl:comment>
                                    <section>
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.25.10.54"/>
                                        <templateId root="1.3.6.1.4.1.19376.1.3.3.2.2"/>
                                        <xsl:copy-of select="hl7:act/hl7:code" copy-namespaces="no"/>
                                        <text>
                                            <paragraph>
                                                <xsl:choose>
                                                    <xsl:when test="hl7:act/hl7:code/@displayName">
                                                        <xsl:value-of select="hl7:act/hl7:code/@displayName"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:text>Laboratoriumresultaten</xsl:text>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <xsl:for-each select=".//hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.7.10.2']]/hl7:code">
                                                    <xsl:text>, </xsl:text>
                                                    <xsl:value-of select="(@displayName, hl7:originalText, concat(@code, ' - ', @codeSystem))[1]"/>
                                                </xsl:for-each>
                                                <xsl:for-each select=".//hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.7.10.4']]/hl7:specimen/hl7:specimenRole/hl7:specimenPlayingEntity/hl7:code">
                                                    <xsl:text>, micro-organisme </xsl:text>
                                                    <xsl:value-of select="(@displayName, hl7:originalText, concat(@code, ' - ', @codeSystem))[1]"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7:act/hl7:entryRelationship/hl7:procedure/hl7:participant[@typeCode='PRD']/hl7:participantRole/hl7:playingEntity/hl7:code">
                                                    <xsl:text> van materiaal </xsl:text>
                                                    <xsl:value-of select="(@displayName, hl7:originalText, concat(@code, ' - ', @codeSystem))[1]"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="(hl7:act/hl7:performer/hl7:assignedEntity/hl7:representedOrganization//hl7:name)[not(string-join(., '') = '')][1]">
                                                    <xsl:text>, door </xsl:text>
                                                    <xsl:value-of select="."/>
                                                </xsl:for-each>
                                            </paragraph>
                                            <xsl:for-each select="hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.121.10.55']]">
                                                <paragraph><xsl:text>Status: </xsl:text><xsl:value-of select="hl7:value/(@displayName, hl7:originalText, @code)[1]"/></paragraph>
                                            </xsl:for-each>
                                            <xsl:if test="hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']]/hl7:value[@value = 'true']">
                                                <paragraph>Deze resultaten zijn een kopie van de bron</paragraph>
                                            </xsl:if>
                                            <xsl:for-each select="hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.121.10.53']]">
                                                <paragraph><xsl:text>EDIFACT-referentienummer: </xsl:text><xsl:value-of select="hl7:value"/></paragraph>
                                            </xsl:for-each>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>Test</td>
                                                        <td>Code</td>
                                                        <td>Datum</td>
                                                        <td>Status</td>
                                                        <td>Resultaat</td>
                                                        <td>Interpretatie</td>
                                                        <td>Opmerking</td>
                                                    </tr>
                                                    <xsl:for-each select=".//hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.3.11.60.7.10.31']]">
                                                        <xsl:variable name="abnormal" select="exists(hl7:interpretationCode[@code = ('H', 'L', '281302008', '281300000')] | hl7:interpetationCode[@codeSystem = '2.16.840.1.113883.4.642.3.59'])"/>
                                                        <tr>
                                                            <td><xsl:value-of select="hl7:code/@displayName"/></td>
                                                            <td>
                                                                <xsl:for-each select="hl7:code | hl7:code/hl7:translation">
                                                                    <xsl:value-of select="@code"/>
                                                                    <xsl:choose>
                                                                        <xsl:when test="@codeSystem = '2.16.840.1.113883.2.4.4.30.45'">
                                                                            <xsl:text> NHG</xsl:text>
                                                                        </xsl:when>
                                                                        <xsl:when test="@codeSystem = '2.16.840.1.113883.6.1'">
                                                                            <xsl:text> LOINC</xsl:text>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <xsl:value-of select="@codeSystem"/>
                                                                            <xsl:text> </xsl:text>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                    <xsl:if test="position() != last()">
                                                                        <br/>
                                                                    </xsl:if>
                                                                </xsl:for-each>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="string-join(hl7:effectiveTime/(substring(@value, 1, 4), substring(@value, 5, 2), substring(@value, 7, 2)), '-')"/>
                                                            </td>
                                                            <td>
                                                                <xsl:choose>
                                                                    <xsl:when test="hl7:entryRelationship/hl7:observation[hl7:code/@code = '92236-9']">
                                                                        <xsl:value-of select="hl7:entryRelationship/hl7:observation[hl7:code/@code = '92236-9']/hl7:value/@code"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select="hl7:statusCode/@code"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </td>
                                                            <td>
                                                                <xsl:variable name="result">
                                                                    <xsl:for-each select="hl7:value">
                                                                        <xsl:choose>
                                                                            <xsl:when test=".[@xsi:type = 'CE']">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="@displayName">
                                                                                        <xsl:value-of select="@displayName"/>
                                                                                    </xsl:when>
                                                                                    <xsl:when test="hl7:originalText">
                                                                                        <xsl:value-of select="hl7:originalText"/>
                                                                                    </xsl:when>
                                                                                    <xsl:when test="@code">
                                                                                        <xsl:value-of select="@code"/>
                                                                                        <xsl:choose>
                                                                                            <xsl:when test="@codeSystem = '2.16.840.1.113883.2.4.4.30.1045'">
                                                                                                <xsl:text> NHG</xsl:text>
                                                                                                <xsl:value-of select="@code"/>
                                                                                            </xsl:when>
                                                                                            <xsl:when test="@codeSystem = '2.16.840.1.113883.6.1'">
                                                                                                <xsl:text> LOINC</xsl:text>
                                                                                            </xsl:when>
                                                                                            <xsl:otherwise>
                                                                                                <xsl:text> </xsl:text>
                                                                                                <xsl:value-of select="@codeSystem"/>
                                                                                            </xsl:otherwise>
                                                                                        </xsl:choose>
                                                                                    </xsl:when>
                                                                                </xsl:choose>
                                                                            </xsl:when>
                                                                            <xsl:when test=".[@xsi:type = 'ST']">
                                                                                <xsl:value-of select="."/>
                                                                            </xsl:when>
                                                                            <xsl:when test=".[@xsi:type = 'PQ']">
                                                                                <xsl:value-of select="@value"/>
                                                                                <xsl:text> </xsl:text>
                                                                                <xsl:value-of select="@unit"/>
                                                                            </xsl:when>
                                                                            <xsl:when test=".[@xsi:type = 'TS']">
                                                                                <xsl:value-of select="@value"/>
                                                                            </xsl:when>
                                                                            <xsl:when test=".[@xsi:type = 'BL']">
                                                                                <xsl:value-of select="@value"/>
                                                                            </xsl:when>
                                                                            <!--<xsl:when test=".[@xsi:type = 'REAL']">
                                                                                <xsl:value-of select="@value"/>
                                                                            </xsl:when>-->
                                                                            <xsl:otherwise>
                                                                                <!-- Unsupported -->
                                                                                <xsl:value-of select="string-join((@value, hl7:*/@value), ' ')"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </xsl:for-each>
                                                                </xsl:variable>
                                                                <xsl:choose>
                                                                    <xsl:when test="$abnormal">
                                                                        <content styleCode="Bold">
                                                                            <xsl:value-of select="$result"/>
                                                                        </content>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select="$result"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </td>
                                                            <td>
                                                                <xsl:variable name="result" select="(hl7:interpretationCode/descendant-or-self::*[@codeSystem = '2.16.840.1.113883.6.96'], hl7:interpretationCode/descendant-or-self::*[@codeSystem = '2.16.840.1.113883.5.83'])[1]"/>
                                                                <xsl:choose>
                                                                    <xsl:when test="$abnormal">
                                                                        <content styleCode="Bold">
                                                                            <xsl:value-of select="($result/@displayName, $result/@code)[1]"/>
                                                                        </content>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select="($result/@displayName, $result/@code)[1]"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </td>
                                                            <td>
                                                                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:templateId[@root = '1.3.6.1.4.1.19376.1.5.3.1.4.2']]/hl7:text">
                                                                    <content ID="{generate-id(.)}">
                                                                        <xsl:value-of select="."/>
                                                                    </content>
                                                                </xsl:for-each>
                                                            </td>
                                                        </tr>
                                                    </xsl:for-each>
                                                </tbody>
                                            </table>
                                        </text>
                                        <xsl:comment> Laboratory Report Data Processing Entry NL </xsl:comment>
                                        <entry typeCode="DRIV">
                                            <xsl:apply-templates select="comment() | hl7:templateId | hl7:act" mode="organizer2CDA"/>
                                        </entry>
                                    </section>
                                </component>
                            </section>
                        </component>
                    </xsl:for-each>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>


    <xd:doc>
        <xd:desc> Niet kopiëren </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:organizer[not(ancestor::hl7:organizer)]/hl7:templateId | hl7:organizer[not(ancestor::hl7:organizer)]/hl7:code | hl7:organizer[not(ancestor::hl7:organizer)]/hl7:statusCode | hl7:organizer[not(ancestor::hl7:organizer)]/hl7:author" mode="organizer2CDA"/>

    <xd:doc>
        <xd:desc> participantRole element hernomen naar associatedEntity in CDA participant </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:organizer/hl7:participant/hl7:participantRole" mode="organizer2CDA">
        <xsl:element name="associatedEntity">
            <xsl:apply-templates select="@* | node()" mode="organizer2CDA"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:organizer/hl7:component" mode="organizer2CDASection">
        <entry xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select="* | node()" mode="organizer2CDA"/>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:entryRelationship/hl7:act[hl7:templateId[@root = '1.3.6.1.4.1.19376.1.5.3.1.4.2']]/hl7:text" mode="organizer2CDA">
        <xsl:copy copy-namespaces="no">
            <reference xmlns="urn:hl7-org:v3" value="#{generate-id(.)}"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:recordTarget/hl7:patientRole" mode="organizer2CDA">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*" mode="organizer2CDA"/>
            
            <xsl:copy-of select="hl7:id" copy-namespaces="no"/>
            <xsl:copy-of select="hl7:addr" copy-namespaces="no"/>
            <xsl:if test="empty(hl7:addr)">
                <addr nullFlavor="UNK"/>
            </xsl:if>
            <xsl:copy-of select="hl7:telecom" copy-namespaces="no"/>
            <xsl:if test="empty(hl7:telecom)">
                <telecom nullFlavor="UNK"/>
            </xsl:if>
            <xsl:copy-of select="hl7:patient" copy-namespaces="no"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:participant[@typeCode = 'CST']" mode="cdaAuthor">
        <author xmlns="urn:hl7-org:v3">
            <time nullFlavor="NI"/>
            <assignedAuthor>
                <!-- id is required for representedCustodianOrganization, let's check if we have one -->
                <xsl:choose>
                    <xsl:when test="hl7:participantRole/hl7:scopingEntity/hl7:id">
                        <xsl:copy-of select="hl7:participantRole/hl7:id" copy-namespaces="no"/>
                        <xsl:if test="empty(hl7:participantRole/hl7:id)">
                            <id nullFlavor="NI"/>
                        </xsl:if>
                        <xsl:copy-of select="hl7:participantRole/hl7:code" copy-namespaces="no"/>
                        <xsl:copy-of select="hl7:participantRole/hl7:addr" copy-namespaces="no"/>
                        <xsl:if test="empty(hl7:participantRole/hl7:addr)">
                            <addr nullFlavor="UNK"/>
                        </xsl:if>
                        <xsl:copy-of select="hl7:participantRole/hl7:telecom" copy-namespaces="no"/>
                        <xsl:if test="empty(hl7:participantRole/hl7:telecom)">
                            <telecom nullFlavor="UNK"/>
                        </xsl:if>
                        <xsl:if test="hl7:participantRole/hl7:playingEntity[hl7:id | hl7:name | hl7:code] | hl7:participantRole/hl7:scopingEntity[hl7:id | hl7:code | hl7:desc]">
                            <representedOrganization>
                                <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:name" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:playingEntity/hl7:name)">
                                    <name nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:telecom" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:playingEntity/hl7:telecom)">
                                    <telecom nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:addr" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:playingEntity/hl7:addr)">
                                    <addr nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:for-each select="hl7:participantRole/hl7:scopingEntity">
                                    <asOrganizationPartOf>
                                        <xsl:copy-of select="hl7:id" copy-namespaces="no"/>
                                        <xsl:copy-of select="hl7:code" copy-namespaces="no"/>
                                        <xsl:if test="hl7:desc">
                                            <wholeOrganization>
                                                <name>
                                                    <xsl:value-of select="hl7:desc"/>
                                                </name>
                                                <xsl:copy-of select="hl7:telecom" copy-namespaces="no"/>
                                                <xsl:if test="empty(hl7:telecom)">
                                                    <telecom nullFlavor="UNK"/>
                                                </xsl:if>
                                                <xsl:copy-of select="hl7:addr" copy-namespaces="no"/>
                                                <xsl:if test="empty(hl7:addr)">
                                                    <addr nullFlavor="UNK"/>
                                                </xsl:if>
                                                <xsl:copy-of select="hl7:standardIndustryClassCode" copy-namespaces="no"/>
                                            </wholeOrganization>
                                        </xsl:if>
                                    </asOrganizationPartOf>
                                </xsl:for-each>
                            </representedOrganization>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <id nullFlavor="NI"/>
                        <xsl:copy-of select="hl7:participantRole/hl7:addr" copy-namespaces="no"/>
                        <xsl:if test="empty(hl7:participantRole/hl7:addr)">
                            <addr nullFlavor="UNK"/>
                        </xsl:if>
                        <xsl:copy-of select="hl7:participantRole/hl7:telecom" copy-namespaces="no"/>
                        <xsl:if test="empty(hl7:participantRole/hl7:playingEntity/hl7:telecom)">
                            <telecom nullFlavor="UNK"/>
                        </xsl:if>
                        <xsl:if test="hl7:participantRole/hl7:code | hl7:participantRole/hl7:playingEntity[hl7:name]">
                            <representedOrganization>
                                <xsl:copy-of select="hl7:participantRole/hl7:id" copy-namespaces="no"/>
                                <xsl:if test="hl7:participantRole/hl7:playingEntity/hl7:name">
                                    <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:name" copy-namespaces="no"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:telecom" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:telecom)">
                                    <telecom nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:addr" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:addr)">
                                    <addr nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:if test="hl7:participantRole/hl7:code">
                                    <standardIndustryClassCode>
                                        <xsl:copy-of select="hl7:participantRole/hl7:code/(@* | node())" copy-namespaces="no"/>
                                    </standardIndustryClassCode>
                                </xsl:if>
                            </representedOrganization>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </assignedAuthor>
        </author>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:performer" mode="organizer2CDA">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*" mode="organizer2CDA"/>
            <xsl:copy-of select="hl7:templateId" copy-namespaces="no"/>
            <xsl:copy-of select="hl7:time" copy-namespaces="no"/>
            <xsl:if test="empty(hl7:time)">
                <time nullFlavor="UNK"/>
            </xsl:if>
            <xsl:copy-of select="hl7:modeCode" copy-namespaces="no"/>
            <xsl:apply-templates select="hl7:assignedEntity" mode="organizer2CDA"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:assignedEntity" mode="organizer2CDA">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*" mode="organizer2CDA"/>
            <xsl:copy-of select="hl7:templateId" copy-namespaces="no"/>
            <xsl:copy-of select="hl7:id" copy-namespaces="no"/>
            <xsl:copy-of select="hl7:code" copy-namespaces="no"/>
            <xsl:copy-of select="hl7:addr" copy-namespaces="no"/>
            <xsl:if test="empty(hl7:addr)">
                <addr nullFlavor="UNK"/>
            </xsl:if>
            <xsl:copy-of select="hl7:telecom" copy-namespaces="no"/>
            <xsl:if test="empty(hl7:telecom)">
                <telecom nullFlavor="UNK"/>
            </xsl:if>
            <xsl:copy-of select="hl7:assignedPerson" copy-namespaces="no"/>
            <xsl:copy-of select="hl7:representedOrganization" copy-namespaces="no"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:organizer[not(ancestor::hl7:organizer)]/hl7:participant" mode="organizer2CDA">
        <participant>
            <xsl:copy-of select="@*" copy-namespaces="no"/>
            <associatedEntity classCode="ASSIGNED">
                <xsl:choose>
                    <xsl:when test="hl7:participantRole/hl7:scopingEntity/hl7:id">
                        <xsl:copy-of select="hl7:participantRole/hl7:addr" copy-namespaces="no"/>
                        <xsl:copy-of select="hl7:participantRole/hl7:telecom" copy-namespaces="no"/>
                        <xsl:if test="hl7:participantRole/hl7:playingEntity[hl7:id | hl7:code | hl7:name] | hl7:participantRole/hl7:scopingEntity[hl7:id | hl7:code | hl7:desc]">
                            <scopingOrganization>
                                <xsl:choose>
                                    <xsl:when test="hl7:participantRole/hl7:id">
                                        <xsl:copy-of select="hl7:participantRole/hl7:id" copy-namespaces="no"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <id nullFlavor="NI"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="hl7:participantRole/hl7:playingEntity/hl7:name">
                                    <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:name" copy-namespaces="no"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:addr" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:playingEntity/hl7:addr)">
                                    <addr nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:telecom" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:playingEntity/hl7:telecom)">
                                    <telecom nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:if test="hl7:participantRole/hl7:code">
                                    <standardIndustryClassCode>
                                        <xsl:copy-of select="hl7:participantRole/hl7:code/(@* | node())" copy-namespaces="no"/>
                                    </standardIndustryClassCode>
                                </xsl:if>
                                <xsl:if test="hl7:participantRole/hl7:scopingEntity">
                                    <asOrganizationPartOf>
                                        <xsl:copy-of select="hl7:participantRole/hl7:scopingEntity/hl7:id" copy-namespaces="no"/>
                                        <xsl:copy-of select="hl7:participantRole/hl7:scopingEntity/hl7:code" copy-namespaces="no"/>
                                        <xsl:if test="hl7:participantRole/hl7:scopingEntity/hl7:desc">
                                            <wholeOrganization>
                                                <name>
                                                    <xsl:value-of select="hl7:participantRole/hl7:scopingEntity/hl7:desc"/>
                                                </name>
                                                <xsl:copy-of select="hl7:participantRole/hl7:scopingEntity/hl7:addr" copy-namespaces="no"/>
                                                <xsl:if test="empty(hl7:participantRole/hl7:scopingEntity/hl7:addr)">
                                                    <addr nullFlavor="UNK"/>
                                                </xsl:if>
                                                <xsl:copy-of select="hl7:participantRole/hl7:scopingEntity/hl7:telecom" copy-namespaces="no"/>
                                                <xsl:if test="empty(hl7:participantRole/hl7:scopingEntity/hl7:telecom)">
                                                    <telecom nullFlavor="UNK"/>
                                                </xsl:if>
                                            </wholeOrganization>
                                        </xsl:if>
                                    </asOrganizationPartOf>
                                </xsl:if>
                            </scopingOrganization>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="hl7:participantRole/hl7:addr" copy-namespaces="no"/>
                        <xsl:copy-of select="hl7:participantRole/hl7:telecom" copy-namespaces="no"/>
                        <xsl:if test="hl7:participantRole/hl7:playingEntity/hl7:name">
                            <scopingOrganization>
                                <xsl:copy-of select="hl7:participantRole/hl7:id" copy-namespaces="no"/>
                                <xsl:if test="hl7:participantRole/hl7:playingEntity/hl7:name">
                                    <xsl:copy-of select="hl7:participantRole/hl7:playingEntity/hl7:name" copy-namespaces="no"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:scopingEntity/hl7:addr" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:scopingEntity/hl7:addr)">
                                    <addr nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:copy-of select="hl7:participantRole/hl7:scopingEntity/hl7:telecom" copy-namespaces="no"/>
                                <xsl:if test="empty(hl7:participantRole/hl7:scopingEntity/hl7:telecom)">
                                    <telecom nullFlavor="UNK"/>
                                </xsl:if>
                                <xsl:if test="hl7:participantRole/hl7:code">
                                    <standardIndustryClassCode>
                                        <xsl:copy-of select="hl7:participantRole/hl7:code/(@* | node())" copy-namespaces="no"/>
                                    </standardIndustryClassCode>
                                </xsl:if>
                            </scopingOrganization>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </associatedEntity>
        </participant>
    </xsl:template>

    <xd:doc>
        <xd:desc>format HL7 2 XMLDate</xd:desc>
        <xd:param name="dateTime">input hl7 date as string</xd:param>
        <xd:param name="precision">precision for output</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatHL72XMLDate">
        <xsl:param name="dateTime" as="xs:string?"/>
        <!-- precision determines the picture of the date format, currently only use case for day or second. -->
        <xsl:param name="precision" as="xs:string?"/>
        <xsl:variable name="xml-date" select="
                xs:date(concat(
                substring($dateTime, 1, 4), '-',
                substring($dateTime, 5, 2), '-',
                substring($dateTime, 7, 2)))"/>
        <xsl:choose>
            <xsl:when test="upper-case($precision) = ('DAY', 'DAG', 'DAYS', 'DAGEN', 'D')">
                <xsl:value-of select="$xml-date"/>
            </xsl:when>
            <xsl:when test="upper-case($precision) = ('SECOND', 'SECONDE', 'SECONDS', 'SECONDEN', 'SEC', 'S') and string-length($dateTime) >= 14">
                <xsl:value-of select="
                        xs:dateTime(concat(
                        substring($dateTime, 1, 4), '-',
                        substring($dateTime, 5, 2), '-',
                        substring($dateTime, 7, 2), 'T',
                        substring($dateTime, 9, 2), ':',
                        substring($dateTime, 11, 2), ':',
                        substring($dateTime, 13, 2)))"/>
            </xsl:when>
            <xsl:when test="upper-case($precision) = ('SECOND', 'SECONDE', 'SECONDS', 'SECONDEN', 'SEC', 'S') and string-length($dateTime) &lt; 14">
                <!-- asked for seconds, but input is smaller than seconds, just return date -->
                <xsl:value-of select="$xml-date"/>
            </xsl:when>
            <xsl:otherwise>Could not determine xml date from input: '<xsl:value-of select="$dateTime"/>' with precision: '<xsl:value-of select="$precision"/>'.</xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes an xml inputdate(time) as a string in inputDate and outputs the date in format '3 jun 2018'</xd:desc>
        <xd:param name="inputDate"/>
    </xd:doc>
    <xsl:function name="nf:formatDate" as="xs:string?">
        <xsl:param name="inputDate" as="xs:string?"/>
        <xsl:variable name="date" select="
                if ($inputDate) then
                    substring($inputDate, 1, 10)
                else
                    ()"/>
        <xsl:if test="$date castable as xs:date">
            <xsl:value-of select="replace(format-date(xs:date($date), '[D] [Mn,*-3] [Y]'), 'maa', 'mrt')"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Default copy template</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="organizer2CDA">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@* | node()" mode="organizer2CDA"/>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>
