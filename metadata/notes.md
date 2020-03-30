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

*Suggested new/additional metadata properties*

Based on the info that is provided in these two page Word docs

`@prefix gss: <http://gss-data.org.uk/def/metadata/> .`

| Item       | Predicate          | Example               |
|------------|--------------------|-----------------------|
|Source      |  gss:source     | 'Mainly Annual Foreign Direct Investment Survey (inward and outward)' |      
|Status      |  gss:status     | 'National Statistics' or 'Official Statistics'                        |
|Recommended Usage |   gss:recommendedUsage           | a paragraph or two of markdown text, maybe with bullets. |
|Strengths |    gss:strengths              | a few bullet points of text  |
|Weaknesses | gss:weaknessses                 | a few bullet points of text  |

Of these, suggest Source and Status are added to the right sidebar as will ahve short values.  The others should go in the wider column, below the description

Other notes:

For 'Source' it would be nice to use prov:wasGeneratedBy, part of PROV-O and recommended by DCAT2.  Downside of that is that the range is a prov:Activity, and we only have a rough text description available, so would have to coin a URI for the Activity, then give it a label. All a lot of hassle which doesn't add much value until there is a systematic way of identifying the various surveys etc.  So for now, will just keep it vague and use a newly coined term

### Metadata sources - Word files from DIT

see the files in the 'DIT-word-files' dir

### Datasets done so far
