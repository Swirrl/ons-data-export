## Notes on dataset metadata

### Dataset URIs

```
http://purl.org/linked-data/cube#DataSet
http://publishmydata.com/pmdcat#Dataset
http://publishmydata.com/pmdcat#DataCube
```

From discussion with RiMo and RiRo, we should have one URI of type pmdcat:Dataset, which is the subject of dataset metadata triples, and a different URI with type qb:DataSet and also pmdcat:DataCube.

The data we are copying over has an established URI for the qb:DataSet, which is the object of all the <obs> qb:dataSet <ds> triples, so we should just use that for the  qb:DataSet URI in our copy of the data, and make a new URI for the pmdcat:Dataset
  
These existing URIs take a variety of patterns, but Alex says they are now trying to standardise on `/data/{slug}` so we should choose a different pattern to avoid accidental collisions with these.

I suggest `/dataset/{slug}` for the pmdcat:Dataset, eg `http://gss-data.org.uk/dataset/ons-fdi



### Custom metadata properties

what properties, what URIs, range/ type of value, whether to display in main column (for longer text) or sidebar (for short/concise values)

*Current metadata properties*


* `<http://publishmydata.com/pmdcat#markdownDescription>` the main free text description, with useful links etc
* `<http://purl.org/dc/terms/issued>` automatic
* `http://purl.org/dc/terms/modified>` automatic
* `<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>`
* `<http://www.w3.org/2000/01/rdf-schema#label>` 
* `<http://purl.org/dc/terms/title>` usually same as title
* `<http://publishmydata.com/pmdcat#graph>` points to where the data contents are stored
* `<http://publishmydata.com/pmdcat#datasetContents>` points to the qb:DataSet resource
* `<http://www.w3.org/2000/01/rdf-schema#comment>` short description, used in search results etc
* `<http://purl.org/dc/terms/creator>`
* `<http://purl.org/dc/terms/license>`
* `<http://www.w3.org/ns/dcat#contactPoint>`
* `<http://purl.org/dc/terms/contributor>`
* `<http://purl.org/dc/terms/publisher>`
* 

### Metadata sources - Word files from DIT



### Datasets done so far
