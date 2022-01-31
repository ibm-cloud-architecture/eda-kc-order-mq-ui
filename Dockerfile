# stage1 as builder
FROM node:10-alpine as builder

WORKDIR /vue-ui

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the files
COPY . .


# Build the project
RUN npm run build


FROM nginx:alpine as production-build
COPY nginx.conf /etc/nginx/conf.d/default.conf.template
COPY docker-entrypoint.sh /

ENV API_HOST_ORDERMS = "http://host.docker.internal"
ENV API_PORT_ORDERMS = "8080"

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stahg 1
COPY --from=builder /vue-ui/dist /usr/share/nginx/html

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
