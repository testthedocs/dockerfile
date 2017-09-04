#
# Dockerfile for Caddy https://caddyserver.com/
# Addopted from https://github.com/abiosoft/caddy-docker
#
FROM alpine:latest

ARG container_version=0.0.0.0

LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs" \
    caddy_version="0.10.7" \
    architecture="amd64" \
    build_version="$container_version"

RUN builddeps=' \
        tar \
        curl \
        '\
        && apk --no-cache add \
        $builddeps \
        git \
        tini \
        openssh-client \
	&& curl --silent --show-error --fail --location \
		--header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
		"https://caddyserver.com/download/linux/amd64?plugins=http.minify" \
	| tar --no-same-owner -C /usr/bin/ -xz caddy \
	&& chmod 0755 /usr/bin/caddy \
        && /usr/bin/caddy -version \
        && apk del --purge $builddeps

EXPOSE 80 443 2015
VOLUME /root/.caddy
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
