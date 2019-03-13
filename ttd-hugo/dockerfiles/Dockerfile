FROM alpine:3.9
LABEL maintainer "Sven <sven@testthedocs.org" \
        org.label-schema.vendor = "TestTheDocs" \
        hugo_version=$HUGO_VERSION

ENV HUGO_VERSION 0.54.0
ENV PIP_CACHE /root/.cache


RUN builddeps=' \
	wget \
	tar \
        python3 \
	' \
	&& adduser -s /bin/false -D -H ttd \
        && apk --no-cache add \
	$builddeps \
        ca-certificates \
        tini \
        su-exec \
        && python3 -m ensurepip \
        && rm -r /usr/lib/python*/ensurepip \
        && pip3 install --upgrade pip \
        && pip3 install pygments \
	&& update-ca-certificates \
	&& wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& tar zxf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& mv hugo /usr/local/bin/hugo \
	&& rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& apk del --purge $builddeps \
        && rm -rf $PIP_CACHE

VOLUME /src
WORKDIR /src

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/sbin/tini", "--", "/usr/local/bin/entrypoint.sh" ]


