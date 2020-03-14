#!/bin/bash
set -e

# create database
flask db init
flask db migrate
flask db upgrade

if [ "$ENV" = 'DEV' ]; then
  echo "Running Development Server"
  flask run --host=0.0.0.0
elif [ "$ENV" = 'UNIT' ]; then
  echo "Running Unit Tests"
  flask test
else
  echo "Running Production Server"
  uwsgi --http 0.0.0.0:9090 --wsgi-file /flasky/flasky.py \
    --callable app --stats 0.0.0.0:9191 --processes 4 --threads 2
fi