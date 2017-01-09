FROM ubuntu:16.04
MAINTAINER Alexiss

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
        git \
        vim \
        python3 \
        python3-pip \
        mysql-client \
        libmysqld-dev \
        net-tools \
        pwgen &&\
    rm -rf /var/lib/apt/lists/* &&\
    pip3 install uwsgi django mysqlclient &&\
    mkdir -p /home/django/website/model_example/ &&\
    django-admin startapp model_example /home/django/website/model_example/

# uWSGI config
COPY uwsgi.ini /home/django/

# Model_example content
COPY admin.py /home/django/website/model_example/
COPY models.py /home/django/website/model_example/

RUN mkdir -p /home/django/website     &&\
    django-admin startproject website /home/django/website
COPY settings.py /home/django/website/website/
RUN echo yes | python3 /home/django/website/manage.py collectstatic
#RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', '$DJANGO_ADMIN_PASSWORD')" | python3 /home/django/website/manage.py shell

ENV SETTING_PATH=/home/django/website/website/settings.py

EXPOSE 8008

CMD ["/usr/local/bin/uwsgi", "--ini", "/home/django/uwsgi.ini"]
