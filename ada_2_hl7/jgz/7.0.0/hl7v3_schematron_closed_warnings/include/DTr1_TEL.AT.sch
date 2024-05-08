<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 TEL - Telecommunication Address
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TEL.AT">
    <!--<extends rule="TEL"/>-->
   <assert role="error"
           test="@nullFlavor or @value"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL">dtr1-1-URL: elements of type URL SHALL have a @value attribute.</assert>
   <assert role="error"
           test="not(@nullFlavor and hl7:useablePeriod)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL">dtr1-1-TEL: not null and useablePeriod</assert>
   <let name="urlScheme" value="substring-before(@value,':')"/>
   <report role="warning"
           test="not(not(@value) or $urlScheme = ('fax', 'file', 'ftp', 'mllp', 'http', 'mailto', 'me', 'modem', 'nfs', 'tel', 'telnet'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.AT">dtr1-1-TEL.AT: ungültiges URL-Schema <value-of select="$urlScheme"/>
   </report>
   <report role="warning"
           test="not(not(@use) or translate(concat(' ', @use, ' '), '(H|HP|HV|WP|AS|EC|MC|PG|TMP) ', '') = '')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.AT">dtr1-2-TEL.AT: @use MUSS aus den Werten 'H', 'HP', 'HV', 'WP', 'AS', 'EC', 'MC', 'PG', 'TMP' gewählt werden.</report>
   <report role="warning"
           test="not(not($urlScheme=('tel','fax')) or matches(@value,'[a-z\d+\.-]+:\+{0,1}[0-9\.\-\(\)]+$'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.AT">dtr1-3-TEL.AT: Nur Ziffernzeichen 0 bis 9, ggf. mit vorangehendem + sowie als visuelle Separatorzeichen Bindestrich -, Punkt . oder Klammern () sind erlaubt.</report>
</rule>
