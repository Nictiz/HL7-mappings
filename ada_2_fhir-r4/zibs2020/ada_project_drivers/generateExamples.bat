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

SET id=nl-core-ContactPerson
echo Converting %id%-01
java -jar "%jarPath%" -s:"%inputDir%/%id%-01.xml" -xsl:%id%-driver.xsl -o:"%outputDir%/%id%-01.xml

SET id2=nl-core-HealthcareProvider
echo Converting %id2%-01
java -jar "%jarPath%" -s:"%inputDir%/%id2%-01.xml" -xsl:%id2%-driver.xsl -o:"%outputDir%/%id2%-01.xml

SET id3=nl-core-HealthProfessional
echo Converting %id3%-01
java -jar "%jarPath%" -s:"%inputDir%/%id3%-01.xml" -xsl:%id3%-driver.xsl -o:"%outputDir%/%id3%-01.xml

SET id4=nl-core-Patient
echo Converting %id4%-01
java -jar "%jarPath%" -s:"%inputDir%/%id4%-01-bundled.xml" -xsl:%id4%-driver.xsl -o:"%outputDir%/%id4%-01.xml

pause