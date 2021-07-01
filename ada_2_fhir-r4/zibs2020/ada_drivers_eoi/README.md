# Test harnesses

Whereas the "payload" folder contains pure zib/nl-core mappings to be re-used across ada projectes, this folder contains drivers to handle the 'Example of the Instance' (eoi) examples as found on [zibs.nl](https://zibs.nl/wiki/HCIM_Release_2020(EN)) as recreated in the [zib2020-nl project on ART-DECOR](https://decor.nictiz.nl/art-decor/decor-project--zib2020bbr-) which can be found in the "ada_instance_eoi" folder.

## Bundling things

Some zibs will be transformed into a single FHIR instance. In this case, multiple ada instances will need to be collected and passed to the stylesheet. To specify a bundle of related instances, the following syntax is used:

```xml
<bundle>
  <source href="instance1.xml"/>
  <source href="instance2.xml"/>
</bundle>
```

The driver in this folder for the corresponding FHIR profile will need to load these sources and pass them in the right way to the stylesheet.