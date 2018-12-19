FROM alpine:3.8
LABEL maintainer "Sven <sven@testthedocs.org" \
    org.label-schema.vendor = "TestTheDocs"

ENV MKDOCS_VERSION 1.0.4

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN adduser -s /bin/false -D -H ttd \
    && apk --no-cache add \
    python3 \
    bash \
    tini \
    su-exec \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade setuptools \
    && pip3 install --no-cache-dir mkdocs==${MKDOCS_VERSION} \
        pygments \
        mkdocs-material \
        pymdown-extensions

VOLUME ["/docs/"]

WORKDIR /docs/


ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

# Expose MkDocs development server port
EXPOSE 8000

# Below settings are used for debug and stuff
#ENTRYPOINT ["mkdocs"]
#CMD ["serve", "--dev-addr=0.0.0.0:8000"]
