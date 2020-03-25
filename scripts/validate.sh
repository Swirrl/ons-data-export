#!/bin/bash


PROJ_DIR=/Users/jenw/Documents/GitHub/ons-data-export
CUBE_VALS_DIR=${PROJ_DIR}/validations/cube

echo "Running RDF Cube validations..."

# The Stardog SPARQL endpoint is http://<server>:<port>/{db}/query

CMD_CUBE="java -jar ${PROJ_DIR}/validations/rdf-validator-0.3.0-SNAPSHOT-standalone.jar --endpoint http://localhost:5820/gss_export/query --suite ${CUBE_VALS_DIR}"
echo $CMD_CUBE
eval $CMD_CUBE