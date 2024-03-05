Dockerised environment for running tests with newman / postman

Notes:
- If you dont add Qase Ids to collection items, newman will increment it. For first run, omit the `--reporter-qase-runId $QASE_RUN_ID` flag to create the initial run ID.
- Use `./setup.sh` to get the zcash params and create .env & config files.
- Use `./build.sh` to (re)build the docker images.
- Use `./run.sh` to run the tests.
- Set which APIs to test in the `newman/.env` file.
