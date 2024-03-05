#!/bin/bash
echo "Running komodefi tests for $QASE_PROJECT_CODE_MM2"
# A short sleep to let mm2 get started...
sleep 5
QASE_RUN_ID=5
# TODO: Use variable for collection.json sourced from latest postman collection
if [ "$(pwd)" == "/tests" ]; then
    newman run -r qase mm2_collection.json -e mm2_environment.json --reporter-qase-runId $QASE_RUN_ID --reporter-qase-logging --reporter-qase-projectCode $QASE_PROJECT_CODE_MM2 --reporter-qase-apiToken $QASE_API_TOKEN --reporter-qase-basePath $QASE_API_BASE_URL --reporter-qase-runName 'DeFi API tests' --reporter-qase-runDescription 'Check API consistency' --reporter-qase-rootSuiteTitle 'Newman tests' -x # WA for issue
else
    newman run -r qase mm2_collection.json -e mm2_environment_local.json --reporter-qase-runId $QASE_RUN_ID --reporter-qase-logging --reporter-qase-projectCode $QASE_PROJECT_CODE_MM2 --reporter-qase-apiToken $QASE_API_TOKEN --reporter-qase-basePath $QASE_API_BASE_URL --reporter-qase-runName 'DeFi API tests' --reporter-qase-runDescription 'Check API consistency' --reporter-qase-rootSuiteTitle 'Newman tests' -x # WA for issue https://github.com/postmanlabs/newman/issues/2148#issuecomment-665229759
fi

echo "Komodefi Tests finished"