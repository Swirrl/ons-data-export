
## Dimension Labels

If a subsequent data import gives a new label to an existing dimension, we end up with additional labels in the underlying data. It's unclear whether these should be separate dimensions in some cases, or whether it's simply a new label for a dimension

```
http://purl.org/linked-data/cube#measureType	"Measure Type"@en
http://purl.org/linked-data/cube#measureType	"measure type"@en
http://purl.org/linked-data/sdmx/2009/dimension#refPeriod	"Period"@en
http://purl.org/linked-data/sdmx/2009/dimension#refPeriod	"Reference Period"@en
http://gss-data.org.uk/def/dimension/flow	"Flow"@en
http://gss-data.org.uk/def/dimension/flow	"Flow"
http://gss-data.org.uk/def/dimension/trade-partner-geography	"Trade Partner Geography"
http://gss-data.org.uk/def/dimension/trade-partner-geography	"HMRC Partner Geography"@en
http://gss-data.org.uk/def/dimension/product	"SITC 4"@en
http://gss-data.org.uk/def/dimension/product	"Product"
http://gss-data.org.uk/def/dimension/trade-reporter-geography	"Trade Reporter Geography"
http://gss-data.org.uk/def/dimension/trade-reporter-geography	"HMRC Reporter Region"@en
```


### Delete labels 

```
PREFIX rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos:    <http://www.w3.org/2004/02/skos/core#>
PREFIX qb:      <http://purl.org/linked-data/cube#>

DELETE { 
    GRAPH <http://gss-data.org.uk/graph/components> { 
        ?dim rdfs:label ?lbl } 
    } 
USING <http://gss-data.org.uk/graph/components> 
WHERE { 
    BIND(<http://purl.org/linked-data/cube#measureType> AS ?dim)
    ?dim a qb:DimensionProperty .
    ?dim rdfs:label ?lbl 
    }
```

Repeat for graph `http://gss-data.org.uk/graph/gss_data/trade/hmrc_rts`

Repeat for dims:
 - `http://purl.org/linked-data/sdmx/2009/dimension#refPeriod`
 - `http://gss-data.org.uk/def/dimension/flow`
 - `http://gss-data.org.uk/def/dimension/trade-partner-geography`
 - `http://gss-data.org.uk/def/dimension/product`
 - `http://gss-data.org.uk/def/dimension/trade-reporter-geography`

### Add chosen labels 

 `stardog data add cogs-staging /path/to/chosen_labels.trig`

Note: I have not added a chosen label for measureType as it is already part of the cube graph (ONS appear to have added another label which does not matching the casing of the existing label)
`<http://purl.org/linked-data/cube#measureType> rdfs:label "Measure Type"@en .`