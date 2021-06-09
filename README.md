# DjangoReady
 Django Ready Python Docker Images
 
 Serves as helper to deploy multiple django apps without creating a dockerfile for each one<br>
 Git repo must have a start.sh file at the root of the repo that is executed after setup is complete.

includes pipenv
GDAL only on -GDAL tagged versions

### You must use these Environment Variables:
GITHUB_USER<br>
GITHUB_TOKEN<br>
GIT_REPO as 	github.com/(user)/(repo).git<br>


### You can mount:
/home/app/repo -> Where the repo files will be downloaded and be kept updated<br>
/root/.local/share/virtualenvs (if using pipenv)<br>


### start.sh example:
```
#!/bin/sh
echo "Installing pipenv requirements"
pipenv clean
pipenv install
echo "Running django startup"
pipenv run python manage.py collectstatic --no-input
pipenv run gunicorn app.wsgi --workers 4 --bind 0.0.0.0:8000 --preload --timeout 0 --log-level "debug" --enable-stdio-inheritance
```
