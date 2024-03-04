# A short sleep to let mm2 get started...

echo "Running tests for $QASE_PROJECT_CODE"
sleep 5
QASE_RUN_ID=5
newman run -r qase collection.json -e environment.json --reporter-qase-runId 5 --reporter-qase-logging --reporter-qase-projectCode $QASE_PROJECT_CODE --reporter-qase-apiToken $QASE_API_TOKEN --reporter-qase-basePath $QASE_API_BASE_URL --reporter-qase-runName 'DeFi API tests' --reporter-qase-runDescription 'Check API consistency' --reporter-qase-rootSuiteTitle 'Newman tests' -x # WA for issue https://github.com/postmanlabs/newman/issues/2148#issuecomment-665229759

echo "Tests finished"