FROM alpine:latest
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"


RUN adduser -s /bin/false -D -H ttd \
    && apk --no-cache add \
    bash \
    ca-certificates \
    curl \
    tini \
    su-exec \
    zip

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

#ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

