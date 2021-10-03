#!/usr/bin/env bash
docker-compose down -v
#remove all
docker stop `docker ps -qa`
docker rm `docker ps -qa`
docker rmi -f `docker images -qa `
docker network rm `docker network ls -q`

sudo rm -rf client/node_modules/ && sudo rm -rf server/node_modules/ && sudo rm -rf _docker/db/postgres/
