FROM node:14
WORKDIR /usr/src/app/public
COPY . .
RUN npm install
EXPOSE 3000
CMD [ "npm","start" ]
