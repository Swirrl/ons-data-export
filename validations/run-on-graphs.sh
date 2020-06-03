#!/bin/bash
# set -e #exit on error

DB_QE=$1
GRAPH_FILE=$2

if [[ -n "$DB_QE" && 
	-n "$GRAPH_FILE" ]]; then

    echo
    echo "PROCESSING VALIDATIONS FOR DB"

    VALIDATE_CMD_1="clj -A:rdf-validator --endpoint ${DB_QE} cogs-whole"

    echo $VALIDATE_CMD_1
    eval $VALIDATE_CMD_1
    echo

    
    echo "Looking up graph details from $GRAPH_FILE"
    echo

    OLDIFS=$IFS
    IFS=','
    [ ! -f $GRAPH_FILE ] && { echo "$GRAPH_FILE file not found"; exit 99; }
    while read graph_uri
    do
      # echo "Graph : $graph_uri"
      # printf '%q\n' "$graph_uri"
      CLEAN_GRAPH=${graph_uri//$'\r'/}
      
      if [[ $CLEAN_GRAPH != "graph_uri" ]] 
      then
      	echo
      	echo "PROCESSING VALIDATIONS FOR $CLEAN_GRAPH"

        VALIDATE_CMD="clj -A:rdf-validator --endpoint ${DB_QE} --graph ${CLEAN_GRAPH} cogs-db"

        echo $VALIDATE_CMD
        eval $VALIDATE_CMD
        echo

      fi

    done < $GRAPH_FILE
    IFS=$OLDIFS

    

  	echo
  	echo "FINISHED VALIDATING ALL GRAPHS"
  	echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
     echo "run-on-graphs.sh <db-query-endpoint> <graphs-file>"
    echo "e.g. ./run-on-graphs.sh http://localhost:5820/cogs-staging/query /path/to/graphs.csv"
fi
