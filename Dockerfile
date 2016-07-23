FROM debian:jessie

ARG GOST_VERSION="2.0-rc3"

ADD https://github.com/ginuerzh/gost/releases/download/2.0-rc3/gost_${GOST_VERSION}_linux_amd64.tar.gz /root/ 
RUN \
cd /root && \
tar xzvf gost_${GOST_VERSION}_linux_amd64.tar.gz && \
cp /root/gost_${GOST_VERSION}_linux_amd64/gost /root/

ENTRYPOINT '/root/gost'
