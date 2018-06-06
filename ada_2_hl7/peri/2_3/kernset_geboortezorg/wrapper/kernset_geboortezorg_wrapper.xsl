<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    <!-- the param can be called from outside this stylesheet, if no value is provided it defaults to whatever is set in 'select' -->
    <xsl:param name="input_xml_payload" select="'../ada_instance/ada_result.xml'"/>
    <!--<xsl:param name="input_xml_payload" select="'../ada_instance/999.1 Test_NL.xml'"/>-->
    <xsl:param name="input_xml_wrapper" select="'input_wrapper.xml'"/>
    
        <xsl:variable name="input_xml_payload_doc" select="document($input_xml_payload)"/>
    <xsl:param name="input_xml_wrapper_doc" select="document($input_xml_wrapper)"/>
    <xsl:include href="../payload/REPC_EX004014NL_Kernset_2_3_3.xsl"/>

    <xsl:template name="MakeWrapper">
        <xsl:call-template name="Wrappers">
            <xsl:with-param name="transmission_wrapper" select="$input_xml_wrapper_doc//transmission_wrapper"/>
            <xsl:with-param name="payload_xml" select="$input_xml_payload_doc"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:call-template name="Wrappers">
            <xsl:with-param name="transmission_wrapper" select="//transmission_wrapper"/>
            <xsl:with-param name="payload_xml" select="$input_xml_payload_doc"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="Wrappers">
        <xsl:param name="transmission_wrapper"/>
        <xsl:param name="payload_xml" select="$input_xml_payload_doc"/>
        <xsl:for-each select="$transmission_wrapper">
            <xsl:for-each select="./schematron_href">
                <xsl:processing-instruction name="xml-model">href="<xsl:value-of select="./@value"/>" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
            </xsl:for-each>
            <!--<ABCD>-->
            <xsl:element name="{./root_xml_element/@value}">
                <xsl:namespace name="hl7" select="'urn:hl7-org:v3'"/>
                <xsl:namespace name="xs" select="'http://www.w3.org/2001/XMLSchema'"/>
                <xsl:for-each select="./schema_location">
                    <xsl:attribute name="xsi:schemaLocation" select="./@value"/>
                </xsl:for-each>
                <xsl:for-each select="./id">
                    <xsl:call-template name="makeId"/>
                </xsl:for-each>
                <xsl:for-each select="./creation_time">
                    <creationTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </creationTime>
                </xsl:for-each>
                <versionCode code="NICTIZEd2005-Okt"/>
                <xsl:for-each select="./interaction_id">
                    <interactionId root="2.16.840.1.113883.1.6">
                        <xsl:attribute name="extension" select="./@value"/>
                    </interactionId>
                </xsl:for-each>
                <profileId root="2.16.840.1.113883.2.4.3.11.1" extension="810"/>
                <processingCode code="P"/>
                <processingModeCode code="T"/>
                <xsl:for-each select="./accept_ack_code">
                    <acceptAckCode>
                        <xsl:attribute name="code" select="./@value"/>
                    </acceptAckCode>
                </xsl:for-each>
                <xsl:for-each select="./receiver">
                    <receiver typeCode="RCV">
                        <xsl:call-template name="makeDevice"/>
                    </receiver>
                </xsl:for-each>
                <xsl:for-each select="./sender">
                    <sender typeCode="SND">
                        <xsl:call-template name="makeDevice"/>
                    </sender>
                </xsl:for-each>
                <xsl:for-each select="./controlact_wrapper">
                    <ControlActProcess classCode="CACT" moodCode="EVN">
                        <xsl:for-each select="./author_or_performer/assigned_person">
                            <authorOrPerformer typeCode="AUT">
                                <participant>
                                    <xsl:call-template name="makeAssignedPerson"/>
                                </participant>
                            </authorOrPerformer>
                        </xsl:for-each>
                        <xsl:for-each select="./overseer/assigned_person">
                            <overseer typeCode="RESP">
                                <xsl:call-template name="makeAssignedPerson"/>
                            </overseer>
                        </xsl:for-each>
                        <subject typeCode="SUBJ" contextConductionInd="false">
                            <xsl:for-each select="./registration_wrapper">
                            <registrationProcess classCode="REG" moodCode="EVN">
                                <xsl:for-each select="./code">
                                    <xsl:call-template name="makeWrapperCode"/>
                                </xsl:for-each>
                                <statusCode code="active"/>
                                <xsl:for-each select="./effective_time">
                                <effectiveTime>
                                    <xsl:for-each select="./low">
                                    <low>
                                        <xsl:call-template name="makeTSValueAttr"/>
                                    </low>
                                    </xsl:for-each>
                                </effectiveTime></xsl:for-each>
                                <!-- call this template with the appropriate input file -->
                                <xsl:call-template name="Kernset23_withInputDoc">
                                    <xsl:with-param name="inputFile" select="$payload_xml"/>                                    
                                </xsl:call-template>
                            </registrationProcess>
                            </xsl:for-each>
                        </subject>
                    </ControlActProcess>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <!-- Helper templates -->
    <xsl:template name="makeAssignedPerson">
        <AssignedPerson>
            <xsl:for-each select="./id">
                <xsl:call-template name="makeId"/>
            </xsl:for-each>
            <xsl:for-each select="./code">
                <xsl:call-template name="makeWrapperCode"/>
            </xsl:for-each>
            <xsl:for-each select="./name">
                <assignedPrincipalChoiceList>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="./@value"/>
                        </name>
                    </assignedPerson>
                </assignedPrincipalChoiceList>
            </xsl:for-each>
            <xsl:for-each select="./organization">
                <Organization>
                    <xsl:for-each select="./id">
                        <xsl:call-template name="makeId"/>
                    </xsl:for-each>
                    <xsl:for-each select="./code">
                        <xsl:call-template name="makeWrapperCode"/>
                    </xsl:for-each>
                    <xsl:for-each select="./name">
                        <name>
                            <xsl:value-of select="./@value"/>
                        </name>
                    </xsl:for-each>
                    <xsl:for-each select="address/city">
                        <addr>
                            <city>
                                <xsl:value-of select="./@value"/>
                            </city>
                        </addr>
                    </xsl:for-each>
                </Organization>
            </xsl:for-each>
        </AssignedPerson>
    </xsl:template>
    <xsl:template name="makeDevice">
        <device classCode="DEV" determinerCode="INSTANCE">
            <xsl:for-each select="./id">
                <id>
                    <xsl:attribute name="extension" select="./@value"/>
                    <xsl:attribute name="root" select="./@root"/>
                </id>
            </xsl:for-each>
            <xsl:for-each select="./name">
                <name>
                    <xsl:value-of select="./@value"/>
                </name>
            </xsl:for-each>
        </device>
    </xsl:template>
    <xsl:template name="makeId">
        <id>
            <xsl:attribute name="extension" select="./@value"/>
            <xsl:attribute name="root" select="./@root"/>
        </id>
    </xsl:template>
    <xsl:template name="makeWrapperCode">
        <code>
            <xsl:attribute name="code" select="./@code"/>
            <xsl:attribute name="codeSystem" select="./@codeSystem"/>
            <xsl:attribute name="displayName" select="./@displayName"/>
        </code>
    </xsl:template>
</xsl:stylesheet>
