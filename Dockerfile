ARG loftsman_docker_kubectl_image_version

##########################
# install
##########################
FROM dtr.dev.cray.com/anajjar/loftsman-docker-kubectl:${loftsman_docker_kubectl_image_version} as install

ARG helm_version
RUN wget -q https://storage.googleapis.com/kubernetes-helm/helm-${helm_version}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

##########################
# helm
##########################
FROM dtr.dev.cray.com/anajjar/loftsman-docker-kubectl:${loftsman_docker_kubectl_image_version} as helm

COPY --from=install /usr/local/bin/helm /usr/local/bin/
