FROM python:3-alpine3.10
LABEL maintainer="Sven <sven@testthedocs.org>" \
    description="ansible-lint" \
    org.label-schema.vendor="TestTheDocs"

ENV PIP_CACHE /root/.cache
ENV AL_VERSION 4.1.0

RUN apk add --no-cache --virtual .build-deps \
        make \
        gcc \
        libc-dev \
        openssl-dev \
        python3-dev \
        libffi-dev \
    && pip install ansible-lint==${AL_VERSION} \
    && rm -rf $PIP_CACHE \
    && apk --no-cache add \
        tini \
        su-exec \
	bash \
    && rm -rf $PIP_CACHE \
    && apk del .build-deps

#VOLUME ["/srv"]


WORKDIR /srv

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
#ENTRYPOINT ["bash"]
