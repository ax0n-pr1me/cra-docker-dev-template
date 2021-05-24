## base image
FROM node:16.2.0-alpine3.13

## install global packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm install npm@latest -g
RUN npm install react-scripts@4.0.3 -g

## set working directory & give permissions to user `node`
RUN mkdir -p /usr/src/app && chown -R node:node /usr/src/app
WORKDIR /usr/src/app

## switch to non-root user & install dependencies
USER node
COPY --chown=node:node package.json .
COPY --chown=node:node package-lock.json .
ENV PATH /usr/src/app/node_modules/.bin:$PATH
ENV PATH=$PATH:/home/node/.npm-global/bin 
RUN npm install

COPY --chown=node:node . .

CMD ["npm", "start"]