#!/bin/bash
# set -e #exit on error

VALIDATOR=$1
DB_QE=$2
TEST_SUITE=$3
GRAPH_FILE=$4

if [[ -n "$VALIDATOR" && 
		-n "$DB_QE" && 
	  -n "$TEST_SUITE" &&
	-n "$GRAPH_FILE" ]]; then

    
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

        VALIDATE_CMD="java -jar ${VALIDATOR} --endpoint ${DB_QE} --suite ${TEST_SUITE} --graph ${CLEAN_GRAPH}"

        echo $VALIDATE_CMD
        eval $VALIDATE_CMD

      fi

    done < $GRAPH_FILE
    IFS=$OLDIFS

    

  	echo
  	echo "FINISHED VALIDATING ALL GRAPHS"
  	echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
     echo "validate.sh <validator-jar> <db-query-endpoint> <test-suite> <graphs-file>"
    echo "e.g. ./validate.sh /path/to/rdf-validator-standalone.jar http://localhost:7820/pmd-data/query /path/to/validations-dir /path/to/graphs.csv"
fi
