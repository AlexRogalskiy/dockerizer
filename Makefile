.PHONY: all build

all: build

build: 
	docker build -t phusion/dockerizer -rm .
