# BGZ-MM

De zib instances worden bijgehouden in ADA:
[ADA zib2017 project](https://decor.nictiz.nl/art-decor/ada-data/projects/zib2017/views/health_and_care_information_models_hcim_2017_index.xhtml)
Let op dat alle te gebruiken instances een titel hebben die begint met: 'mm-bgz'. Het XSLT script gebruikt dit om te bepalen wat de input voor de wiki is. 

Na aanpassen kunnen deze bestanden gedownload worden via de searchset:
```html
https://decor.nictiz.nl/ada/projects/zib2017/?raw=true
```

1. Download ADA instances, save as `ada_instance\searchset.xml`
2. To run all xslt transformations please run `buildResources.bat`. The batch file assumes [Saxon](http://saxon.sourceforge.net) is installed in the folder `C:\SaxonHE9-9-1-7J\saxon9he.jar`. Another Saxon location can be specified using the %SaxonPath% EnvironmentVariable.