FROM node:latest
# https://github.com/qase-tms/qase-javascript/blob/master/qase-core-reporter/examples/newman-reporter/README.md
RUN npm install -g newman newman-reporter-qase
WORKDIR /tests
COPY ./.env .
COPY ./run_tests.sh .
COPY ./collection.json .
COPY ./environment.json .
