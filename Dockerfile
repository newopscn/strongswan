FROM alpine:3.9

LABEL MAINTAINER wanglin@dbca.cn

RUN apk add --no-cache strongswan

EXPOSE 500/udp 4500/udp
CMD ["ipsec", "start", "--nofork"]
