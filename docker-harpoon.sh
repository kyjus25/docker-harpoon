#!/bin/bash

# Remove Containers
if [ "$(docker ps -a -q)" != "" ]; then
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
fi

# Remove Images
if [ "$(docker image list -a -q)" != "" ]; then
	docker image stop $(docker image list -a -q) --force
	docker image rm $(docker image list -a -q) --force
fi

# Remove Volumes
if [ "$(docker volume list -q)" != "" ]; then
	docker volume stop $(docker volume list -q) --force
	docker volume rm $(docker volume list -q) --force
fi
