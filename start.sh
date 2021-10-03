#!/usr/bin/env bash
#echo "Make sure u dont have local node_modules in server/ or client/"
docker-compose -f docker-compose.yaml up -d --force-recreate --build
docker exec -i pg-node-server bash -c "npm run migrate"
