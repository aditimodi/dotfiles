#!/bin/bash

set -e

echo "Installing the latest version of node"
curl -sL install-node.now.sh | sh -s -- -P "$HOME/.local" 
nodejs -V


