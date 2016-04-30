FROM jenkinsci/jenkins:2.0
USER root

RUN \
    apt-get purge lxc-docker* | true \
    && apt-get purge docker.io* | true \
    && apt-get update \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb http://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install  --force-yes -y docker-engine=1.9.1-0~jessie \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
