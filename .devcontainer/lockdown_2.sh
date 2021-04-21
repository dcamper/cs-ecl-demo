#!/usr/bin/env bash

# Remove ability for vscode user to sudo without a password
sudo rm -f /etc/sudoers.d/vscode
