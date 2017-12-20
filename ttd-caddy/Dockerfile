#
# Dockerfile for Caddy https://caddyserver.com/
# Addopted from https://github.com/abiosoft/caddy-docker
#
#
# Builder Stage One
#
FROM golang:1.9-alpine as builder

ARG version="0.10.10"

RUN apk add --no-cache curl git

# caddy
RUN git clone https://github.com/mholt/caddy -b "v${version}" /go/src/github.com/mholt/caddy \
    && cd /go/src/github.com/mholt/caddy \
    && git checkout -b "v${version}"

# builder dependency
RUN git clone https://github.com/caddyserver/builds /go/src/github.com/caddyserver/builds

# build
RUN cd /go/src/github.com/mholt/caddy/caddy \
    && git checkout -f \
    && go run build.go \
    && mv caddy /go/bin
#ONBUILD COPY plugins.go /go/src/github.com/mholt/caddy/caddy/caddymain/plugins.go

#
# Final stage - Stage Two
#
FROM alpine:3.7

LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs" \
    caddy_version="0.10.10" \
    architecture="amd64" \
    build_version="$container_version"


RUN apk add --no-cache \
    tini

# install caddy
COPY --from=builder /go/bin/caddy /usr/bin/caddy

# validate install
RUN /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy /srv
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile
#COPY index.html /srv/html/index.html

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
