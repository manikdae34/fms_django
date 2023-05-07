#!/bin/sh

ssh dae@100.42.73.236 <<EOF
  cd fms_django
  git pull
  source /opt/envs/fms_django/bin/activate
  pip install -r requirements.txt
  ./manage.py makemigrations
  ./manage.py migrate  --run-syncdb
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF
