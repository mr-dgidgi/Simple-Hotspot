# Simple-Pi-Hotspot
Docker image to create a basic hotspot on Raspberry Pi

Container created for my Recoverybox Project : https://github.com/mr-dgidgi/RecoveryBox

It can be use outside of this environnement

By default it create an SSID named 'default' with 'default' as WPA Passphrase and the DCHP is configured to use 192.168.200/24 network.

## Setup and installation
1. enable IP Forward
```shell
sysctl net.ipv4.ip_forward=1
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf
```
2. clone the image
```shell
docker clone mrdgidgi/simple-pi-hotspot
```
3. run the container
```shell
docker run -rm mrdgidgi/simple-pi-hotspot
```

## Customization
1. Create folder with custom config 
```shell
mkdir /etc/ap_config
cd /etc/ap_config
```
2. Customize the configuration
Create hostapd.conf and dnsmasq.conf with your custom configuration

3. Run the container
```shell
docker run -rm -v /etc/ap_config/hostapd.conf:/etc/hostapd/hostapd.conf -v /etc/ap_config/dnsmasq.conf:/etc/dnsmasq.conf mrdgidgi/simple-pi-hotspot
```


