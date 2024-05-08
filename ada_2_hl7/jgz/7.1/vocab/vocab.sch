<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="urn:hl7-org:v3" prefix="hl7"/>
    <let name="fileName" value="tokenize(document-uri(.),'/')[last()]"/>
    <let name="codeSystem" value="substring-before($fileName,'.xml')"/>
    <pattern>
        <title>codeSystem should match file basename (without extension), usually the OID</title>
        <rule context="hl7:code">
            <assert role="error" test="@codeSystem=$codeSystem"
                >codeSystem should match file basename (without extension) '<value-of select="$codeSystem"/>'. </assert>
        </rule>
        <rule context="hl7:reference">
            <let name="upperCode" value="../@code"/>
            <let name="upperCodeSystem" value="../@codeSystem"/>
            <let name="code" value="@extension"/>
            <let name="codeSystemFile" value="concat(@root,'.xml')"/>
            <assert role="error" test="document($codeSystemFile)/*/hl7:code[@code=$code]"
                >The code <value-of select="$code"/> must exist in <value-of select="$codeSystemFile"/></assert>
            <assert role="error" test="not($upperCodeSystem='2.16.840.1.113883.1.6' and @root='2.16.840.1.113883.1.18') or
                document($codeSystemFile)/*/hl7:code[@code=$code]/hl7:reference[@root=$upperCodeSystem and @extension=$upperCode]"
                >The interaction <value-of select="$upperCode"/> references trigger event <value-of select="@extension"/>, but this trigger event does not reference this interaction in <value-of select="$codeSystemFile"/></assert>
        </rule>
        <rule context="hl7:code">
            <assert role="error" test="
                not(hl7:qualifier[@name='Verzendtype' and @value='Reagerend']) or
                not(hl7:qualifier[@name='Vertrouwensniveau']) or
                not(hl7:qualifier[@name='Vertrouwensniveau' and @value='Laag'])"
                >Verzendtype 'Reagerend' en Vertrouwensniveau anders dan 'Laag' gaan niet samen. Reagerende interacties kunnen alleen door een applicatie worden verzonden</assert>
        </rule>
    </pattern>
</schema>