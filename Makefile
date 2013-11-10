VERSION = 1.0

.PHONY: all build tag_latest

all: build

build:
	docker build -t phusion/dockerizer:$(VERSION) -rm .

tag_latest:
	docker tag phusion/dockerizer:$(VERSION) phusion/dockerizer:latest
