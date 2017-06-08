FROM alpine:3.5
LABEL maintainer "v.la@live.cn"

ENV TRAEFIK_VERSION=1.3.0 \
    TRAEFIK_USER=TRAEFIK \
    TRAEFIK_ETC_DIR=/etc/traefik

RUN apk --update upgrade \
    && apk --no-cache --no-progress add ca-certificates \
    && rm -rf /var/cache/apk/*

LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \    
      org.label-schema.version="vTRAEFIK_VERSION" \
      org.label-schema.docker.schema-version="1.0"

COPY traefik /usr/local/bin/
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh \
    && chmod 755 /usr/local/bin/traefik

EXPOSE 80/tcp

VOLUME ["${TRAEFIK_ETC_DIR}"]
WORKDIR ${TRAEFIK_ETC_DIR}

ENTRYPOINT ["entrypoint.sh"]
CMD ["--help"]

