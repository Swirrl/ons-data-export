#!/bin/bash
# set -e #exit on error

DB_FROM=$1
GRAPH_URI=$2
DATASET_URI=$3
DATASET_SLUG=$4

export GRAPH_PREFIX=http://gss-data.org.uk/graph
export CUBE_PREFIX=http://gss-data.org.uk/data

export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export


if [[ -n "$DB_FROM" ]]; then

  	cd $WORKING_DIR

    CMD_DATA_EXPORT="./scripts/export-data.sh ${DB_FROM} ${GRAPH_URI} ${DATASET_SLUG}"
    echo $CMD_DATA_EXPORT
    eval $CMD_DATA_EXPORT

    CMD_COMP_EXPORT="./scripts/export-components.sh ${DB_FROM} ${GRAPH_URI} ${DATASET_URI} ${DATASET_SLUG}"
    echo $CMD_COMP_EXPORT
    eval $CMD_COMP_EXPORT

    CMD_CODELIST_EXPORT="./scripts/export-codelists.sh ${DB_FROM} ${DATASET_URI} ${DATASET_SLUG}"
    echo $CMD_CODELIST_EXPORT
    eval $CMD_CODELIST_EXPORT

    

  	echo
  	echo "FINISHED EXPORTING ${DATASET_SLUG}"
  	echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "export-one.sh <db-from> <graph-uri> <dataset-uri> <dataset-slug>"
    echo "e.g. ./export-one.sh http://localhost:7820/pmd-data http://gss-data.org.uk/graph/gss_data/trade/hmrc-rts-small-area http://gss-data.org.uk/data/gss_data/trade/hmrc-rts-small-area hmrc-rts-small-area"
fi