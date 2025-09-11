
# AH: Creates Echo-Casus1 Echo-Casus2 Echo-Casus3 Kraam-Casus1 Kraam-Casus2 directories, setup with copies from generated contents using the same filename as their manually created counter parts
# You may then use a Diff tool to compare the generated output with the manul output in ../../../../../Nictiz-testscripts/src/Geboortezorg-2-0/Cert/_reference/
c=`pwd`
cd `dirname $0`
rm -rf compare
mkdir compare

echo Renaming in Echo-Casus1 ...
cd compare
cp -rp ../../med_mij_echo_beschikbaarstellen/fhir_instance/gz-ize-kwa-casus1 Echo-Casus1
cd Echo-Casus1

mv mm-gbz-bc-AmnioticFluid160321000146103-e7b3d5c9-6ae1-11ec-2241-020000000000.xml medmij-gbz-bc-FetusObservation-160321000146103-1a78132-1943-14rp-1287-040000000000.xml
mv mm-gbz-bc-DisorderOfChild76916001-98e01ded-6af7-11ec-2394-020000000000.xml medmij-gbz-zib-Problem-76916001-0a42b3d2-1831-14ec-1751-030000000000.xml
mv mm-gbz-bc-Fetus83418008-7f96aada-6ada-11ec-1267-020000000000.xml medmij-gbz-bc-Fetus-3e413n6r-4153-12ud-1758-020000000000.xml
mv mm-gbz-bc-FetusObservation11727-5-b20db7df-6b2d-11ec-2361-020000000000.xml medmij-gbz-bc-FetusObservation-89087-1-5e413e4k-4123-12id-1258-020000000000.xml
mv mm-gbz-bc-FetusObservation11815-8-6fb1c9d8-6aa9-11ec-2356-020000000000.xml medmij-gbz-bc-FetusObservation-11815-8-2e41631-4522-14rp-1287-040000000000.xml
mv mm-gbz-bc-FetusObservation11820-8-527fcabe-6b43-11ec-2355-020000000000.xml medmij-gbz-bc-FetusObservation-11820-8-2e41631-4523-14il-1158-040000000000.xml
mv mm-gbz-bc-FetusObservation11863-8-ab2221a4-6b4c-11ec-2358-020000000000.xml medmij-gbz-bc-FetusObservation-11863-8-7k31231-4922-14rp-1287-040000000000.xml
mv mm-gbz-bc-FetusObservation11963-6-0e5f694d-6a9e-11ec-2353-020000000000.xml medmij-gbz-bc-FetusObservation-11963-6-2f456i3l-4523-14ia-1257-030000000000.xml
mv mm-gbz-bc-FetusObservation11979-2-2fddfcc7-6aea-11ec-2351-020000000000.xml medmij-gbz-bc-FetusObservation-11979-2-3e443e4l-4423-14ik-1257-030000000000.xml
mv mm-gbz-bc-FetusObservation364619008-0312eb29-6ae8-11ec-2240-020000000000.xml medmij-gbz-bc-FetusObservation-364619008-1d21131-1943-14rp-1287-040000000000.xml
mv mm-gbz-bc-FetusObservation421060004+2748008-6e3c3392-6b00-11ec-2783-020000000000.xml medmij-gbz-bc-FetusObservation-421060004-2748008-1d2e331-2939-14up-3287-040000000000.xml
mv mm-gbz-bc-FetusObservation698598000-7224b919-6ad1-11ec-2784-020000000000.xml medmij-gbz-bc-FetusObservation-698598000-64588327-0eca-4839-8001-1ca2776b06f6.xml
mv mm-gbz-bc-MaternalObservation248918004-2782394d-6b5f-11ec-2363-020000000000.xml medmij-gbz-bc-FetusObservation-248918004-2e31641-4523-14ip-1357-030000000000.xml
mv mm-gbz-bc-MaternalRecord-d0510907-6af3-11ec-0000-020000000000.xml medmij-gbz-bc-MaternalRecord-0d485b6r-2263-12ed-1751-020000000000.xml
mv mm-gbz-bc-PlacentaLocalization7381000146107-0d6cda3b-6b72-11ec-2243-020000000000.xml medmij-gbz-bc-PlacentaLocalization-7381000146107-1b28536-7943-14rp-1287-040000000000.xml
mv mm-gbz-bc-PregnancyObservation161714006-1f55c413-6b6f-11ec-2334-020000000000.xml medmij-gbz-bc-PregnancyObservation161714006-0e49awc8-2160-11ec-1451-056700000000.xml
mv mm-gbz-bc-PregnancyUltraSound143701000146108-f605320f-6b1f-11ec-2120-020000000000.xml medmij-gbz-bc-PregnancyUltraSound-2g321a41-2126-15od-1258-020000000000.xml
mv mm-gbz-bc-PregnancyUltraSoundGeneralFindings290201000146101-d986eb0f-6b5b-11ec-2891-020000000000.xml medmij-gbz-bc-PregnancyUltraSoundGeneralFindings-290201000146101-5e413e4k-4123-14ik-1257-030000000000.xml
mv mm-gbz-bc-ReferralRequest-33fe0a01-6b6b-11ec-2887-020000000000.xml medmij-gbz-bc-ReferralRequest-02492973-7a1a-43b4-8fa2-fae2528d2ab4.xml
mv mm-gbz-bc-UmbilicalCord289299005-28e11776-6b6a-11ec-2779-020000000000.xml medmij-gbz-bc-FetusObservation-289299005-1c2e536-3923-14up-3287-040000000000.xml 
mv mm-gbz-bc-Woman-LEONIE-L-XXX-OSSE.xml medmij-gbz-nl-core-patient-L-XXX-Osse.xml
rm mm-gbz-nl-core-location-location-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml
rm mm-gbz-nl-core-organization-organization-mm-gbz--1235.xml
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-528-1-1007-3-3-87654321.xml medmij-gbz-nl-core-organization-20cc97fe-a1d2-4140-b492-19e50b6cf49f.xml
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml medmij-gbz-nl-core-organization-2-16-841-1-133487-8-9-6-108794321.xml
mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-8452962.xml medmij-gbz-nl-core-practitioner-2-16-368-1-1357-3-115650601.xml
mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-8452962.xml medmij-gbz-nl-core-practitionerrole-2-13-572-2-1217-3-1157740001.xml
mv mm-gbz-zib-HeadCircumference9843-4-f7b92fc7-6b22-11ec-2362-020000000000.xml medmij-gbz-bc-FetusObservation-363812007-2e456e3l-4523-14ik-1257-030000000000.xml
#mv mm-gbz-zib-Payer-Payer-mm-gbz-1e350d71-6b22-11ec-2129-020000000000-1.xml
mv mm-gbz-zib-Pregnancy-Gravidity11996-6-7eeea4de-6af8-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Gravidity161732006-76d22171-280c-4386-9e53-08ea8c8cd13b.xml
mv mm-gbz-zib-Pregnancy-Parity11977-6-a0f9852a-6b49-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Parity364325004-852770ba-c05c-4373-a814-bed3fec708a3.xml
mv mm-gbz-zib-Pregnancy118185001-3cc38e5b-6ac9-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy118185001-0d47bfc2-1933-14ec-1751-030000000000.xml
mv mm-gbz-bc-ObstetricProcedure143701000146108-6e8bd802-6abf-11ec-2241-020000000000.xml medmij-gbz-bc-ObstetricProcedure-0f933e4l-4113-14od-1258-020000000000.xml

