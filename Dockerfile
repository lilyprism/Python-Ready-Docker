FROM python:3.9-slim-buster
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DockerHOME=/home/app

# User set variables
ENV GITHUB_USER=sayga231
ENV GITHUB_TOKEN=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
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
RUN git clone https://$GITHUB_USER:$GITHUB_TOKEN@$GIT_REPO repo



# port where the Django app runs
EXPOSE $PORT
STOPSIGNAL SIGTERM

RUN chmod +x /repo/start.sh
CMD repo/start.sh
