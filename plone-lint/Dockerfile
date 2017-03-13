FROM alpine:latest
MAINTAINER sven <sven@testthedocs.org>

LABEL os="alpine"

RUN apk --no-cache add \
    musl \
    openssl \
    bash \
    ca-certificates \
    grep

Add ttd-lint /srv/ttd-lint

WORKDIR /srv

# Make sure to check if tini [https://github.com/krallin/tini] could be useful
ENTRYPOINT ["/srv/ttd-lint"]

