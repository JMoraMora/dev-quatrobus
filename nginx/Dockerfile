FROM nginx:1.18.0

RUN mkdir /etc/nginx/templates
COPY ./templates/default.conf.template /etc/nginx/templates/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]