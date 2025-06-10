#!/usr/bin/env sh
set -eu

find /etc/nginx/conf.d -type f -name '*.template' | while read -r tpl; do

  # Strip only the final .template and add .conf once
  envsubst '$SITE_FQDN $SITE_CERT $SITE_KEY' \
  < "$tpl" > "$(dirname "$tpl")/$(basename "${tpl%.template}").conf"
done

exec nginx -g 'daemon off;'