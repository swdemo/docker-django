FROM python:3
MAINTAINER Alexis

RUN pip3 install --no-cache-dir uwsgi django mysqlclient &&\
    mkdir -p /home/django/website/model_example/ &&\
    django-admin startapp model_example /home/django/website/model_example/

COPY uwsgi.ini admin.py models.py settings.py /home/django/

RUN mv /home/django/admin.py /home/django/website/model_example/ && \
    mv /home/django/models.py /home/django/website/model_example/ && \
    django-admin startproject website /home/django/website &&\
    mv /home/django/settings.py /home/django/website/website/ && \
    echo yes | python3 /home/django/website/manage.py collectstatic
#RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', '$DJANGO_ADMIN_PASSWORD')" | python3 /home/django/website/manage.py shell

EXPOSE 8008

CMD ["/usr/local/bin/uwsgi", "--ini", "/home/django/uwsgi.ini"]
