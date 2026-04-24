FROM alpine:3.14


ENV WLAN_INT=wlan0
ENV WLAN_IP=192.168.200.1
ENV WLAN_MASK=24
RUN apk add hostapd dnsmasq

COPY conf/* /etc/conf/

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]