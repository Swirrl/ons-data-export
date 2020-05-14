#!/bin/bash
# set -e #exit on error

DB_FROM=$1
FILEPATH=$2

export GRAPH_PREFIX=http://gss-data.org.uk/graph
export CUBE_PREFIX=http://gss-data.org.uk/data

export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export


if [[ -n "$DB_FROM" && 
  -n "$FILEPATH" ]]; then

  	cd $WORKING_DIR
    DATASET_FILE="${FILEPATH}"
    
    echo "Looking up dataset details from $DATASET_FILE"
    echo

    OLDIFS=$IFS
    IFS=','
    [ ! -f $DATASET_FILE ] && { echo "$DATASET_FILE file not found"; exit 99; }
    while read graph_uri dataset_uri dataset_slug
    do
      # echo "Graph : $graph_uri"
      # printf '%q\n' "$graph_uri"
      CLEAN_GRAPH=${graph_uri//$'\r'/}
      # echo "Dataset : $dataset_uri"
      # printf '%q\n' "$dataset_uri"
      CLEAN_DS=${dataset_uri//$'\r'/}
      # echo "Slug : $dataset_slug"
      # printf '%q\n' "$dataset_slug"
      CLEAN_SLUG=${dataset_slug//$'\r'/}
      # printf '%q\n' "$CLEAN_SLUG"

      echo "PROCESSING DATA EXPORT FOR $CLEAN_SLUG"
       if [[ $CLEAN_SLUG != "dataset_slug" ]] 
      then

        CMD_DATA_EXPORT="./scripts/export-data.sh ${DB_FROM} ${CLEAN_GRAPH} ${CLEAN_SLUG}"
        echo $CMD_DATA_EXPORT
        eval $CMD_DATA_EXPORT

        CMD_COMP_EXPORT="./scripts/export-components.sh ${DB_FROM} ${CLEAN_GRAPH} ${CLEAN_DS} ${CLEAN_SLUG}"
        echo $CMD_COMP_EXPORT
        eval $CMD_COMP_EXPORT

        CMD_CODELIST_EXPORT="./scripts/export-codelists.sh ${DB_FROM} ${CLEAN_DS} ${CLEAN_SLUG}"
        echo $CMD_CODELIST_EXPORT
        eval $CMD_CODELIST_EXPORT
      fi

      
    done < $DATASET_FILE
    IFS=$OLDIFS

    

  	echo
  	echo "FINISHED ALL DATASETS"
  	echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "http://localhost:9820/gss_alpha "
     echo "export-all.sh <db-from> <filename>"
    echo "e.g. ./export-all.sh http://localhost:7820/pmd-data /path/to/datasets.csv"
fi