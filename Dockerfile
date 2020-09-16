FROM wilton/php-ci:7.4

ENV VERSION 0.6.0

USER root

ENTRYPOINT ["/bin/sh", "/run/docker-entrypoint.sh"]

RUN apk update && apk add gnupg sudo && \
  curl -L https://github.com/AGWA/git-crypt/archive/$VERSION.tar.gz | tar zxv -C /var/tmp && \
  cd /var/tmp/git-crypt-$VERSION && \
  make && \
  make install PREFIX=/usr/local && \
  rm -rf /var/tmp/git-crypt-$VERSION

# Copy Files 
COPY --chown=www-data:www-data docker/config/ /
COPY --chown=www-data:www-data ./src .
COPY docker/run/ /run/

# requires mongo-ext 1.5.1
RUN set -ex \ 
  chmod +x /run/docker-entrypoint.sh 
 
