#
# Makefile for itasca-reference
#

NAME =	floross/docker-readthedocs:0.0.1-alpha 
NAME_CONTAINER = docker-readthedocs

build:
	docker build -t $(NAME) ./

tag:
	docker tag $(NAME)

release:
	docker push $(NAME)

start:
	docker run -d --name $(NAME_CONTAINER) -p 8000:8000 $(NAME) 
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)

stop:
	docker stop $(NAME_CONTAINER)

compose-up:
	docker-compose --verbose up -d
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)
	
compose-up-rc:
	docker-compose up -d --verbose
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)
run:
	docker-compose run --service-ports --rm $(NAME)
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)