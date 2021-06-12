#!/bin/sh -e
#
# entrypoint for strongswan
#

iptables -t nat -A POSTROUTING -s 192.168.111.0/24 -o eth0 -j MASQUERADE
exec ipsec start --nofork "$@"
