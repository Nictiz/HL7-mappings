<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 TEL.IPS - Telecommunication Address
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TEL.IPS">
   <extends rule="TEL"/>
   <let name="urlScheme" value="substring-before(@value,':')"/>
   <let name="urlStr" value="substring-after(@value,':')"/>
   <assert role="error"
           test="not($urlScheme=('tel','fax')) or matches($urlStr,'^\+?[0-9()\.-]+$')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.IPS">dtr1-TEL.IPS: Phone and fax numbers SHALL consist of an optional leading + for country code followed by digits 0-9. The only other allowable characters are parentheses (), hyphens - and/or dots. Pattern is '^\+?[0-9()\.-]+$'</assert>
   <assert role="error"
           test="not($urlScheme=('tel','fax')) or matches(replace($urlStr,'[^\d]',''),'[0-9]+')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.IPS">dtr2-TEL.IPS: Phone and fax numbers SHALL have at least one dialing digit in the phone number after visual separators are removed.</assert>
</rule>
