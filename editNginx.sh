#!/usr/bin/env sh
set -eu
echo "Configuring..."
envsubst '${API_HOST_ORDERMS} ${API_PORT_ORDERMS} ${API_HOST_VOYAGESMS} ${API_PORT_VOYAGESMS}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
echo "Configured ..."
exec "$@"
