<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="" xmlns:hl7="urn:hl7-org:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!-- the param can be called from outside this stylesheet, if no value is provided it defaults to whatever is set in 'select' -->
    <xsl:param name="output_xml_wrapper" select="'../wrapper/output_wrapper'"/>
    <xsl:include href="../payload/sturen_medicatievoorschrift_906_to_ADA.xsl"/>

    <!-- template MakeWrapper can be called from outside this template, if needed to explicitly supply the input.xml filename -->
    <xsl:template name="MakeWrapper">
        <xsl:param name="input_xml_payload" select="'../hl7_instance/CDA_MP90_Voorschrift_01c_MA_2VV_1dd1st.xml'"/>
        <xsl:variable name="input_xml_payload_doc" select="document($input_xml_payload)"/>
        <xsl:call-template name="Wrappers">
            <xsl:with-param name="payload_xml" select="$input_xml_payload_doc"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="/">
        <xsl:call-template name="Wrappers">
            <xsl:with-param name="payload_xml" select="."/>
        </xsl:call-template>
    </xsl:template>

    <!-- template Wrapper that does all the work and does a call to payload conversion as well-->
    <xsl:template name="Wrappers">
        <xsl:param name="payload_xml" select="."/>
        <xsl:param name="hl7_root" select="//hl7:*[not(ancestor::hl7:*)]"/>
        <xsl:variable name="wrapper_root" select="$hl7_root[hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']]"/>
        <xsl:for-each select="$wrapper_root">
            <xsl:variable name="interaction-id" select="local-name(.)"/>
            <!-- wrapper output xml -->
            <xsl:result-document exclude-result-prefixes="#all" href="{concat($output_xml_wrapper, '_', ./position(), '.xml')}" indent="yes">
                <transmission_wrapper xmlns="" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="output_wrapper.xsd">
                    <root_xml_element value="{$interaction-id}"/>
                    <xsl:for-each select="hl7:id">
                        <id value="{./@extension}" root="{./@root}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:creationTime">
                        <creation_time value="{nf:formatHL72XMLDate(./@value, nf:determine_date_precision(./@value))}"/>
                    </xsl:for-each>
                    <interaction_id value="{$interaction-id}"/>
                    <xsl:for-each select="./hl7:acceptAckCode">
                        <accept_ack_code value="{./@code}"/>
                    </xsl:for-each>
                    <!-- No attention line in this interaction -->
                    <!--                    <xsl:for-each select="">
                        <attention_line_bsn value="012345672"/>
                    </xsl:for-each> -->
                    <xsl:for-each select="./hl7:receiver/hl7:device">
                        <receiver>
                            <xsl:call-template name="make-device"/>
                        </receiver>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:sender/hl7:device">
                        <sender>
                            <xsl:call-template name="make-device"/>
                        </sender>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:ControlActProcess">
                        <controlact_wrapper>
                            <xsl:for-each select="./hl7:authorOrPerformer">
                                <author_or_performer>
                                    <xsl:for-each select="./hl7:participant">
                                        <xsl:for-each select="./hl7:AssignedDevice">
                                            <assigned_device>
                                                <xsl:for-each select="./hl7:id">
                                                    <id value="{./@extension}" root="{./@root}"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7:Organization">
                                                    <organization>
                                                        <xsl:for-each select="./hl7:id">
                                                            <id value="{./@extension}" root="{./@root}"/>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="./hl7:name">
                                                            <name value="{./text()}"/>
                                                        </xsl:for-each>
                                                    </organization>
                                                </xsl:for-each>
                                            </assigned_device>
                                        </xsl:for-each>
                                        <xsl:for-each select="./hl7:AssignedPerson">
                                            <xsl:call-template name="make-assigned-person"/>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </author_or_performer>
                            </xsl:for-each>
                            <xsl:for-each select="./hl7:overseer">
                                <overseer>
                                    <xsl:for-each select="./hl7:AssignedPerson">
                                        <xsl:call-template name="make-assigned-person"/>
                                    </xsl:for-each>
                                </overseer>
                            </xsl:for-each>
                            <!-- Hier komt de echte Payload van het Voorschrift -->
                        </controlact_wrapper>
                    </xsl:for-each>
                </transmission_wrapper>

            </xsl:result-document>
        </xsl:for-each>
        <!-- payload conversion -->
        <xsl:call-template name="Voorschrift-90-ADA">
            <xsl:with-param name="patient" select="//hl7:recordTarget/hl7:patientRole"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Helper templates -->
    <!-- assigned_person -->
    <xsl:template name="make-assigned-person">
        <assigned_person>
            <xsl:for-each select="./hl7:id">
                <id value="{./@extension}" root="{./@root}"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:code">
                <code value="{./@code}" code="{./@code}" codeSystem="{./@codeSystem}" displayName="{./@displayName}"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:assignedPrincipalChoiceList/hl7:assignedPerson/hl7:name">
                <name value="{./text()}"/>
            </xsl:for-each>
            <xsl:for-each select="./hl7:Organization">
                <organization>
                    <xsl:for-each select="./hl7:id">
                        <id value="{./@extension}" root="{./@root}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:code">
                        <code value="{./@code}" code="{./@code}" codeSystem="{./@codeSystem}" displayName="{./@displayName}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:name">
                        <name value="{./text()}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:addr/hl7:city">
                        <address>
                            <city value="{./text()}"/>
                        </address>
                    </xsl:for-each>
                </organization>
            </xsl:for-each>
        </assigned_person>
    </xsl:template>
    <!-- device -->
    <xsl:template name="make-device">
        <xsl:for-each select="./hl7:id">
            <id value="{./@extension}" root="{./@root}"/>
        </xsl:for-each>
        <xsl:for-each select="./hl7:name">
            <name value="{./text()}"/>
        </xsl:for-each>        
    </xsl:template>
</xsl:stylesheet>
