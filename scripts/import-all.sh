#!/bin/bash

DB_TO=$1
DATASET_SLUG=$2


if [[ -n "$DB_TO" ]]; then

  	export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export
	export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik

	cd $MUTTNIK_DIR

	DATASET_FILE="${WORKING_DIR}/datasets_to_export.csv"
    
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

      echo "PROCESSING DATA IMPORT FOR $CLEAN_SLUG"
       if [[ $CLEAN_SLUG != "dataset_slug" ]] 
      then
  		OUTPUT_DIR=${WORKING_DIR}/export/${CLEAN_SLUG}
  		EXTRA_METADATA_FILE=${WORKING_DIR}/metadata/${CLEAN_SLUG}/metadata.trig

        for rdf in $OUTPUT_DIR/*.trig; do
			 [ -e "$rdf" ] || continue
			echo
			CMD_TRIG="stardog data add $DB_TO $rdf"
			echo $CMD_TRIG
			eval $CMD_TRIG
			echo
		done

		if [[ -f "$EXTRA_METADATA_FILE" ]]; then
		    echo
		    echo "Additional metadata found for $CLEAN_SLUG"
			CMD_DRAFTER="stardog data add $DB_TO $EXTRA_METADATA_FILE"
			echo $CMD_DRAFTER
			eval $CMD_DRAFTER
			echo
		else 
			echo "No additional metadata found for $CLEAN_SLUG"
		fi

		for ttl in $OUTPUT_DIR/drafter-*.ttl; do
			 [ -e "$ttl" ] || continue
			echo
			CMD_DRAFTER="stardog data add --named-graph http://publishmydata.com/graphs/drafter/drafts $DB_TO $ttl"
			echo $CMD_DRAFTER
			eval $CMD_DRAFTER
			echo
		done

		for gzip in $OUTPUT_DIR/*.gz; do
			 [ -e "$gzip" ] || continue
			echo 
		    CMD_GZ="stardog data add --compression GZIP --format TRIG $DB_TO $gzip"
		    echo $CMD_GZ
		    eval $CMD_GZ
		    echo
		done
      fi

      
    done < $DATASET_FILE
    IFS=$OLDIFS

    echo "Importing extra reference data"
    export REFS_DIR=${WORKING_DIR}/export/ref
	for refrdf in $REFS_DIR/*.trig; do
		 [ -e "$refrdfv" ] || continue
		echo
		CMD_TRIG="stardog data add $DB_TO $refrdf"
		echo $CMD_TRIG
		eval $CMD_TRIG
		echo
	done


  	echo
  	echo "FINISHED ALL DATASETS"
  	echo 


	


else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "import-all.sh <db-to>"
    echo "e.g. ./import-all.sh cogs-staging"

fi