#!/bin/bash

for d in $HOME/science_comm $HOME/.ipython/profile_collection; do
    pushd $d

    # Check the status of git:
    git status
    git branch -avv
    git remote -v
    git log -n 3

    # Add **ALL** files to be committed:
    git add .

    git commit -m "[$(date '+%F %H:%M:%S')]: Manual commit at SIX from $(hostname)"

    git push origin master

    popd
    echo -e "\n\n"
done

