#!/bin/bash
set -e #exit on error

DB_UPDATE=$1
DATASET_GRAPH_URI=$2
DATASET_SLUG=$3

export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export
export OUTPUT_DIR=${WORKING_DIR}/export/${DATASET_SLUG}
export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik

if [[ -n "$DATASET_GRAPH_URI" && 
  -n "$DB_UPDATE" ]]; then
    
  	cd $WORKING_DIR

# METADATA
    echo
    echo "UPDATING ADDITIONAL METADATA IN $DB_UPDATE"
    echo

    echo "Drop metadata graph"
    CMD_DROP="stardog query $DB_UPDATE "DROP GRAPH <${DATASET_GRAPH_URI}-metadata>""
    echo CMD_DROP
    # eval CMD_DROP
    
    echo "Add exported metadata"

    echo "Add additional metadata"
    METADATA_FILE=$OUTPUT_DIR/data-$DATASET_SLUG-metadata.trig
    CMD_MD="stardog query -b graph=\"<$DATASET_GRAPH_URI>\" -f TRIG $DB_UPDATE $WORKING_DIR/queries/update_additional_metadata.sparql -v"
    echo $CMD_MD
    # eval $CMD_MD

  echo

    

    echo
    echo "Finished."
    echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "update-additional-data.sh <db-update> <dataset-graph-uri> <dataset-slug>"
    echo "e.g. ./update-additional-data.sh cogs-staging http://gss-data.org.uk/graph/gss_data/trade/ons-fdi ons-fdi"
fi