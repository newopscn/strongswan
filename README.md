# strongswan

[Strongswan DockerHub](https://hub.docker.com/r/newops/strongswan)

## Guide for helm deploy

[Helm charts for strongswan](https://github.com/newopscn/k8s-charts/tree/master/strongswan)

```bash
$ git clone xxx strongswan
$ helm install --name opsvpn --namespace secure strongswan/
$ helm status opsvpn
$ helm delete opsvpn --purge
```
## Guide for manual deploy

* ipsec

```bash
COPY conf/ipsec.conf /etc/ipsec.conf
COPY conf/ipsec.secrets /etc/ipsec.secrets
```

* certificates


```bash
$ chmod 640 /etc/ipsec.d/cacerts/chain.pem
$ chmod 640 /etc/ipsec.d/certs/cert.pem
$ chmod 640 /etc/ipsec.d/private/privkey.pem
```

* run with no daemon

```bash
$ ipsec start --nofork
```

## Post start

```bash
$ sysctl -w net.ipv4.ip_forward=1
$ iptables -t nat -A POSTROUTING -s 192.168.111.0/24 -o eth0 -j MASQUERADE
```

## Referrence

* https://github.com/wuruxu/letsencrypt_strongswan_guide
* https://github.com/vimagick/dockerfiles/tree/master/strongswan
* https://wiki.strongswan.org/projects/strongswan/wiki/ForwardingAndSplitTunneling
