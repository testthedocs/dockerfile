
# Based on testthedocs/caddy and https://github.com/jojomi/docker-caddy
# First build the binary so we are compliant with the license

# Builder
FROM golang:1.10 as builder

ENV CADDY_VERSION=0.11.0

RUN go get -u github.com/mholt/caddy && go get -u github.com/caddyserver/builds
WORKDIR /go/src/github.com/mholt/caddy/caddy
RUN git checkout v${CADDY_VERSION}
WORKDIR /go/src/github.com/mholt/caddy/caddy
# I decided to disable telemetry in this image.
# If it would have been a simple CLI switch, I would have put the switch to the CMD,
# but it seems I have to disable all metrics one by one.
# Disable next line if you want to contribute to telemetry data collection.
RUN sed -i"" 's/const enableTelemetry = true/const enableTelemetry = false/g' /go/src/github.com/mholt/caddy/caddy/caddymain/run.go
RUN CGO_ENABLED=0 GOOS=linux go run build.go -goos=linux -goarch=amd64


# Final stage

FROM alpine:3.7

ARG version="0.11.0"

LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs" \
    caddy_version="$version"


RUN apk add --no-cache tini

# Install caddy
COPY --from=builder /go/src/github.com/mholt/caddy/caddy/caddy /usr/bin/caddy

WORKDIR /srv

COPY Caddyfile /etc/Caddyfile
#COPY index.html /srv/html/index.html
EXPOSE 80 443 2015


ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]

EXPOSE 80 443 2015
