#!/bin/bash

set -e


echo "Starting Sanaei Railway"


export NGINX_PORT=${PORT:-3000}


envsubst '${NGINX_PORT}' \
< /etc/nginx/nginx.conf.template \
> /etc/nginx/nginx.conf


mkdir -p /etc/x-ui


if [ ! -f /etc/x-ui/config.json ]; then

echo "first start"

fi


exec supervisord -c /etc/supervisor/supervisord.conf -n
