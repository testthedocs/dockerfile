FROM alpine:latest
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"

ENV SPHINX_VERSION 1.7.1

RUN builddeps=' \
    git \
    ' \
    && adduser -s /bin/false -D -H ttd \
    && apk --no-cache add \
    $builddeps \
    python3 \
    ca-certificates \
    make \
    tini \
    su-exec \
    enchant \
    aspell-en \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade setuptools \
    && pip3 install --no-cache-dir sphinx==${SPHINX_VERSION} \
		sphinx_rtd_theme \
		sphinx-autobuild \
                recommonmark \
                pyenchant \
                sphinxcontrib-spelling \
                sphinxcontrib.gist \
                sphinx_tabs \
    && pip3 install -e git://github.com/svx/sphinxcontrib-osexample.git@plone#egg=sphinxcontrib-osexample \
    && apk del --purge $builddeps

VOLUME ["/build/docs"]

COPY dockerfiles/_config /build/_config
COPY dockerfiles/Makefile /build/Makefile
COPY dockerfiles/_theme /build/_theme

WORKDIR /build

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

EXPOSE 8000
