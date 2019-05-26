#!/bin/sh

TILLER_IMAGE=$LOFTSMAN_TILLER_IMAGE
CERT_PATH=$LOFTSMAN_CERT_PATH

helm=$(which helm)
if [[ "$1" == "init" ]]; then
  shift
  $helm init $@ \
    --tiller-image "$TILLER_IMAGE" \
    --tiller-namespace loftsman \
    --service-account loftsman \
    --tiller-tls \
    --tiller-tls-cert "$CERT_PATH/cert.pem" \
    --tiller-tls-key "$CERT_PATH/key.pem" \
    --tiller-tls-verify \
    --tls-ca-cert "$CERT_PATH/ca.cert.pem"
else
  $helm $@ \
    --tiller-namespace loftsman \
    --tls \
    --tls-cert "$CERT_PATH/cert.pem" \
    --tls-key "$CERT_PATH/key.pem"
fi
