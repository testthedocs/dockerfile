FROM alpine:latest
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"

ENV PIP_CACHE /root/.cache
ENV SPHINX_VERSION 1.6.6

RUN builddeps=' \
    git \
    ' \
    && adduser -s /bin/false -D -H sphinx \
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
    && pip3 install --upgrade pip \
    && pip3 install --upgrade setuptools \
    && pip3 install sphinx==${SPHINX_VERSION} \
		sphinx_rtd_theme \
		sphinx-autobuild \
                recommonmark \
                pyenchant \
                sphinxcontrib-spelling \
    && pip3 install -e git://github.com/svx/sphinxcontrib-osexample.git@plone#egg=sphinxcontrib-osexample \
    && apk del --purge $builddeps \
    && rm -rf $PIP_CACHE

VOLUME ["/build/docs"]

COPY dockerfiles/_config /build/_config
COPY dockerfiles/Makefile /build/Makefile
COPY dockerfiles/_theme /build/_theme

WORKDIR /build

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
