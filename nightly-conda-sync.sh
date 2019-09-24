#!/bin/bash

set -e

# Vars
noext=$(basename $0 | rev | cut -d. -f2- | rev)
logfile=/var/log/${noext}/${noext}-$(date "+%F_%H-%M-%S").log
gitcmd=/usr/bin/git

# Clean up just in case
rm -f $logfile

echo "Log file: $logfile"

# Check the status of the repos and pull

check_status(){
    printf '=%.0s' {1..80}
    echo
    pwd
    echo

    $gitcmd status
    echo
    $gitcmd branch -avv
    echo
    $gitcmd remote -v
    echo
    $gitcmd pull --all
    echo
    $gitcmd log -n 3

    printf '=%.0s' {1..80}
    echo
}

for pkg in rixs sixtools; do
    pushd /opt/conda_envs/src/$pkg >/dev/null 2>&1
    cat << EOF >> $logfile
$(check_status)
EOF
    popd >/dev/null 2>&1
done

exit 0
