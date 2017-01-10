django-admin startapp model_example /home/django/website/model_example/
python3 /home/django/website/manage.py makemigrations
python3 /home/django/website/manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'pwd')" | python3 /home/django/website/manage.py shell
