#!/bin/bash

set -e

type -v node &> /dev/null && echo "nodejs found; no need to install again" || ()echo "Installing the latest version of node";
curl -sL install-node.now.sh | sh -s -- -P "$HOME/.local" ;
nodejs -V)


