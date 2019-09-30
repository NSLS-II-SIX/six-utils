#!/bin/bash

cd ~/science_comm

# Check the status of git:
git status
git branch -avv
git remote -v
git log -n 3

# Add **ALL** files to be committed:
git add .

git commit -m "[$(date '+%F %H:%M:%S')]: Automatic commit at SIX from $(hostname)"

git push origin master

