FROM alpine:latest
LABEL maintainer "Sven <sven@testthedocs.org" \
	    org.label-schema.vendor = "TestTheDocs"


ENV HUGO_VERSION 0.21

LABEL hugo_version=$HUGO_VERSION

RUN builddeps=' \
	ca-certificates \
	wget \
	tar \
	' \
	&& apk --no-cache add \
	$builddeps \
	&& update-ca-certificates \
	&& wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& tar zxf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& mv hugo /usr/local/bin/hugo \
	&& rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
	&& apk del --purge $builddeps

VOLUME /src
WORKDIR /src

ENTRYPOINT [ "hugo" ]


