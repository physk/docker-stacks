#!/bin/bash

echo "Creating docker network"
docker network create traefik_proxy

echo "Creating directories"
mkdir -p ${BASE_DIR}/services/traefik
mkdir -p ${BASE_DIR}/docker/shared

echo "Copying traefik configs"
cp templates/template_traefik.toml ${BASE_DIR}/services/traefik/traefik.toml
touch ${BASE_DIR}/services/traefik/servers.toml