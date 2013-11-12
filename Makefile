NAME = phusion/dockerizer
VERSION = 0.2.0

.PHONY: all build update tag_latest

all: build

build:
	docker build -t $(NAME):$(VERSION) -rm .

update:
	rm -f cid.txt
	docker run -cidfile cid.txt -v `pwd`:/input $(NAME):$(VERSION) sh -c 'cp /input/stack/* /build/ && chown root:root /build/*'
	docker commit `cat cid.txt` $(NAME) $(VERSION)
	rm -f cid.txt

tag_latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest
