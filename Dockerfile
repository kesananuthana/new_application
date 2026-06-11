FROM ghcr.io/cirruslabs/flutter:3.29.0 AS build

WORKDIR app

COPY ..

Run flutter pub get
Run flutter build web

FROM nginx:alpine

COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