echo Renaming in Echo-Casus2 ...
cd ..
cp -rp ../../med_mij_echo_beschikbaarstellen/fhir_instance/gz-ize-kwa-casus2 Echo-Casus2
cd Echo-Casus2

mv mm-gbz-bc-AmnioticFluid160321000146103-691bd083-6b06-11ec-2241-020000000000.xml medmij-gbz-bc-FetusObservation-160321000146103-1a78132-1249-64rp-1287-040000000000.xml
mv mm-gbz-bc-FetalHeartRate8867-4-b44e1d0d-6aa4-11ec-2178-020000000000.xml medmij-gbz-bc-FetusObservation249043002-5f617a89-2123-39ag-2255-010000000000.xml
mv mm-gbz-bc-Fetus83418008-cbb5dafb-6b4f-11ec-1267-020000000000.xml medmij-gbz-bc-Fetus-3e413n6r-4153-12vd-1258-010000000000.xml
mv mm-gbz-bc-FetusObservation11727-5-e114b810-6b12-11ec-2361-020000000000.xml medmij-gbz-bc-FetusObservation-89087-1-5e213a4k-2923-72id-1258-020000000000.xml
mv mm-gbz-bc-FetusObservation11820-8-1cab788b-6af5-11ec-2355-020000000000.xml medmij-gbz-bc-FetusObservation-11820-8-2e41631-4523-14is-1157-030000000000.xml
mv mm-gbz-bc-FetusObservation11963-6-04dca8eb-6aba-11ec-2353-020000000000.xml medmij-gbz-bc-FetusObservation-11963-6-2e456e3l-4122-143k-1344-030000000000.xml
mv mm-gbz-bc-FetusObservation11979-2-7e3c443d-6b25-11ec-2351-020000000000.xml medmij-gbz-bc-FetusObservation-11979-2-3e443e4l-4123-142k-1357-032000000000.xml
mv mm-gbz-bc-FetusObservation249062004-f8c0fb58-6b40-11ec-2778-020000000000.xml medmij-gbz-bc-FetusObservation249062004-5f617a89-2923-32ig-1258-020000000000.xml
mv mm-gbz-bc-FetusObservation364619008-1e7602eb-6b43-11ec-2240-020000000000.xml medmij-gbz-bc-FetusObservation-364619008-0d21131-1923-18rp-1289-010000000000.xml
mv mm-gbz-bc-MaternalRecord-eadc3c53-6b19-11ec-0000-020000000000.xml medmij-gbz-bc-MaternalRecord-9d485k6r-2763-15ed-3753-050000000000.xml
mv mm-gbz-bc-PregnancyObservation161714006-363c0938-6b1d-11ec-2334-020000000000.xml medmij-gbz-bc-PregnancyObservation161714006-0e49awc8-2160-11ec-1751-020000000000.xml
mv mm-gbz-bc-PregnancyUltraSound169228004-0b532cc3-6b36-11ec-2120-020000000000.xml medmij-gbz-bc-PregnancyUltraSound-9g721a81-2126-15od-1258-020000000000.xml
#mv mm-gbz-bc-Woman-LEONIE-L-XXX-OSSE.xml
#mv mm-gbz-nl-core-location-location-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml
#mv mm-gbz-nl-core-organization-organization-mm-gbz--1235.xml
#mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml
#mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-8452962.xml
#mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-8452962.xml
mv mm-gbz-zib-HeadCircumference9843-4-0425be53-6b03-11ec-2362-020000000000.xml medmij-gbz-bc-FetusObservation-363812007-2e457e8l-4923-12ik-1257-030000000000.xml
mv mm-gbz-zib-Payer-Payer-mm-gbz-2940951a-6b35-11ec-2129-020000000000-1.xml medmij-gbz-zib-Payer-1-12-839-1-113883-4-2-6-108923322.xml
mv mm-gbz-zib-Pregnancy-Gravidity11996-6-e0c60d1b-6ad3-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Gravidity161732006-0d67gec5-2663-11ec-1741-020000000000.xml
mv mm-gbz-zib-Pregnancy-Parity11977-6-a1d8cd67-6b2f-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Parity364325004-0d47afc6-1963-12ec-1142-030000000000.xml
mv mm-gbz-zib-Pregnancy118185001-c8cdd3f7-6b7c-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy118185001-1d47bec2-2933-11ec-3743-040000000000.xml
mv mm-gbz-bc-ObstetricProcedure169228004-4cbbd308-6a9c-11ec-2241-020000000000.xml medmij-gbz-bc-ObstetricProcedure-1f433e4l-4223-15od-1258-020000000000.xml

