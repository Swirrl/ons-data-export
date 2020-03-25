#!/bin/bash
set -e #exit on error


DB_FROM=$1
DATASET_URI=$2
DATASET_SLUG=$3

export WORKING_DIR=/Users/jenw/Documents/Projects/muttnik/data/export
export OUTPUT_DIR=${WORKING_DIR}/export/${DATASET_SLUG}
export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik

if [[ -n "$DATASET_URI" && 
  -n "$DB_FROM" ]]; then

    cd $WORKING_DIR
    mkdir -p $OUTPUT_DIR
    
  	echo
  	echo "Querying for components used in <$DATASET_URI>"
  	echo


    components_output=$OUTPUT_DIR/components.trig
    
    stardog query -b cube="<$DATASET_URI>" -f TRIG $DB_FROM $WORKING_DIR/queries/construct-components.sparql > $components_output

          NOW=$(date +"%FT%TZ")
          echo $NOW
          GRAPH_URI="http://gss-data.org.uk/graph/components"

         # DRAFTER
          echo "Creating triples to make components public in drafter"
          echo
          echo "<${GRAPH_URI}> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://publishmydata.com/def/drafter/ManagedGraph> . 
          <${GRAPH_URI}> <http://publishmydata.com/def/drafter/isPublic> true . 
          <${GRAPH_URI}> <http://purl.org/dc/terms/issued> \"${NOW}\"^^xsd:dateTime .
          <${GRAPH_URI}> <http://purl.org/dc/terms/modified> \"${NOW}\"^^xsd:dateTime ." > "${OUTPUT_DIR}/drafter-components.ttl"
          echo "<${GRAPH_URI}-metadata> a <http://publishmydata.com/def/drafter/ManagedGraph> . 
          <${GRAPH_URI}-metadata> <http://publishmydata.com/def/drafter/isPublic> true . 
          <${GRAPH_URI}-metadata> <http://purl.org/dc/terms/issued> \"${NOW}\"^^xsd:dateTime .
          <${GRAPH_URI}-metadata> <http://purl.org/dc/terms/modified> \"${NOW}\"^^xsd:dateTime ." > "${OUTPUT_DIR}/drafter-components-metadata.ttl"
          


  	echo
  	echo "Finished exporting components"
  	echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "export-components.sh <db-from> <dataset-uri> <dataset-slug>"
    echo "e.g. ./export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/ons-pink-book-chapter-3 ons-pink-book-chapter-3"
fi