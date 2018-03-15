FROM debian:stretch
LABEL maintainer="jeffrey@vandenborne.co"

RUN set -xe \
    && DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y install --no-install-recommends python3 python3-dev python3-pip libssl-dev \
                                                  openssl libacl1-dev libacl1 build-essential \
                                                  libzstd-dev libb2-dev liblz4-dev \
    && pip3 install setuptools Cython wheel && pip3 install borgbackup \
    && find /usr/local \
        \( -type d -a -name test -o -name tests \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' +

ENTRYPOINT [ "/usr/local/bin/borg" ]
CMD [ "--help" ]