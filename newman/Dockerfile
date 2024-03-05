FROM node:20
# https://github.com/qase-tms/qase-javascript/blob/master/qase-core-reporter/examples/newman-reporter/README.md
RUN npm install -g newman newman-reporter-qase
WORKDIR /tests
COPY ./run_tests.sh ./run_tests.sh
COPY ./run_kmd_tests.sh ./run_kmd_tests.sh
COPY ./run_mm2_tests.sh ./run_mm2_tests.sh
COPY ./kmd_collection.json .
COPY ./kmd_environment.json .
COPY ./mm2_collection.json .
COPY ./mm2_environment.json .
