#!/bin/bash

DB_TO=$1
DATASET_SLUG=$2


if [[ -n "$DB_TO" ]]; then

  	export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export
	export OUTPUT_DIR=${WORKING_DIR}/export/ref
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

	


else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "import-refs.sh <db-to>"
    echo "e.g. ./export-codelists.sh cogs-staging"

fi