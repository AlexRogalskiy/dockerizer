VERSION = 1.0

.PHONY: all build update tag_latest

all: build

build:
	docker build -t phusion/dockerizer:$(VERSION) -rm .

update:
	rm -f cid.txt
	docker run -cidfile cid.txt -v `pwd`:/input phusion/dockerizer:$(VERSION) sh -c 'cp /input/stack/* /build/ && chown root:root /build/*'
	docker commit `cat cid.txt` phusion/dockerizer $(VERSION)
	rm -f cid.txt

tag_latest:
	docker tag phusion/dockerizer:$(VERSION) phusion/dockerizer:latest
