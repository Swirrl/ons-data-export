## How to export a dataset from gss-alpha and import into a local stardog DB

### Prerequisites

1. Connect to `jen-cogs-dev` staging server (in google console `swirrl-staging-servers` project): `ssh -L 9820:localhost:5820 {user}@34.89.101.197` . Note: IP is not fixed
2. Set up a blank stardog db to hold your data locally `stardog-admin db create --name gss-datasets`
3. Make a note of the dataset graph URI and slug you want to export, e.g. `http://gss-data.org.uk/data/gss_data/trade/ons-fdi`

### Exporting: Running the scripts

#### Dataset triples and metadata

Parameters:
 - Remote DB connection/name
 - Graph URI 
 - Dataset slug

```
./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-fdi ons-fdi
```

The graph URI is used as the binding in the scripts that count and export the metadata and data. 
The dataset slug is used in the exported directory structure and filenames.

#### Components

Parameters:
 - Remote DB connection/name
 - Dataset URI
 - Dataset slug

```
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-fdi ons-fdi
```

The dataset URI is used as the binding in the scripts that exports the components 
The dataset slug is used in the exported directory structure and filenames.

#### Code Lists

Parameters:
 - Remote DB connection/name
 - Dataset URI
 - Dataset slug

```
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-fdi ons-fdi
```

The dataset URI is used as the binding in the scripts that exports the concepts and creates the scheme metadata
The dataset slug is used in the exported directory structure and filenames.



#### Importing

```
~/full-path-to/export/scripts/import-all.sh gss_export ons-fdi
```

Note: if there is a local STARDOG_HOME set on dev computer, this may interfere with the environment variables set by `direnv` in muttnik, so if the data produced is sometimes blank, try running the import command from within the muttnik directory before troubleshooting further.

### cmds
```
./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-fdi ons-fdi
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-fdi ons-fdi
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-fdi ons-fdi

./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-international-trade-in-services ons-international-trade-in-services
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-international-trade-in-services ons-international-trade-in-services
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-international-trade-in-services ons-international-trade-in-services

./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-uk-sa-trade-in-goods ons-uk-sa-trade-in-goods
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-sa-trade-in-goods ons-uk-sa-trade-in-goods
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-sa-trade-in-goods ons-uk-sa-trade-in-goods

./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-uk-total-trade ons-uk-total-trade
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-total-trade ons-uk-total-trade
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-total-trade ons-uk-total-trade

```

```
/Users/jenw/Documents/Projects/muttnik/data/export/scripts/import-all.sh gss_export ons-fdi
/Users/jenw/Documents/Projects/muttnik/data/export/scripts/import-all.sh gss_export ons-international-trade-in-services
/Users/jenw/Documents/Projects/muttnik/data/export/scripts/import-all.sh gss_export ons-uk-sa-trade-in-goods
/Users/jenw/Documents/Projects/muttnik/data/export/scripts/import-all.sh gss_export ons-uk-total-trade
```

## TODO

 - `ons-international-trade-in-services/codelist-international-trade-basis.trig` -> 0 triples updated in 00:00:00.108
 - `ons-uk-sa-trade-in-goods/codelist-flow-directions.trig` -> 0 triples updated in 00:00:00.111
 - `ons-uk-sa-trade-in-goods/codelist-migration-directions.trig` -> 0 triples updated in 00:00:00.106
 - `ons-uk-sa-trade-in-goods/codelist-ons-trade-areas-cord.trig` -> 0 triples updated in 00:00:00.125
 - `ons-uk-sa-trade-in-goods/components.trig` -> 0 triples updated in 00:00:00.106
 - `ons-uk-total-trade/codelist-flow-directions.trig` -> 0 triples updated in 00:00:00.117
 - `ons-uk-total-trade/codelist-migration-directions.trig` -> 0 triples updated in 00:00:00.101
 - `ons-uk-total-trade/codelist-ons-trade-areas-cord.trig` -> 0 triples updated in 00:00:00.129
 - `ons-uk-total-trade/components.trig` -> 0 triples updated in 00:00:00.103
