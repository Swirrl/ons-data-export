
### Reference Data

Run against gss_alpha export:

`stardog data export --named-graph http://gss-data.org.uk/graph/reference-time --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/reference-times.ttl`

(Import TTL into graph `http://gss-data.org.uk/graph/vocab/reference-times`)

Run against cogs-dev and save to trig file:

```
CONSTRUCT {
    GRAPH <http://gss-data.org.uk/graph/vocab/reference-times-metadata> {
        ?s ?p ?o 
    }
}
FROM <http://gss-data.org.uk/graph/vocab/reference-times-metadata> {
    ?s ?p ?o 
}
```

`stardog data export --named-graph http://gss-data.org.uk/graph/measurement-units --format TRIG http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/measurement-units.trig`

Run against cogs-dev and save to trig file:
```
CONSTRUCT {
    GRAPH <ttp://gss-data.org.uk/graph/vocab/measurement-units-metadata> {
        ?s ?p ?o 
    }
}
FROM <http://gss-data.org.uk/graph/vocab/measurement-units-metadata> {
    ?s ?p ?o 
}
```

### "Products" dimension - pink book services.

Just grab data for now. Fix to be code list later

stardog data export --named-graph http://gss-data.org.uk/graph/pink-book-services  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/pink-book-services.ttl

stardog data add --named-graph http://gss-data.org.uk/graph/vocab/pink-book-services gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/pink-book-services.ttl

### ITIS services

stardog data export --named-graph http://gss-data.org.uk/graph/itis-services  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/itis-services.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/itis-services gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/itis-services.ttl

### ONS Trade Areas

stardog data export --named-graph http://gss-data.org.uk/graph/ons-trade-areas-itis  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/ons-trade-areas-itis.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/ons-trade-areas-itis gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/ons-trade-areas-itis.ttl

### HMRC geogrpahies

stardog data export --named-graph http://gss-data.org.uk/graph/hmrc-geographies  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/hmrc-geographies.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/hmrc-geographies gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/hmrc-geographies.ttl

### NUTs geog

stardog data export --named-graph http://gss-data.org.uk/graph/nuts-geography  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/nuts-geography.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/nuts-geography gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/nuts-geography.ttl


### SITC

stardog data export --named-graph http://gss-data.org.uk/graph/sitc-4  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/sitc-4.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/sitc-4 gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/sitc-4.ttl

### ABS Trades

stardog data export --named-graph http://gss-data.org.uk/graph/ons-abs-trades  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/ons-abs-trades.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/ons-abs-trades gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/ons-abs-trades.ttl


### X

stardog data export --named-graph http://gss-data.org.uk/graph/marker  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/marker.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/marker gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/marker.ttl


### sic-2007

stardog data export --named-graph http://business.data.gov.uk/companies/sources/vocab/sic-2007.ttl  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/sic-2007.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/sic-2007 gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/sic-2007.ttl


### X

stardog data export --named-graph http://gss-data.org.uk/graph/cord-sitc  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cord-sitc.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/cord-sitc gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cord-sitc.ttl


---------

### price-classifications

stardog data export --named-graph http://gss-data.org.uk/graph/price-classifications  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/price-classifications.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/price-classifications gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/price-classifications.ttl

### cdid

stardog data export --named-graph http://gss-data.org.uk/def/cdid  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cdid.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/cdid gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cdid.ttl

### age-of-business
stardog data export --named-graph http://gss-data.org.uk/graph/age-of-business  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/age-of-business.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/age-of-business gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/age-of-business.ttl

### statistical-geography
stardog data export --named-graph http://gss-data.org.uk/graph/statistical-geography  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/statistical-geography.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/statistical-geography gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/statistical-geography.ttl

### hmrc-industry-groups
stardog data export --named-graph http://gss-data.org.uk/graph/hmrc-industry-groups  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/hmrc-industry-groups.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/hmrc-industry-groups gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/hmrc-industry-groups.ttl

### cpav2008
stardog data export --named-graph http://gss-data.org.uk/graph/semstats/cpav2008  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cpav2008.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/semstats/cpav2008 gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cpav2008.ttl

### cdid_legacy

stardog data export --named-graph http://gss-data.org.uk/def/cdid_legacy  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cdid_legacy.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/cdid_legacy gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/cdid_legacy.ttl

### cdid_legacy
stardog data export --named-graph http://gss-data.org.uk/graph/hmrc-regions  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/hmrc-regions.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/hmrc-regions gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/hmrc-regions.ttl

### ons-functional-category
stardog data export --named-graph http://gss-data.org.uk/graph/ons-functional-category  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/ons-functional-category.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/ons-functional-category gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/ons-functional-category.ttl

### bop-services
stardog data export --named-graph http://gss-data.org.uk/graph/bop-services  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/bop-services.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/bop-services gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/bop-services.ttl

### export-and-import-activity
stardog data export --named-graph http://gss-data.org.uk/graph/export-and-import-activity  --format TURTLE http://localhost:9820/gss_alpha /Users/jenw/Documents/GitHub/ons-data-export/export/ref/export-and-import-activity.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/export-and-import-activity gss_export /Users/jenw/Documents/GitHub/ons-data-export/export/ref/export-and-import-activity.ttl

### product
stardog data export --named-graph http://gss-data.org.uk/graph/product  --format TURTLE http://localhost:7820/pmd-data /Users/jenw/Documents/GitHub/ons-data-export/export/ref/product.ttl
stardog data add --named-graph http://gss-data.org.uk/graph/vocab/product  --format TURTLE cogs-staging /Users/jenw/Documents/GitHub/ons-data-export/export/ref/product.ttl




stardog data export --named-graph http://gss-data.org.uk/def/concept-scheme/sdmx-bop  --format TURTLE http://localhost:7820/pmd-data /Users/jenw/Documents/GitHub/ons-data-export/data-issues/missing-reference-data/ref/sdmx-bop.ttl


stardog data add --named-graph http://gss-data.org.uk/graph/vocab/sdmx-bop  --format TURTLE cogs-staging-2020-04-23 /Users/jenw/Documents/GitHub/ons-data-export/data-issues/missing-reference-data/ref/sdmx-bop.ttl


## "Combined Nomenclature, 2012" (hmrc_rts product dimension values)
stardog data export --named-graph https://trade.ec.europa.eu/def/cn_2012 --format TURTLE http://localhost:7820/pmd-data /Users/jenw/Documents/GitHub/ons-data-export/data-issues/missing-reference-data/ref/cn_2012.ttl

stardog data add cogs-staging /Users/jenw/Documents/GitHub/ons-data-export/data-issues/missing-reference-data/ref/cn_2012.trig 











