# Based on https://github.com/abiosoft/caddy-docker
#
# Builder
#
FROM testthedocs/caddy-builder as builder

ARG version="1.0.0"
#ARG plugins="git,cors,realip,expires,cache"

# process wrapper
#RUN go get -v github.com/abiosoft/parent

RUN VERSION=${version} ENABLE_TELEMETRY=false /bin/sh /usr/bin/builder.sh

#
# Final stage
#
FROM alpine:3.9

ARG version="1.0.0"

LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor="TestTheDocs" \
    caddy_version="$version"

# Let's Encrypt Agreement
ENV ACME_AGREE="false"

# Telemetry Stats
ENV ENABLE_TELEMETRY="false"

RUN apk add --no-cache tini

# Install Caddy
COPY --from=builder /install/caddy /usr/bin/caddy

# Validate install
RUN /usr/bin/caddy -version
RUN /usr/bin/caddy -plugins


#VOLUME /root/.caddy /srv
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile
COPY index.html /srv/html/index.html
#COPY index.html /srv/html/index.html

#ENTRYPOINT ["bash"]
ENTRYPOINT ["/sbin/tini", "caddy"]
#CMD ["--conf", "/etc/Caddyfile", "--log", "stdout", "--agree=$ACME_AGREE"]

CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]

EXPOSE 80 443 2015