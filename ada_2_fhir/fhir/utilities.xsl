<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:hl7="urn:hl7-org:v3"
    xmlns:fhir="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities"
    exclude-result-prefixes="xs xd util hl7 fhir"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 11, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> ahenket</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Vocabulary file containing language dependant strings such as labels</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="util:vocFile" select="'utilities-l10n.xml'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Cache language dependant strings</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="util:vocMessages" select="doc($util:vocFile)"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Default language for retrieval of language dependant strings such as labels, e.g. 'en-US'. This is the fallback language in case the string is not available in the actual language.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="util:textlangDefault" select="'en-US'"/>
    
    <xd:doc>
        <xd:desc>Index the translation file for performance</xd:desc>
    </xd:doc>
    <xsl:key name="util-i18nkey" match="translation" use="@key"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Retrieves a language dependant string from our <xd:ref name="vocFile" type="parameter">language file</xd:ref> such as a label based on a key. Returns string based on <xd:ref name="textLang" type="parameter">textLang</xd:ref>, <xd:ref name="textLangDefault" type="parameter">textLangDefault</xd:ref>, the first two characters of the textLangDefault, e.g. 'en' in 'en-US' and finally if all else fails just the key text.</xd:p>
        </xd:desc>
        <xd:param name="pre">Some text or space to prefix our string with</xd:param>
        <xd:param name="key">The key to find our text with</xd:param>
        <xd:param name="post">Some text like a colon or space to postfix our text with</xd:param>
        <xd:param name="textLang">Actual language for retrieval of language dependant strings such as labels, e.g. 'en-US'. Unless supplied, this is taken from the ClinicalDocument/language/@code attribute or first FHIR language element, or in case that is not present from <xd:ref name="textlangDefault" type="parameter">textlangDefault</xd:ref>.</xd:param>
    </xd:doc>
    <xsl:template name="util:getLocalizedString">
        <xsl:param name="pre" select="''"/>
        <xsl:param name="key"/>
        <xsl:param name="post" select="''"/>
        <xsl:param name="textLang">
            <xsl:choose>
                <xsl:when test="ancestor-or-self::hl7:ClinicalDocument/hl7:languageCode/@code">
                    <xsl:value-of select="ancestor-or-self::hl7:ClinicalDocument/hl7:languageCode/@code"/>
                </xsl:when>
                <xsl:when test="ancestor-or-self::fhir:*/fhir:language/@value">
                    <xsl:value-of select="(ancestor-or-self::fhir:*/fhir:language/@value)[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$util:textlangDefault"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        
        <!-- Do lowercase compare of default language+region-->
        <xsl:variable name="textLangDefaultLowerCase">
            <xsl:call-template name="util:caseDown">
                <xsl:with-param name="data" select="$util:textlangDefault"/>
            </xsl:call-template>
        </xsl:variable>
        <!-- Do lowercase compare of default language (assume alpha2 not alpha3) -->
        <xsl:variable name="textLangDefaultPartLowerCase" select="substring($textLangDefaultLowerCase,1,2)"/>
        <!-- Do lowercase compare of language+region -->
        <xsl:variable name="textLangLowerCase">
            <xsl:call-template name="util:caseDown">
                <xsl:with-param name="data" select="$textLang"/>
            </xsl:call-template>
        </xsl:variable>
        <!-- Do lowercase compare of language (assume alpha2 not alpha3) -->
        <xsl:variable name="textLangPartLowerCase" select="substring($textLangLowerCase,1,2)"/>
        
        <xsl:variable name="translation" select="$util:vocMessages/*/key('util-i18nkey', $key)"/>
        
        <xsl:choose>
            <!-- compare 'de-CH' -->
            <xsl:when test="$translation/value[@lang = $textLangLowerCase]">
                <xsl:value-of select="concat($pre,$translation/value[@lang=$textLangLowerCase]/text(),$post)"/>
            </xsl:when>
            <!-- compare 'de' in 'de-CH' -->
            <xsl:when test="$translation/value[substring(@lang, 1, 2)=$textLangPartLowerCase]">
                <xsl:value-of select="concat($pre,$translation/value[substring(@lang, 1, 2)=$textLangPartLowerCase]/text(),$post)"/>
            </xsl:when>
            <!-- compare 'en-US' -->
            <xsl:when test="$translation/value[@lang=$textLangDefaultLowerCase]">
                <xsl:value-of select="concat($pre,$translation/value[@lang=$textLangDefaultLowerCase]/text(),$post)"/>
            </xsl:when>
            <!-- compare 'en' in 'en-US' -->
            <xsl:when test="$translation/value[substring(@lang, 1, 2)=$textLangDefaultPartLowerCase]">
                <xsl:value-of select="concat($pre,$translation/value[substring(@lang, 1, 2)=$textLangDefaultPartLowerCase]/text(),$post)"/>
            </xsl:when>
            <xsl:when test="$translation/value[@lang='en-us']">
                <xsl:value-of select="concat($pre,$translation/value[@lang='en-us']/text(),$post)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logDEBUG"/>
                    <xsl:with-param name="msg">
                        <xsl:text>util:getLocalizedString Key not found: </xsl:text>
                        <xsl:value-of select="$key"/>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:value-of select="concat($pre,$key,$post)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Converts Latin characters in input to lower case and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="util:caseDown">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:value-of select="lower-case($data)"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Converts Latin characters in input to upper case and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="util:caseUp">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:value-of select="translate($data,'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Converts first character in input to upper case if it is a Latin character and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="util:firstCharCaseUp">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:call-template name="util:caseUp">
                <xsl:with-param name="data" select="substring($data,1,1)"/>
            </xsl:call-template>
            <xsl:value-of select="substring($data,2)"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize based on delimiters, or if no delimiter do character tokenization</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="delimiters">Optional delimiter string</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
    </xd:doc>
    <xsl:template name="util:tokenize">
        <xsl:param name="string" select="''"/>
        <xsl:param name="delimiters" select="' '"/>
        <xsl:param name="prefix"/>
        <xsl:choose>
            <xsl:when test="not($string)"/>
            <xsl:when test="not($delimiters)">
                <xsl:call-template name="util:_tokenize-characters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="util:_tokenize-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize every character</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
    </xd:doc>
    <xsl:template name="util:_tokenize-characters">
        <xsl:param name="string"/>
        <xsl:param name="prefix"/>
        <xsl:if test="$string">
            <xsl:call-template name="util:getLocalizedString">
                <xsl:with-param name="key" select="concat($prefix,substring($string, 1, 1))"/>
            </xsl:call-template>
            <xsl:call-template name="util:_tokenize-characters">
                <xsl:with-param name="string" select="substring($string, 2)"/>
                <xsl:with-param name="prefix" select="$prefix"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize based on delimiters</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="delimiters">Required delimiter string</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
    </xd:doc>
    <xsl:template name="util:_tokenize-delimiters">
        <xsl:param name="string"/>
        <xsl:param name="delimiters"/>
        <xsl:param name="prefix"/>
        <xsl:variable name="delimiter" select="substring($delimiters, 1, 1)"/>
        <xsl:choose>
            <xsl:when test="not($delimiter)">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat($prefix,$string)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string, $delimiter)">
                <xsl:if test="not(starts-with($string, $delimiter))">
                    <xsl:call-template name="util:_tokenize-delimiters">
                        <xsl:with-param name="string" select="substring-before($string, $delimiter)"/>
                        <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                        <xsl:with-param name="prefix" select="$prefix"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:text> </xsl:text>
                <xsl:call-template name="util:_tokenize-delimiters">
                    <xsl:with-param name="string" select="substring-after($string, $delimiter)"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="util:_tokenize-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>
    
    <!-- provide a mapping from string logLevel to numeric value -->
    <xsl:variable name="logALL" select="'ALL'"/>
    <xsl:variable name="logDEBUG" select="'DEBUG'"/>
    <xsl:variable name="logINFO" select="'INFO'"/>
    <xsl:variable name="logWARN" select="'WARN'"/>
    <xsl:variable name="logERROR" select="'ERROR'"/>
    <xsl:variable name="logFATAL" select="'FATAL'"/>
    <xsl:variable name="logOFF" select="'OFF'"/>
    <xsl:variable name="logLevelMap" as="element(level)*">
        <level name="{$logALL}" int="6" desc="The ALL has the lowest possible rank and is intended to turn on all logging."/>
        <level name="{$logDEBUG}" int="5" desc="The DEBUG Level designates fine-grained informational events that are most useful to debug an application."/>
        <level name="{$logINFO}" int="4" desc="The INFO level designates informational messages that highlight the progress of the application at coarse-grained level."/>
        <level name="{$logWARN}" int="3" desc="The WARN level designates potentially harmful situations."/>
        <level name="{$logERROR}" int="2" desc="The ERROR level designates error events that might still allow the application to continue running."/>
        <level name="{$logFATAL}" int="1" desc="The FATAL level designates very severe error events that will presumably lead the application to abort."/>
        <level name="{$logOFF}" int="0" desc="The OFF level has the highest possible rank and is intended to turn off logging."/>
    </xsl:variable>
    <xsl:variable name="util:chkdLogLevel" select="if ($logLevelMap[@name = $logLevel]) then $logLevel else $logINFO"/>
    
    <xd:doc>
        <xd:desc>Emit message text if the level of the message is smaller than or equal to logLevel </xd:desc>
        <xd:param name="msg">The message to emit</xd:param>
        <xd:param name="level">The level this should be emitted at</xd:param>
        <xd:param name="terminate">Terminate after emitting</xd:param>
    </xd:doc>
    <xsl:template name="util:logMessage">
        <xsl:param name="msg" as="item()*"/>
        <xsl:param name="level" select="$logINFO" as="xs:string"/>
        <xsl:param name="terminate" select="false()" as="xs:boolean"/>
        <xsl:variable name="term" select="if ($terminate) then 'yes' else 'no'"/>
        <xsl:variable name="currLevel" select="$logLevelMap[@name = $level]/number(@int)"/>
        <xsl:variable name="compLevel" select="$logLevelMap[@name = $util:chkdLogLevel]/number(@int)"/>
        <!--<xsl:if test="$term='yes'">
            <!-\- we'll gonna die anyway, write a survivor document for later post processing -\->
            <xsl:result-document href="last-survivor-message.xml" format="xml" indent="yes">
                <last level="{$level}">
                    <xsl:copy-of select="$msg"/>
                </last>
            </xsl:result-document>
        </xsl:if>-->
        <xsl:if test="$terminate or ($currLevel le $compLevel)">
            <!-- must die if to be terminated on message -->
            <xsl:message terminate="{$term}">
                <xsl:value-of select="substring(concat($level,'        '),1,7)"/>
                <xsl:text>: </xsl:text>
                <xsl:copy-of select="$msg"/>
            </xsl:message>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>