echo Renaming in Echo-Casus3 ...
cd ..
cp -rp ../../med_mij_echo_beschikbaarstellen/fhir_instance/gz-ize-kwa-casus3 Echo-Casus3
cd Echo-Casus3

mv mm-gbz-bc-Fetus83418008-0f2dfafb-6a9d-11ec-1267-020000000000.xml medmij-gbz-bc-Fetus-b89db315-ddc8-43bd-8b08-7e6cb2cf5adb.xml
mv mm-gbz-bc-FetusObservation11820-8-32c4af83-6af2-11ec-2355-020000000000.xml medmij-gbz-bc-FetusObservation-11820-8-a10ba8c4-899c-4be2-9b20-f26016cc56da.xml
mv mm-gbz-bc-FetusObservation11957-8-b5996b75-6aba-11ec-2357-020000000000.xml medmij-gbz-bc-FetusObservation-11957-8-0558b7d0-267a-4b24-9738-f6b6365f6935.xml
mv mm-gbz-bc-FetusObservation11963-6-a6d95cbb-6aab-11ec-2353-020000000000.xml medmij-gbz-bc-FetusObservation-11963-6-93b66255-4cfd-43bc-ba23-9e9c9f6e6d57.xml
mv mm-gbz-bc-FetusObservation11979-2-289b9930-6ac6-11ec-2351-020000000000.xml medmij-gbz-bc-FetusObservation-11979-2-bca06142-ecda-4c64-9431-fd6b98f851c9.xml
mv mm-gbz-bc-FetusObservation12146-7-be82cc57-6b06-11ec-2360-020000000000.xml medmij-gbz-bc-FetusObservation-12146-7-df3c8ef9-fc4a-43b5-b35e-81e265d9d761.xml
mv mm-gbz-bc-FetusObservation459053006-d3cab583-6b12-11ec-2784-020000000000.xml medmij-gbz-bc-FetusObservation-459053006-612fb4cc-b27f-4a65-8205-fc51d9b7560a.xml
mv mm-gbz-bc-MaternalRecord-6188717b-6b7b-11ec-0000-020000000000.xml medmij-gbz-bc-MaternalRecord-3e423b6r-2113-12ed-1751-020000000000.xml
mv mm-gbz-bc-PregnancyObservation161714006-b1ae75dc-6ae6-11ec-2334-020000000000.xml medmij-gbz-bc-PregnancyObservation161714006-ca5a6267-c009-409c-b905-9492ca2c24f5.xml
mv mm-gbz-bc-PregnancyUltraSound133601000146101-6d76d85f-6a96-11ec-2120-020000000000.xml medmij-gbz-bc-PregnancyUltraSound-7a5a4ff7-14dc-4683-98d5-e8e0c8c18028.xml
mv mm-gbz-bc-Woman-MERTHE-M-XXX-KOOIJMAN.xml medmij-gbz-nl-core-patient-M-XXX-Kooijman.xml
#mv mm-gbz-nl-core-location-location-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml
#mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-90012345.xml
#mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-8452962.xml
#mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-8452962.xml
mv mm-gbz-zib-HeadCircumference9843-4-71235839-6add-11ec-2362-020000000000.xml medmij-gbz-bc-FetusObservation-363812007-31ec8cae-8936-4af3-b248-daa1258d4ed2.xml
mv mm-gbz-zib-Pregnancy-Gravidity11996-6-de1b872a-6b1b-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Gravidity161732006-0d47gec7-1063-12ec-1851-090000000000.xml
mv mm-gbz-zib-Pregnancy-Parity11977-6-d30fff81-6b08-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy-Parity364325004-0d47a4c6-2033-21eb-1759-090000000000.xml
mv mm-gbz-zib-Pregnancy118185001-c6ab20cb-6b5e-11ec-2334-020000000000.xml medmij-gbz-zib-Pregnancy118185001-1e48bfc2-3943-15ec-1751-030000000000.xml
mv mm-gbz-bc-ObstetricProcedure133601000146101-c2f2a72b-6b5c-11ec-2241-020000000000.xml medmij-gbz-bc-ObstetricProcedure-8ef5191b-ae29-4410-9a63-82907cdecfb6.xml

echo Renaming in Kraam-Casus1 ...
cd ..
cp -rp ../../med_mij_kraam_beschikbaarstellen/fhir_instance/gz-izk-kwa-casus1 Kraam-Casus1
cd Kraam-Casus1

