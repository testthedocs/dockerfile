# ttd-caddy

A [Docker](https://docker.com) image for [Caddy](https://caddyserver.com).

This is a build of Caddy without telemetry.

Based on [caddy-docker](https://github.com/abiosoft/caddy-docker) of Abiola Ibrahim.

## Quick Start

```shell
docker run -d -p 2015:2015 testthedocs/ttd-caddy
```
Point your browser to `http://127.0.0.1:2015`.

![Example screen](https://github.com/testthedocs/ttd-caddy/blob/master/docs/_static/ttd-caddy-default.png)

## Usage

### Default Caddyfile

The image contains a default Caddyfile.

```
0.0.0.0
browse
log stdout
errors stdout
gzip

header / {
      Cache-Control "max-age=86400"
    }

root /srv/html
```

### Paths in container

Caddyfile: `/etc/Caddyfile`

Sites root: `/srv`

### Using local Caddyfile and sites root

Replace `/path/to/Caddyfile` and `/path/to/sites/root` accordingly.

```shell
docker run -d \
    -v /path/to/sites/root:/srv \
    -v path/to/Caddyfile:/etc/Caddyfile \
    -p 2015:2015 \
    testthedocs/ttd-caddy
```

## Building

- First build the builder image by running `make builder`.
- Second run `make image`.

### Stage One

Building Caddy from GitHub (Open Source Version).

### Stage Two

Building the base container using the Caddy binary which got build in Stage One

```bash
docker build -t testthedocs/ttd-caddy
```
