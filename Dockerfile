### STAGE 1: Build ###

FROM node:12 AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build


### STAGE 2: Run ###

FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html
