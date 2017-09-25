FROM alpine:latest
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"

ENV PIP_CACHE /root/.cache

RUN adduser -s /bin/false -D -H ttduser \
    && apk --no-cache add \
    $builddeps \
    python3 \
    make \
    tini \
    su-exec \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip \
    && pip3 install --upgrade setuptools \
    && pip3 install yamllint \
    && rm -rf $PIP_CACHE

VOLUME ["/build"]


WORKDIR /build

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
