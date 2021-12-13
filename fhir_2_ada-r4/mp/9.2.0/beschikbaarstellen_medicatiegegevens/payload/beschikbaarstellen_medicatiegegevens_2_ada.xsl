<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir"
	xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">

	<!-- TODO currently the 907 version, we should upgrade to 920 -->
	<xsl:import href="../../../../../fhir_2_ada/mp/fhir_2_ada_mp_include.xsl"/>
	<xsl:import href="../../../../zibs2020/payload/zib_latest_package.xsl"/>
	<xsl:output indent="yes"/>


	<xd:doc>
		<xd:desc> 
			The ·value space· of ID is the set of all strings that ·match· the NCName production in [Namespaces in XML].
			The ·lexical space· of ID is the set of all strings that ·match· the NCName production in [Namespaces in XML].
			The ·base type· of ID is NCName. 
			NCName 	::= 	(Letter | '_') (NCNameChar)*
			NCNameChar 	::= 	Letter | Digit | '.' | '-' | '_' | CombiningChar | Extender
			Letter	   ::=   	BaseChar | Ideographic    !!! =:regexpr /i minus '!'
or			
NCName 	::= 	(\i | '_') (\i | Digit | '.' | '-' | '_' | CombiningChar | Extender)* 
or
NCName 	::= 	(\i | '_') (\i | 
[#x0030-#x0039] | [#x0660-#x0669] | [#x06F0-#x06F9] | [#x0966-#x096F] | [#x09E6-#x09EF] | [#x0A66-#x0A6F] | [#x0AE6-#x0AEF] | [#x0B66-#x0B6F] | [#x0BE7-#x0BEF] | [#x0C66-#x0C6F] | [#x0CE6-#x0CEF] | [#x0D66-#x0D6F] | [#x0E50-#x0E59] | [#x0ED0-#x0ED9] | [#x0F20-#x0F29] | '.' | '-' | '_' |
[#x0300-#x0345] | [#x0360-#x0361] | [#x0483-#x0486] | [#x0591-#x05A1] | [#x05A3-#x05B9] | [#x05BB-#x05BD] | #x05BF | [#x05C1-#x05C2] | #x05C4 | [#x064B-#x0652] | #x0670 | [#x06D6-#x06DC] | [#x06DD-#x06DF] | [#x06E0-#x06E4] | [#x06E7-#x06E8] | [#x06EA-#x06ED] | [#x0901-#x0903] | #x093C | [#x093E-#x094C] | #x094D | [#x0951-#x0954] | [#x0962-#x0963] | [#x0981-#x0983] | #x09BC | #x09BE | #x09BF | [#x09C0-#x09C4] | [#x09C7-#x09C8] | [#x09CB-#x09CD] | #x09D7 | [#x09E2-#x09E3] | #x0A02 | #x0A3C | #x0A3E | #x0A3F | [#x0A40-#x0A42] | [#x0A47-#x0A48] | [#x0A4B-#x0A4D] | [#x0A70-#x0A71] | [#x0A81-#x0A83] | #x0ABC | [#x0ABE-#x0AC5] | [#x0AC7-#x0AC9] | [#x0ACB-#x0ACD] | [#x0B01-#x0B03] | #x0B3C | [#x0B3E-#x0B43] | [#x0B47-#x0B48] | [#x0B4B-#x0B4D] | [#x0B56-#x0B57] | [#x0B82-#x0B83] | [#x0BBE-#x0BC2] | [#x0BC6-#x0BC8] | [#x0BCA-#x0BCD] | #x0BD7 | [#x0C01-#x0C03] | [#x0C3E-#x0C44] | [#x0C46-#x0C48] | [#x0C4A-#x0C4D] | [#x0C55-#x0C56] | [#x0C82-#x0C83] | [#x0CBE-#x0CC4] | [#x0CC6-#x0CC8] | [#x0CCA-#x0CCD] | [#x0CD5-#x0CD6] | [#x0D02-#x0D03] | [#x0D3E-#x0D43] | [#x0D46-#x0D48] | [#x0D4A-#x0D4D] | #x0D57 | #x0E31 | [#x0E34-#x0E3A] | [#x0E47-#x0E4E] | #x0EB1 | [#x0EB4-#x0EB9] | [#x0EBB-#x0EBC] | [#x0EC8-#x0ECD] | [#x0F18-#x0F19] | #x0F35 | #x0F37 | #x0F39 | #x0F3E | #x0F3F | [#x0F71-#x0F84] | [#x0F86-#x0F8B] | [#x0F90-#x0F95] | #x0F97 | [#x0F99-#x0FAD] | [#x0FB1-#x0FB7] | #x0FB9 | [#x20D0-#x20DC] | #x20E1 | [#x302A-#x302F] | #x3099 | #x309A 
| #x00B7 | #x02D0 | #x02D1 | #x0387 | #x0640 | #x0E46 | #x0EC6 | #x3005 | [#x3031-#x3035] | [#x309D-#x309E] | [#x30FC-#x30FE])* 

or // no duplicates

NCName 	::= 	(/i | 
[#x0030-#x0039] | [#x0660-#x0669] | [#x06F0-#x06F9] | [#x0966-#x096F] | [#x09E6-#x09EF] | [#x0A66-#x0A6F] | [#x0AE6-#x0AEF] | [#x0B66-#x0B6F] | [#x0BE7-#x0BEF] | [#x0C66-#x0C6F] | [#x0CE6-#x0CEF] | [#x0D66-#x0D6F] | [#x0E50-#x0E59] | [#x0ED0-#x0ED9] | [#x0F20-#x0F29] | '.' | '-' | '_' |
[#x0300-#x0345] | [#x0360-#x0361] | [#x0483-#x0486] | [#x0591-#x05A1] | [#x05A3-#x05B9] | [#x05BB-#x05BD] | #x05BF | [#x05C1-#x05C2] | #x05C4 | [#x064B-#x0652] | #x0670 | [#x06D6-#x06DC] | [#x06DD-#x06DF] | [#x06E0-#x06E4] | [#x06E7-#x06E8] | [#x06EA-#x06ED] | [#x0901-#x0903] | #x093C | [#x093E-#x094C] | #x094D | [#x0951-#x0954] | [#x0962-#x0963] | [#x0981-#x0983] | #x09BC | #x09BE | #x09BF | [#x09C0-#x09C4] | [#x09C7-#x09C8] | [#x09CB-#x09CD] | #x09D7 | [#x09E2-#x09E3] | #x0A02 | #x0A3C | #x0A3E | #x0A3F | [#x0A40-#x0A42] | [#x0A47-#x0A48] | [#x0A4B-#x0A4D] | [#x0A70-#x0A71] | [#x0A81-#x0A83] | #x0ABC | [#x0ABE-#x0AC5] | [#x0AC7-#x0AC9] | [#x0ACB-#x0ACD] | [#x0B01-#x0B03] | #x0B3C | [#x0B3E-#x0B43] | [#x0B47-#x0B48] | [#x0B4B-#x0B4D] | [#x0B56-#x0B57] | [#x0B82-#x0B83] | [#x0BBE-#x0BC2] | [#x0BC6-#x0BC8] | [#x0BCA-#x0BCD] | #x0BD7 | [#x0C01-#x0C03] | [#x0C3E-#x0C44] | [#x0C46-#x0C48] | [#x0C4A-#x0C4D] | [#x0C55-#x0C56] | [#x0C82-#x0C83] | [#x0CBE-#x0CC4] | [#x0CC6-#x0CC8] | [#x0CCA-#x0CCD] | [#x0CD5-#x0CD6] | [#x0D02-#x0D03] | [#x0D3E-#x0D43] | [#x0D46-#x0D48] | [#x0D4A-#x0D4D] | #x0D57 | #x0E31 | [#x0E34-#x0E3A] | [#x0E47-#x0E4E] | #x0EB1 | [#x0EB4-#x0EB9] | [#x0EBB-#x0EBC] | [#x0EC8-#x0ECD] | [#x0F18-#x0F19] | #x0F35 | #x0F37 | #x0F39 | #x0F3E | #x0F3F | [#x0F71-#x0F84] | [#x0F86-#x0F8B] | [#x0F90-#x0F95] | #x0F97 | [#x0F99-#x0FAD] | [#x0FB1-#x0FB7] | #x0FB9 | [#x20D0-#x20DC] | #x20E1 | [#x302A-#x302F] | #x3099 | #x309A 
| #x00B7 | #x02D0 | #x02D1 | #x0387 | #x0640 | #x0E46 | #x0EC6 | #x3005 | [#x3031-#x3035] | [#x309D-#x309E] | [#x30FC-#x30FE])* 

or // in xml
NCName 	::= 	(/i | 
[&#x0030;-&#x0039;] | [&#x0660;-&#x0669;] | [&#x06F0;-&#x06F9;] | [&#x0966;-&#x096F;] | [&#x09E6;-&#x09EF;] | [&#x0A66;-&#x0A6F;] | [&#x0AE6;-&#x0AEF;] | [&#x0B66;-&#x0B6F;] | [&#x0BE7;-&#x0BEF;] | [&#x0C66;-&#x0C6F;] | [&#x0CE6;-&#x0CEF;] | [&#x0D66;-&#x0D6F;] | [&#x0E50;-&#x0E59;] | [&#x0ED0;-&#x0ED9;] | [&#x0F20;-&#x0F29;] | '.' | '-' | '_' | [&#x0300;-&#x0345;] | [&#x0360;-&#x0361;] | [&#x0483;-&#x0486;] | [&#x0591;-&#x05A1;] | [&#x05A3;-&#x05B9;] | [&#x05BB;-&#x05BD;] | &#x05BF; | [&#x05C1;-&#x05C2;] | &#x05C4; | [&#x064B;-&#x0652;] | &#x0670; | [&#x06D6;-&#x06DC;] | [&#x06DD;-&#x06DF;] | [&#x06E0;-&#x06E4;] | [&#x06E7;-&#x06E8;] | [&#x06EA;-&#x06ED;] | [&#x0901;-&#x0903;] | &#x093C; | [&#x093E;-&#x094C;] | &#x094D; | [&#x0951;-&#x0954;] | [&#x0962;-&#x0963;] | [&#x0981;-&#x0983;] | &#x09BC; | &#x09BE; | &#x09BF; | [&#x09C0;-&#x09C4;] | [&#x09C7;-&#x09C8;] | [&#x09CB;-&#x09CD;] | &#x09D7; | [&#x09E2;-&#x09E3;] | &#x0A02; | &#x0A3C; | &#x0A3E; | &#x0A3F; | [&#x0A40;-&#x0A42;] | [&#x0A47;-&#x0A48;] | [&#x0A4B;-&#x0A4D;] | [&#x0A70;-&#x0A71;] | [&#x0A81;-&#x0A83;] | &#x0ABC; | [&#x0ABE;-&#x0AC5;] | [&#x0AC7;-&#x0AC9;] | [&#x0ACB;-&#x0ACD;] | [&#x0B01;-&#x0B03;] | &#x0B3C; | [&#x0B3E;-&#x0B43;] | [&#x0B47;-&#x0B48;] | [&#x0B4B;-&#x0B4D;] | [&#x0B56;-&#x0B57;] | [&#x0B82;-&#x0B83;] | [&#x0BBE;-&#x0BC2;] | [&#x0BC6;-&#x0BC8;] | [&#x0BCA;-&#x0BCD;] | &#x0BD7; | [&#x0C01;-&#x0C03;] | [&#x0C3E;-&#x0C44;] | [&#x0C46;-&#x0C48;] | [&#x0C4A;-&#x0C4D;] | [&#x0C55;-&#x0C56;] | [&#x0C82;-&#x0C83;] | [&#x0CBE;-&#x0CC4;] | [&#x0CC6;-&#x0CC8;] | [&#x0CCA;-&#x0CCD;] | [&#x0CD5;-&#x0CD6;] | [&#x0D02;-&#x0D03;] | [&#x0D3E;-&#x0D43;] | [&#x0D46;-&#x0D48;] | [&#x0D4A;-&#x0D4D;] | &#x0D57; | &#x0E31; | [&#x0E34;-&#x0E3A;] | [&#x0E47;-&#x0E4E;] | &#x0EB1; | [&#x0EB4;-&#x0EB9;] | [&#x0EBB;-&#x0EBC;] | [&#x0EC8;-&#x0ECD;] | [&#x0F18;-&#x0F19;] | &#x0F35; | &#x0F37; | &#x0F39; | &#x0F3E; | &#x0F3F; | [&#x0F71;-&#x0F84;] | [&#x0F86;-&#x0F8B;] | [&#x0F90;-&#x0F95;] | &#x0F97; | [&#x0F99;-&#x0FAD;] | [&#x0FB1;-&#x0FB7;] | &#x0FB9; | [&#x20D0;-&#x20DC;] | &#x20E1; | [&#x302A;-&#x302F;] | &#x3099; | &#x309A; | &#x00B7; | &#x02D0; | &#x02D1; | &#x0387; | &#x0640; | &#x0E46; | &#x0EC6; | &#x3005; | [&#x3031;-&#x3035;] | [&#x309D;-&#x309E;] | [&#x30FC;-&#x30FE;])* 

			BaseChar	   ::=			
			[#x0041-#x005A] | [#x0061-#x007A] | [#x00C0-#x00D6] | [#x00D8-#x00F6] | [#x00F8-#x00FF] | [#x0100-#x0131] | [#x0134-#x013E] | [#x0141-#x0148] | [#x014A-#x017E] | [#x0180-#x01C3] | [#x01CD-#x01F0] | [#x01F4-#x01F5] | [#x01FA-#x0217] | [#x0250-#x02A8] | [#x02BB-#x02C1] | #x0386 | [#x0388-#x038A] | #x038C | [#x038E-#x03A1] | [#x03A3-#x03CE] | [#x03D0-#x03D6] | #x03DA | #x03DC | #x03DE | #x03E0 | [#x03E2-#x03F3] | [#x0401-#x040C] | [#x040E-#x044F] | [#x0451-#x045C] | [#x045E-#x0481] | [#x0490-#x04C4] | [#x04C7-#x04C8] | [#x04CB-#x04CC] | [#x04D0-#x04EB] | [#x04EE-#x04F5] | [#x04F8-#x04F9] | [#x0531-#x0556] | #x0559 | [#x0561-#x0586] | [#x05D0-#x05EA] | [#x05F0-#x05F2] | [#x0621-#x063A] | [#x0641-#x064A] | [#x0671-#x06B7] | [#x06BA-#x06BE] | [#x06C0-#x06CE] | [#x06D0-#x06D3] | #x06D5 | [#x06E5-#x06E6] | [#x0905-#x0939] | #x093D | [#x0958-#x0961] | [#x0985-#x098C] | [#x098F-#x0990] | [#x0993-#x09A8] | [#x09AA-#x09B0] | #x09B2 | [#x09B6-#x09B9] | [#x09DC-#x09DD] | [#x09DF-#x09E1] | [#x09F0-#x09F1] | [#x0A05-#x0A0A] | [#x0A0F-#x0A10] | [#x0A13-#x0A28] | [#x0A2A-#x0A30] | [#x0A32-#x0A33] | [#x0A35-#x0A36] | [#x0A38-#x0A39] | [#x0A59-#x0A5C] | #x0A5E | [#x0A72-#x0A74] | [#x0A85-#x0A8B] | #x0A8D | [#x0A8F-#x0A91] | [#x0A93-#x0AA8] | [#x0AAA-#x0AB0] | [#x0AB2-#x0AB3] | [#x0AB5-#x0AB9] | #x0ABD | #x0AE0 | [#x0B05-#x0B0C] | [#x0B0F-#x0B10] | [#x0B13-#x0B28] | [#x0B2A-#x0B30] | [#x0B32-#x0B33] | [#x0B36-#x0B39] | #x0B3D | [#x0B5C-#x0B5D] | [#x0B5F-#x0B61] | [#x0B85-#x0B8A] | [#x0B8E-#x0B90] | [#x0B92-#x0B95] | [#x0B99-#x0B9A] | #x0B9C | [#x0B9E-#x0B9F] | [#x0BA3-#x0BA4] | [#x0BA8-#x0BAA] | [#x0BAE-#x0BB5] | [#x0BB7-#x0BB9] | [#x0C05-#x0C0C] | [#x0C0E-#x0C10] | [#x0C12-#x0C28] | [#x0C2A-#x0C33] | [#x0C35-#x0C39] | [#x0C60-#x0C61] | [#x0C85-#x0C8C] | [#x0C8E-#x0C90] | [#x0C92-#x0CA8] | [#x0CAA-#x0CB3] | [#x0CB5-#x0CB9] | #x0CDE | [#x0CE0-#x0CE1] | [#x0D05-#x0D0C] | [#x0D0E-#x0D10] | [#x0D12-#x0D28] | [#x0D2A-#x0D39] | [#x0D60-#x0D61] | [#x0E01-#x0E2E] | #x0E30 | [#x0E32-#x0E33] | [#x0E40-#x0E45] | [#x0E81-#x0E82] | #x0E84 | [#x0E87-#x0E88] | #x0E8A | #x0E8D | [#x0E94-#x0E97] | [#x0E99-#x0E9F] | [#x0EA1-#x0EA3] | #x0EA5 | #x0EA7 | [#x0EAA-#x0EAB] | [#x0EAD-#x0EAE] | #x0EB0 | [#x0EB2-#x0EB3] | #x0EBD | [#x0EC0-#x0EC4] | [#x0F40-#x0F47] | [#x0F49-#x0F69] | [#x10A0-#x10C5] | [#x10D0-#x10F6] | #x1100 | [#x1102-#x1103] | [#x1105-#x1107] | #x1109 | [#x110B-#x110C] | [#x110E-#x1112] | #x113C | #x113E | #x1140 | #x114C | #x114E | #x1150 | [#x1154-#x1155] | #x1159 | [#x115F-#x1161] | #x1163 | #x1165 | #x1167 | #x1169 | [#x116D-#x116E] | [#x1172-#x1173] | #x1175 | #x119E | #x11A8 | #x11AB | [#x11AE-#x11AF] | [#x11B7-#x11B8] | #x11BA | [#x11BC-#x11C2] | #x11EB | #x11F0 | #x11F9 | [#x1E00-#x1E9B] | [#x1EA0-#x1EF9] | [#x1F00-#x1F15] | [#x1F18-#x1F1D] | [#x1F20-#x1F45] | [#x1F48-#x1F4D] | [#x1F50-#x1F57] | #x1F59 | #x1F5B | #x1F5D | [#x1F5F-#x1F7D] | [#x1F80-#x1FB4] | [#x1FB6-#x1FBC] | #x1FBE | [#x1FC2-#x1FC4] | [#x1FC6-#x1FCC] | [#x1FD0-#x1FD3] | [#x1FD6-#x1FDB] | [#x1FE0-#x1FEC] | [#x1FF2-#x1FF4] | [#x1FF6-#x1FFC] | #x2126 | [#x212A-#x212B] | #x212E | [#x2180-#x2182] | [#x3041-#x3094] | [#x30A1-#x30FA] | [#x3105-#x312C] | [#xAC00-#xD7A3] 
			
			Ideographic	   ::=   	[#x4E00-#x9FA5] | #x3007 | [#x3021-#x3029] 
			
			CombiningChar	   ::=   	[#x0300-#x0345] | [#x0360-#x0361] | [#x0483-#x0486] | [#x0591-#x05A1] | [#x05A3-#x05B9] | [#x05BB-#x05BD] | #x05BF | [#x05C1-#x05C2] | #x05C4 | [#x064B-#x0652] | #x0670 | [#x06D6-#x06DC] | [#x06DD-#x06DF] | [#x06E0-#x06E4] | [#x06E7-#x06E8] | [#x06EA-#x06ED] | [#x0901-#x0903] | #x093C | [#x093E-#x094C] | #x094D | [#x0951-#x0954] | [#x0962-#x0963] | [#x0981-#x0983] | #x09BC | #x09BE | #x09BF | [#x09C0-#x09C4] | [#x09C7-#x09C8] | [#x09CB-#x09CD] | #x09D7 | [#x09E2-#x09E3] | #x0A02 | #x0A3C | #x0A3E | #x0A3F | [#x0A40-#x0A42] | [#x0A47-#x0A48] | [#x0A4B-#x0A4D] | [#x0A70-#x0A71] | [#x0A81-#x0A83] | #x0ABC | [#x0ABE-#x0AC5] | [#x0AC7-#x0AC9] | [#x0ACB-#x0ACD] | [#x0B01-#x0B03] | #x0B3C | [#x0B3E-#x0B43] | [#x0B47-#x0B48] | [#x0B4B-#x0B4D] | [#x0B56-#x0B57] | [#x0B82-#x0B83] | [#x0BBE-#x0BC2] | [#x0BC6-#x0BC8] | [#x0BCA-#x0BCD] | #x0BD7 | [#x0C01-#x0C03] | [#x0C3E-#x0C44] | [#x0C46-#x0C48] | [#x0C4A-#x0C4D] | [#x0C55-#x0C56] | [#x0C82-#x0C83] | [#x0CBE-#x0CC4] | [#x0CC6-#x0CC8] | [#x0CCA-#x0CCD] | [#x0CD5-#x0CD6] | [#x0D02-#x0D03] | [#x0D3E-#x0D43] | [#x0D46-#x0D48] | [#x0D4A-#x0D4D] | #x0D57 | #x0E31 | [#x0E34-#x0E3A] | [#x0E47-#x0E4E] | #x0EB1 | [#x0EB4-#x0EB9] | [#x0EBB-#x0EBC] | [#x0EC8-#x0ECD] | [#x0F18-#x0F19] | #x0F35 | #x0F37 | #x0F39 | #x0F3E | #x0F3F | [#x0F71-#x0F84] | [#x0F86-#x0F8B] | [#x0F90-#x0F95] | #x0F97 | [#x0F99-#x0FAD] | [#x0FB1-#x0FB7] | #x0FB9 | [#x20D0-#x20DC] | #x20E1 | [#x302A-#x302F] | #x3099 | #x309A 			
			
			Extender	   ::=   	#x00B7 | #x02D0 | #x02D1 | #x0387 | #x0640 | #x0E46 | #x0EC6 | #x3005 | [#x3031-#x3035] | [#x309D-#x309E] | [#x30FC-#x30FE] 
			
			Digit	   ::=   	[#x0030-#x0039] | [#x0660-#x0669] | [#x06F0-#x06F9] | [#x0966-#x096F] | [#x09E6-#x09EF] | [#x0A66-#x0A6F] | [#x0AE6-#x0AEF] | [#x0B66-#x0B6F] | [#x0BE7-#x0BEF] | [#x0C66-#x0C6F] | [#x0CE6-#x0CEF] | [#x0D66-#x0D6F] | [#x0E50-#x0E59] | [#x0ED0-#x0ED9] | [#x0F20-#x0F29] 
		
			\i	the set of initial name characters, those ·match·ed by: Letter | '_' | ':'
			\c	the set of name characters, those ·match·ed by: NameChar
			\C	::= [^\c]
			
			replace non-permitted chars in an xml ID (type xs:ID) [\i-[:]][\c-[:]]* in
			targets (bouwstenen element) zorgaanbieder@id, zorgverlener@id, farmaceutisch_product@id.
			And the corresponding references to them zorgaanbieder@value, zorgverlener@value, farmaceutisch_product@value
		</xd:desc>
		<xd:param name="stringIn"/>
	</xd:doc>


	<xsl:function name="nf:replaceChar">
		<!--xxwim TODO remove multiples in $pelstring-->
		<xsl:param name="charStringInAndtestChar"/><!--replaced &#x09EF; &#x09EE;-->
		<xsl:variable name="NCNameChars"  select="'\i|[&#x0030;-&#x0039;]|[&#x0660;-&#x0669;]|[&#x06F0;-&#x06F9;]|[&#x0966;-&#x096F;]|[&#x09E6;-&#x09EF;]|[&#x0A66;-&#x0A6F;]|[&#x0AE6;-&#x0AEF;]|[&#x0B66;-&#x0B6F;]|[&#x0BE7;-&#x0BEF;]|[&#x0C66;-&#x0C6F;]|[&#x0CE6;-&#x0CEF;]|[&#x0D66;-&#x0D6F;]|[&#x0E50;-&#x0E59;]|[&#x0ED0;-&#x0ED9;]|[&#x0F20;-&#x0F29;]\.|\-|_|[&#x0300;-&#x0345;]|[&#x0360;-&#x0361;]|[&#x0483;-&#x0486;]|[&#x0591;-&#x05A1;]|[&#x05A3;-&#x05B9;]|[&#x05BB;-&#x05BD;]|&#x05BF;|[&#x05C1;-&#x05C2;]|&#x05C4;|[&#x064B;-&#x0652;]|&#x0670;|[&#x06D6;-&#x06DC;]|[&#x06DD;-&#x06DF;]|[&#x06E0;-&#x06E4;]|[&#x06E7;-&#x06E8;]|[&#x06EA;-&#x06ED;]|[&#x0901;-&#x0903;]|&#x093C;|[&#x093E;-&#x094C;]|&#x094D;|[&#x0951;-&#x0954;]|[&#x0962;-&#x0963;]|[&#x0981;-&#x0983;]|&#x09BC;|&#x09BE;|&#x09BF;|[&#x09C0;-&#x09C4;]|[&#x09C7;-&#x09C8;]|[&#x09CB;-&#x09CD;]|&#x09D7;|[&#x09E2;-&#x09E3;]|&#x0A02;|&#x0A3C;|&#x0A3E;|&#x0A3F;|[&#x0A40;-&#x0A42;]|[&#x0A47;-&#x0A48;]|[&#x0A4B;-&#x0A4D;]|[&#x0A70;-&#x0A71;]|[&#x0A81;-&#x0A83;]|&#x0ABC;|[&#x0ABE;-&#x0AC5;]|[&#x0AC7;-&#x0AC9;]|[&#x0ACB;-&#x0ACD;]|[&#x0B01;-&#x0B03;]|&#x0B3C;|[&#x0B3E;-&#x0B43;]|[&#x0B47;-&#x0B48;]|[&#x0B4B;-&#x0B4D;]|[&#x0B56;-&#x0B57;]|[&#x0B82;-&#x0B83;]|[&#x0BBE;-&#x0BC2;]|[&#x0BC6;-&#x0BC8;]|[&#x0BCA;-&#x0BCD;]|&#x0BD7;|[&#x0C01;-&#x0C03;]|[&#x0C3E;-&#x0C44;]|[&#x0C46;-&#x0C48;]|[&#x0C4A;-&#x0C4D;]|[&#x0C55;-&#x0C56;]|[&#x0C82;-&#x0C83;]|[&#x0CBE;-&#x0CC4;]|[&#x0CC6;-&#x0CC8;]|[&#x0CCA;-&#x0CCD;]|[&#x0CD5;-&#x0CD6;]|[&#x0D02;-&#x0D03;]|[&#x0D3E;-&#x0D43;]|[&#x0D46;-&#x0D48;]|[&#x0D4A;-&#x0D4D;]|&#x0D57;|&#x0E31;|[&#x0E34;-&#x0E3A;]|[&#x0E47;-&#x0E4E;]|&#x0EB1;|[&#x0EB4;-&#x0EB9;]|[&#x0EBB;-&#x0EBC;]|[&#x0EC8;-&#x0ECD;]|[&#x0F18;-&#x0F19;]|&#x0F35;|&#x0F37;|&#x0F39;|&#x0F3E;|&#x0F3F;|[&#x0F71;-&#x0F84;]|[&#x0F86;-&#x0F8B;]|[&#x0F90;-&#x0F95;]|&#x0F97;|[&#x0F99;-&#x0FAD;]|[&#x0FB1;-&#x0FB7;]|&#x0FB9;|[&#x20D0;-&#x20DC;]|&#x20E1;|[&#x302A;-&#x302F;]|&#x3099;|&#x309A;|&#x00B7;|&#x02D0;|&#x02D1;|&#x0387;|&#x0640;|&#x0E46;|&#x0EC6;|&#x3005;|[&#x3031;-&#x3035;]|[&#x309D;-&#x309E;]|[&#x30FC;-&#x30FE;]'"/>

		<xsl:variable name="pelString" select="subsequence($charStringInAndtestChar, 1, 1)"/>
		<xsl:variable name="testChar" select="substring($pelString, 1, 1)"/>
		<xsl:variable name="finalString" select="subsequence($charStringInAndtestChar, 2, 1)"/>
		
  <!--these messages do give a layed out overview of what happens, possibly nice to keep?--> 
		<xsl:message>
			<xsl:value-of select="concat('char= ', string($testChar))"/>
		</xsl:message>
		<xsl:message>
			<xsl:value-of select="concat('pelstring=   ', $pelString)"/>
		</xsl:message>
		<xsl:message>
			<xsl:value-of select="concat('finalstring= ', $finalString)"/>
		</xsl:message>

		<xsl:choose>
			<xsl:when test="string-length($pelString) lt 1">
				<xsl:value-of select="$finalString"/>
			</xsl:when>
			<xsl:when test="not(matches($testChar, $NCNameChars)) or ($testChar eq ':')">	<!-- ':' part of \i, but NOT part NCName/Letter. So replace it too -->
				<xsl:value-of select="nf:replaceChar((substring($pelString, 2, string-length($pelString)-1), replace($finalString, $testChar, '-')))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="nf:replaceChar((substring($pelString, 2, string-length($pelString)-1), $finalString))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="nf:convert2NCName">
		<xsl:param name="stringIn"/>
		<xsl:variable name="parm" select="($stringIn, $stringIn)"/>
		<xsl:value-of select="nf:replaceChar($parm)"/>
	</xsl:function>

	<xd:doc>
		<xd:desc>Base template for the main interaction.</xd:desc>
	</xd:doc>
	<xsl:template match="/">

		<!--xxxwim bouwstenen toevoegen  -->
		<xsl:variable name="bouwstenen">

			<xsl:for-each select="f:Bundle/f:entry/f:resource/f:Medication">
				<farmaceutisch_product id="{nf:convert2NCName(./../../f:fullUrl/@value)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.260">
					<xsl:for-each select="./f:code/f:coding">
						<product_code codeSystem="{replace(./f:system/@value, 'urn:oid:', '')}" displayName="./display@value" codeSystemName="G-Standaard PRK" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.4.261"/>
					</xsl:for-each>
				</farmaceutisch_product>
			</xsl:for-each>

			<!--xxxwim: TODO    		
    		<xsl:for-each select="ancestor::f:Bundle/f:entry/f:fullUrl/f:....">
    		| ancestor::f:Bundle/f:entry/esource/PractitionerRole/specialty
    		</xsl:for-each>-->

			<xsl:for-each select="f:Bundle/f:entry/f:resource/f:PractitionerRole/f:practitioner/f:reference">
				<!-- requester verwijst naar PractitionerRole, zoek het doel (Practitioner) bij deze referentie (practitioner/reference) om de zorgverlener bouwsteen te kunnen maken-->
				<xsl:variable name="referenceAtValue" select="string(@value)"/>
				<xsl:variable name="PractitioneridentifierAtValue" select="//f:entry/f:fullUrl[./@value eq $referenceAtValue]/../f:resource/f:Practitioner/f:identifier/f:value/@value"/>
				<xsl:variable name="PractitionerRole" select="./../.."/>

				<!-- xxxwim remove: -->
				<!--				<xsl:message>
	<xsl:value-of select="name($PractitionerRole)"/>
</xsl:message>-->

				<zorgverlener id="{nf:convert2NCName($PractitioneridentifierAtValue)}">
					<zorgverlener_identificatienummer value="{$PractitioneridentifierAtValue}"
						root="{replace(//f:entry/f:fullUrl[./@value eq $referenceAtValue]/../f:resource/f:Practitioner/f:id/@value, '-.*', '')   }"/>
					<naamgegevens comment="">
						<voornamen value=""/>
						<geslachtsnaam comment="">
							<voorvoegsels value=""/>
							<achternaam value=""/>
						</geslachtsnaam>
					</naamgegevens>
					<specialisme codeSystem="{replace($PractitionerRole/f:specialty/f:coding/f:system/@value, 'urn:oid:', '')}" codeSystemVersion="{$PractitionerRole/f:specialty/f:coding/f:version/@value}"
						displayName="{$PractitionerRole/f:specialty/f:coding/f:display/@value}" code="{$PractitionerRole/f:specialty/f:coding/f:code/@value}"/>
					<zorgaanbieder>
						<!-- de referentie naar bouwsteen zorgaanbieder-->
						<zorgaanbieder datatype="reference" value="{nf:convert2NCName($PractitionerRole/f:organization/f:reference/@value)}"/>
					</zorgaanbieder>
				</zorgverlener>
			</xsl:for-each>



			<xsl:for-each select="f:Bundle/f:entry/f:resource/f:Organization">
				<xsl:variable name="entryFullURrlAtValue" select="./../../f:fullUrl/@value"/>
				<!--				<xsl:variable name="PractitioneridentifierAtValue" select="//f:entry/f:fullUrl[./@value eq $referenceAtValue]/../f:resource/f:Practitioner/f:identifier/f:value/@value"/>
				<xsl:variable name="PractitionerRole" select="./../.."/>-->
				<!-- xxxwim remove: -->
				<!--				<xsl:message>
					<xsl:value-of select="$entryFullURrlAtValue"/>
				</xsl:message>-->
				<zorgaanbieder id="{nf:convert2NCName($entryFullURrlAtValue)}">
					<!--{nf:compareCI('012:3ccc')}-->
					<zorgaanbieder_identificatienummer value="{./f:identifier/f:value/@value}" root="2.16.528.1.1007.3.3"/>
					<organisatie_naam value="{./f:name/@value}"/>
					<adresgegevens comment="">
						<straat value="{./f:address/f:line/f:extension[@url eq 'http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName']/f:valueString/@value}"/>
						<huisnummer value="{./f:address/f:line/f:extension[@url eq 'http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber']/f:valueString/@value}"/>
						<postcode value="{./f:address/f:postalCode/@value}"/>
						<woonplaats value="{./f:address/f:city/@value}"/>

						<adres_soort value="" code="{./f:address/f:extension[@url eq 'http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType']/f:valueCodeableConcept/f:coding/f:code/@value}"
							codeSystem="2.16.840.1.113883.5.1119" displayName="Werkadres"/>
					</adresgegevens>
				</zorgaanbieder>
			</xsl:for-each>

		</xsl:variable>


		<adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd">
			<meta status="new" created-by="generated" last-update-by="generated" creation-date="{current-dateTime()}" last-update-date="{current-dateTime()}"/>
			<data>
				<beschikbaarstellen_medicatiegegevens app="mp-mp920" shortName="beschikbaarstellen_medicatiegegevens" formName="medicatiegegevens" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.172"
					transactionEffectiveDate="2021-04-02T09:33:39" prefix="mp-" language="nl-NL">
					<xsl:attribute name="title">Generated from HL7 FHIR medicatiegegevens 9.0.7 xml</xsl:attribute>
					<xsl:attribute name="id">DUMMY</xsl:attribute>

					<xsl:choose>
						<xsl:when
							test="count(f:Bundle/f:entry/f:resource/f:Patient) ge 2 or count(distinct-values(f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)/f:subject/f:reference/@value)) ge 2">
							<xsl:message terminate="yes">Multiple Patients and/or subject references found. Please check.</xsl:message>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Patient" mode="nl-core-Patient"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each-group select="f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)"
						group-by="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/concat(f:system/@value, f:value/@value)">
						<medicamenteuze_behandeling>
							<identificatie>
								<xsl:attribute name="value" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/f:value/@value"/>
								<xsl:attribute name="root" select="local:getOid(f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/f:system/@value)"/>
							</identificatie>
							<!-- medicatieafspraak -->
							<xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = '16076005']" mode="nl-core-MedicationAgreement"/>
							<!-- verstrekkingsverzoek -->
							<!--                            <xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value='52711000146108']" mode="zib-DispenseRequest-2.2"/>-->
							<!-- toedieningsafspraak -->
							<xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value = '422037009']" mode="nl-core-AdministrationAgreement"/>
							<!-- verstrekking -->
							<!--                            <xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value='373784005']" mode="zib-Dispense-2.2"/>-->
							<!-- medicatie_gebruik -->
							<!--                            <xsl:apply-templates select="current-group()[self::f:MedicationStatement/f:category/f:coding/f:code/@value='6']" mode="zib-MedicationUse-2.2"/>-->
						</medicamenteuze_behandeling>
					</xsl:for-each-group>
					<!--xxxwim bouwstenen -->
					<bouwstenen>
						<xsl:for-each select="$bouwstenen">
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</bouwstenen>

				</beschikbaarstellen_medicatiegegevens>
			</data>
		</adaxml>
	</xsl:template>

</xsl:stylesheet>
