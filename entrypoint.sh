#!/bin/sh

# Applying database migrations
echo "Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn storefront.wsgi:application --bind 0.0.0.0:9000 --workers 4
