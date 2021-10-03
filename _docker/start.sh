#!/usr/bin/env bash
usage="$(basename "$0") [-h] [--out-fe] -- script that starts docker containers for development

where:
    --help  show this help text
    --out-fe  does not detach frontend enviorment docker container output"
showfe="-d"
while [ ! $# -eq 0 ]
do
    case "$1" in
        --help | -h)
            echo "$usage"
            exit
            ;;
        --out-fe | -t)
            showfe="-t"
            ;;
    esac
    shift
done
dockerFe="docker run --rm --name pg-fe-server --network=host -e NODE_ENV=development -u \"node\" -w \"/app\" $showfe -p 8080:8080 -v /$(pwd)/../client/:/app node:latest npm run serve"

docker ps -q --filter "name=pg-node-server" | grep -q . && docker stop pg-node-server
docker ps -q --filter "name=pg-db-server" | grep -q . && docker stop pg-db-server
docker ps -q --filter "name=pg-fe-server" | grep -q . && docker stop pg-fe-server

docker run \
    --rm \
    --name pg-db-server \
    -e POSTGRES_PASSWORD=postgres \
    --network=host \
    -d \
    -p 5432:5432\
    -v /$(pwd)/../_docker/db/postgres:/var/lib/postgresql/data  \
    postgres:latest

docker run \
    --rm \
    --name pg-node-server \
    --network=host \
    -e NODE_ENV=development \
    -u "node" \
    -w "/app" \
    -p 3000:3000\
    -d \
    -v /$(pwd)/../server/:/app  \
    node:latest npm run dev

eval $dockerFe

docker exec -i pg-node-server bash -c "npx knex migrate:rollback --all"
docker exec -i pg-node-server bash -c "npx knex migrate:latest"
docker exec -i pg-node-server bash -c "npx knex seed:run"
