FROM arm64v8/alpine:3.14

RUN apt update && apt install -y hostapd dnsmasq

COPY conf/hostapd.conf /etc/hostapd/hostapd.conf
COPY conf/dnsmasq.conf /etc/dnsmasq.conf
COPY conf/wlan0 /etc/network/interfaces.d/wlan0