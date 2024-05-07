<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 - URL.NL.EXTENDED
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="URL.NL.EXTENDED">
   <extends rule="URL"/>
   <let name="urlScheme" value="substring-before(@value,':')"/>
   <let name="urlStr" value="substring-after(@value,':')"/>
   <!-- 
        Tested with: <telecom use="HP" value="tel:+31190531770"/>
        <telecom use="HP" value="tel:+31-(0)190531770%20;isub=1%2023"/>
        <telecom value="tel:41234567"/>
        <telecom value="tel:01041234567"/>
        <telecom value="mailto:afdsf.-.b@b.nl"/>
        <telecom value="mailto:afdsf-b@b.nl"/>
        <telecom value="mailto:afdsfb@b-b.nl"/>
        <telecom value="http://www.nictiz.nl:8080/directory"/>
        <telecom value="http://tools.ietf.org/html/rfc2616"/>
        <telecom value="http://abc.com:80/~smith/home.html"/>
        <telecom value="http://ABC.com/%7Esmith/home.html"/>
        <telecom value="http://ABC.com:/%7esmith/home.html"/>
        <telecom
        value="http://www.linkedin.com/memberInvite?acceptInvitation=&amp;invitationID=775190257&amp;sharedKey=DT2gs65T&amp;itemID=I1478332986_2&amp;goback=%2Emml_inbox_none_DATE_1"/>
        <telecom value="http://www.google.com/search?client=safari&amp;rls=en&amp;q=http&amp;ie=UTF-&amp;&amp;oe=UTF-8"/>
        <telecom
        value="http://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-6744919314769019&amp;format=fp_al_lp&amp;output=html&amp;h=15&amp;w=728&amp;ea=0&amp;flash=10.0.32&amp;url=http%3A%2F%2Fwww.asciitable.com%2F&amp;dt=1254481943190&amp;prev_fmts=728x15_0ads_al_s&amp;correlator=1254481943041&amp;frm=0&amp;ga_vid=144077625.1254481943&amp;ga_sid=1254481943&amp;ga_hid=1308288403&amp;ga_fc=0&amp;u_tz=120&amp;u_his=2&amp;u_java=1&amp;u_h=900&amp;u_w=1440&amp;u_ah=874&amp;u_aw=1440&amp;u_cd=24&amp;u_nplug=12&amp;u_nmime=126&amp;biw=1280&amp;bih=764&amp;fu=0&amp;ifi=2&amp;dtd=19&amp;kw_type=radlink&amp;rt=ChBKxeAdAAfWUgreC87p9BZcEhFFQkNESUMgQ29udmVyc2lvbhoI4oCu6eKAF3Qg-t7QxAIoAUj63tDEAlITCOSh6Lednp0CFRMv3godeiF75w&amp;hl=en&amp;kw0=Hex+Tool&amp;kw1=EBCDIC+Hex&amp;kw2=EBCDIC+ASCII&amp;kw3=EBCDIC+Conversion&amp;kw4=EBCDIC+Table&amp;okw=EBCDIC+Conversion"/>
        <telecom value="http://www.google.com/url?ct=abg&amp;pa="/>
        <telecom value="http://www.google.com/url?ct=abg&amp;q=https://www.google.com/adsense/support/bin/request.py#dsffsd*!"/>
        <telecom
        value="http://www.google.com/url?ct=abg&amp;q=https://www.google.com/adsense/support/bin/request.py%3Fcontact%3Dabg_afc%26url%3Dhttp://www.asciitable.com/%26hl%3Den%26client%3Dca-pub-6744919314769019%26adU%3Dwww.intodq.com%26adT%3DValue%2Byour%2Bdata%26adU%3Dwww.pervasivedatatools.com%26adT%3Dascii%2Bebcdic%2Btranscoding%26adU%3Dwww.softwaremining.com%26adT%3DCobol%2BTo%2BOO%2BJava/C%2523%26adU%3Dwww.dbload.com%26adT%3DData%2BExport%2B%2526amp%253B%2BImport%2BTool%26adU%3Dwww.metex.com%26adT%3DApplication%2BModernization%26adU%3Dwww.Import-Usa-Cars.nl/Vans%26adT%3DImport%2BUSA%2BCars%26adU%3Dwww.CobolProducts.com/datafile/%26adT%3DConvert%2BCobol%2BData%2BFiles%26adU%3Dwww.Transend.com/EmailConversion%26adT%3DEmail%2BConversion%2BSoftware%26adU%3Dwww.skills-1st.co.uk%26adT%3DTDI%2BExpert%26adU%3Dwww.TransTOOLs.com%26adT%3DGo%2Bto%2BJava,%2BGo%2BNow%26gl%3DNL&amp;usg=AFQjCNF7NyJM3uxA3m7VTHZLcNFjzVOdwA"/>
        <telecom value="http://user:pass@www.mysite.com/dir/?section=other&amp;auth=Jane+Smith+writing+as+J.+N.+Doe"/>
        <telecom value="tel:+1-201-555-0123"/>
        <telecom value="tel:+1-201-555-0123;ext=4324;parameter=moeder"/>
        <telecom value="tel:7042;phone-context=example.com"/>
        <telecom value="tel:863-1234;phone-context=+1-914-555"/>
        <telecom value="tel:863-1234;phone-context=+1-914-555;phone-context=example.com"/>
        <telecom value="mllp://1.10.1.1:mllp/"/>
        <telecom value="mllp://www.enovation.nl:8/"/>
        <telecom value="ftp://user:pass@10.10.10.10:21"/>
        <telecom value="ftp://10.10.10.10"/>
        <telecom value="ftp://10.10.10.10:21"/>
        <telecom value="ftp://10.10.10.10:21/"/>
        <telecom value="ftp://ftphost.org"/>
        <telecom value="ftp://ftphost.org/"/>
        <telecom value="ftp://ftphost.org:ftp/"/>
        <telecom value="ftp://ftphost.org:ftp/;type=i"/>
        <telecom value="ftp://ftphost.org:ftp/dir/di-r/na$$%a0&amp;me;type=i"/>
        <telecom value="file://c:/filename.txt"/>
        <telecom value="file://c:/filename/file%7c"/>
        <telecom value="file://host.org/filename.txt"/>
        <telecom value="nfs://host.org/filename.txt"/>
        <telecom value="nfs://host.org//filename.txt"/>
        <telecom value="telnet://10.10.10.10"/>
        <telecom value="telnet://10.10.10.10:21"/>
        <telecom value="telnet://10.10.10.10:21/"/>
        <telecom value="telnet://ftphost.org"/>
        <telecom value="telnet://ftphost.org/"/>
        <telecom value="telnet://ftphost.org:ftp/"/>
        <telecom value="x-hl7-applicatie:2.16.840.1.113883.2.4.6.6.7000324"/>
    -->
   <assert role="error"
           test="if ($urlScheme='tel' or $urlScheme='fax') then (         matches($urlStr,'^(\+?([\d()./-]|(%[a-f\d]{2}))+)*(;(phone-context=((\+?([\d()./-]|(%[a-f\d]{2}))+)|(([a-z\d-]|(%[a-f\d]{2}))+(\.([a-z\d-]|(%[a-f\d]{2}))+)*))|(ext=[\d./-]+)|(isub=(([a-z\d();/?:@&amp;=+$,_.!~*''-])|(%[a-f\d]{2}))+)|([a-z\d-]+=([a-z\d\[\]/:&amp;+$_.!~*()-]|(%[a-f\d]{2}))+)))*$')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr3-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with RFC 3966</assert>
   <!-- file -->
   <assert role="error"
           test="if ($urlScheme='file') then (         matches($urlStr,'^///{0,2}((((([1-2]\d{0,2})(\.([1-2]\d{0,2})){3})|(([\w-]+\.)+([a-z]+))))|([a-z][:|]))(/(([a-z\d$\.+!*(),?&amp;~_=-])|(%[a-f\d]{2}))*)*$','i')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr4-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with RFC 1738.</assert>
   <!-- nfs -->
   <assert role="error"
           test="if ($urlScheme='nfs') then (         matches($urlStr,'^//((((([1-2]\d{0,2})(\.([1-2]\d{0,2})){3})|(([\w-]+\.)+([a-z]+))))|([a-z][:|]))/?(/(([a-z\d$\.+!*(),?&amp;~_=-])|(%[a-f\d]{2}))*)*$','i')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr5-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with RFC 2224.</assert>
   <!-- ftp en ftps -->
   <!-- Merk op: interne hostnamen niet ondersteund -->
   <assert role="error"
           test="if ($urlScheme='ftp' or $urlScheme='ftps') then (         matches($urlStr,'^//((([a-z\d$\.+!*(),?&amp;=~_-])|(%[a-f\d]{2}))+(:(([a-z\d$\.+!*(),?&amp;~_=-])|(%[a-f\d]{2}))*)?@)?((([1-2]\d{0,2})(\.([1-2]\d{0,2})){3})|(([\w-]+\.)+(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z]{2})))(:(([1-9]\d{0,4})|([a-z][\w-]*))?)?(/(([a-z\d$\.+!*(),?&amp;_~=-])|(%[a-f\d]{2}))*)*(;type=[aid])?$','i')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr6-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with RFC 1738.</assert>
   <!-- http en https
        http_URL = "http:" "//" host [ ":" port ] [ abs_path [ "?" query ]]
    -->
   <!-- Merk op: interne hostnamen niet ondersteund -->
   <assert role="error"
           test="if ($urlScheme='http' or $urlScheme='https') then (         matches($urlStr,'^//((([a-z\d$\.+!*(),?&amp;~_=-])|(%[a-f\d]{2}))+(:(([a-z\d$\.+!*(),?&amp;~_=-])|(%[a-f\d]{2}))*)?@)?((([1-2]\d{0,2})(\.([1-2]\d{0,2})){3})|(([\w-]+\.)+(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z]{2})))(:(([1-9]\d{0,4})|([a-z]\w*))?)?(/(([a-z\d$\.+!*(),?&amp;~_=-])|(%[a-f\d]{2}))*)*(\?(([\w$_\.+;:@~!*(),])|(%[a-f\d]{2}))+=(([\w$_\.+;:/@~!*(),-])|(%[a-f\d]{2}))*(&amp;((([\w$_\.+;:@~!*(),])|(%[a-f\d]{2}))+=(([\w$_\.+;:/@~!*(),-])|(%[a-f\d]{2}))*)?)*)?(#([\w~!$+|.,*:=~_]|%[a-f\d]{2})*)?$', 'i')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr7-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with RFC 1738</assert>
   <!-- telnet://<user>:<password>@<host>:<port>/ -->
   <!-- Merk op: interne hostnamen niet ondersteund -->
   <assert role="error"
           test="if ($urlScheme='telnet') then (         matches($urlStr,'^//((([a-z\d$\.+!*(),?&amp;~_=-])|(%[a-f\d]{2}))+(:(([a-z\d$\.+!*(),?&amp;=-])|(%[a-f\d]{2}))*)?@)?((([1-2]\d{0,2})(\.([1-2]\d{0,2})){3})|(([\w-]+\.)+(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z]{2})))(:(([1-9]\d{0,4})|([a-z]\w*))?)?(/(([a-z\d$\.+!*(),?&amp;=-])|(%[a-f\d]{2}))*)*$','i')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr8-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with RFC 1738.</assert>
   <!-- mailto -->
   <assert role="error"
           test="if ($urlScheme='mailto') then (         matches($urlStr,'^[\w$\.+!*(),?&amp;~_=-]+(\.[\w$\.+!*(),?&amp;~_=-]+)*@([\w$+!*(),?&amp;~_=-]+\.)+([a-z]{2,4})$','i')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr9-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with RFC 2368. Note that it is not allowed to carry extra headers</assert>
   <!-- x-hl7-applicatie -->
   <assert role="error"
           test="if ($urlScheme='x-hl7-applicatie') then (         matches($urlStr,'^2\.16\.840\.1\.113883\.2\.4\.6\.6\.[1-9]\d*$')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr10-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST start with "2.16.840.1.113883.2.4.6.6." prefixed with the numerical part</assert>
   <!-- mllp -->
   <!-- Note: internal hostnames not supported -->
   <assert role="error"
           test="if ($urlScheme='mllp') then (         matches($urlStr,'^//(([1-2]\d{0,2})(\.([1-2]\d{0,2})){3}|(([\w-]+\.)+(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z]{2}))):(([1-9]\d{0,4})|([A-Za-z]\w*))/$')         ) else (1=1)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL.NL.EXTENDED">dtr11-URL.NL.EXTENDED: URIs with URL Scheme <value-of select="$urlScheme"/> MUST comply with mllp://host:port/ where 'host' MAY be a name or IP and 'port' a named port or integer</assert>
</rule>
