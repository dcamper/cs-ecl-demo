#!/usr/bin/env bash

# The name of the Ubuntu variant to use as a command
# line cargument; variants are like 'focal' or 'bionic'
UBUNTU_VARIANT=$1

#------------------------------------------------

# Array containing HPCC versions to install;
# order newest -> oldest
HPCC_VERSION_LIST=(8.0.6 7.12.46 7.10.64 7.8.86)

#------------------------------------------------

function grabPackage
{
    local VERSION=$1

    wget https://cdn.hpccsystems.com/releases/CE-Candidate-${VERSION}/bin/clienttools/hpccsystems-clienttools-community_${VERSION}-1${UBUNTU_VARIANT}_amd64.deb
}

#------------------------------------------------

# Update the repo list
sudo apt update

# Download packages into /tmp
cd /tmp

for v in "${HPCC_VERSION_LIST[@]}"; do
    grabPackage "${v}"
done

# Install packages, then delete them
sudo apt install -y ./hpccsystems-clienttools-community_*-1${UBUNTU_VARIANT}_amd64.deb
rm hpccsystems-clienttools-community_*-1${UBUNTU_VARIANT}_amd64.deb
