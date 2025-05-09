#!/bin/bash
set -e  # Exit on error
echo "Installing dependencies..."
python -m pip install --upgrade pip
pip install -r requirements.txt

echo "Collecting static files..."
mkdir -p static
mkdir -p media
mkdir -p staticfiles
python manage.py collectstatic --noinput --clear

echo "Running migrations..."
python manage.py makemigrations
python manage.py migrate

# Create a test file to verify static files
echo "Testing static files" > static/test.txt

echo "Build completed successfully!"

# Create superuser if needed
# python manage.py createsuperuser --noinput 