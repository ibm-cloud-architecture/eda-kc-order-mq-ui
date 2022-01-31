#!/usr/bin/env sh
set -eu

envsubst '${API_HOST_ORDERMS} ${API_PORT_ORDERMS}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
