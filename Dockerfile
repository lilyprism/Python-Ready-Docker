FROM python:3.9-slim-buster
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DockerHOME=/home/app
ENV GIT_REPO=https://github.com/sayga231/DjangoReady.git

# set work directory
RUN mkdir -p $DockerHOME

# where the code lives
WORKDIR $DockerHOME

# Install dependencies
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get clean -y
RUN pip install pipenv

# copy whole project to the docker home directory.
COPY . $DockerHOME
RUN git clone $GIT_REPO repo

# port where the Django app runs
EXPOSE 8000
STOPSIGNAL SIGTERM

CMD repo/start.sh
