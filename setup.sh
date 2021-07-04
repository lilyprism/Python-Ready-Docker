#!/bin/sh
while true; do
  # Clone the repo
  echo "Cloning $GIT_REPO this may take a while..."
  git -C repo fetch --all
  # git -C repo clean -fdx
  git -C repo reset --hard origin/master || git clone https://"$GITHUB_USER":"$GITHUB_TOKEN"@"$GIT_REPO" repo

  # Enter the repo or exit on error
  echo "Cloning complete, entering repo directory"
  cd repo || exit

  # Kill everything and start the script
  kill -- -1

  # Change permissions on start script
  chmod +x ./start.sh
  ./start.sh &

  # Wait 5 minutes before starting to check if there are new updates
  sleep 300
  echo "Started checking for updates..."
  while true; do
    git fetch
    UPDATES=$(git rev-list HEAD...origin/master --count) || "0"

    if [ "$UPDATES" -gt 0 ]; then
      echo "There are updates,  restarting..."
      cd ..
      break
    fi
    sleep 60
  done
done