mv mm-gbz-bc-AbilityToTakeCareOfChild129879003-944cd2ca-6b7e-11ec-2998-020000000000.xml	medmij-gbz-bc-AbilityToTakeCareOfChild-b7816n34-2191-19ec-8669-020000000000.xml
mv mm-gbz-bc-Birth3950001-e7a46a7e-6b19-11ec-2123-020000000000.xml	medmij-gbz-bc-BirthProcedure3950001-6b971017-a6d9-11ek-1598-020000000000.xml
mv mm-gbz-bc-BirthObservation364336006-1d78d063-6b51-11ec-2414-020000000000.xml	medmij-gbz-bc-BirthObservation364336006-d715d984-2062-11ed-2093-020000000000.xml
mv mm-gbz-bc-BirthObservation366344009-13602ae3-6b08-11ec-2419-020000000000.xml	medmij-gbz-bc-BirthObservation-366344009-b8ac8945-052d-41ae-9f59-544810nd5734.xml
#mv mm-gbz-bc-Child-JORIS.xml	
mv mm-gbz-bc-ChildObservation28263002-0083b76e-6a9f-11ec-2990-020000000000.xml	medmij-gbz-bc-ChildObservation28263002-g3506b72-2291-11ec-8669-020000000000.xml
mv mm-gbz-bc-ChildObservation77262006-0fd92ff3-6b69-11ec-1001-020000000000.xml	medmij-gbz-bc-ChildObservation77262006-b7859b34-2291-11ec-8669-020000000000.xml
mv mm-gbz-bc-ChildObservation252957005-6f7a0ff3-6b56-11ec-1000-020000000000.xml	medmij-gbz-bc-ChildObservation252957005-b78506b34-2291-11ec-8669-020000000000.xml
mv mm-gbz-bc-ChildObservation364062005-918c5793-6ac7-11ec-2996-020000000000.xml	medmij-gbz-bc-ChildObservation-364062005-6205c98a-7769-672j-a3sa-fa2ad3170gd2.xml
mv mm-gbz-bc-ChildObservation364204002-a66be9bf-6b23-11ec-2304-020000000000.xml	medmij-gbz-bc-ChildObservation-364204002-6205c98a-7769-317c-a5dd-fa2ad3177sk9.xml
mv mm-gbz-bc-ChildObservation364528001-9319b6f6-6b20-11ec-2296-020000000000.xml	medmij-gbz-bc-ChildObservation364528001-b78506b72-2291-11ec-8669-020000000000.xml
mv mm-gbz-bc-ChildObservation364595007-b048b26b-6b13-11ec-2988-020000000000.xml	medmij-gbz-bc-ChildObservation364595007-c48506b34-2291-11ec-8669-020000000000.xml
mv mm-gbz-bc-ChildObservation404950004-4a7fdc6e-6b51-11ec-2989-020000000000.xml	medmij-gbz-bc-ChildObservation404950004-v6516b72-2291-11ec-8669-020000000000.xml
mv mm-gbz-bc-DeliveryObservation168089007-e00632ff-6ada-11ec-2412-020000000000.xml	medmij-gbz-bc-DeliveryObservation366334007-d238d44b-2062-11ec-2046-020000000000.xml
mv mm-gbz-bc-DeliveryObservation236994008-8b77d2cd-6b6c-11ec-2421-020000000000.xml	medmij-gbz-bc-DeliveryObservation-236994008-f7e01114-1b2b-1404-9cca-553b9s9d1s88.xml
mv mm-gbz-bc-DeliveryObservation289251005-a230453f-6b0a-11ec-2410-020000000000.xml	medmij-gbz-bc-DeliveryObservation289251005-d238d44b-2062-11ec-2089-020000000000.xml
mv mm-gbz-bc-DeliveryObservation364332008-93918c8e-6b62-11ec-2396-020000000000.xml	medmij-gbz-bc-DeliveryObservation364332008-166579o5-8fde-12ec-3274-020000000000.xml
mv mm-gbz-bc-DeliveryObservation364343000-0b4c0093-6ac2-11ec-2424-020000000000.xml	medmij-gbz-bc-DeliveryObservation364343000-a239d44b-2062-11ec-2089-020000000000.xml
mv mm-gbz-bc-DeliveryObservation136311000146100-28a81d0f-6aba-11ec-2423-020000000000.xml	medmij-gbz-bc-DeliveryObservation136311000146100-d238d34c-2062-11ec-2089-020000000000.xml
mv mm-gbz-bc-DeliveryObservation160611000146102-52d3ab9a-6b77-11ec-2409-020000000000.xml	medmij-gbz-bc-DeliveryObservation160611000146102-8052cd55-f24d-46a4-a87a-e5f904c0b387.xml
mv mm-gbz-bc-DeliveryObservation160621000146107-3fd6453f-6b08-11ec-2408-020000000000.xml	medmij-gbz-bc-DeliveryObservation-160621000146107-ee4ffd82-7493-4d8a-a548-34ba6de8fbf5.xml
mv mm-gbz-bc-DeliveryProcedure236973005-765d253f-6ac5-11ec-2123-020000000000.xml	medmij-gbz-bc-DeliveryProcedure236973005-d135d241-2062-11ec-2089-020000000000.xml
#mv mm-gbz-bc-Encounter-7b82e263-6aff-11ec-1275-020000000000.xml	
#mv mm-gbz-bc-Encounter-52e660eb-6a9b-11ec-1275-020000000000.xml	
#mv mm-gbz-bc-Encounter-c326cab3-6b5d-11ec-1275-020000000000.xml	
mv mm-gbz-bc-FamilySituationAssessment423340009-9144d61e-6aa1-11ec-2291-020000000000.xml	medmij-gbz-bc-FamilySituationAssessment-193477a5-3fde-11ec-3274-020000000000.xml
mv mm-gbz-bc-FeedingPatternInfant289145007-92828b8e-6b78-11ec-2793-020000000000.xml	medmij-gbz-zib-FeedingPatternInfant-a2406b64-2391-14ec-8669-020000000000.xml
mv mm-gbz-bc-FeedingPatternInfant289145007-987528db-6acd-11ec-2793-020000000000.xml	medmij-gbz-zib-FeedingPatternInfant-a2406b64-2391-14ec-4667-020000000000.xml
mv mm-gbz-bc-MaternalObservation268467002-ea10863b-6ac8-11ec-2227-020000000000.xml	medmij-gbz-bc-MaternalObservation169740003-2-17-831-1-113883-2-4-5-107004321.xml
mv mm-gbz-bc-MaternalObservation1263932002-c1fabb6e-6ad0-11ec-1022-020000000000.xml	medmij-gbz-bc-MaternalObservation1263932002-b7806b34-2391-11rz-8263-020000000000.xml
mv mm-gbz-bc-MaternalObservation118791000146100-398c7da3-6b34-11ec-1023-020000000000.xml	medmij-gbz-bc-MaternalObservation118791000146100-b7106b24-2291-11ex-8663-020000000000.xml
mv mm-gbz-bc-MaternalObservation142961000146102-2156d262-6b68-11ec-2225-020000000000.xml	medmij-gbz-bc-MaternalObservation142961000146102-2-17-831-1-113773-2-4-5-107004321.xml
mv mm-gbz-bc-MaternalObservation160631000146109-bb5b30ba-6ab0-11ec-1074-020000000000.xml	medmij-gbz-bc-MaternalObservation160631000146109-a545d818-0a02-436c-82c3-2ed66d7ed397.xml
mv mm-gbz-bc-MaternalRecord-f720ebe3-6b47-11ec-0000-020000000000.xml	medmij-gbz-bc-MaternalRecord-0d479b8b-2064-12ec-1751-020000000000.xml
mv mm-gbz-bc-VitaminKAdministration698350008-7eeb5ff3-6b3a-11ec-1075-020000000000.xml	medmij-gbz-bc-VitaminKAdministration-193478a5-8fde-12ec-3274-020000000000.xml
mv mm-gbz-bc-Woman-KIM-K-XXX-ZHANGANAK-XXX-VISSER.xml	medmij-gbz-nl-core-patient-KIMXXX-ZHANGANAK.xml
#mv mm-gbz-nl-core-location-location-mm-gbz-2-16-840-1-113883-2-4-6-1-33112345.xml 
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-08001234.xml	medmij-gbz-nl-core-organization-2-16-840-1-113883-2-4-6-108004321.xml
#mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-08767234.xml	
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-33112345.xml	medmij-gbz-nl-core-organization-2-16-840-1-113883-2-4-6-108006591.xml
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-4-1000.xml	medmij-gbz-nl-core-organization-2-16-840-1-113883-2-4-6-108794321.xml
mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-123456001.xml	medmij-gbz-nl-core-practitioner-2-16-528-1-1007-3-112340001.xml
mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-123456781.xml	medmij-gbz-nl-core-practitioner-2-16-518-2-1007-3-115640001.xml
mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-12345600103-00008001234.xml medmij-gbz-nl-core-practitionerrole-1234560103-000.xml	
mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-12345678115153100014610833112345.xml	medmij-gbz-nl-core-practitionerrole-1234560123-120.xml
mv mm-gbz-nl-core-relatedperson-relatedperson-mm-gbz-TOONXXX-VISSER.xml	medmij-gbz-nl-core-relatedperson-507e646d-35fb-453a-8c75-6d69f817148c.xml
mv mm-gbz-zib-AlcoholUse228273003-dbe954eb-6aa7-11ec-1212-020000000000.xml	medmij-gbz-zib-AlcoholUse228273003-0d47afe5-2063-11ec-1752-020000000000.xml
mv mm-gbz-zib-ApgarScore9271-8-8a62f52a-6ad7-11ec-2967-020000000000.xml	medmij-gbz-zib-ApgarScore9271-8-a4907b81-2290-11ec-8669-020000000000.xml
mv mm-gbz-zib-ApgarScore9272-6-f8494c8e-6abd-11ec-2140-020000000000.xml	medmij-gbz-zib-ApgarScore9272-6-a4907b9r-2291-11ec-8669-020000000000.xml
mv mm-gbz-zib-ApgarScore9274-2-61a4252a-6b02-11ec-2966-020000000000.xml	medmij-gbz-zib-ApgarScore9274-2-a4912b60-2291-11ec-8669-020000000000.xml
mv mm-gbz-zib-BodyTemperature8310-5-30a52462-6b72-11ec-2279-020000000000.xml	medmij-gbz-zib-BodyTemperature8310-5-166578a5-8fde-12ec-3274-020000000000.xml
mv mm-gbz-zib-BodyTemperature8310-5-b8f6c35e-6b0d-11ec-2279-020000000000.xml	medmij-gbz-zib-BodyTemperature8310-5-193578a5-8fde-12ec-3274-020000000000.xml
mv mm-gbz-zib-BodyWeight8339-4-4679e087-6aa8-11ec-2141-020000000000.xml	medmij-gbz-zib-BodyWeight29463-7-a4506b72-2291-11ec-8669-020000000000.xml
mv mm-gbz-zib-BodyWeight29463-7-ae4034d3-6b4c-11ec-2107-020000000000.xml	medmij-gbz-zib-BodyWeight29463-7-d715d939-2012-11ec-1087-020000000000.xml
mv mm-gbz-zib-BodyWeight29463-7-de2a7353-6a97-11ec-2107-020000000000.xml	medmij-gbz-zib-BodyWeight29463-7-d735d999-2062-11ec-1087-020000000000.xml
mv mm-gbz-zib-FamilySituation365470003-0834cc24-6ac1-11ec-2171-020000000000.xml	medmij-gbz-zib-familySituation-365470003-0c08fb83-823f-84s2-op89-q26p85d7624l.xml
mv mm-gbz-zib-LivingSituation365508006-c382f161-6ac2-11ec-2172-020000000000.xml	medmij-gbz-zib-LivingSituation-2-17-831-1-113883-2-4-6-108004321.xml
mv mm-gbz-zib-Payer-Payer-mm-gbz-*.xml medmij-gbz-zib-Payer-1-12-839-1-113883-2-4-6-108004321.xml
mv mm-gbz-zib-ParticipationInSociety314845004-2d6f38a3-6abc-11ec-1269-020000000000.xml	medmij-gbz-zib-ParticipationInSociety-1c6e08c1-9edr-11ec-1563-020000000000.xml
mv mm-gbz-zib-Pregnancy-Gravidity11996-6-64cb4eb7-6b0d-11ec-2334-020000000000.xml	medmij-gbz-zib-Pregnancy-Gravidity161732006-0d47gec7-2063-11ec-1751-020000000000.xml
mv mm-gbz-zib-Pregnancy-Parity11977-6-123688e3-6b11-11ec-2334-020000000000.xml	medmij-gbz-zib-Pregnancy-Parity364325004-0d47afc6-2063-11ec-1749-020000000000.xml
mv mm-gbz-zib-Pregnancy118185001-80338356-6b6f-11ec-2334-020000000000.xml	medmij-gbz-zib-Pregnancy118185001-0d47afc5-1963-11ec-1751-020000000000.xml
mv mm-gbz-zib-Problem708014007-ecc8b67f-6a99-11ec-2259-020000000000.xml	medmij-gbz-zib-Problem708014007-a4918b3f-2221-11ec-8161-020000000000.xml
mv mm-gbz-zib-TobaccoUse365980008-a25bb5af-6b44-11ec-2224-020000000000.xml	medmij-gbz-zib-TobaccoUse365980008-0d47afe9-2063-11ec-1752-020000000000.xml
mv mm-gbz-bc-MaternalObservation365469004-271feecf-6b5c-11ec-2291-020000000000.xml medmij-gbz-bc-MaternalObservation-365469004-411bac7f4-0ffe-41c4-b616-67c86577689b.xml

