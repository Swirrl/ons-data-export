```
PREFIX skos:    <http://www.w3.org/2004/02/skos/core#>
PREFIX qb:      <http://purl.org/linked-data/cube#>
PREFIX pmdqb:   <http://publishmydata.com/def/qb/>

SELECT *
{
    GRAPH <http://gss-data.org.uk/graph/components> {
        <http://gss-data.org.uk/def/dimension/flow> ?p ?o 
    }
}
```

Migration direction should not be in trade data - remove scheme graph and any link between flow dimension and the migration direction.