#!/bin/bash

DB_TO=$1
DATASET_SLUG=$2


if [[ -n "$DB_TO" && 
  -n "$DATASET_SLUG"  ]]; then

  	export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export
	export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik

	cd $MUTTNIK_DIR


		OUTPUT_DIR=${WORKING_DIR}/export/${DATASET_SLUG}
		echo "getting import files from $OUTPUT_DIR"
  		EXTRA_METADATA_FILE=${WORKING_DIR}/metadata/${DATASET_SLUG}/metadata.trig

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
		    echo "Additional metadata found for $DATASET_SLUG"
			CMD_DRAFTER="stardog data add $DB_TO $EXTRA_METADATA_FILE"
			echo $CMD_DRAFTER
			eval $CMD_DRAFTER
			echo
		else 
			echo "No additional metadata found for $DATASET_SLUG"
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


  	echo
  	echo "FINISHED IMPORT FOR $DATASET_SLUG"
  	echo 


	


else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "import-one.sh <db-to> <dataset-slug>"
    echo "e.g. ./import-one.sh cogs-staging ons-fdi"

fi