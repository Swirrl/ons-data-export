1. make sure clojure cli is installed
2. open `ons-data-export/validations` in command line
3. run `clj -A:rdf-validator --endpoint http://localhost:5820/db-name/query --graph http://gss-data.org.uk/graph/gss_data/trade/ons_pinkbook cogs` 

Note: 

- `--graph` param is optional but will reduce timeouts on datastores with many datasets
- adjust `ons-data-export/validations/deps.edn` to include/exclude other validation suites available at https://github.com/Swirrl/pmd-rdf-validations (see README for more info)
- the `cogs` argument passes the `suite-to-run` to the rdf-validator, which is defined in `/src/rdf-validator-suite.edn`