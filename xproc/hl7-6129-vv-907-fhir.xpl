<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" name="myPipeline" version="1">
    <p:input port="source" primary="true" sequence="false">
        <p:document href="../hl7_2_ada/mp/6.12.9/opleveren_verstrekkingenlijst/hl7_instance/QURX_EX990113NL_01.xml"/>
    </p:input>
    <p:output port="result" sequence="true">
        <p:pipe step="last-step" port="result"/>
    </p:output>
    <p:xslt name="hl72ada" >
          <p:input port="stylesheet">
            <p:document href="../hl7_2_ada/mp/6.12.9/opleveren_verstrekkingenlijst/payload/opleveren_verstrekkingenlijst_612_to_ada_vv.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt> 
    <p:xslt name="ada2fhir" >
          <p:input port="stylesheet">
            <p:document href="../ada_2_fhir/mp/9.0.7/beschikbaarstellen_verstrekkingenvertaling/payload/beschikbaarstellen_verstrekkingenvertaling_2_fhir.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>  
     <p:store href="result.xml" name="last-step"/>
</p:declare-step>
