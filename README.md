# jenkins2-docker

jenkins2 inside a docker container with support for DooD (Docker out of Docker)

[![Build Status](https://travis-ci.org/willoucom/jenkins2-docker.svg?branch=master)](https://travis-ci.org/willoucom/jenkins2-docker)

Require socat (https://github.com/willoucom/socat-docker)

# Docker compose v2

using volumes for persistance
```
version: '2'
services:
  jenkins2:
    image: willoucom/jenkins2-docker
    ports:
      - "8080:8080"
      - "5000:5000"
    depends_on:
      - socat
    volumes:
      - data:/var/jenkins_home
    environment:
      DOCKER_HOST: "tcp://socat:2375"

  socat:
    image: willoucom/socat-docker
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
volumes:
  data:
```
