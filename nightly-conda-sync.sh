#!/bin/bash

set -e

# Vars
noext=$(echo $0 | rev | cut -d. -f2- | rev)
logfile=/var/log/${noext}/${noext}-$(date "+%F_%H-%M-%S").log
gitcmd=/usr/bin/git

# Clean up just in case
rm -f $logfile

# Check the status of the repos and pull

## rixs
cd /opt/conda_envs/src/rixs
cat << EOF >> $logfile
pwd
$gitcmd status
$gitcmd branch -avv
$gitcmd remote -v
$gitcmd pull --all
$gitcmd log -n 3
EOF

echo -e "\n\n" >> $logfile

## sixtools
cd /opt/conda_envs/src/sixtools
pwd >> $logfile
cat << EOF >> $logfile
pwd
$gitcmd status
$gitcmd branch -avv
$gitcmd remote -v
$gitcmd pull --all
$gitcmd log -n 3
EOF
