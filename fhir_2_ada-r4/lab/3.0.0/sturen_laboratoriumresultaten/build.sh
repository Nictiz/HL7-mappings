
WD=`dirname $0`
export jarPath=~/Development/lib/SaxonPE9-7-0-20J/saxon9pe.jar

if [ ! -e $jarPath ]; then
    echo.
    echo Did not find Saxon JAR here '$jarPath'. Either add it here, or change the script to supply a different path...
    echo http://saxon.sourceforge.net
    exit
fi

rm -rf "$WD/fhir_instance" "$WD/ada_instance"
mkdir "$WD/fhir_instance"
mkdir "$WD/ada_instance"
cp $WD/../../../../ada_2_fhir-r4/lab/3.0.0/sturen_laboratoriumresultaten/fhir_instance/lr-slr-TEST*.xml "$WD/fhir_instance/"

for file in `ls fhir_instance/lr-slr-TEST*.xml` ; do
    echo "    Processing $file as $WD/ada_instance/`basename $file` ..."
    java -jar "$jarPath" -s:$file -xsl:payload/sturen_laboratoriumresultaten_2_ada.xsl -o:"$WD/ada_instance/`basename $file`"
done



