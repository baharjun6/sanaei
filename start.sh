#!/bin/bash

set -e

echo "Starting Sanaei Railway"

export NGINX_PORT=${PORT:-3000}

echo "Using port: $NGINX_PORT"

envsubst '${NGINX_PORT}' \
< /etc/nginx/nginx.conf.template \
> /etc/nginx/nginx.conf


echo "Testing nginx"

nginx -t


echo "Starting supervisor"

exec supervisord -c /etc/supervisor/supervisord.conf -n
