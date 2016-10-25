FROM ubuntu:16.04
MAINTAINER jaap@polderknowledge.nl

RUN apt-get update && apt-get install -y --no-install-recommends python-pip python-setuptools \
   git php-cli curl wget npm nodejs && \
   ln -s /usr/bin/nodejs /usr/bin/node && \
   npm install -g gulp && pip install --upgrade pip && pip install mkdocs && \
   pip install pymdown-extensions
COPY . /mkdoc-theme

VOLUME ["/data"]
WORKDIR /data
