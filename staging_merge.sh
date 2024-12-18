#!/bin/bash
question() {
    echo -e -n "\n\n\033[1m${1}\033[0m [y/n]: "
    declare -i answer
    while true; do
        read yn
        case $yn in
            [Yy]* ) return 0;; # true
            [Nn]* ) return 1;; # false
            * ) echo "Please answer yes or no.";;
        esac
    done
}

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Uncommitted changes"
  exit 1
fi


branch=$(git rev-parse --abbrev-ref HEAD)
git checkout staging-azure
gitpull

if question "git merge $branch"; then
    git merge $branch
fi

if question "push?"; then
    git push
fi 

if question "checkout to initial branch?"; then
    git checkout $branch
fi