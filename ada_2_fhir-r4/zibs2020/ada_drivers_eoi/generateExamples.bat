@echo off
:: CHECK BEFORE RUNNING ####
SET jarPath=C:\SaxonHE9-9-1-7J\saxon9he.jar
SET inputDir=../ada_instance_eoi
SET outputDir=../fhir_instance_eoi

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

echo Converting zib-ContactPerson
java -jar "%jarPath%" -s:"%inputDir%/Contactpersoon-bundled.xml" -xsl:ContactPerson-driver.xsl outputDir=%outputDir%

echo Converting zib-HealthcareProvider
java -jar "%jarPath%" -s:"%inputDir%/Zorgaanbieder-eoi.xml" -xsl:HealthcareProvider-driver.xsl outputDir=%outputDir%

echo Converting zib-HealthProfessional
java -jar "%jarPath%" -s:"%inputDir%/Zorgverlener-eoi.xml" -xsl:HealthProfessional-driver.xsl outputDir=%outputDir%

echo Converting zib-Patient
java -jar "%jarPath%" -s:"%inputDir%/Patient-bundled.xml" -xsl:Patient-driver.xsl outputDir=%outputDir%

pause