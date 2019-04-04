# docker-stacks

## Install Docker, Docker Compose, Git

```bash
sudo apt update && \
sudo apt install apt-transport-https ca-certificates curl software-properties-common git nano -y && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
sudo apt update && \
sudo apt install docker-ce -y && \
sudo curl -L https://github.com/docker/compose/releases/download/1.23.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
sudo usermod -aG docker ${USER}
```

> Log out and Log In to get the new docker group on your user

## Clone git

```bash
cd ~ && \
git clone https://github.com/physk/docker-stacks.git
```

### Setup Dash if you have not already

```bash
cd ~/docker-stacks/services && \
docker-compose pull && \
docker-compose run --rm dash /usr/bin/dash-setup.sh
```

## Setup ENV
### Edit .env file

```bash
nano ~/docker-stacks/.env
```

### Push .env to local enviroment

```bash
cat ~/docker-stacks/.env > /etc/environment && \
for env in $( cat /etc/environment | grep -v "#" | grep -Pv '^\s*$' ); do export $(echo $env | sed -e 's/"//g' | sed -z 's/["\n\r]//g'); done
```

## Install Services

```bash
cd ~/docker-stacks/services && \
chmod +x ./setup.sh && ./setup.sh && \
docker-compose up -d
```

## Install Media Servers

```bash
cd ~/docker-stacks/media_servers && \
chmod +x setup.sh && ./setup.sh && \
docker-compose up -d
```

## Install Media Content Aggrgators

```bash
cd ~/docker-stacks/media_content && \
docker-compose up -d
```