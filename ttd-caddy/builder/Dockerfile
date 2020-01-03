FROM golang:1.13.5-alpine3.11

RUN apk add --no-cache git gcc musl-dev

COPY builder/builder.sh /usr/bin/builder.sh

CMD ["/bin/sh", "/usr/bin/builder.sh"]

