FROM node:latest AS install
WORKDIR /src/app
COPY . .
RUN yarn install

FROM node:latest AS build
WORKDIR /src/app
COPY --from=install /src/app/node_modules ./node_modules
RUN NODE_ENV=production yarn run build

FROM nginx:latest AS final
COPY --from=build /src/app/build /usr/share/nginx/html
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
