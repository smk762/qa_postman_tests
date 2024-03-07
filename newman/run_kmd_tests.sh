#!/bin/bash
echo "Running komodo-cli tests for $QASE_PROJECT_CODE_KMD"
# A short sleep to let komodod get started...
sleep 10
# Run without this flag the first time so that newman creates a run id, then you can use it to run the tests with the flag
QASE_RUN_ID=7

# TODO: Use variable for collection.json sourced from latest postman collection
if [ "$(pwd)" == "/tests" ]; then
    newman run -r qase $QASE_COLLECTION_URL -e kmd_environment.json  --reporter-qase-logging --reporter-qase-projectCode $QASE_PROJECT_CODE_KMD --reporter-qase-apiToken $QASE_API_TOKEN --reporter-qase-basePath $QASE_API_BASE_URL --reporter-qase-runName 'KMD RPC Tests' --reporter-qase-runId $QASE_RUN_ID --reporter-qase-runDescription 'Check komodo-cli' --reporter-qase-rootSuiteTitle 'Komodo deamon tests' -x # WA for issue https://github.com/postmanlabs/newman/issues/2148#issuecomment-665229759
else
    newman run -r qase $QASE_COLLECTION_URL -e newman/kmd_environment_local.json  --reporter-qase-logging --reporter-qase-projectCode $QASE_PROJECT_CODE_KMD --reporter-qase-apiToken $QASE_API_TOKEN --reporter-qase-basePath $QASE_API_BASE_URL --reporter-qase-runName 'KMD RPC Tests' --reporter-qase-runId $QASE_RUN_ID --reporter-qase-runDescription 'Check komodo-cli' --reporter-qase-rootSuiteTitle 'Komodo deamon tests' -x # WA for issue https://github.com/postmanlabs/newman/issues/2148#issuecomment-665229759
fi
echo "komodo-cli tests finished"
