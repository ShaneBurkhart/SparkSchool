FROM node:7.3.0
MAINTAINER Shane Burkhart <shane@trysparkschool.com>

ADD . /app
WORKDIR /app

RUN npm install

EXPOSE 80

CMD ["node", "index.js"]
