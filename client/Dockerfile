# base image
FROM node:14.14.0

# set working directory
WORKDIR /client

# add `/app/node_modules/.bin` to $PATH
ENV PATH /client/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /client/package.json
RUN npm install
RUN npm install @vue/cli -g

# start app
CMD ["npm", "run", "serve"]