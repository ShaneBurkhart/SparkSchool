.PHONY: assets deploy public

all: dev

build:
	docker-compose -f docker-compose.dev.yml build

npm:
	docker-compose -f docker-compose.dev.yml run app npm install

dev:
	docker-compose -f docker-compose.dev.yml up -d

jekyll:
	jekyll build --source ./courses --destination ./courses/_site

jekyll-watch:
	docker run --rm -ti -v `pwd`:/app ruby bash -c "bundle install --gemfile=/app/Gemfile && jekyll build --watch --source /app/courses --destination /app/courses/_site"

logs:
	docker-compose -f docker-compose.dev.yml logs -f

ps:
	docker-compose -f docker-compose.dev.yml ps

stop:
	docker-compose -f docker-compose.dev.yml down

restart:
	docker-compose -f docker-compose.dev.yml restart

migrate:
	docker-compose -f docker-compose.dev.yml exec db psql -U sparkschool sparkschool -c "$$(cat ./db/migration.sql | tr '\n' ' ')"

public:
	rm -rf public/*
	docker-compose -f docker-compose.dev.yml run app gulp build

sitemap:
	docker-compose -f docker-compose.dev.yml run app gulp sitemap

watch-css:
	docker-compose -f docker-compose.dev.yml run app gulp sass:watch

deploy:
	ssh -A ubuntu@35.167.77.85 'cd ~/SparkSchool; git pull origin master; ./deploy/prod.sh'

# Ping google with new sitemap
ping_google:
	curl www.google.com/webmasters/tools/ping?sitemap=https%3A%2F%2Ftrysparkschool.com%2Fsitemap.xml

# Make it easy for Grayson to pull the new code
grayson:
	git pull origin master
	docker run --rm -v `pwd`:/app ruby bash -c "bundle install --gemfile=/app/Gemfile && jekyll build --source /app/courses --destination /app/courses/_site"
	docker-compose -f docker-compose.dev.yml build app
	docker-compose -f docker-compose.dev.yml run app npm install
	rm -rf public/*
	docker-compose -f docker-compose.dev.yml run app gulp build
	docker-compose -f docker-compose.dev.yml build nginx
	docker-compose -f docker-compose.dev.yml down
	docker-compose -f docker-compose.dev.yml up -d
