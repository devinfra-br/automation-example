#!/bin/sh




touch /app/storage/logs/app.log \
    && mkdir -p /app/storage/cache/MongoDbHydrators \
    && mkdir -p /app/storage/cache/MongoDbProxies \
    && chown -R www-data: /app/storage

echo "date.timezone = America/Sao_Paulo" > /usr/local/etc/php/php.ini-development 
echo "date.timezone = America/Sao_Paulo" > /usr/local/etc/php/php.ini-production

# Aplica índices do mongo via Doctrine
#php artisan ensure-indexes

# supervisor
exec supervisord -n -c /etc/supervisord.conf