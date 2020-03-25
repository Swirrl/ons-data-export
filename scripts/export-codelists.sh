#!/bin/bash
# set -e #exit on error

DB_FROM=$1
DATASET_URI=$2
DATASET_SLUG=$3

export GRAPH_PREFIX=http://gss-data.org.uk/graph
export CUBE_PREFIX=http://gss-data.org.uk/data

export WORKING_DIR=/Users/jenw/Documents/Projects/muttnik/data/export
export OUTPUT_DIR=${WORKING_DIR}/export/${DATASET_SLUG}
export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik


if [[ -n "$DATASET_URI" && 
  -n "$DB_FROM" ]]; then

  	cd $WORKING_DIR
    mkdir -p $OUTPUT_DIR

# METADATA
  	echo
  	echo "Querying for code lists used in <$DATASET_URI>"
  	echo

    codelist_output=$OUTPUT_DIR/code-lists.csv
    
    stardog query -b cube="<$DATASET_URI>" -f CSV $DB_FROM $WORKING_DIR/queries/cube-code-lists.sparql > $codelist_output

    IFS=$'\n' read -d '\r' -r -a codelists < $codelist_output

    for i in "${codelists[@]}"
    do
       : 

       # echo $i
       if [[ $i == http* ]] 
       then
          SLUG=$(basename $i)
          # printf '%q\n' "$SLUG"
          CLEAN_SLUG=${SLUG//$'\r'/}
          echo "Exporting graph for code list: $CLEAN_SLUG" 
          # printf '%q\n' "$CLEAN_SLUG"
          GRAPH_URI=${GRAPH_PREFIX}/${CLEAN_SLUG}
          

          DATA_OUTPUT=$OUTPUT_DIR/codelist-${CLEAN_SLUG}.trig

          echo "Constructing concept scheme triples for $CLEAN_SLUG"
          echo "Saving to $DATA_OUTPUT"

          CMD="stardog query -b graph=\"<$GRAPH_URI>\" -f TRIG $DB_FROM $WORKING_DIR/queries/construct_codelist_data.sparql > $DATA_OUTPUT"
          echo $CMD
          eval $CMD

          echo

          echo "Constructing muttnik friendly metadata for concept scheme $CLEAN_SLUG"
          CS_URI="http://gss-data.org.uk/def/concept-scheme/${CLEAN_SLUG}"

          METADATA_OUTPUT=$OUTPUT_DIR/codelist-${CLEAN_SLUG}-metadata.trig
          echo "Saving to $METADATA_OUTPUT"

          CMD_M="stardog query -b concept_scheme=\"<$CS_URI>\" -f TRIG $DB_FROM $WORKING_DIR/queries/construct_codelist_metadata.sparql > $METADATA_OUTPUT"
          echo $CMD_M
          eval $CMD_M

          NOW=$(date +"%FT%TZ")
          echo $NOW
          NEW_GRAPH_URI=${GRAPH_PREFIX}/vocab/${CLEAN_SLUG}

         # DRAFTER
          echo "Creating triples to make codelist public in drafter"
          echo
          echo "<${NEW_GRAPH_URI}> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://publishmydata.com/def/drafter/ManagedGraph> . 
          <${NEW_GRAPH_URI}> <http://publishmydata.com/def/drafter/isPublic> true . 
          <${NEW_GRAPH_URI}> <http://purl.org/dc/terms/issued> \"${NOW}\"^^xsd:dateTime .
          <${NEW_GRAPH_URI}> <http://purl.org/dc/terms/modified> \"${NOW}\"^^xsd:dateTime ." > "${OUTPUT_DIR}/drafter-cl-${CLEAN_SLUG}.ttl"
          echo "<${NEW_GRAPH_URI}-metadata> a <http://publishmydata.com/def/drafter/ManagedGraph> . 
          <${NEW_GRAPH_URI}-metadata> <http://publishmydata.com/def/drafter/isPublic> true . 
          <${NEW_GRAPH_URI}-metadata> <http://purl.org/dc/terms/issued> \"${NOW}\"^^xsd:dateTime .
          <${NEW_GRAPH_URI}-metadata> <http://purl.org/dc/terms/modified> \"${NOW}\"^^xsd:dateTime ." > "${OUTPUT_DIR}/drafter-cl-metadata-${CLEAN_SLUG}.ttl"
          

       fi
       
    done    

  	echo
  	echo "Finished exporting code lists"
  	echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "export-codelists.sh <db-from> <dataset-uri> <dataset-slug>"
    echo "e.g. ./export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/ons-pink-book-chapter-3 ons-pink-book-chapter-3"
fi