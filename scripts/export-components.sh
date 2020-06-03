#!/bin/bash
set -e #exit on error


DB_FROM=$1
DATASET_GRAPH_URI=$2
DATASET_URI=$3
DATASET_SLUG=$4

export WORKING_DIR=/Users/jenw/Documents/GitHub/ons-data-export
export OUTPUT_DIR=${WORKING_DIR}/export/${DATASET_SLUG}
export MUTTNIK_DIR=/Users/jenw/Documents/GitHub/muttnik

if [[ -n "$DATASET_URI" && 
   -n "$DATASET_GRAPH_URI" && 
  -n "$DB_FROM" ]]; then

    cd $WORKING_DIR
    mkdir -p $OUTPUT_DIR
    
  	echo
  	echo "Querying for components used in <$DATASET_URI>"
  	echo


    dimensions_output=$OUTPUT_DIR/dimensions.trig
    attributes_output=$OUTPUT_DIR/attributes.trig
    measures_output=$OUTPUT_DIR/measures.trig
    
    stardog query -b cube="<$DATASET_URI>" cube_graph="<$DATASET_GRAPH_URI>" -f TRIG $DB_FROM $WORKING_DIR/queries/construct-dimensions.sparql > $dimensions_output

    stardog query -b cube="<$DATASET_URI>" cube_graph="<$DATASET_GRAPH_URI>" -f TRIG $DB_FROM $WORKING_DIR/queries/construct-attributes.sparql > $attributes_output

    stardog query -b cube="<$DATASET_URI>" cube_graph="<$DATASET_GRAPH_URI>" -f TRIG $DB_FROM $WORKING_DIR/queries/construct-measures.sparql > $measures_output


          GRAPH_URI="http://gss-data.org.uk/graph/components"

         # DRAFTER
          echo "Creating triples to make components public in drafter"
          echo
          echo "<${GRAPH_URI}> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://publishmydata.com/def/drafter/ManagedGraph> . 
          <${GRAPH_URI}> <http://publishmydata.com/def/drafter/isPublic> true ." > "${OUTPUT_DIR}/drafter-components.ttl"

          echo "<${GRAPH_URI}-metadata> a <http://publishmydata.com/def/drafter/ManagedGraph> . 
          <${GRAPH_URI}-metadata> <http://publishmydata.com/def/drafter/isPublic> true . " > "${OUTPUT_DIR}/drafter-components-metadata.ttl"
          


  	echo
  	echo "Finished exporting components"
  	echo 

else
    echo script error: There appears to be an error a required variable was not set.    
    echo "usage:"
    echo "export-components.sh <db-from> <dataset-graph-uri> <dataset-uri> <dataset-slug>"
    echo "e.g. ./export-components.sh http://localhost:7820/pmd-data http://gss-data.org.uk/graph/gss_data/trade/hmrc_rts http://gss-data.org.uk/data/gss_data/trade/hmrc_rts hmrc_rts"
fi