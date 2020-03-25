## How to export a dataset from gss-alpha and import into a local stardog DB

### Prerequisites

1. Connect to `jen-cogs-dev` staging server (in google console `swirrl-staging-servers` project): `ssh -L 9820:localhost:5820 {user}@34.89.101.197` . Note: IP is not fixed
2. Set up a blank stardog db to hold your data locally `stardog-admin db create --name gss_export`
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

#### Exporting everything in one go

The script `/scripts/export-all.sh` will look at the contents of `/datasets_to_export.csv` and will run each of the export scripts (data, components and code lists) for each row in the CSV file. Adjust the contents of the CSV file if you want to quickly run the commands for a number of datasets. 


### Importing

```
~/full-path-to/export/scripts/import-all.sh gss_export ons-fdi
```

Note: if there is a local STARDOG_HOME set on dev computer, this may interfere with the environment variables set by `direnv` in muttnik, so if the data produced is sometimes blank, try running the import command from within the muttnik directory before troubleshooting further.
