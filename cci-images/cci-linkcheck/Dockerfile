FROM testthedocs/cci-alpine:0.0.1

LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs" \
    name="cci-linkcheck" \
    description="Custom ttd-linkcheck image for CircleCI"


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY linkcheck /usr/local/bin/linkcheck

RUN apk --no-cache add curl

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
