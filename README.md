# strongswan

## Referrence

* https://github.com/wuruxu/letsencrypt_strongswan_guide
* https://github.com/vimagick/dockerfiles/tree/master/strongswan

## configure

* ipsec

```bash
COPY conf/ipsec.conf /etc/ipsec.conf
COPY conf/ipsec.secrets /etc/ipsec.secrets
```

* certificates


```bash
chmod 640 /etc/ipsec.d/cacerts/chain.pem
chmod 640 /etc/ipsec.d/certs/cert.pem
chmod 640 /etc/ipsec.d/private/privkey.pem
```

## start

```bash
ipsec start --nofork
```

## post start

```bash
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -s 192.168.111.0/24 -o eth0 -j MASQUERADE
```
