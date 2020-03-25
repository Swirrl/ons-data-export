#!/bin/bash


PROJ_DIR=/Users/jenw/Documents/GitHub/ons-data-export
CUBE_VALS_DIR=${PROJ_DIR}/validations/cube
PMD_VALS_DIR=${PROJ_DIR}/validations/pmd



# The Stardog SPARQL endpoint is http://<server>:<port>/{db}/query

# echo "Running RDF Cube validations..."
# CMD_CUBE="java -jar ${PROJ_DIR}/validations/rdf-validator-0.3.0-SNAPSHOT-standalone.jar --endpoint http://localhost:5820/gss_export/query --suite ${CUBE_VALS_DIR}"
# echo $CMD_CUBE
# eval $CMD_CUBE

echo "Running PMD validations..."
CMD_PMD="java -jar ${PROJ_DIR}/validations/rdf-validator-0.3.0-SNAPSHOT-standalone.jar --endpoint http://localhost:5820/gss_export/query --suite ${PMD_VALS_DIR}"
echo $CMD_PMD
eval $CMD_PMD