echo Renaming in Kraam-Casus2 ...
cd ..
cp -rp ../../med_mij_kraam_beschikbaarstellen/fhir_instance/gz-izk-kwa-casus2 Kraam-Casus2
cd Kraam-Casus2

mv mm-gbz-bc-AbilityToTakeCareOfChild129879003-497712aa-6ac5-11ec-2998-020000000000.xml	medmij-gbz-bc-AbilityToTakeCareOfChild129879003-8b35ed8a-8d86-4b2d-ab59-f54d7d73c3d3.xml
mv mm-gbz-bc-Birth3950001-eb227a2d-6b38-11ec-2123-020000000000.xml	medmij-gbz-bc-BirthProcedure-76999b6b-54b7-4011-ae0b-7d80e1f939d7.xml
mv mm-gbz-bc-BirthObservation364336006-e483f236-6ae8-11ec-2414-020000000000.xml	medmij-gbz-bc-BirthObservation364336006-c11fcd4a-52e1-40ee-a0ea-345d27855fd1.xml
mv mm-gbz-bc-BirthObservation366344009-f8b8aff1-6ae5-11ec-2419-020000000000.xml	medmij-gbz-bc-BirthObservation366344009-705bafe7-eb0f-4b86-9cb9-d019668aea78.xml
#mv mm-gbz-bc-Child-LISA-L-XXX-HOLLANDERS.xml	
mv mm-gbz-bc-ChildObservation28263002-137d828a-6adc-11ec-2990-020000000000.xml	medmij-gbz-bc-ChildObservation28263002-032bce77-b64a-41ac-ab5b-725f4df3aac6.xml
mv mm-gbz-bc-ChildObservation77262006-39d28ef4-6ac2-11ec-1001-020000000000.xml	medmij-gbz-bc-ChildObservation77262006-ebe22663-1daa-49da-9e53-204ba166ad0f.xml
#mv mm-gbz-bc-ChildObservation364204002-d4b34e70-6ab5-11ec-2304-020000000000.xml	
mv mm-gbz-bc-ChildObservation364528001-22e409c2-6afc-11ec-2296-020000000000.xml	medmij-gbz-bc-ChildObservation364528001-133d66fe-bd73-491b-a74d-6f4e45860d0f.xml
mv mm-gbz-bc-ChildObservation364595007-3696aba2-6ad7-11ec-2988-020000000000.xml	medmij-gbz-bc-ChildObservation364595007-6205c97a-7769-417c-a5cd-fa2ad3179bf3.xml
mv mm-gbz-bc-ChildObservation404950004-101b752f-6b22-11ec-2989-020000000000.xml	medmij-gbz-bc-ChildObservation404950004-eba4e423-75e5-42b5-ba82-6227c2e5c40c.xml
mv mm-gbz-bc-DeliveryObservation168089007-e6af21bf-6b6c-11ec-2412-020000000000.xml	medmij-gbz-bc-DeliveryObservation-33b76a7f-7b7f-4177-a6cc-31da4b15e4b0.xml
mv mm-gbz-bc-DeliveryObservation236994008-8856b819-6b10-11ec-2421-020000000000.xml	medmij-gbz-bc-DeliveryObservation-236994008-f7e01114-1b2b-1404-9cca-116b7s7d1s77.xml
mv mm-gbz-bc-DeliveryObservation289251005-c1a3e3d5-6ad9-11ec-2410-020000000000.xml	medmij-gbz-bc-DeliveryObservation289251005-6d50a466-d9e2-448c-b4f0-037de56cab36.xml
mv mm-gbz-bc-DeliveryObservation364332008-28364cf5-6b56-11ec-2396-020000000000.xml	medmij-gbz-bc-DeliveryObservation364332008-b9be3a20-85a8-4c2a-8b10-a0f7c16712b3.xml
mv mm-gbz-bc-DeliveryObservation364343000-e6ae55c5-6b5b-11ec-2424-020000000000.xml	medmij-gbz-bc-DeliveryObservation364343000-0925e3d4-6481-45fd-b055-e59c2ed95071.xml
mv mm-gbz-bc-DeliveryObservation136311000146100-27cf4f3d-6b1f-11ec-2423-020000000000.xml	medmij-gbz-bc-DeliveryObservation136311000146100-d10955dd-cc03-431c-93f4-477a07acf832.xml
mv mm-gbz-bc-DeliveryObservation160611000146102-f3065ad3-6aa8-11ec-2409-020000000000.xml	medmij-gbz-bc-DeliveryObservation-160611000146102-d227a57f-b582-88b0-a1ea-dilqhs7a1d691.xml
mv mm-gbz-bc-DeliveryObservation160621000146107-9cc4f6a1-6af4-11ec-2408-020000000000.xml	medmij-gbz-bc-DeliveryObservation-160621000146107-9d497a46-fd9f-4ca6-b6d3-7f0f1cf72b63.xml
mv mm-gbz-bc-DeliveryProcedure236973005-d28f5c93-6b4b-11ec-2123-020000000000.xml	medmij-gbz-bc-DeliveryProcedure-7008a0cc-d174-4d0d-96cc-d6c418d727ee.xml
#mv mm-gbz-bc-Encounter-ba5eb7ff-6b12-11ec-1275-020000000000.xml
mv mm-gbz-bc-FamilySituationAssessment423340009-9471d6ae-6abc-11ec-2291-020000000000.xml	medmij-gbz-bc-FamilySituationAssessment-e18ec7c1-688c-42a4-8363-05e8f5e6dbe4.xml
mv mm-gbz-bc-FeedingPatternInfant289145007-3943c045-6ab7-11ec-2793-020000000000.xml	medmij-gbz-zib-FeedingPatternInfant-9853b17d-c3de-495e-a9b9-8c465bd128a4.xml
mv mm-gbz-bc-MaternalObservation268467002-4b2d77d6-6abe-11ec-2227-020000000000.xml	medmij-gbz-bc-MaternalObservation169740003-8469601b-1169-4a16-aa6f-aef7a9a46fda.xml
mv mm-gbz-bc-MaternalObservation142961000146102-1d567cc3-6acc-11ec-2225-020000000000.xml	medmij-gbz-bc-MaternalObservation142961000146102-843aea08-4197-475c-95c3-0ed9b0b895cf.xml
mv mm-gbz-bc-MaternalObservation160631000146109-c60d8749-6abc-11ec-1074-020000000000.xml	medmij-gbz-bc-MaternalObservation160631000146109-305ef6b3-dff3-4944-950c-32486d4c801b.xml
mv mm-gbz-bc-MaternalRecord-95b12773-6ada-11ec-0000-020000000000.xml	medmij-gbz-bc-MaternalRecord-ef612ccb-86ea-4bb9-80e8-f68dbd83b290.xml
mv mm-gbz-bc-VitaminKAdministration698350008-8098fff4-6b20-11ec-1075-020000000000.xml	medmij-gbz-bc-VitaminKAdministration-62c5fa2e-a318-4b54-b8cc-21dd2b3366e4.xml
mv mm-gbz-bc-Woman-LINDA-L-XXX-HOLLANDERS.xml	medmij-gbz-nl-core-patient-LINDAXXX-HOLLANDERS.xml
#mv mm-gbz-nl-core-location-location-mm-gbz-2-16-840-1-113883-2-4-6-1-08767234.xml	
#mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-08001234.xml	
mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-08767234.xml	medmij-gbz-nl-core-organization40a30cd5-7dcd-19i8-357l-5976hre248o6.xml
#mv mm-gbz-nl-core-organization-organization-mm-gbz-2-16-840-1-113883-2-4-6-1-33112345.xml	
mv mm-gbz-nl-core-organization-organization-mm-gbz-974383de-6aec-11ec-2129-020000000000.xml	medmij-gbz-nl-core-organization21973780-dfe2-4434-9c2e-c5c6cb2b9f26.xml
mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-98765432.xml	medmij-gbz-nl-core-practitioner-30542d7e-35ea-420a-ab1e-3b617d4e2a6d.xml
#mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-123456001.xml	
#mv mm-gbz-nl-core-practitioner-practitioner-mm-gbz-2-16-528-1-1007-3-1-123456781.xml	
mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-9876543201-04608767234.xml	medmij-gbz-nl-core-practitionerrole-a2860844-36a5-484b-a7e2-f61c7a36542b.xml
#mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-12345600103-00008001234.xml	
#mv mm-gbz-nl-core-practitionerrole-practitionerrole-mm-gbz-12345678115153100014610833112345.xml	
#mv mm-gbz-nl-core-relatedperson-relatedperson-mm-gbz-81ae9d40-6b0f-11ec-1294-020000000000.xml	
mv mm-gbz-zib-AlcoholUse228273003-1910b595-6aba-11ec-1212-020000000000.xml	medmij-gbz-zib-AlcoholUse228273003-48c8a133-ec39-4907-ba76-b1c5eb98bd95.xml
mv mm-gbz-zib-ApgarScore9271-8-6b7fa113-6b67-11ec-2967-020000000000.xml	medmij-gbz-zib-ApgarScore9271-8-2b619c6c-ef73-414c-bff7-8dfec68908d3.xml
mv mm-gbz-zib-ApgarScore9272-6-f6da5388-6aa9-11ec-2140-020000000000.xml	medmij-gbz-zib-ApgarScore9272-6-034d969e-9173-434e-b226-f55434114da8.xml
mv mm-gbz-zib-ApgarScore9274-2-1b501113-6b5e-11ec-2966-020000000000.xml	medmij-gbz-zib-ApgarScore9274-2-8f1b03cf-a992-4783-b729-4d5b3103dd4f.xml
mv mm-gbz-zib-BodyTemperature8310-5-4035d925-6b47-11ec-2279-020000000000.xml	medmij-gbz-zib-BodyTemperature8310-5-2e8a5c41-c50a-4e3f-9b2c-7ad101629fa5.xml
# 2350g
mv mm-gbz-zib-BodyWeight8339-4-0885390b-6b1c-11ec-2141-020000000000.xml	medmij-gbz-zib-BodyWeight29463-7-633d4179-25da-43fa-91a0-8e47a90ce00c0000.xml
# 2380g
mv mm-gbz-zib-BodyWeight29463-7-2e1fe38d-6ade-11ec-2107-020000000000.xml	medmij-gbz-zib-BodyWeight29463-7-eb03e27b-6e0e-4d13-8c26-addfbb7a7549.xml
# 1980g
mv mm-gbz-zib-BodyWeight29463-7-7dec281a-6a9b-11ec-2107-020000000000.xml	medmij-gbz-zib-BodyWeight29463-7-633d4179-25da-43fa-91a0-8e47a90ce00c.xml

