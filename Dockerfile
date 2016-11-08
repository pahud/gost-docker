FROM alpine:latest

MAINTAINER Pahud Hsieh <pahudnet@gmail.com>

RUN \
apk add --no-cache --virtual .build-deps \
build-base git go bash && \
cd /root && mkdir src bin && cd src && \
git clone https://github.com/ginuerzh/gost && \
cd gost && \
GOPATH=/root go get ./... && \
mv /root/bin/gost /sbin/ && \
rm -rf /root/src \
&& apk del .build-deps


