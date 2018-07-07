FROM chaznet/amd64-ubuntu-sbn:16.04
MAINTAINER Chef Software, Inc. <docker@chef.io>, chaz

ARG REFRESHED_ON
ARG CHANNEL=stable
ARG VERSION=2.5.3

ENV DEBIAN_FRONTEND=noninteractive \
    PATH=/opt/chefdk/bin:/opt/chefdk/embedded/bin:/root/.chefdk/gem/ruby/2.4.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update && \
    apt-get install -y wget ssh git tig silversearcher-ag && \
    wget --content-disposition "http://packages.chef.io/files/${CHANNEL}/chefdk/${VERSION}/ubuntu/16.04/chefdk_${VERSION}-1_amd64.deb" -O /tmp/chefdk.deb && \
    dpkg -i /tmp/chefdk.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /chef-repo

WORKDIR /chef-repo

CMD ["/bin/bash"]
