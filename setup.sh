#!/bin/sh
# Clone the repo
git clone https://"$GITHUB_USER":"$GITHUB_TOKEN"@"$GIT_REPO" repo

# Enter the repo or exit on error
cd repo || exit

# Change permissions on start script
chmod +x start.sh
start.sh
