#!/bin/sh
#
ip addr add ${WLAN_IP}/${WLAN_MASK} dev ${WLAN_INT}
ip link set ${WLAN_INT} up
dnsmasq -k --conf-file=/etc/conf/dnsmasq.conf &
exec hostapd -d /etc/conf/hostapd.conf
