#!/bin/sh
dnsmasq -k --conf-file=/etc/dnsmasq.conf &
exec hostapd -d /etc/hostapd/hostapd.conf
