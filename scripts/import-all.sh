#!/bin/bash

DB_TO=$1
DATASET_SLUG=$2


if [[ -n "$DATASET_SLUG" && 
  -n "$DB_TO" ]]; then

  	export WORKING_DIR=/Users/jenw/Documents/Projects/muttnik/data/export
	export OUTPUT_DIR=${WORKING_DIR}/export/${DATASET_SLUG}
	export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik

	cd $MUTTNIK_DIR


	for rdf in $OUTPUT_DIR/*.trig; do
		 [ -e "$rdf" ] || continue
		echo
		CMD_TRIG="stardog data add $DB_TO $rdf"
		echo $CMD_TRIG
		eval $CMD_TRIG
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

	for ttl in $OUTPUT_DIR/drafter-*.ttl; do
		 [ -e "$ttl" ] || continue
		echo
		CMD_DRAFTER="stardog data add --named-graph http://publishmydata.com/graphs/drafter/drafts $DB_TO $ttl"
		echo $CMD_DRAFTER
		eval $CMD_DRAFTER
		echo
	done


else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "import-all.sh <db-to> <dataset-slug>"
    echo "e.g. ./export-codelists.sh gss_export ons-pink-book-chapter-3"

fi