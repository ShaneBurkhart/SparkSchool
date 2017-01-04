#!/bin/bash

git pull origin master

# Build jekyll
docker run --rm -v `pwd`:/app ruby bash -c "bundle install --gemfile=/app/Gemfile && jekyll build --source /app/courses --destination /app/courses/_site"

# Build assets and containers
docker-compose -f docker-compose.prod.yml build app
docker-compose -f docker-compose.dev.yml run app gulp build
docker-compose -f docker-compose.prod.yml build

docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d
