#!/bin/bash

# Send completion request to llama-server
curl --request POST \
    --url https://torn.hep.kbfi.ee:38080/v1/completions \
    --header "Content-Type: application/json" \
    --data '{"prompt": "Plan the steps for a Hadoop to CEPH migration in clear steps.","n_predict": 128}'

