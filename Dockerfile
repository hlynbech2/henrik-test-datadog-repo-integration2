
FROM node:24.13.1-alpine

ARG GIT_COMMIT
ENV GIT_COMMIT=${GIT_COMMIT}

WORKDIR /app
COPY server.js .

CMD ["node", "server.js"]
