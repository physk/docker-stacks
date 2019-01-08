# docker-stacks

## Install
```
cat .env > /etc/environment && for env in $( cat /etc/environment | grep -v "#" | grep -Pv '^\s*$' ); do export $(echo $env | sed -e 's/"//g'); done```
