#!/bin/bash

# el script se detiene en la primera línea que da error y las siguientes líneas no se ejecutan
set -e

pip install --upgrade -r requirements.txt
docker compose exec web python manage.py makemigrations
docker compose exec web python manage.py migrate
docker compose down -v
docker compose up -d --build
docker image prune -f

