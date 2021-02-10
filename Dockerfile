# Pull base image
FROM python:3.8.5

# Set environment variables
# Python will not try to write .pyc files which we do not desire
ENV PYTHONDONTWRITEBYTECODE 1
# ensures our console output looks familiar 
# and is not buffered by Docker, which we also don’t want
ENV PYHTONUNBUFFERED 1

# Set work directory
WORKDIR /django_project

# Install dependencies
COPY Pipfile Pipfile.lock /django_project/
RUN pip install pipenv && pipenv install --system

# Copy project
COPY . /django_project/