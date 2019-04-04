#!/bin/bash
echo "Downloading Bitwarden Installer"
curl -Lso ${BASE_DIR}/services/bitwarden/bitwarden.sh https://go.btwrdn.co/bw-sh \
    && chmod +x ${BASE_DIR}/services/bitwarden/bitwarden.sh
echo "Running Install"
cd ${BASE_DIR}/services/bitwarden
mkdir -p bwdata/scripts
curl -s -o bwdata/scripts/run.sh https://raw.githubusercontent.com/bitwarden/server/master/scripts/run.sh
chmod u+x bwdata/scripts/run.sh
mkdir -p bwdata/env
echo "LOCAL_UID=`id -u $(whoami)`" > bwdata/env/uid.env
echo "LOCAL_GID=`id -g $(whoami)`" >> bwdata/env/uid.env
docker run -it --rm --name setup -v ${BASE_DIR}/services/bitwarden/bwdata:/bitwarden \
        --env-file ${BASE_DIR}/services/bitwarden/bwdata/env/uid.env bitwarden/setup:latest \
        dotnet Setup.dll -install 1 -domain ${BITWARDEN_SUBDOMAIN}.${DOMAIN} -letsencrypt n -os lin \
        -corev latest -webv latest
echo "Overriding docker-compose values to make it work with traefik"
cp /home/$(whoami)/docker-stacks/bitwarden/templates/docker-compose.override.yml bwdata/docker/
echo "Starting Bitwarden"
./bitwarden.sh start