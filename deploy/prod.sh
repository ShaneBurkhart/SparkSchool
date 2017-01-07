#!/bin/bash

git pull origin master

# Build jekyll
docker run --rm -v `pwd`:/app ruby bash -c "bundle install --gemfile=/app/Gemfile && jekyll build --source /app/courses --destination /app/courses/_site"

# Build assets and containers
docker-compose -f docker-compose.prod.yml build app

sudo rm -rf public/*
docker run -v $(pwd)/public:/app/public sparkschool_app gulp build
docker-compose -f docker-compose.prod.yml build nginx

docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d
