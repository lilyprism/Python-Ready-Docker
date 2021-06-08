#!/bin/sh
# Clone the repo
echo "Cloning $GIT_REPO this may take a while..."
git -C repo pull || git clone https://"$GITHUB_USER":"$GITHUB_TOKEN"@"$GIT_REPO" repo

# Enter the repo or exit on error
echo "Cloning complete, entering repo directory"
cd repo || exit

# Change permissions on start script
chmod +x ./start.sh
./start.sh
