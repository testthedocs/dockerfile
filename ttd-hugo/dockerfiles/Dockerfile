FROM alpine:3.11
LABEL maintainer "Sven <sven@testthedocs.org" \
        org.label-schema.vendor = "TestTheDocs" \
        hugo_version=$HUGO_VERSION

ENV HUGO_VERSION 0.62.1
ENV PIP_CACHE /root/.cache


RUN builddeps=' \
	wget \
	tar \
        python3 \
	' \
	&& adduser -s /bin/false -D -H ttd \
        && apk --no-cache add \
	$builddeps \
        tini \
        su-exec \
        libc6-compat \
        g++ \
        git \
        && python3 -m ensurepip \
        && rm -r /usr/lib/python*/ensurepip \
        && pip3 install --upgrade pip \
        && pip3 install pygments \
	&& wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& tar zxf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& mv hugo /usr/local/bin/hugo \
	&& rm hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& apk del --purge $builddeps \
        && rm -rf $PIP_CACHE

VOLUME /src
WORKDIR /src

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 1313

ENTRYPOINT [ "/sbin/tini", "--", "/usr/local/bin/entrypoint.sh" ]


