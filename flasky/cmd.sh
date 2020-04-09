#!/bin/bash
set -e

# using environment variable from file
file_env() {
   local var="$1"
   local fileVar="${var}_FILE"
   local def="${2:-}"

   if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
      echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
      exit 1
   fi
   local val="$def"
   if [ "${!var:-}" ]; then
      val="${!var}"
   elif [ "${!fileVar:-}" ]; then
      val="$(cat "${!fileVar}")"
   fi
   export "$var"="$val"
   unset "$fileVar"
}
file_env 'SECRET_KEY'
file_env 'MAIL_USERNAME'
file_env 'MAIL_PASSWORD'
file_env 'ADMIN_EMAIL'
file_env 'ADMIN_PASSWORD'

# create roles and admin user
flask deploy

sleep 20

# environment variables
if [ "$ENV" = 'DEV' ]; then
  echo "Running Development Server"
  flask run --host=0.0.0.0
elif [ "$ENV" = 'UNIT' ]; then
  echo "Running Unit Tests"
  flask test
else
  echo "Running Production Server"
  uwsgi --http 0.0.0.0:9090 --wsgi-file /flasky/flasky.py \
    --callable app --stats 0.0.0.0:9191 --processes 2 --threads 2
fi
