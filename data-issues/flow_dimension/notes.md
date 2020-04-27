```
PREFIX skos:    <http://www.w3.org/2004/02/skos/core#>
PREFIX qb:      <http://purl.org/linked-data/cube#>
PREFIX pmdqb:   <http://publishmydata.com/def/qb/>
# DELETE {
#     GRAPH <http://gss-data.org.uk/graph/components> {
#         ?dim qb:codeList ?code_list 
#     }
# }
SELECT *
WHERE
{
    GRAPH <http://gss-data.org.uk/graph/components> {
        BIND(<http://gss-data.org.uk/def/concept-scheme/migration-directions> AS ?code_list)
        ?dim qb:codeList ?code_list 
    }
}
```

Migration direction should not be in trade data - remove scheme graph and any link between flow dimension and the migration direction.

`DROP GRAPH <http://gss-data.org.uk/graph/vocab/migration-directions>`
`DROP GRAPH <http://gss-data.org.uk/graph/vocab/migration-directions-metadata>`