mv mm-gbz-zib-DrugUse228366006-452307dd-6b55-11ec-1211-020000000000.xml	medmij-gbz-bc-zib-DrugUse-228366006-6afb07e2-e295-4f1c-9159-f927e7nak23b.xml
#mv mm-gbz-zib-FamilySituation365470003-a638b16a-6b38-11ec-2171-020000000000.xml	
mv mm-gbz-zib-FamilySituationChild55801000146105-c4b3b173-6b4b-11ec-2292-020000000000.xml	medmij-gbz-zib-FamilySituationChild-55801000146105-40a30cd5-5fqo-47b3-492j-5ea8c4978261.xml
mv mm-gbz-zib-LivingSituation365508006-48285d5b-6b47-11ec-2172-020000000000.xml	medmij-gbz-zib-LivingSituation-1c367e3a-91af-4630-937d-9246e6f2cff9.xml
mv mm-gbz-zib-ParticipationInSociety314845004-f96eecad-6b31-11ec-1269-020000000000.xml	medmij-gbz-zib-ParticipationInSociety-44bac7f4-0ffe-41b3-b616-67c79947519b.xml
mv mm-gbz-zib-Payer-Payer-mm-gbz-18c003de-6b37-11ec-2129-020000000000-1.xml medmij-gbz-zib-Payer-cea49e7e-68ba-470c-9943-e2229dd28707.xml
mv mm-gbz-zib-Pregnancy-Gravidity11996-6-8c304c65-6acb-11ec-2334-020000000000.xml	medmij-gbz-zib-Pregnancy-Gravidity161732006-2-98854706-998c-4fcb-9df3-7720e151fb27.xml
mv mm-gbz-zib-Pregnancy-Parity11977-6-d7c2c7d9-6b57-11ec-2334-020000000000.xml	medmij-gbz-zib-Pregnancy-Parity364325004-2-da1db3bd-6722-4736-adc1-f96a0722a4f5.xml
mv mm-gbz-zib-Pregnancy118185001-1263f55d-6b51-11ec-2334-020000000000.xml	medmij-gbz-zib-Pregnancy118185001-9fa7c03a-34f0-46a3-ae03-0f03a99e9215.xml
mv mm-gbz-zib-Problem160933000-e5759c91-6b69-11ec-2259-020000000000.xml	medmij-gbz-zib-Problem160933000-e634660f-1b9d-4de6-be58-bfd601fe98eb.xml
#mv mm-gbz-zib-TobaccoUse365980008-97f88123-6b63-11ec-2224-020000000000.xml	