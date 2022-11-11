#!/bin/bash
# Update the package index
apt update
# Install security updates
apt -y upgrade
# Install a new package, without unnecessary recommended packages
apt -y install --no-install-recommends nginx python3 git ca-certificates
# Delete cached files we don't need anymore
apt clean
# Delete index
rm -rf /var/lib/apt/lists/*