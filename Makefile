all: dev

build:
	docker-compose -f docker-compose.dev.yml build

dev:
	docker-compose -f docker-compose.dev.yml up -d

jekyll:
	jekyll build --source ./courses --destination ./courses/_site

logs:
	docker-compose -f docker-compose.dev.yml logs -f

status:
	docker-compose -f docker-compose.dev.yml ps
