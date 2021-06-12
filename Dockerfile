FROM alpine:3.9

LABEL MAINTAINER wanglin@dbca.cn

RUN apk add --no-cache iptables openssl util-linux strongswan
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 500/udp 4500/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["ipsec", "start", "--nofork"]
