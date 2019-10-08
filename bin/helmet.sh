#!/bin/sh

helm=$(which helm)
if [[ "$1" == "init" ]]; then
  shift
  $helm init $@ \
    --tiller-image "$LOFTSMAN_TILLER_IMAGE" \
    --tiller-namespace loftsman \
    --service-account loftsman \
    --tiller-tls \
    --tiller-tls-cert "$LOFTSMAN_CERT_PATH/cert.pem" \
    --tiller-tls-key "$LOFTSMAN_CERT_PATH/key.pem" \
    --tiller-tls-verify \
    --tls-ca-cert "$LOFTSMAN_CERT_PATH/ca.cert.pem"
else
  # Export these so they'll be used when needed and not when not
  # Exporting them when doing an init like above causes errors
  export TILLER_NAMESPACE=loftsman
  export HELM_TLS_ENABLE=true
  export HELM_TLS_CERT="$LOFTSMAN_CERT_PATH/cert.pem"
  export HELM_TLS_KEY="$LOFTSMAN_CERT_PATH/key.pem"
  export LOFTSMAN_CHART_REPO="$(cat /loftsman/config/charts.repo)"
  # If helm init hasn't occured, do a `helm init --client-only`
  # This is mostly for the adhoc calls
  if [ ! -d $HOME/.helm/repository ]; then
    source client-helm-init
  fi
  $helm $@
fi
