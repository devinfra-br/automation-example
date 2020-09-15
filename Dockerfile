FROM wilton/php-ci:7.4

ENTRYPOINT ["/bin/sh", "/run/docker-entrypoint.sh"]

# Copy Files 
COPY --chown=www-data:www-data docker/config/ /
COPY --chown=www-data:www-data ./src .
COPY docker/run/ /run/

# requires mongo-ext 1.5.1
RUN set -ex \ 
  chmod +x /run/docker-entrypoint.sh 
 
