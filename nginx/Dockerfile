FROM nginx:1.18.0

RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled

COPY ./sites-available/quaweb.conf          /etc/nginx/sites-available/quaweb
COPY ./sites-available/quatrobus.conf       /etc/nginx/sites-available/quatrobus

RUN ln -s /etc/nginx/sites-available/quaweb /etc/nginx/sites-enabled/quaweb
RUN ln -s /etc/nginx/sites-available/quatrobus /etc/nginx/sites-enabled/quatrobus

RUN sed -i '/include \/etc\/nginx\/conf.d\/\*.conf;/a include /etc/nginx/sites-enabled/*;' /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]