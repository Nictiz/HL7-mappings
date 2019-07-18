This is a preliminary version of converting HL7v3 messages/CDA with various Ketenzorg/Community Based Care 'building blocks' to a relatively simple dataset xml format in response type transactions. 

It is based on publication 3.0.2 for the HL7v3 Ketenzorg project and on version 3.0.2 for the ADA data format.

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "payload" contains the stylesheets that do the conversion for the payload: "beschikbaarstellen_*_2_ada.xsl"
The xslts use the "../../../hl7_2_ada_ketenzorg_include.xsl" which in turn uses ../../../../hl7/hl7_2_ada_hl7_include.xsl which is meant to be reused by other/different transactions.

The folder 'hl7v3_instance' contains sample hl7 instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder ada_instance contains the result of the conversion.

The ADA user front-end for Ketenzorg 3.0.2 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/ketenzorg3.0/views/ketenzorg_30_index.xhtml

TODO:
Issue 329 : Bouwsteen medicatieafspraak. Dataset, transacties en templates zijn uitgebreid met relaties naar Episode / Contact.
Issue 338 : Transactie Voorschrift. Het is nu mogelijk om verstrekkingsverzoeken zonder MA of met een kopie-MA te sturen. Hoe het uiteindelijk moet, is nog afhankelijk van (onder andere) een juridische toets en wordt procedureel afgesproken.
Zit kopie-indicator in de mapping?
Issue 348 : Geneesmiddel - product code. Meerdere product codes zijn gewenst, bij een specifieke G-standaard codering nu ook de meer generieke codering(en) meegeven. Aangepast in de scenario's/transacties.
ook TODO: de meest specifieke code moet in FHIR een user selected true krijgen.
Issue 354 : Bouwsteen medicatieafspraak. Lengte en gewicht meetdatum/tijd waren niet verplicht in MP maar wel in zib. Met issue 360 (gebruik maken van zib template) is dit ook hersteld: dus het meegeven van datum/tijd is nu verplicht
Issue 360 : Bouwsteen medicatieafspraak. Lengte en gewicht waren nog gebaseerd op oude zibs (2015) en een specifiek mp-template. Dit is herstel naar 2017 zib met bijbehorend template.
nakijken of ada elementen nog goed zijn.

