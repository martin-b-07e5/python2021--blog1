# README: Multi-Stage Docker Build & Database Initialization for Django + MySQL

This guide explains how to fully dockerize a Django application using a multi-stage Docker build and initialize the MySQL database from a SQL dump.

---

## Prerequisites

- Docker and Docker Compose installed
- A Django project (with `requirements.txt`)
- A MySQL SQL dump file (e.g., `dump-g6db-YYYYMMDD.sql`)

---

## 1. Project Structure

```
myProjects/
└── blog1/
    ├── appblog/
    ├── blog/
    ├── docker-entrypoint-initdb.d/
    │   └── dump-g6db-YYYYMMDD.sql
    ├── Dockerfile
    ├── docker-compose.yml
    ├── requirements.txt
    └── ...
```

---

## 2. Prepare the Database Dump

1. Create the init folder in your Django project root:
    ```bash
    mkdir -p ./docker-entrypoint-initdb.d/
    ```
2. Copy your MySQL dump into this folder:
    ```bash
    cp /path/to/your/dump-g6db-YYYYMMDD.sql ./docker-entrypoint-initdb.d/
    ```

---

## 3. Dockerfile (Multi-Stage Build)

```dockerfile
# Stage 1: Build dependencies and install Python packages
FROM python:3.12-slim AS builder

WORKDIR /app

RUN apt-get update && \
    apt-get install -y gcc default-libmysqlclient-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && pip install --user -r requirements.txt

# Stage 2: Final image for running the application
FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

COPY . .

ENV PYTHONUNBUFFERED=1

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
```

---

## 4. docker-compose.yml

```yaml
# version: "3.9"
services:
  db:
    image: mysql:lts
    restart: always
    environment:
      MYSQL_DATABASE: g6db
      MYSQL_USER: grupo6
      MYSQL_PASSWORD: holagrupo6
      MYSQL_ROOT_PASSWORD: rootpassword
    ports:
      - "3307:3306"
    volumes:
      - db_data:/var/lib/mysql
      - ./docker-entrypoint-initdb.d/:/docker-entrypoint-initdb.d/:ro

  web:
    build: .
    restart: always
    # command: python manage.py runserver 0.0.0.0:8000
    command: sh -c "/wait-for-it.sh db:3306 -- python manage.py runserver 0.0.0.0:8000"
    volumes:
      - .:/app
    ports:
      - "8001:8000"
    environment:
      MYSQL_DATABASE: g6db
      MYSQL_USER: grupo6
      MYSQL_PASSWORD: holagrupo6
      MYSQL_HOST: db
      MYSQL_PORT: 3306
    depends_on:
      - db

volumes:
  db_data:
```

---

## 5. Important Notes on the SQL Dump

- The SQL dump **must be compatible with MySQL** (not SQLite).
- All foreign key columns must have the **exact same type** as the referenced column (e.g., both `int(11)`).
- The dump will be executed **only the first time** the database volume is created (when it's empty).

---

## 6. Build and Run

**First time (or to reset the DB):**

```bash
docker compose down -v
docker compose up -d --build
```

- This will build the images, create the containers, and initialize the MySQL database from your dump.

---

## 7. Access the Application

- Django: [http://localhost:8001/](http://localhost:8001/)
- MySQL: Host `127.0.0.1`, Port `3307`, User/Password as in `docker-compose.yml`

---

## 8. Troubleshooting

- If you see errors about foreign keys or missing tables, check your SQL dump for type mismatches.
- If you need to re-import the dump, **remove the volume** with `docker compose down -v` before restarting.

---

## 9. Migrations

- If you use a dump that already creates all tables, **do not run Django migrations automatically**.
- If you want Django to manage the schema, let Django create the tables with `python manage.py migrate` and import only the data (not the structure).

---

## 10. Useful Commands

- Enter the web container:
  ```bash
  docker compose exec web bash
  ```
- Enter the db container:
  ```bash
  docker compose exec db bash
  ```
- Run Django migrations manually:
  ```bash
  docker compose exec web python manage.py migrate
  ```

---

## 11. Summary

- Use a multi-stage Docker build for efficient images.
- Place your MySQL dump in `docker-entrypoint-initdb.d/` and mount it in the db service.
- Always check foreign key types in your dump.
- Use `docker compose down -v` to reset the database and re-import the dump.

---

**If you have any doubts about your dump or the process, check the logs with `docker compose logs db` and review error messages carefully.**
