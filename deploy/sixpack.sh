#!/bin/bash

git pull origin master

docker-compose -f ../sixpack/docker-compose.yml build
docker-compose -f ../sixpack/docker-compose.yml stop
docker-compose -f ../sixpack/docker-compose.yml up -d
