rm -rf Echo-Casus1 Echo-Casus2 Echo-Casus3 Kraam-Casus1 Kraam-Casus2
cp -rp ../med_mij_echo_beschikbaarstellen/fhir_instance/gz-ize-kwa-casus1 Echo-Casus1
cp -rp ../med_mij_echo_beschikbaarstellen/fhir_instance/gz-ize-kwa-casus2 Echo-Casus2
cp -rp ../med_mij_echo_beschikbaarstellen/fhir_instance/gz-ize-kwa-casus3 Echo-Casus3

cp -rp ../med_mij_kraam_beschikbaarstellen/fhir_instance/gz-izk-kwa-casus1 Kraam-Casus1
cp -rp ../med_mij_kraam_beschikbaarstellen/fhir_instance/gz-izk-kwa-casus2 Kraam-Casus2

cd Echo-Casus1

# bc-FetusObservation > bc-AmnioticFluid
# andere waarden voor conditie van vruchtwater in Observation.component.value
mv mm-gbz-bc-AmnioticFluid160321000146103-e7b3d5c9-6ae1-11ec-2241-020000000000.xml medmij-gbz-bc-FetusObservation-160321000146103-1a78132-1943-14rp-1287-040000000000.xml

# zib-Problem > bc-DisOrderOfChild
# .category handmatig 404684003 | Klinische bevinding | versus gegenereerd 414025005 | aandoening van foetus of neonaat (aandoening) |
mv mm-gbz-bc-DisorderOfChild76916001-98e01ded-6af7-11ec-2394-020000000000.xml medmij-gbz-zib-Problem-76916001-0a42b3d2-1831-14ec-1751-030000000000.xml

mv mm-gbz-bc-Fetus83418008-7f96aada-6ada-11ec-1267-020000000000.xml medmij-gbz-bc-Fetus-3e413n6r-4153-12ud-1758-020000000000.xml

# Dataset/ADA instance probleem op 3616 EFWWaarde waar eenheid mm staat waar je gram verwacht dus FHIR heeft nu ook mm in genereerde data
mv mm-gbz-bc-FetusObservation11727-5-b20db7df-6b2d-11ec-2361-020000000000.xml medmij-gbz-bc-FetusObservation-89087-1-5e413e4k-4123-12id-1258-020000000000.xml

mv mm-gbz-bc-FetusObservation11815-8-6fb1c9d8-6aa9-11ec-2356-020000000000.xml medmij-gbz-bc-FetusObservation-11815-8-2e41631-4522-14rp-1287-040000000000.xml
mv mm-gbz-bc-FetusObservation11820-8-527fcabe-6b43-11ec-2355-020000000000.xml medmij-gbz-bc-FetusObservation-11820-8-2e41631-4523-14il-1158-040000000000.xml
mv mm-gbz-bc-FetusObservation11863-8-ab2221a4-6b4c-11ec-2358-020000000000.xml medmij-gbz-bc-FetusObservation-11863-8-7k31231-4922-14rp-1287-040000000000.xml
mv mm-gbz-bc-FetusObservation11963-6-0e5f694d-6a9e-11ec-2353-020000000000.xml medmij-gbz-bc-FetusObservation-11963-6-2f456i3l-4523-14ia-1257-030000000000.xml
mv mm-gbz-bc-FetusObservation11979-2-2fddfcc7-6aea-11ec-2351-020000000000.xml medmij-gbz-bc-FetusObservation-11979-2-3e443e4l-4423-14ik-1257-030000000000.xml
mv mm-gbz-bc-FetusObservation364619008-0312eb29-6ae8-11ec-2240-020000000000.xml medmij-gbz-bc-FetusObservation-364619008-1d21131-1943-14rp-1287-040000000000.xml
mv mm-gbz-bc-FetusObservation421060004+2748008-6e3c3392-6b00-11ec-2783-020000000000.xml medmij-gbz-bc-FetusObservation-421060004-2748008-1d2e331-2939-14up-3287-040000000000.xml
mv mm-gbz-bc-FetusObservation698598000-7224b919-6ad1-11ec-2784-020000000000.xml medmij-gbz-bc-FetusObservation-698598000-64588327-0eca-4839-8001-1ca2776b06f6.xml

# bc-FetusObservation > MaternalObservation
# inhoudelijk geen relevante verschillen
mv mm-gbz-bc-MaternalObservation248918004-2782394d-6b5f-11ec-2363-020000000000.xml medmij-gbz-bc-FetusObservation-248918004-2e31641-4523-14ip-1357-030000000000.xml

