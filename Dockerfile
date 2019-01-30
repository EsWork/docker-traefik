FROM alpine:3.8

ENV TRAEFIK_VERSION=1.7.8 \
    TRAEFIK_USER=TRAEFIK \
    TRAEFIK_ETC_DIR=/etc/traefik

#china mirrors repos
# RUN echo "https://mirrors.ustc.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories \
# &&  echo "https://mirrors.ustc.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositories


RUN set -ex; \
    apk --update upgrade; \
    apk --no-cache --no-progress add ca-certificates tzdata; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		armhf) arch='arm' ;; \
		aarch64) arch='arm64' ;; \
		x86_64) arch='amd64' ;; \
		*) echo >&2 "error: unsupported architecture: $apkArch"; exit 1 ;; \
	esac; \
	wget --quiet -O /usr/local/bin/traefik "https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-$arch"; \
	chmod +x /usr/local/bin/traefik ;\
    rm -rf /var/cache/apk/*

LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \    
      org.label-schema.version="v1.7.8" \
      org.label-schema.docker.schema-version="1.0"

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 80/tcp

VOLUME ["${TRAEFIK_ETC_DIR}"]
WORKDIR ${TRAEFIK_ETC_DIR}

ENTRYPOINT ["entrypoint.sh"]
CMD ["--help"]

