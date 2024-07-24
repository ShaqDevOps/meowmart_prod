#!/bin/bash

set -e

# Avoid replacing these with envsubst
export host=\$host
export request_uri=\$request_uri

# Always use the non-SSL config
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
