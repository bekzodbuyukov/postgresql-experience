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

## Installing database adapter, psycopg2
To install pycopg2 within Docker:

```bash
docker-compose exec [service-name] pipenv install psycopg2-binary 
```

Installing new software package within Docker and then rebuilding the image from scratch will help us to avoid **Pipfile.lock** conflicts.

> More info about Pipfile.lock conflicts in the book **Django for professionals**, Chapter: 3, page: 42 by _William S. Vincent_.

## Updating the DATABASE config in settings.py file

## Installing and running PostgreSQL locally
