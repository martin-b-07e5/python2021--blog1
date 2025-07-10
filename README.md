This `README.md` provides a clear guide for other developers to clone and run your application locally.

## 💡Clone the Repository

git clone https://github.com/martin-b-07e5/python2021--blog1.git

### Environment Setup

    cd repositoryName
    cd python2021--blog1

#### 💡Create a virtual environment:

    $ python -m venv env

#### 💡Activate the virtual environment:

    ✅Linux:
    $ source env/bin/activate

    Windows:
    .\env\Scripts\activate

##### list installed packages

    (env) $ pip list
    Package    Version
    ---------- -------
    pip        23.0.1
    setuptools 66.1.1

##### verify installed packages have compatible dependencies

    (env) $ pip check
    No broken requirements found.

#### 💡Install dependencies:

    (env) $ pip install -r requirements.txt

     -r,--requirement <file>
              Install from the given requirements file.  This option can be used multiple times.

##### Output installed packages in requirements format

    (env) $ pip freeze
    pip freeze
    asgiref==3.9.1
    Django==5.2.4
    mysqlclient==2.2.7
    python-dotenv==1.1.1
    pytz==2025.2
    sqlparse==0.5.3

##### verify installed packages have compatible dependencies

    (env) $ pip check
    No broken requirements found.

### Run the Application

#### 💡Perform migrations:

#### 💡If you are inside the container:

    (env) $ python manage.py makemigrations
    (env) $ python manage.py migrate

#### 💡From your host (outside the container):

    $ docker compose exec web python manage.py makemigrations
    $ docker compose exec web python manage.py migrate

💡 Enter the container
(env) ➜ blog1 git:(main) ✗ docker exec -it blog1-web-container bash

root@82a4284c9f5d:/app# python manage.py makemigrations
No changes detected

root@82a4284c9f5d:/app# python manage.py migrate
Operations to perform:
Apply all migrations: admin, appblog, auth, contenttypes, sessions
Running migrations:
No migrations to apply.

#### ✅runserver

    (env) $ python manage.py runserver

    ```bash
    docker compose down -v
    docker compose up -d --build
    ```

##### ✅❗change port

    (env) $ ✗ python manage.py runserver 8001
    Django version 3.2.9, using settings 'blog.settings'
    Starting development server at http://127.0.0.1:8001/
    Quit the server with CONTROL-C.

# usage

## 💡Admin panel

    -  url: 127.0.0.1:8001/admin/
    - user: admin
    - pass: somePassword

    -  url: 127.0.0.1:8001/admin/
    - user: grupo6
    - pass: somePassword


        http://127.0.0.1:8001/admin/

# change password

    (env) $ python manage.py changepassword admin

# create another superuser

        (env) $ python manage.py createsuperuser
        Username: admin2
        Superuser created successfully.

# Video

[video](https://www.youtube.com/watch?v=2I709vaAu-k)

# about

- 👋 Hi, I’m Bergagno Martín -- martin-b-07e5

- 👀 I'm interested in ...
- 🌱 I'm currently learning/improving on... OOA + OOD + OOP + python + django + SQL + Version control using git + Agile project management with Scrum & kanban, ...
- 💞️ I'm looking to collaborate on ...

- 🌱 We're currently learning/improving on... OOA + OOD + OOP + python + django + SQL + Version control using git + Agile project management with Scrum &
- 📫 How to reach me: <a href="https://tinyurl.com/yc8c53kw" title="email" target="_blank">by email</a>
