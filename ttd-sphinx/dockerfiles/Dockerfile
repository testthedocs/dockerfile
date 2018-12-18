FROM alpine:3.8
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"

ENV SPHINX_VERSION 1.8.2

VOLUME ["/build/docs"]
COPY dockerfiles/_config /build/_config
COPY dockerfiles/Makefile /build/Makefile
COPY dockerfiles/_theme /build/_theme

RUN builddeps=' \
    git \
    ' \
    && adduser -s /bin/false -D -H ttd \
    && apk --no-cache add \
    $builddeps \
    aspell-en \
    ca-certificates \
    make \
    python3 \
    su-exec \
    tini \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade setuptools \
    && pip3 install --no-cache-dir sphinx==${SPHINX_VERSION} \
        recommonmark \
        sphinx_rtd_theme \
        sphinx_press_theme \
        sphinx-sitemap \
    && apk del --purge $builddeps

WORKDIR /build

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

EXPOSE 8000
