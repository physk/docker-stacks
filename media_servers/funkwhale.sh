#!/bin/bash
mkdir -p ${BASE_DIR}/media_servers/funkwhale/
cd ${BASE_DIR}/media_servers/funkwhale/
touch .env
echo "FUNKWHALE_HOSTNAME=${FUNKWHALE_SUBDOMAIN}.${DOMAIN}" >> .env
echo "FUNKWHALE_PROTOCOL=http" >> .env
echo "DJANGO_SECRET_KEY=$(openssl rand -hex 45)" >> .env
echo "NESTED_PROXY=1" >> .env