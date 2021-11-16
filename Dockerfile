FROM node:16.13.0 as build
WORKDIR /app
COPY . /app
RUN npm install -y -g @angular/cli
RUN npm run build
EXPOSE 4200



FROM nginx:latest
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/dist/* /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]

