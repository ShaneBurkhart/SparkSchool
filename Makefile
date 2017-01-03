.PHONY: assets

all: dev

build:
	docker-compose -f docker-compose.dev.yml build

npm:
	docker-compose -f docker-compose.dev.yml run app npm install

dev:
	docker-compose -f docker-compose.dev.yml up -d

jekyll:
	bundle install
	jekyll build --source ./courses --destination ./courses/_site

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

assets:
	docker-compose -f docker-compose.dev.yml run app gulp build

watch-css:
	docker-compose -f docker-compose.dev.yml run app gulp sass:watch
