## How to export a dataset from gss-alpha and import into a local stardog DB

### Prerequisites

1. Tunnel to the server that hosts the db we are retrieving the data from
2. Set up a blank stardog db to hold your data locally, ensure it uses the same properties as a muttnik db

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



### Validating

Run validations on the imported RDF using 

`./script/validate.sh`

This will take a little while to run if the DB has large / a lot of datasets


### Loading in muttnik

Once the data is in a stardog db, muttnik can have a new project added to it using a new `edn` file 

The only config that needs adjusting are the endpoints:

```
 :mut.endpoint/raw-query "http://localhost:5820/gss_export/query"
 :mut.endpoint/raw-update "http://localhost:5820/gss_export/update"
```

Start muttnik and use `(go :gss-export)`, the loader will create any additional graphs required by muttnik to work and then it can be viewed in a browser at `http://localhost:3000`. If you've not set up muttnik before, be sure to follow the README to install all necessary prerequisites to get muttnik working on your machine.