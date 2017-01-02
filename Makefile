all: dev

build:
	docker-compose -f docker-compose.dev.yml build

dev:
	docker-compose -f docker-compose.dev.yml up -d

jekyll:
	bundle install
	jekyll build --source ./courses --destination ./courses/_site

logs:
	docker-compose -f docker-compose.dev.yml logs -f

ps:
	docker-compose -f docker-compose.dev.yml ps
