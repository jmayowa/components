FROM node:alpine

USER node
WORKDIR /home/node/app

COPY --chown=node . .

RUN --mount=type=secret,id=npm,dst=/home/node/app/.npmrc,uid=1000 npm install

COPY package.json /home/node/app
RUN npm install 
COPY . /app
EXPOSE 8002

CMD ["node", "index.js" ]