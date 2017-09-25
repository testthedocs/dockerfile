FROM alpine:latest
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"

ENV PIP_CACHE /root/.cache

RUN builddeps=' \
    ca-certificates \
    gcc \
    libffi-dev \
    python-dev \
    musl-dev \
    openssl-dev \
    ' \
    && adduser -s /bin/false -D -H ttduser \
    && apk --no-cache add \
    $builddeps \
    python2 \
    make \
    tini \
    su-exec \
    && python2 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip2 install --upgrade pip \
    && pip2 install --upgrade setuptools \
    && pip2 install ansible-lint \
    && rm -rf $PIP_CACHE \
    && apk del --purge $builddeps

VOLUME ["/build"]


WORKDIR /build

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
