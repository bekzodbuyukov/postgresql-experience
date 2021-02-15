# postgresql-experience
To get an experience of using PostgreSQL

General pattern (algorithm)
1. [Setting venv (Pipenv), Django project and Docker](#setting-venv-(pipenv)-django-project-and-docker)
2. [Installing database adapter, psycopg2](#installing-database-adapter-psycopg2)
3. [Updating the DATABASE config in settings.py file](#updating-the-database-config-in-settingspy-file)
4. [Installing and running PostgreSQL locally](#installing-and-running-postgresql-locally)

## Setting venv (Pipenv), Django project and Docker
Follow [these](https://github.com/bekzodbuyukov/docker-experience) steps.

**Note**: **docker-compose.yml** file a little bit different

```yaml
version: '3.8'

services:
  web:
    build: .
    command: python django_project/manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/django_project
    ports: 
      - 8000:8000
    depends_on:
      - db
  db:
    image: postgres:13.2
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
```

We have added new service named **db**, also added this service on depending of **web** service. As a result service **db** runs before **web**.

More info about PostgreSQL in Docker is [here](https://hub.docker.com/_/postgres).

**Warning**: It is very bad practise to share with public **docker-compose.yml** file of production-ready or any other project. In this repo it's done just for example.

## Installing database adapter, psycopg2
To install pycopg2 within Docker (for this you must run Docker in detached mode):

```bash
$ docker-compose exec [service-name] pipenv install psycopg2-binary 
```

Some additional info:
1. **psycopg2-binary** is a stand-alone version of [psycopg2](https://pypi.org/project/psycopg2/), which doesn't require a compiler or external libraries.
2. Installing new software package within Docker and then rebuilding the image from scratch will help us to avoid **Pipfile.lock** conflicts.

> More info about Pipfile.lock conflicts in the book **Django for Professionals**, Chapter: 3, page: 42 by _William S. Vincent_.

## Updating the DATABASE config in settings.py file
Set **DATABASE** settings in **settings.py** to content below:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'db',
        'PORT': 5432
    }
}
```

## Installing and running PostgreSQL locally
To run Docker with our new services in detached mode (we are forcing image build):

```bash
$ docker-compose up -d --build
```

Don't forget to apply migrations, because now we are using new database:

```bash
$ docker-compose exec [service-name] python django_project/manage.py migrate
```

and create super user:

```bash
$ docker-compose exec [service-name] python django_project/manage.py createsuperuser
```

> Using book **Django for Professionals** by _William S. Vincent_
