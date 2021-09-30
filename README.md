# helm

## Description

This repo contains code to build a container image that provides Helm in a container.  As far as I know, this is only used by Ahoy, but it is here if needed by others.

## Note on Versions

The container built here contains a specific version of `helm` which is used in constructing the image tag at build / publish time.  That version is found in the `.version` file in this directory, and corresponds to the version tag used on the published image.

The container also uses a base image of `docker-kubectl:<version>`.  To keep this consistent everywhere it is used, this version is kept in the `.base_img_version` file in this directory.

To move to a newer `kubectl` version update `.version`.  To move to a newer base docker image, update `.base_img_version`.
