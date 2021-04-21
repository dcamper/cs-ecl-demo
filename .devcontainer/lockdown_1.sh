#!/usr/bin/env bash

# To make launch.json, which is required by the ECL extension
# and is visible in the repo, non-editable by the user we need
# to jump through some hoops.  The container setup process
# changes the owner of all files to vscode, which means the
# user can modify any file in the repo.  Until the container
# supports the postStartCommand option, we need to move
# launch.json to another location to prevent the chown from
# taking affect.

WD=/etc/HPCCSystems

# Move launch.json to another location
sudo mkdir ${WD}
sudo mv .vscode/launch.json ${WD}/

# Make launch.json uneditable
sudo chmod 444 ${WD}/launch.json
sudo chown root ${WD}/launch.json

# Create softlink
sudo ln -s ${WD}/launch.json .vscode/launch.json
