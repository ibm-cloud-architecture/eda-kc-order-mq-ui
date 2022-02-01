FROM nginx:alpine as production-build
RUN touch /var/run/nginx.pid
RUN chown -R nginx:nginx /var/run/nginx.pid
RUN chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/
RUN chmod -R 777 /etc/nginx/
RUN chmod -R 777 /usr/share/nginx/html/


USER nginx

COPY default.conf /etc/nginx/conf.d/default.conf.template

COPY editNginx.sh /docker-entrypoint.d/


 ENV API_HOST_ORDERMS=http://host.docker.internal
 ENV API_PORT_ORDERMS=8080
 ENV API_HOST_VOYAGESMS=http://host.docker.internal
 ENV API_PORT_VOYAGESMS=8081

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stahg 1
COPY dist /usr/share/nginx/html

EXPOSE 8080
#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
