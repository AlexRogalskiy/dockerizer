FROM phusion/passenger-full:0.9.0
MAINTAINER Phusion <info@phusion.nl>

RUN mkdir /build2
ADD ./stack/ /build2
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /build2/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
