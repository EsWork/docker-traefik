[![Build Status](https://travis-ci.org/EsWork/docker-traefik.svg?branch=master)](https://travis-ci.org/EsWork/docker-traefik) 
[![](https://images.microbadger.com/badges/image/eswork/traefik.svg)](https://microbadger.com/images/eswork/traefik "Get your own image badge on microbadger.com")

## Supported tags and respective `Dockerfile` links

- [`latest` , `1.3.1`  (1.3.1/Dockerfile)](https://github.com/eswork/docker-traefik/blob/master/Dockerfile)

Introduction
---

基于`Alpine linux`镜像构建`traefik-1.3.1`

Getting started

Installation
---

自动化构建镜像的可用[Dockerhub](https://hub.docker.com/r/eswork/traefik)和推荐的安装方法

```bash
docker pull eswork/traefik:latest
```

或者你可以自己构建镜像

```bash
docker build -t eswork/traefik github.com/eswork/docker-traefik
```

Quickstart
---

运行traefik：

```bash
docker run --name traefik -d \
  -p 8080:8080 -p 80:80 -p 443:443 \
  -v /etc/localtime:/etc/localtime:ro \
  --restart=unless-stopped -d \
  eswork/traefik
```

或者您可以使用示例[docker-compose.yml](docker-compose.yml)文件启动容器

