<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 PN - Person Name
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="PN.NL">
   <extends rule="PN"/>
   <assert role="error"
           test="not(*[tokenize(@qualifier,'\s')='LS'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.NL">dtr1-1-PN: Person names SHALL NOT contain a name part qualified with 'LS' (Legal status for organizations)</assert>
   <assert role="error"
           test="not(hl7:given[contains(@qualifier,'IN')]) or hl7:given[contains(@qualifier,'IN') and not(starts-with(text(),'.')) and contains(text(),'.') and ends-with(text(),'.')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.NL">Datatype PN: als given/@qualifier 'IN' bevat dan moeten er initialen gescheiden en gevolgd door een punt in het element given staan.</assert>
   <assert role="error"
           test="not(hl7:given[contains(@qualifier,'IN') and contains(@qualifier,'CL')])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.NL">Datatype PN: given/@qualifier 'IN' en 'CL' gaan niet samen. Initalen zijn geen roepnaam</assert>
   <assert role="error"
           test="not(hl7:given[contains(@qualifier,'CL') and contains(text(),'.')])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.NL">Datatype PN: als given/@qualifier 'CL' bevat dan moeten er voornamen in dit element staan. Voornamen hebben geen puntjes.</assert>
   <report role="warning"
           test="hl7:prefix[@qualifier='VV' and not(ends-with(text(),' '))]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.NL">Datatype PN: als er een spatie tussen een voorvoegsel en de bijbehorende achternaam hoort, moet het prefix element met qualifier=VV ook eindigen met een spatie.</report>
   <!-- Test of voorvoegsels in de achternaam zijn opgenomen -->
   <report role="warning"
           test="hl7:family[substring(.,1,4)='van '] or hl7:family[substring(.,1,3)=('de ','in ')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.NL">Datatype PN: voorvoegsels moeten in het prefix element worden gevoerd, tenzij het bronsysteem voorvoegsels en achternaam niet gescheiden vastlegt.</report>
</rule>
