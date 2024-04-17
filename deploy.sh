#!/bin/bash

# Variables
REPO_DIR="~/svaeva-redux/" # Directory where your website will be stored
GIT_REPO="git@github.com:Daisie-Bell/svaeva-redux.git" # Your GitHub repository SSH link
BRANCH="main" # Your repository branch to deploy

# Ensure the repository directory exists
if [ ! -d "$REPO_DIR" ]; then
  mkdir -p "$REPO_DIR"
fi
# Fetch the latest code
git fetch origin
# Reset to the latest code on your branch
git reset --hard origin/$BRANCH

# Additional deployment steps like npm install or build processes
sudo sh run.sh

echo "Deployment completed successfully."
