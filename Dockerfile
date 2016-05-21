#
# Gcloud Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >


# Update & install packages for installing curl
RUN apt-get update && \
    apt-get install -y curl lsb-release

#Configure gcloud repository
RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

RUN ls -l /etc/apt/sources.list.d/google-cloud-sdk.list && \
    cat /etc/apt/sources.list.d/google-cloud-sdk.list

# Update & install packages for installing gcloud
RUN apt-get update && \
    apt-get install -y google-cloud-sdk
