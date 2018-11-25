#!/bin/bash
set -euo pipefail

if [[ $(git diff --stat) != '' ]]; then
  echo 'Changes detected. Please either stash or commit your changes.'
  exit 0
fi

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
HUGO_ENV=production hugo

commit_hash=$(git rev-parse HEAD)
# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding site using commit $commit_hash"

if [ $# -eq 1 ]; then
  msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
