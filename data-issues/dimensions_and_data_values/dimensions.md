
## Observation Values

When importing datasets from GSS Alpha, the exporter runs as follows:

1. Retrieves all observation data from the dataset graph
2. Retrieves all metadata from metadata graph
3. Retrieves any concepts schemes defined in the dataset's dimensions via `qb:codeList`

In some cases, the dataset has URI values in its observation data that are from concept schemes that are not defined in that column's dimension.

In these cases, the correct concept scheme (or in some cases, dataset) had to be manually searched for and then exported so that the dataset would display the labels for that value.

The "floating" concept schemes are:

```
http://business.data.gov.uk/companies/def/sic-2007/scheme
http://gss-data.org.uk/def/concept-scheme/age-of-business
http://gss-data.org.uk/def/concept-scheme/bop-services
http://gss-data.org.uk/def/concept-scheme/cord-sitc
http://gss-data.org.uk/def/concept-scheme/export-and-import-activity
http://gss-data.org.uk/def/concept-scheme/hmrc-geographies
http://gss-data.org.uk/def/concept-scheme/hmrc-industry-groups
http://gss-data.org.uk/def/concept-scheme/hmrc-regions
http://gss-data.org.uk/def/concept-scheme/itis-services
http://gss-data.org.uk/def/concept-scheme/marker
http://gss-data.org.uk/def/concept-scheme/measurement-units
http://gss-data.org.uk/def/concept-scheme/nuts-geography
http://gss-data.org.uk/def/concept-scheme/ons-abs-trades
http://gss-data.org.uk/def/concept-scheme/ons-functional-category
http://gss-data.org.uk/def/concept-scheme/ons-trade-areas-itis
http://gss-data.org.uk/def/concept-scheme/pink-book-services
http://gss-data.org.uk/def/concept-scheme/price-classification  *
http://gss-data.org.uk/def/concept-scheme/product
http://gss-data.org.uk/def/concept-scheme/sitc-4
http://stamina-project.org/codes/cpav2008/cpa
```

There are also values in use from graphs `http://gss-data.org.uk/graph/cdid` and `http://gss-data.org.uk/graph/vocab/cdid-legacy`

* The price-classification concept scheme error turned out to be a typo rather than a missing `qb:codeList`, see https://github.com/Swirrl/ons-data-export/issues/10


## Dimension filtering

When there is no `qb:codeList` set on a dimension, there is no way for the UI to display a filter. The dimensions that have no code lists are:

```
http://gss-data.org.uk/def/dimension/age-of-business
http://gss-data.org.uk/def/dimension/export-and-import-activity
http://gss-data.org.uk/def/dimension/product
http://gss-data.org.uk/def/dimension/product
http://gss-data.org.uk/def/dimension/trade-reporter-geography
http://gss-data.org.uk/def/dimension/trade-reporter-geography
http://purl.org/linked-data/cube#measureType
http://purl.org/linked-data/cube#measureType
http://purl.org/linked-data/cube#measureType
http://purl.org/linked-data/sdmx/2009/dimension#refArea
```

Some of these look fairly straightforward to hook up with the concept schemes listed above, but this will still leave a number of concepts schemes in use in the dataset observation values 


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