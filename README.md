# jenkins2-docker

jenkins2 inside a docker container with support for DooD (Docker out of Docker)

Require socat (https://github.com/willoucom/socat-docker)

# Basic usage

```
docker run -p 8080:8080 -p 5000:5000 -l socat:socat willoucom/jenkins2-docker
```

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
      - soccat
    volumes:
      - data:/var/jenkins_home
  soccat:
    image: willoucom/socat-docker
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
volumes:
  data:
```


[![Build Status](https://travis-ci.org/willoucom/jenkins2-docker.svg?branch=master)](https://travis-ci.org/willoucom/jenkins2-docker)
