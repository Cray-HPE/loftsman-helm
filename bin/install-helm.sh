#!/bin/sh

set -e

####################################
# Install helm
####################################
source helm-init-hack

# Initialize Helm
helmet init --upgrade
helm repo remove stable
echo "Waiting for tiller to be up and running..."
echo ""
wait-for-pod tiller-deploy
# Done installing helm