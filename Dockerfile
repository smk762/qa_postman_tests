FROM node:latest
RUN npm install -g newman newman-reporter-html
WORKDIR /tests
COPY ./run_tests.sh .
COPY ./collection.json .
COPY ./environment.json .
