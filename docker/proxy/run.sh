#!/bin/bash

set -e

# Avoid replacing these with envsubst
export host=\$host
export request_uri=\$request_uri

# Generate the configuration file from the template, specifying the environment variables to substitute
envsubst '\$DOMAIN \$APP_HOST \$APP_PORT' < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

# Start Nginx
nginx -g 'daemon off;'
