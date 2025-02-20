FROM node:22 AS build

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install -g @angular/cli

RUN npm install 

RUN npm run build 

FROM nginx:alpine

COPY --from=build /usr/src/app/dist/angular-tour-of-heroes/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
