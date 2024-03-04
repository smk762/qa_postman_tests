# A short sleep to let mm2 get started...
sleep 5

QASE_RUN_ID=1

newman run -r qase collection.json -e environment.json --reporter-qase-logging --reporter-qase-projectCode $PROJECT_CODE --reporter-qase-apiToken $API_TOKEN --reporter-qase-runId 1 --reporter-qase-basePath https://api.qase.io/v1 --reporter-qase-runName 'DeFi API tests' --reporter-qase-runDescription 'Check API consistency' --reporter-qase-rootSuiteTitle 'Newman tests' -x # WA for issue https://github.com/postmanlabs/newman/issues/2148#issuecomment-665229759
