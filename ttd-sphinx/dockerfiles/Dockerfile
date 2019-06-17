FROM alpine:3.9
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"

ENV SPHINX_VERSION 2.0.1

VOLUME ["/build/docs"]
COPY dockerfiles/_config /build/_config
COPY dockerfiles/Makefile /build/Makefile
COPY dockerfiles/_theme /build/_theme

RUN adduser -s /bin/false -D -H ttd \
        && apk --no-cache add \
            aspell-en \
            ca-certificates \
            make \
            su-exec \
            tini \
            python3 \
        && python3 -m ensurepip \
        && rm -r /usr/lib/python*/ensurepip

RUN set -x \
        && apk add --no-cache --virtual .build-deps \
            git \
        && pip3 install --no-cache-dir --upgrade pip \
        && pip3 install --no-cache-dir --upgrade setuptools \
        && pip3 install --no-cache-dir sphinx==${SPHINX_VERSION} \
            recommonmark \
            sphinx_rtd_theme \
            sphinx_press_theme \
            sphinx-sitemap \
    && apk del .build-deps

WORKDIR /build

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

EXPOSE 8000
