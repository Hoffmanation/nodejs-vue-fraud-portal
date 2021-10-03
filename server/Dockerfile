# The instructions for the first stage
FROM node:14.14.0 as builder

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

RUN apt-get install -y python make gcc g++

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

RUN npm install --save nodemon
RUN npm install --save knex@0.20.8

RUN npm install

# The instructions for second stage
FROM node:latest

WORKDIR /server

COPY --from=builder node_modules node_modules

COPY . .

# If you are building your code for production
# RUN npm ci --only=production

CMD [ "npm", "run", "dev" ]