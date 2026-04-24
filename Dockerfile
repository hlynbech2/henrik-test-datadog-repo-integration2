
FROM node:24.13.1-alpine

ARG GIT_COMMIT
ENV GIT_COMMIT=${GIT_COMMIT}
ENV DD_ENV="staging"
ENV DD_LOGS_INJECTION=true

WORKDIR /app
COPY package.json .
COPY server.js .

RUN npm install

CMD ["node", "server.js"]
