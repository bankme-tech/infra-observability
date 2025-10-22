#!/bin/sh

# Replace variables in nginx config
sed -e "s/\${GRAFANA_DOMAIN}/$GRAFANA_DOMAIN/g" \
    -e "s/\${ZABBIX_DOMAIN}/$ZABBIX_DOMAIN/g" \
    -e "s/\${PROMETHEUS_DOMAIN}/$PROMETHEUS_DOMAIN/g" \
    -e "s/\${ALERTMANAGER_DOMAIN}/$ALERTMANAGER_DOMAIN/g" \
    -e "s/\${TEMPO_DOMAIN}/$TEMPO_DOMAIN/g" \
    /etc/nginx/nginx.conf > /tmp/nginx.conf

# Start nginx
exec nginx -g 'daemon off;' -c /tmp/nginx.conf
