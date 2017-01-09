FROM nginx
MAINTAINER Alexis

RUN apt-get update && apt install -y net-tools

COPY nginx-site.conf /etc/nginx/conf.d/default.conf
COPY uwsgi_params /home/django/

EXPOSE 80
