FROM alpine:latest
LABEL maintainer="jeffrey@vandenborne.co"

RUN set -xe \
    && apk --no-cache add borgbackup

ENTRYPOINT [ "/usr/bin/borg" ]
CMD [ "--help" ]