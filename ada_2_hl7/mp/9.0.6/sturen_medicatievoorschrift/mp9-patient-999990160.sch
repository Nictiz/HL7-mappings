<sch:rule xmlns:sch="http://purl.oclc.org/dsdl/schematron" context="//hl7:recordTarget">
    <sch:let name="bsn" value="'999990160'"/>
<!--    <sch:let name="voornaam" value="''"/>-->
    <sch:let name="initialen" value="'O'"/>
    <sch:let name="achternaam" value="'XXX-Incident-B'"/>
    <sch:let name="geslacht" value="'M'"/>
    <sch:let name="geboortedatum" value="'19500201'"/>
    <sch:assert role="error" test="not(//hl7:id[@root = '2.16.840.1.113883.2.4.6.3'][@extension != $bsn])">BSN moet <sch:value-of select="$bsn"/> zijn.</sch:assert>
<!--    <sch:assert role="error" test="not(exists(./hl7:patientRole/hl7:patient/hl7:name/hl7:given)) or not(exists(./hl7:patientRole/hl7:patient/hl7:name/hl7:given[@qualifier = 'BR' or @qualifier = 'CL'])) or contains((./hl7:patientRole/hl7:patient/hl7:name/hl7:given)[1], $voornaam)">Voornaam moet <sch:value-of select="$voornaam"/> bevatten.</sch:assert>
-->    
    <sch:assert role="error" test="not(exists(./hl7:patientRole/hl7:patient/hl7:name/hl7:given)) or not(exists(./hl7:patientRole/hl7:patient/hl7:name/hl7:given[@qualifier = 'IN'])) or contains((./hl7:patientRole/hl7:patient/hl7:name/hl7:given)[1], $initialen)">Initialen moet <sch:value-of select="$initialen"/> bevatten.</sch:assert>
    <sch:assert role="error" test="not(exists(./hl7:patientRole/hl7:patient/hl7:name/hl7:family)) or contains(upper-case((./hl7:patientRole/hl7:patient/hl7:name/hl7:family)[1]), upper-case($achternaam))">Achternaam moet <sch:value-of select="$achternaam"/> bevatten.</sch:assert>
    <sch:assert role="error" test="string-length(normalize-space((./hl7:patientRole/hl7:patient/hl7:name/text())[1])) = 0 or contains(upper-case((./hl7:patientRole/hl7:patient/hl7:name)[1]), upper-case($achternaam))">De naam moet <sch:value-of select="$achternaam"/> bevatten.</sch:assert>
    <sch:assert role="error" test="./hl7:patientRole/hl7:patient/hl7:administrativeGenderCode[@code = $geslacht]">Het geslacht moet '<sch:value-of select="$geslacht"/>' zijn.</sch:assert>
    <sch:assert role="error" test="./hl7:patientRole/hl7:patient/hl7:birthTime[@value = $geboortedatum]">De geboortedatum moet '<sch:value-of select="$geboortedatum"/>' zijn.</sch:assert>
</sch:rule>