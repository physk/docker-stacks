# docker-stacks

## Install Docker, Docker Compose, Git
```
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common git -y && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
sudo apt-get update && \
sudo apt-get install docker-ce -y && \
sudo curl -L https://github.com/docker/compose/releases/download/1.23.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
sudo usermod -aG docker ${USER}
```

## Clone git
```
cd ~ && \
git clone https://github.com/physk/docker-stacks.git
```

## Setup ENV 
```
cat .env > /etc/environment && \
for env in $( cat /etc/environment | grep -v "#" | grep -Pv '^\s*$' ); do export $(echo $env | sed -e 's/"//g' | sed -z 's/["\n\r]//g'); done
```

## Install Services
```
cd ~/docker-stacks/services && \
docker-compose up -d
```
## Install Media Servers
```
cd ~/docker-stacks/media_servers && \
docker-compose up -d
```
