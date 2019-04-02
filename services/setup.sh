#!/bin/bash

echo "Creating docker network"
docker network create traefik_proxy

echo "Creating base directory"
sudo mkdir -p ${BASE_DIR}
sudo chown -hR ${PUID}:${PGID} ${BASE_DIR}

echo "Creating more directories"
mkdir -p ${BASE_DIR}/services/traefik
mkdir -p ${BASE_DIR}/docker/shared

echo "Copying traefik configs"
cp templates/template_traefik.toml ${BASE_DIR}/services/traefik/traefik.toml
touch ${BASE_DIR}/services/traefik/servers.toml

echo "Updating ${BASE_DIR}/services/traefik/traefik.toml"
sed -i "s#DOMAIN#${DOMAIN}#g" ${BASE_DIR}/services/traefik/traefik.toml
sed -i "s#EMAIL#${CLOUDFLARE_EMAIL}#g" ${BASE_DIR}/services/traefik/traefik.toml