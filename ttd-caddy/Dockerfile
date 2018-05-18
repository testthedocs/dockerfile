# Dockerfile for Caddy https://caddyserver.com/
# Addopted from https://github.com/abiosoft/caddy-docker
#
# Builder
#
FROM golang:1.10.0-alpine as builder
ARG version="0.11.0"
# We do not use plugins at the moment
#ARG plugins="git,filemanager,cors,realip,expires,cache"
RUN apk add --no-cache curl git gcc musl-dev
COPY builder.sh /usr/bin/builder.sh

# Run the build script
RUN VERSION=${version} PLUGINS=${plugins} ENABLE_TELEMETRY=false /bin/sh /usr/bin/builder.sh

#
# Final stage
#
FROM alpine:3.7

ARG version="0.11.0"

LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs" \
    caddy_version="$version"


# We do not use Let's Encrypt for now
# Let's Encrypt Agreement
#ENV ACME_AGREE="false"

# We do not want Telementry
# Telemetry Stats
ENV ENABLE_TELEMETRY="false"

RUN apk add --no-cache tini

# Install caddy
COPY --from=builder /install/caddy /usr/bin/caddy

# Validate install
RUN /usr/bin/caddy -version
RUN /usr/bin/caddy -plugins

EXPOSE 80 443 2015
VOLUME /root/.caddy /srv
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile
#COPY index.html /srv/html/index.html


#ENTRYPOINT ["/bin/parent", "caddy"]
#CMD ["--conf", "/etc/Caddyfile", "--log", "stdout", "--agree=$ACME_AGREE"]
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
