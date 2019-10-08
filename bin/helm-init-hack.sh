#!/bin/sh

# Make helm work without internet
# We need to make a dummy repository so helm init doesn't try to add
# an existing valid stable repo.
mkdir -p $HOME/.helm
mkdir -p $HOME/.helm/repository
mkdir -p $HOME/.helm/repository/cache
mkdir -p $HOME/.helm/repository/local
mkdir -p $HOME/.helm/cache/archive

DATE=$(date +%F)
cat <<EOF > $HOME/.helm/repository/repositories.yaml
apiVersion: v1
generated: ${DATE}T12:28:18.387961-06:00
repositories:
- caFile: ""
  cache: /root/.helm/repository/cache/stable-index.yaml
  certFile: ""
  keyFile: ""
  name: stable
  password: ""
  url: localhost
  username: ""
EOF
# End hack