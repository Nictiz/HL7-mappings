WD=`dirname $0`

# run 2wiki
export saxonPath=~/Development/lib/SaxonPE10-1J/saxon-pe-10.1.jar

inputDir=$WD/ada_instance
processedDir=$WD/ada_processed
xsltDir=$WD/payload
outputDir=$WD/fhir_instance_resources

if [ ! -e "$saxonPath" ]; then
    echo
    echo "Did not find Saxon JAR here '$saxonPath'. Either add it here or set the 'saxonPath' environment variable to supply a different path..."
    echo http://saxon.sourceforge.net
    exit 1
fi

# refresh searchset
curl -o "$WD/ada_instance/searchset.xml" "https://decor.nictiz.nl/ada/projects/zib2017/?raw=true"

echo "Removing previous output"
#if [ -e "$processedDir" ];
	 rm -rf "$processedDir"
#fi

#if [ -e "$outputDir" ];
	 rm -rf "$outputDir"
#fi

java -jar "$saxonPath" -s:"$xsltDir/ada_processing/bgz_mm-adarefs2ada.xsl" -xsl:"$xsltDir/ada_processing/bgz_mm-adarefs2ada.xsl" -o:"$outputDir/dummy.xml"

for file in `ls "$processedDir"` ; do
    echo "    Converting $file..."
    java -jar "$saxonPath" -s:"$processedDir/$file" -xsl:"$xsltDir/beschikbaarstellen_2_fhir.xsl" -o:"$outputDir/dummy.xml"
done