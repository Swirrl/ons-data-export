#!/bin/bash
set -e #exit on error

DB_FROM=$1
DATASET_GRAPH_URI=$2
DATASET_SLUG=$3
METADATA_ONLY=$4

export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export
export OUTPUT_DIR=${WORKING_DIR}/export/${DATASET_SLUG}
export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik

if [[ -n "$DATASET_GRAPH_URI" && 
  -n "$DB_FROM" ]]; then
    
  	cd $WORKING_DIR
    mkdir -p $OUTPUT_DIR

# METADATA
    echo
    echo "EXPORTING METADATA FROM $DB_FROM"
    echo

    echo "Counting metadata triples for $DATASET_GRAPH_URI"

    stardog query -b graph="<$DATASET_GRAPH_URI>" -f TEXT $DB_FROM $WORKING_DIR/queries/count_metadata_triples.sparql -v

    stardog query -b graph="<$DATASET_GRAPH_URI>" -f TEXT $DB_FROM $WORKING_DIR/queries/count_metadata_triples.sparql > $OUTPUT_DIR/$DATASET_SLUG-metadata-count.txt

    echo
    echo "Querying $DATASET_SLUG metadata graph and constructing muttnik friendly metadata"

    METADATA_FILE=$OUTPUT_DIR/data-$DATASET_SLUG-metadata.trig
    echo "Saving to $METADATA_FILE"
    CMD_MD="stardog query -b graph=\"<$DATASET_GRAPH_URI>\" -f TRIG $DB_FROM $WORKING_DIR/queries/construct_obs_metadata.sparql > $METADATA_FILE"
    echo $CMD_MD
    eval $CMD_MD

  echo

    if [[ "$METADATA_ONLY" != "metadata-only" ]]; then

        # DATA 
        echo
        echo "EXPORTING DATA FROM $DB_FROM"
        echo

        echo "Counting data triples for $DATASET_SLUG"
        stardog query -b graph="<$DATASET_GRAPH_URI>" -f TEXT $DB_FROM $WORKING_DIR/queries/count_data_triples.sparql 

        stardog query -b graph="<$DATASET_GRAPH_URI>" -f TEXT $DB_FROM $WORKING_DIR/queries/count_data_triples.sparql > $OUTPUT_DIR/$DATASET_SLUG-data-count.txt

        echo
        echo "Exporting data contents of $DATASET_SLUG graph"

        DATA_FILE=$OUTPUT_DIR/data-$DATASET_SLUG.trig.gz
        echo "Saving to $DATA_FILE"
        CMD_DATA="stardog data export --named-graph $DATASET_GRAPH_URI --format TRIG $DB_FROM --compression GZIP $DATA_FILE"
        echo $CMD_DATA
        eval $CMD_DATA


        NOW=$(date +"%FT%TZ")
        echo $NOW

        # DRAFTER
        echo "Creating triples to make dataset public in drafter"
        echo
        echo "<${DATASET_GRAPH_URI}> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://publishmydata.com/def/drafter/ManagedGraph> . 
        <${DATASET_GRAPH_URI}> <http://publishmydata.com/def/drafter/isPublic> true . 
        <${DATASET_GRAPH_URI}> <http://purl.org/dc/terms/issued> \"${NOW}\"^^xsd:dateTime .
        <${DATASET_GRAPH_URI}> <http://purl.org/dc/terms/modified> \"${NOW}\"^^xsd:dateTime ." > "${OUTPUT_DIR}/drafter-data-${DATASET_SLUG}.ttl"
        echo "<${DATASET_GRAPH_URI}-metadata> a <http://publishmydata.com/def/drafter/ManagedGraph> . 
        <${DATASET_GRAPH_URI}-metadata> <http://publishmydata.com/def/drafter/isPublic> true . 
        <${DATASET_GRAPH_URI}-metadata> <http://purl.org/dc/terms/issued> \"${NOW}\"^^xsd:dateTime .
        <${DATASET_GRAPH_URI}-metadata> <http://purl.org/dc/terms/modified> \"${NOW}\"^^xsd:dateTime ." > "${OUTPUT_DIR}/drafter-metadata-${DATASET_SLUG}.ttl"

    else 
        echo "Skipping data and drafter RDF creation as this script run updates metadata only"
    fi

    echo
    echo "Finished exporting metadata and data"
    echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "export-data.sh <db-from> <dataset-graph-uri> <dataset-slug>"
    echo "e.g. ./export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-pink-book-chapter-3 ons-pink-book-chapter-3"
fi