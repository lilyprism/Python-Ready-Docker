# DjangoReady
 Django Ready Python Docker Images
 
 Serves as helper to deploy multiple django apps without creating a dockerfile for each one<br>
 Git repo must have a start.sh file at the root of the repo that is executed after setup is complete.

includes GDAL and pipenv

<h3>You must use these Environment Variables: </h3>
GITHUB_USER<br>
GITHUB_TOKEN<br>
GIT_REPO as 	github.com/(user)/(repo).git<br>
<br>
<h3>You can mount:</h3>
/home/app/repo -> Where the repo files will be downloaded and be kept updated<br>
/root/.local/share/virtualenvs (if using pipenv)<br>
