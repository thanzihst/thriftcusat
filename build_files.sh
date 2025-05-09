#!/bin/bash
set -e  # Exit on error
echo "Installing dependencies..."
python -m pip install --upgrade pip
pip install -r requirements.txt

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Running migrations..."
python manage.py migrate --noinput

echo "Build completed successfully!"

# Create superuser if needed
# python manage.py createsuperuser --noinput 