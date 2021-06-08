FROM python:3.9-slim-buster
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DockerHOME=/home/app

ARG GITHUB_USER
ARG GITHUB_TOKEN

# User set variables
ENV GITHUB_USER=$GITHUB_USER
ENV GITHUB_TOKEN=$GITHUB_TOKEN
ENV GIT_REPO=github.com/sayga231/DjangoReady.git
ENV PORT 8000

# set work directory
RUN mkdir -p $DockerHOME

# where the code lives
WORKDIR $DockerHOME

# Install dependencies
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get clean -y

# copy whole project to the docker home directory.
COPY . $DockerHOME
RUN cd $DockerHOME

# port where the Django app runs
EXPOSE $PORT
STOPSIGNAL SIGTERM

CMD $DockerHOME/setup.sh
