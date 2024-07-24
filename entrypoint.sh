#!/bin/sh

set -e

# Applying database migrations
echo "Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start uWSGI
echo "Starting uWSGI..."
exec uwsgi --socket :9000 --workers 4 --master --enable-threads --module storefront.wsgi --harakiri 120 --max-requests 5000 --vacuum --buffer-size 65535 --logto /tmp/uwsgi.log --log-level debug
