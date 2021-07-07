@echo off
:: CHECK BEFORE RUNNING ####
SET jarPath=C:\SaxonHE9-9-1-7J\saxon9he.jar
SET inputDir=../ada_instance
SET outputDir=../fhir_instance

if not exist "%jarPath%" (
    echo.
    echo.Did not find Saxon JAR here '%jarPath%'. Either add it here, or change the script to supply a different path...
    echo.http://saxon.sourceforge.net
    pause
)

if exist "%outputDir%" (
    echo.
    echo Removing output dir
    rmdir "%outputDir%" /s /q
)

echo Converting Contactpersoon-eoi
java -jar "%jarPath%" -s:"%inputDir%/Contactpersoon-eoi-bundled.xml" -xsl:Contactpersoon-eoi-driver.xsl outputDir=%outputDir%

echo Converting Zorgaanbieder-eoi
java -jar "%jarPath%" -s:"%inputDir%/Zorgaanbieder-eoi.xml" -xsl:Zorgaanbieder-eoi-driver.xsl outputDir=%outputDir%

echo Converting Zorgverlener-eoi
java -jar "%jarPath%" -s:"%inputDir%/Zorgverlener-eoi.xml" -xsl:Zorgverlener-eoi-driver.xsl outputDir=%outputDir%

echo Converting Patient-eoi
java -jar "%jarPath%" -s:"%inputDir%/Patient-eoi-bundled.xml" -xsl:Patient-eoi-driver.xsl outputDir=%outputDir%

pause