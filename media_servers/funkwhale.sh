#!/bin/bash
echo "Creating funkwhale data directory"
mkdir -p ${BASE_DIR}/media_servers/funkwhale/

echo "Creating funkwhale .env"
touch ${BASE_DIR}/media_servers/funkwhale/.env
echo "FUNKWHALE_HOSTNAME=${FUNKWHALE_SUBDOMAIN}.${DOMAIN}" >> ${BASE_DIR}/media_servers/funkwhale/.env
echo "FUNKWHALE_PROTOCOL=http" >> ${BASE_DIR}/media_servers/funkwhale/.env
echo "DJANGO_SECRET_KEY=$(openssl rand -hex 45)" >> ${BASE_DIR}/media_servers/funkwhale/.env
echo "NESTED_PROXY=1" >> ${BASE_DIR}/media_servers/funkwhale/.env