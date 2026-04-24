
FROM node:24.13.1-alpine

ARG GIT_COMMIT
ENV GIT_COMMIT=${GIT_COMMIT}
ENV DD_ENV="staging"
ENV DD_LOGS_INJECTION=true
ENV DD_GIT_COMMIT_SHA=${GIT_COMMIT}
ENV DD_GIT_REPOSITORY_URL="github.com/hlynbech2/henrik-test-datadog-repo-integration2"
ENV DD_SERVICE="henriktestserver"

WORKDIR /app

COPY package.json .
RUN npm install

COPY server.js .


CMD ["node", "server.js"]