mv mm-gbz-bc-MaternalRecord-d0510907-6af3-11ec-0000-020000000000.xml medmij-gbz-bc-MaternalRecord-0d485b6r-2263-12ed-1751-020000000000.xml
mv mm-gbz-bc-PlacentaLocalization7381000146107-0d6cda3b-6b72-11ec-2243-020000000000.xml medmij-gbz-bc-PlacentaLocalization-7381000146107-1b28536-7943-14rp-1287-040000000000.xml
mv mm-gbz-bc-PregnancyObservation161714006-1f55c413-6b6f-11ec-2334-020000000000.xml medmij-gbz-bc-PregnancyObservation161714006-0e49awc8-2160-11ec-1451-056700000000.xml

# Nakijken ... in gegenereerde data ontbreekt een component  
mv mm-gbz-bc-PregnancyUltraSoundGeneralFindings290201000146101-d986eb0f-6b5b-11ec-2891-020000000000.xml medmij-gbz-bc-PregnancyUltraSoundGeneralFindings-290201000146101-5e413e4k-4123-14ik-1257-030000000000.xml

# Nakijken ... in gegenereerde data ontbreekt een specialty
mv mm-gbz-bc-ReferralRequest-33fe0a01-6b6b-11ec-2887-020000000000.xml medmij-gbz-bc-ReferralRequest-02492973-7a1a-43b4-8fa2-fae2528d2ab4.xml

# bc-FetusObservation > bc-UmbilicalCord
mv mm-gbz-bc-UmbilicalCord289299005-28e11776-6b6a-11ec-2779-020000000000.xml medmij-gbz-bc-FetusObservation-289299005-1c2e536-3923-14up-3287-040000000000.xml 

mv mm-gbz-bc-Woman-LEONIE-L-XXX-OSSE.xml medmij-gbz-nl-core-patient-L-XXX-Osse.xml
rm mm-gbz-nl-core-location-location-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml
rm mm-gbz-nl-core-organization-organization-mm-gbz--1235.xml
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-528-1-1007-3-3-87654321.xml medmij-gbz-nl-core-organization-20cc97fe-a1d2-4140-b492-19e50b6cf49f.xml
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml medmij-gbz-nl-core-organization-2-16-841-1-133487-8-9-6-108794321.xml
mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-8452962.xml medmij-gbz-nl-core-practitioner-2-16-368-1-1357-3-115650601.xml

# Nakijken ... in gegenereerde data ontbreekt een specialty
mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-8452962.xml medmij-gbz-nl-core-practitionerrole-2-13-572-2-1217-3-1157740001.xml

# bc-FetusObservation > zib-HeadCircumference
# Observation.category,.code.coding, .effectiveDateTime en .value verschillen vanwege FHIR Vital Signs profile eisen. Resultaat verplicht 16.8 cm niet 168 mm 
mv mm-gbz-zib-HeadCircumference9843-4-702ae7a7-6b29-11ec-2362-020000000000.xml medmij-gbz-bc-FetusObservation-363812007-2e456e3l-4523-14ik-1257-030000000000.xml

# valueQuantity unit=1 wordt (terecht) niet meer gevuld
mv mm-gbz-zib-Pregnancy-Gravidity11996-6-7eeea4de-6af8-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Gravidity161732006-76d22171-280c-4386-9e53-08ea8c8cd13b.xml

# valueQuantity unit=1 wordt (terecht) niet meer gevuld
mv mm-gbz-zib-Pregnancy-Parity11977-6-a0f9852a-6b49-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Parity364325004-852770ba-c05c-4373-a814-bed3fec708a3.xml

# Navragen ... in de gegenereerde data is de Zwangerschap active. In de handmatig, inactive ... beide hebben geen enkele datummarkering
mv mm-gbz-zib-Pregnancy118185001-3cc38e5b-6ac9-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy118185001-0d47bfc2-1933-14ec-1751-030000000000.xml

# bc-ObstetricProcedure > zib-Procedure
# Procedure.performedDateTime > .performedPeriod.start, .location en .reasonReference erbij 
mv mm-gbz-zib-Procedure143701000146108-6e8bd802-6abf-11ec-2241-020000000000.xml medmij-gbz-bc-ObstetricProcedure-0f933e4l-4113-14od-1258-020000000000.xml

# bc-PregnancyUltraSound > zib-TextResult 
# Nakijken ... in gegenereerde data ontbreken alle Observations
mv mm-gbz-zib-TextResult16310003-TextResult-mm-gbz-0bab0539-6aaf-11ec-2786-020000000000.xml medmij-gbz-bc-PregnancyUltraSound-2g321a41-2126-15od-1258-020000000000.xml

cd ../Echo-Casus2

