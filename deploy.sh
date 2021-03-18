#!/usr/bin/env sh

# Stop the script if a command fails
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# ========================
# === Project ============
# ========================

# Add changes to git
git add .

# Commit changes
msg="Rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Push source and build repos
git push -u origin master

# ========================
# === Site ===============
# ========================

# Build the project
hugo

# Go to public folder
cd public

# Add changes to git
git add .

# Commit changes
msg="Rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Push source and build repos
git push -u origin master
