FROM node:17-alpine

RUN npm i -g pm2

WORKDIR /usr/src/app
COPY . .
RUN npm i --only=prod

RUN npm run build

CMD ["pm2-runtime", "dist/index.js"]