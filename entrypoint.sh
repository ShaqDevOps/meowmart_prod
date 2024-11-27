#!/bin/sh

set -e  # Exit immediately if a command fails

# Applying database migrations
echo "DEBUG: Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

# Collect static files
echo "DEBUG: Collecting static files..."
python manage.py collectstatic --noinput

# Start Gunicorn
echo "DEBUG: Starting Gunicorn..."
exec gunicorn storefront.wsgi:application --bind 0.0.0.0:9000 --workers 4 --log-level debug
