# base image
FROM node:lts as build-stage

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY frontend/package.json /app/package.json
RUN npm install
RUN npm install -g @vue/cli

# add app
COPY frontend /app

# build app for production with minification
RUN npm run build

# production environment
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 5555
CMD ["nginx", "-g", "daemon off;"]
