FROM node:alpine as buildsection

WORKDIR /var/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

EXPOSE 80

COPY --from=buildsection /var/app/build /usr/share/nginx/html