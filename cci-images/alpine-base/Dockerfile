FROM alpine:3.10

LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs" \
    name="cci-alpine" \
    description="Alpine base image for CircleCI"

RUN adduser -s /bin/false -D -H ttd \
    && apk --no-cache add \
    tini \
    su-exec \
    bash \
    git \
    openssh \
    tar \
    gzip \
    ca-certificates
