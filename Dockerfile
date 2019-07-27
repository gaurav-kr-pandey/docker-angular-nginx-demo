FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install
RUN npm install -g @angular/cli@7.3.9

COPY . .
#EXPOSE 4200 49153

CMD npm run build --output-path=./app/dist/Demo-App

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist/Demo-App /usr/share/nginx/html