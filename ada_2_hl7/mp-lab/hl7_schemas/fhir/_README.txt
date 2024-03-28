Source            : FHIR 4.0.1 https://www.hl7.org/fhir/R4/fhir-codegen-xsd.zip
Add date          : April 21, 2021
Changes applied   : Add xs:element effectiveTime in ../hl7fhir_extension.xsd for reference

Affected file     : POCD_MT000040NL_extended.xsd
                    Add    : <xs:import namespace="http://hl7.org/fhir" schemaLocation="fhir/fhir-base.xsd"/>
                    
                    Change : <xs:complexType name="POCD_MT000040.SubstanceAdministration">
                                <xs:sequence>
                                    ....
                                    <xs:choice minOccurs="0" maxOccurs="1">
                                        <xs:element name="effectiveTime" type="SXCM_TS" minOccurs="0" maxOccurs="unbounded"/>
                                        <xs:element ref="f:effectiveTime" minOccurs="0" maxOccurs="1"/>
                                    </xs:choice>
                                ....