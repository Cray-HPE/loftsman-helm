#!/bin/sh

set -e

helm=$(which helm)

source helm-init-hack

$helm init --client-only > /dev/null 2>&1
$helm repo remove stable > /dev/null 2>&1
$helm repo add loftsman $LOFTSMAN_CHART_REPO > /dev/null 2>&1