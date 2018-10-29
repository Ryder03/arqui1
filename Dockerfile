from python:2

workdir /ribbit

copy . /ribbit

run pip install -r requeriments.txt
run python manage.py syncdb --noinput
run python manage.py migrate ribbit_app

cmd python manage.py runserver 0:$PORT