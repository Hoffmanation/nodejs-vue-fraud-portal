#!/usr/bin/env bash
docker ps -q --filter "name=pg-node-docker" | grep -q . && docker stop pg-node-docker
docker ps -q --filter "name=pg-db-docker" | grep -q . && docker stop pg-db-docker
docker ps -q --filter "name=pg-fe-docker" | grep -q . && docker stop pg-fe-docker
