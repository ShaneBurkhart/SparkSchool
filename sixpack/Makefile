all: build

build:
	docker-compose build

stop:
	docker-compose down

logs:
	docker-compose logs

deploy:
	ssh -A ubuntu@52.35.36.109 'cd ~/SparkSchool; git pull origin master; ./deploy/sixpack.sh'
