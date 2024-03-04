FROM node:20
# https://github.com/qase-tms/qase-javascript/blob/master/qase-core-reporter/examples/newman-reporter/README.md
RUN npm install -g newman newman-reporter-qase
WORKDIR /tests
COPY ./run_tests.sh .
COPY ./collection.json .
COPY ./environment.json .
